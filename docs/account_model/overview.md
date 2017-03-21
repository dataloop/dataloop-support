## Overview

The Outlyer account model is designed around the concept of organizations and accounts. Users can exist in multiple organizations and accounts and can switch between them by using the dropdowns in the global header. 

### Organizations

An organization typically maps directly to your company name. On a new sign-up, users are prompted to provide an organization name.

For example, your organization might be called `Acme-Inc`.

Once an organization is created, additional members can be invited in.

### Accounts

Accounts can be created within an organization. For smaller companies these typically map to environments. At scale they can map to services or product service groupings. Accounts allow you to segment your monitoring setup. For MSPs these can even map to customer company names.

For example your accounts under the Acme-Inc organization might be called `Test`, `Staging` and `Production`. 

### Organization Admins

The first user to sign up and create an organization automatically becomes an **organization admin**. Additional organization admins can be invited via the user icon with the cog on the organization overview page sidebar.

Organization admins have full access to every account. They can create, rename and delete accounts in addition to managing the members and roles within each account.

When creating new accounts an organization admin should also enter the account name and invite initial account members. Account member setup can be delegated by setting the role to admin.

### Account Members

Account members can only see accounts that they are a member of. Additional account members can be invited into an account by either organization admins or account admins via the user icon within each account.

Members can be given the following roles:

* Admin - Full account access, invite additional members, assign the admin role
* Members - Full account access
* View Only - View only account access (coming soon)

### Invites

Invitations are valid for 7 days and can be resent from the member management area. Invitations can also be cancelled from this area.
