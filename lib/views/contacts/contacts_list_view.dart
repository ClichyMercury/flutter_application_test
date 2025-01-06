import 'package:flutter/material.dart';
import 'package:flutter_application_test/viewmodels/contact_view_model.dart';
import 'package:flutter_application_test/views/contacts/contact_detail_view.dart';
import 'package:flutter_application_test/views/widgets/contact_card.dart';
import 'package:provider/provider.dart';

class ContactsListView extends StatelessWidget {
  const ContactsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Contacts',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer<ContactViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.contacts.isEmpty && viewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            );
          }

          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.maxScrollExtent > 0) {
                final threshold = scrollInfo.metrics.maxScrollExtent * 0.8;
                if (!viewModel.isLoading &&
                    scrollInfo.metrics.pixels >= threshold) {
                  viewModel.loadMoreContacts();
                }
              }
              return true;
            },
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search contacts...',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final contact = viewModel.contacts[index];
                      return ContactCard(
                        index: index,
                        contact: contact,
                        onTap: () => Navigator.push(
                          context,
                          CustomPageRoute(
                            child: ContactDetailView(contact: contact),
                          ),
                        ),
                      );
                    },
                    childCount: viewModel.contacts.length,
                  ),
                ),
                if (viewModel.isLoading)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
