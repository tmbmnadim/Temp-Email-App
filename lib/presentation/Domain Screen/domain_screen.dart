import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tempemailsystemqtec/domain/usecase/domains_provider.dart';
import 'package:tempemailsystemqtec/presentation/Account/create_email_account.dart';
import 'package:tempemailsystemqtec/presentation/Custom%20Widgets/domain_selection_tile.dart';
import 'package:tempemailsystemqtec/presentation/Custom%20Widgets/top_bar.dart';

class DomainScreen extends StatelessWidget {
  const DomainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<DomainsProvider>(context, listen: false).getDomains();
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temp Mail"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 1),
            TopBar(
              screenSize: screenSize,
              title: "Available Domains",
            ),
            const SizedBox(height: 20),

            /// ===================================== List of Available Domains
            Consumer<DomainsProvider>(builder: (context, domains, child) {
              if (domains.domains.isNotEmpty) {
                return SizedBox(
                  height: screenSize.height * 0.75,
                  width: screenSize.width,
                  child: ListView.builder(
                      itemCount: domains.domains.length,
                      itemBuilder: (context, index) {
                        return DomainSelectionTile(
                            domain: "${domains.domains[index].domain}",

                            /// Select a Domain
                            onTap: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CreateEmailAccountScreen(
                                    domain: "@${domains.domains[index].domain}",
                                  ),
                                ),
                              );
                            });
                      }),
                );
              } else {
                return const CircularProgressIndicator(
                  color: Colors.black,
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
