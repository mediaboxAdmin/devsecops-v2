package kubernetes.security

deny[msg] {
  input.kind == "Pod"
  container := input.spec.containers[_]
  endswith(container.image, ":latest")
  msg := sprintf("Container '%s' utilise une image 'latest', ce qui est interdit", [container.name])
}
