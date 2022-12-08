# Besvarelse for kandidatnr. 1025

# Del 1

### Utfordringer


### Feil under release


### Dev og Ops


### Hvordan fjerne risiko


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
Jeg er helt ærlig ikke sikker på dette, men fikk fikset feilen da jeg endret linje 3 i `databucket.tf` til å starte med `data` istedenfor `resource`. Dette er visstnok en kjent utfordring, ifølge mine google-søk.