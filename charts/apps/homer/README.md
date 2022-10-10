# homer

Chart taken from k8s-at-home repo [here](https://github.com/k8s-at-home/charts/tree/master/charts/stable/homer).

A dead simple static HOMepage for your servER to keep your services on hand, from a simple yaml configuration file.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/bastienwirtz/homer>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository                             | Name   | Version |
|----------------------------------------|--------|---------|
| https://library-charts.k8s-at-home.com | common | 4.5.2   |

## TL;DR

```console
helm repo add k8s-at-home https://zekker6.github.io/helm-charts
helm repo update
helm install homer zekker6/homer
```

## Installing the Chart

To install the chart with the release name `homer`

```console
helm install homer zekker6/homer
```

## Uninstalling the Chart

To uninstall the `homer` deployment

```console
helm uninstall homer
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install homer \
  --set env.TZ="America/New York" \
    zekker6/homer
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install homer zekker6/homer -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key                          | Type   | Default          | Description                                                                                                                                 |
|------------------------------|--------|------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| configmap.config.data        | object | See values.yaml  | Homer configuration. See [image documentation](https://github.com/bastienwirtz/homer/blob/main/docs/configuration.md) for more information. |
| configmap.config.enabled     | bool   | `false`          | Store homer configuration as a ConfigMap                                                                                                    |
| env                          | object | See below        | environment variables.                                                                                                                      |
| env.TZ                       | string | `"UTC"`          | Set the container timezone                                                                                                                  |
| image.pullPolicy             | string | `"IfNotPresent"` | image pull policy                                                                                                                           |
| image.repository             | string | `"b4bz/homer"`   | image repository                                                                                                                            |
| image.tag                    | string | `nil`            |                                                                                                                                             |
| ingress.main                 | object | See values.yaml  | Enable and configure ingress settings for the chart under this key.                                                                         |
| persistence                  | object | See values.yaml  | Configure persistence settings for the chart under this key.                                                                                |
| securityContext.runAsGroup   | int    | `1000`           | Specify the group ID the application will run as                                                                                            |
| securityContext.runAsNonRoot | bool   | `true`           | Enable validation that the container must run as non-root user                                                                              |
| securityContext.runAsUser    | int    | `1000`           | Specify the user ID the application will run as                                                                                             |
| service                      | object | See values.yaml  | Configures service settings for the chart.                                                                                                  |

## Changelog

### Version 8.0.2

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.5.2

#### Fixed

N/A

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)