import 'package:flutter/material.dart';
import 'package:nexteramediagroup_mobile/core/after_layout.dart';
import 'package:nexteramediagroup_mobile/core/app_states.dart';
import 'package:nexteramediagroup_mobile/presentation/providers/user_provider.dart';
import 'package:nexteramediagroup_mobile/presentation/screens/user_detail_screen.dart'
    show UserDetailScreen;
import 'package:nexteramediagroup_mobile/presentation/widgets/avatar_image.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen>
    with AfterLayoutMixin<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: Column(
        children: [
          Expanded(
            child: Consumer<UserProvider>(
              builder: (context, provider, child) {
                switch (provider.state) {
                  case UserState.loading:
                    return const Center(child: CircularProgressIndicator());

                  case UserState.error:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: 48,
                            color: Colors.red,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Error: ${provider.errorMessage}',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: provider.retry,
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );

                  case UserState.empty:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person_off_outlined,
                            size: 48,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    );

                  case UserState.loaded:
                    return ListView.builder(
                      itemCount: provider.users.length,
                      itemBuilder: (context, index) {
                        final user = provider.users[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UserDetailScreen(user: user),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 2,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: ListTile(
                              leading: AvatarImage(url: user.avatar!),
                              title: Text(
                                user.name!,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user.role!,
                                    style: const TextStyle(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  Text(
                                    user.email!,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              // Arrow Icon
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                            ),
                          ),
                        );
                      },
                    );

                  default:
                    return const Center(child: Text('Please wait...'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).getUsers();
  }
}
