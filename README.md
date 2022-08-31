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

The labs prod cluster is the working environment for all the labs application, api, starterkit, and other demo application ci/cd pipelines. All persistent environments are managed inside the production cluster for cost reasons. In a deployment of the Platform Starter Kit, you could imagine that
dev and qa namespaces would instead be created inside a non-production cluster.

The following table shows the added namespaces in the lab environments, and what cluster they are created in

| namespace                 |  sandbox  |   prod     |
|:-------------------------:|:---------:|:----------:|
| twdps-core-labs-team-prod |           |      x     |
| twdps-core-labs-team-qa   |           |      x     |
| twdps-core-labs-team-dev  |           |      x     |

### development

In this simple example, to add additional default namespaces or an additional team name, edit the `deploy-namespaces.sh` script, add or editing the current configuration.   
