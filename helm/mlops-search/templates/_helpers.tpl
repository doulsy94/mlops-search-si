{{- define "mlops-search.name" -}}
{{- printf "%s-mlops-search" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "mlops-search.labels" -}}
app.kubernetes.io/name: mlops-search
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "mlops-search.image" -}}
{{- if not (regexMatch "^sha256:[a-f0-9]{64}$" (.Values.image.digest | default "")) -}}
{{- fail "image.digest must be set to a valid sha256:<64-hex> digest — mutable tags are not allowed" -}}
{{- end -}}
{{- printf "%s@%s" .Values.image.repository .Values.image.digest -}}
{{- end -}}
