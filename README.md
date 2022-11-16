```sh
$ oapi-codegen -version
github.com/deepmap/oapi-codegen/cmd/oapi-codegen
v1.12.2
```

# oapi-codegen-unresolvedrefs

Demonstrates a problem with oapi-codegen.

Unresolved referencences appear if you have a splitted specification and some components that are not diretly referenced in path but as some component properties.

```sh
$ ./test.sh
[2] PetExtra not defined

```

# test.sh
```
#!/bin/bash

oapi-codegen -package ps petstore-expanded.yaml \
    | ./getspec.sh | grep -q 'PetExtra description' || echo '[1] PetExtra not defined'

oapi-codegen -config "oapi.configs/petstore.path.config.yaml" "paths/petstore.path.yaml" \
    | ./getspec.sh | grep -q 'PetExtra description' || echo '[2] PetExtra not defined'
```

First run of oapi-codegen generates source based on monolitic file (petstore-expanded.yaml).

Second run of oapi-codegen generates source based on splitted specifications.

Output from first and second run should be similar, however the second run does include `PetExtra` definition in the specification embeded in the code.
