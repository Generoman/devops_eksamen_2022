# Besvarelse for kandidatnr. 1025

### Angående Cloud9
Jeg har ikke brukt Cloud9 under besvarelsen, til fordel for IntelliJ. Merk derfor at Cloud9 vil være tomt hos meg på
AWS.

# Del 1

### Dagens prosess
Den prosessen Shopifly nå følger har fire deployments i året, dedikerte testere, og manuelle godkjenninger av leveranse.
Utvikling og vedlikehold er også delte avdelinger.

Utfordringene med dette er først og fremst veldig trege releases, som sannsynligvis kommer av store leveranser.
Oppstykking av teams fører til lite krysspollenering av kunnskap - et eget team med testere burde f.eks. ikke være
nødvendig. Det virker som automatiseringen av prosessen også er minimal.

Innføring av DevOps vil blant annet sørge for hyppigere, men mindre releases. Feilende releases kan minimeres ved  hjelp
av Blue Green Deployment (release nyeste versjon kun til en del av brukergruppen). Godkjenning av leveranser kan i stor
grad automatiseres ved hjelp av CI/CD og Trunk Based Development, hvor en kan sette opp diverse checks på pull requests.

### Feil under release
Mindre hyppige releases fører til at det går lengre tid frem til man vet om ting virker som de skal eller ikke. Ved feil
i produksjon, skal feilen rettes opp ASAP. Mean Time To Recovery (MTTR) er en vanlig metrikk å følge med på i DevOps,
som ser på hvor kort tid det tar mellom en feil oppstår, og når den blir fikset. Om utviklere har ansvar for dette,
fremfor en ops-avdeling, vil også denne tiden være kortere, da utviklerne sannsynligvis har bedre forståelse for HVA som
har gått galt.

Hva angår mer kontroll og QA, så kan dette automatiseres ved hjelp av automatiserte tester gjennom et CI/CD-verktøy som
GitHub Actions eller lignende. Jeg er også av den oppfatning at utviklere burde skrive sine egne tester gjennom en
blanding av TDD og BDD. Kodekvalitet/linting og lignende kan også automatiseres. Godkjenning av pull requests er kanskje
eneste manuelle steg som burde beholdes, men det er en personlig mening.

### Dev og Ops
Jeg har nevnt dette litt allerede, men det handler først og fremst om eierskap og ansvar. Utviklere som har ansvar for å
drifte eget produkt er mer motivert til å skrive god kode, da de har "skin in the game". Jeg vil også påstå at MTTR vil
gå ned dersom den som fikser en eventuell feil kjenner koden godt.

### Risiko ved hyppige releases
Hyppige forandringer kan bety hyppige feil. Jeg har allerede nevnt automatiserte tester gjennom CI/CD og Blue Green
Deployment. I tillegg kan telemetri hjelpe et team å oppdage feil så snart de skjer.

## Del 2

### Oppgave 3
Da studenter har tilgang på Github Pro gratis, har jeg kunnet sette opp branch protection på mitt repo.
* På Github-repoet, gå til "Settings"
* Under "Code and automation", gå til "Branches"
* Under "Branch protection rules", trykk "Add rule"
* "Branch name pattern" skal være "main"
* "Require a pull request before merging" skal være huket av
  * "Require approvals" skal være huket av (1)
* "Require status checks to pass before merging" skal være huket av
  * Skriv inn "build" i søkefeltet og velg det fra dropdown
  * Ved fullføring av Del 5, har jeg også lagt til "Terraform" fra søk/dropdown, da dette virket fornuftig
* "Do not allow bypassing the above settings" må være huket av for at reglene skal gjelde admin også
* Trykk "Create" nederst på siden

## Del 3

### Oppgave 1
Workflowen feiler pga manglende innloggingsinformasjon - workflowen forventer spesifikke Secrets.
* Logg inn på Dockerhub
* Gå til Account Settings -> Security
* Opprett en Access Token, kopier verdiene inn i Secrets på Github-repoet
* Merk at Secrets må ha keys `DOCKER_HUB_USERNAME` og `DOCKER_HUB_TOKEN`

### Oppgave 3
* Logg på AWS via linken i README og gå til Elastic Container Registry
* Opprett et nytt repository med navn "1025"
* I AWS, gå til IAM -> Users, finn og klikk på din bruker
* Trykk på Security Credentials-fanen, og klikk "Create access key"-knappen under "Access keys"
* Kopier "Access key ID" og "Secret access key" inn i Secrets på Github-repoet
* Merk at Secrets må ha keys `AWS_ACCESS_KEY_ID` og `AWS_SECRET_ACCESS_KEY`, respektivt

## Del 5

### Kommentar
Merk at for at `cloudwatch-dashboard.yml`-workflowen skal kjøre riktig, må det være satt opp to Secrets i repoet:
* `CANDIDATE_ID` må være "1025"
* `CANDIDATE_EMAIL` må være sensors epostadresse

### Oppgave 1
Jeg er helt ærlig ikke sikker på dette, men fikk fikset feilen da jeg endret linje 3 i `databucket.tf` til å starte med
`data` istedenfor `resource`. Dette er visstnok en kjent utfordring, ifølge mine google-søk.