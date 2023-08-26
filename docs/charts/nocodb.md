# nocodb

![Version: 0.20.0](https://img.shields.io/badge/Version-0.20.0-informational?style=flat-square) ![AppVersion: v0.109.7](https://img.shields.io/badge/AppVersion-v0.109.7-informational?style=flat-square)

nocodb - Open Source Airtable Alternative

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/zekker6/helm-charts/issues/new)**

## Source Code

* <https://github.com/zekker6/helm-charts/tree/main/charts/apps/nocodb>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 12.x.x |
| https://zekker6.github.io/helm-charts | common | 0.4.3 |

## TL;DR

```console
helm repo add zekker6 https://zekker6.github.io/helm-charts/
helm repo update
helm install nocodb zekker6/nocodb
```

## Installing the Chart

To install the chart with the release name `nocodb`

```console
helm install nocodb zekker6/nocodb
```

## Uninstalling the Chart

To uninstall the `nocodb` deployment

```console
helm uninstall nocodb
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/zekker6/helm-charts/blob/main/charts/library/common/values.yaml) from the [common library](https://github.com/zekker6/helm-charts/blob/main/charts/library/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install nocodb \
  --set env.TZ="America/New York" \
    zekker6/nocodb
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install nocodb zekker6/nocodb -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/zekker6/helm-charts/blob/main/charts/library/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | See the following files for additional environment variables: https://github.com/nocodb/nocodb#docker |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"nocodb/nocodb"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence.data | object | See values.yaml | Configure persistence for data to use sqlite backend. |
| postgresql.architecture | string | `"standalone"` |  |
| postgresql.auth.database | string | `"nocodb"` |  |
| postgresql.auth.password | string | `"nocodb"` |  |
| postgresql.auth.postgresPassword | string | `"nocodb"` |  |
| postgresql.auth.username | string | `"nocodb"` |  |
| postgresql.enabled | bool | `false` |  |
| postgresql.primary.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| postgresql.primary.persistence.enabled | bool | `true` |  |
| postgresql.primary.persistence.size | string | `"100Mi"` |  |
| service | object | See values.yaml | Configures service settings for the chart. |

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/zekker6/nocodb?modal=changelog)

## Support

- See the [Docs](http://zekker6.github.io/helm-charts/docs/)
- Open an [issue](https://github.com/zekker6/helm-charts/issues/new)

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)