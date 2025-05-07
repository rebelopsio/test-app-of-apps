{{/*
Inject release values
*/}}
{{- define "test-app-of-apps.values" -}}
{{- $appName := base .Template.Name | trimSuffix ".yaml" }}
{{- mergeOverwrite
          (print "values/" $appName "/values.yaml" | .Files.Get | fromYaml)
          (print "values/" $appName "/values." .Environment ".yaml" | .Files.Get | fromYaml)
      | toYaml }}
{{- end }}
