<div align="center">
	<p>
		<img alt="Thoughtworks Logo" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/thoughtworks_flamingo_wave.png?sanitize=true" width=200 />
    <br />
		<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/dps_lab_title.png?sanitize=true" width=350/>
	</p>
  <h3>lab-platform-simple-namespaces</h3>
</div>
<br />

Often in the early evolution of a new platform product effort, or in situations where there are only a couple of teams who will ever be using a cluster, a basic or simplistic namespace management scheme is the right fit while a more complex process needed at scale is evolved.  

The labs preview cluster is the working environment for all the labs application, api, starterkit, and other demo application ci/cd pipelines. 

The following table shows the added namespaces in the lab environments and the pipeline that creates the namespaces. Below the table is a description of how the labs team uses these namespaces.  

| namespace         |  sandbox  |  preview   | pipeline                       |
|-------------------|:---------:|:----------:|--------------------------------|
| amazon-cloudwatch |     x     |      x     | lab-platform-eks               |
| lab-system        |     x     |      x     | lab-platform-eks               |
| istio-operator    |     x     |      x     | lab-platform-eks               |
| istio-system      |     x     |      x     | lab-platform-eks               |
| cert-manager      |     x     |      x     | lab-platform-eks               |
| default-mtls      |     x     |      x     | lab-platform-servicemesh       |
| twdps-dev         |           |      x     | lab-platform-simple-namespaces |
| twdps-qa          |           |      x     | lab-platform-simple-namespaces |
| twdps-prod        |           |      x     | lab-platform-simple-namespaces |
| demo-dev          |           |      x     | lab-platform-simple-namespaces |
| demo-qa           |           |      x     | lab-platform-simple-namespaces |
| demo-prod         |           |      x     | lab-platform-simple-namespaces |

**lab-system**  

Target environment for custom operators and other cluster-wide api-extention type capabilities.  

**twdps-dev > twdps-qa > twdps-prod**  

Dev and Release environments for dps reference software.   

**demo-dev > demo-qa > demo-prod**  

Dev and Release environments for examples using OSS or other 3rd party code.  

### gateways

There are two top level hosted zones used for demonstration purposes:  

twdps.io  
twdps.digital  

_cluster-level gateways_  

For use by cluster-level applications or services such as Kiali. These are deployed by the servicemesh pipeline.  


| gateway                  | urls                     |
|--------------------------|--------------------------|
| preview-wildcard-gateway | preview.twdps.digital    |
|                          | *.preview.twdps.digital  |
|                          | preview.twdps.io         |
|                          | *.preview.twdps.io       |

_no api gateway_  

twdps.digital is a top level domain managed in the same account as the preview cluster and used to demonstrate a common ingress pattern for in-cluster urls where no external api-gateway is in use.   

| gateway                    | urls                     |
|----------------------------|--------------------------|
| twdps-digital-dev-gateway  | api.dev.twdps.digital    |
|                            | dev.twdps.digital        |
| twdps-digital-qa-gateway   | api.qa.twdps.digital     |
|                            | qa.twdps.digital         |
| twdps-digital-prod-gateway | api.twdps.digital        |
|                            | twdps.digital            |

_api gateway_  

twdps.io is a top level domain managed in a different account than the preview cluster and used to demonstrate a common ingress pattern for in-cluster urls where an api-gateway is in use. E.g., APIs or other endpoints are exposed using urls that direct traffic first to an api gateway before hitting the cluster.  

Note. Have not included gateway urls for typical ui urls.  

| gateway                  | urls                      |
|--------------------------|---------------------------|
| dev-io-gateway           | api.dev.preview.twdps.io  |
| qa-io-gateway            | api.qa.preview.twdps.io   |
| prod-io-gateway          | api.prod.preview.twdps.io |

In this example, the actual externally urls and routes would be:  

dev.api.twdps.io  >  api-gateway  >  api.dev.preview.twdps.io  
qa.api.twdps.io   >  api-gateway  >  api.qa.preview.twdps.io
api.twdps.io      >  api-gateway  >  api.prod.preview.twdps.io  

### development

In this simple example, to add additional default namespaces or an additional team name, edit the `preview-namespaces.sh` script, add or editing the current configuration.   
