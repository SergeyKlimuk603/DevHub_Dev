Integer recordCount = 10;
String baseName = 'TestAccount_';

List<Account> accounts = new List<Account>();
for (Integer i = 1; i <= recordCount; i++) {
    Account acc = new Account();
    acc.Name = baseName + i;
    acc.Industry = 'Technology';
    acc.AnnualRevenue = 1000 * i;
    acc.NumberOfEmployees = 10 * i;
    accounts.add(acc);
}

insert accounts;