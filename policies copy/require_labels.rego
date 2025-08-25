package kubernetes.security

deny[msg] {
  missing := ["app","env"]
  label := missing[_]
  not input.metadata.labels[label]
  msg := sprintf("Ressource %s doit avoir le label '%s'", [input.metadata.name, label])
}
