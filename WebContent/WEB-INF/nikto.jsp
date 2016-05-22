<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="nav.jsp"></c:import>
<body>

	<section>
		<div class="panel panel-default col-md-12 col-lg-12"
			style="padding: 0px;">

			<c:import url="top_page.jsp"></c:import>

			<div class="panel-footer">

				<!-- Test nav bar -->

				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand">Nikto</a>
						</div>

						<ul class="nav navbar-nav">


							<li id="form_btn" role="presentation" class="active"
								onclick="switcher(this)"><a> <c:out
										value="${language.getLanguageValue('default', '/default/form')}" />

							</a></li>

							<li id="response_btn" role="presentation"
								onclick="switcher(this)"><a> <c:out
										value="${language.getLanguageValue('default', '/default/response')}" />
							</a></li>
							<li><a data-toggle="tooltip"
								title="<c:out value="${language.getLanguageValue('tls-sled', '/tls-sled/desc-tool')}" />"
								data-placement="right">?</a></li>
						</ul>

					</div>
				</nav>
				
				
				<div id="form">
					<form method="POST" action="<c:url value="/tlssled" ></c:url>"
						id="form">
						<div>
							<label for="hostname" data-toggle="tooltip" class="col-lg-12 col-md-12 col-sm-12"
								title="<c:out value="${language.getLanguageValue('tls-sled', '/tls-sled/aide/cible')}" />"
								data-placement="right"> <c:out
									value="${language.getLanguageValue('tls-sled', '/tls-sled/options/cible')}" />
							</label>
							<div class="input-group col-lg-2 col-mg-4 col-sm-6">
								<input type="text" class="form-control" placeholder="Hostname"
									name="hostname" id="hostname" onkeyup="updateCommand()"
									onselect="updateCommand()" autofocus required> <span
									class="input-group-addon" id="basic-addon2"
									data-toggle="tooltip"
									title="<c:out value="${language.getLanguageValue('tls-sled', '/tls-sled/aide/cible')}" />"
									data-placement="bottom"> <i class="fa fa-question fa-lg"></i>
								</span>
							</div>
							<p class="error">${form.errors['hostname']}</p>

							<label for="port" data-toggle="tooltip" class="col-lg-12 col-md-12 col-sm-12"
								title="<c:out value="${language.getLanguageValue('tls-sled', '/tls-sled/aide/port')}" />"
								data-placement="right"> <c:out
									value="${language.getLanguageValue('tls-sled', '/tls-sled/options/port')}" />
							</label>
							<div class="input-group col-lg-2">
								<input type="number" class="form-control" placeholder="Port"
									name="port" id="port" value="80" onkeyup="updateCommand()"
									onchange="updateCommand()" required> <span
									class="input-group-addon" id="basic-addon2"
									data-toggle="tooltip"
									title="<c:out value="${language.getLanguageValue('tls-sled', '/tls-sled/aide/port')}" />"
									data-placement="bottom"> <i class="fa fa-question fa-lg"></i>
								</span>
							</div>
							<p class="error">${form.errors['port']}</p>
							
							
							<label for="help-vhost" data-toggle="tooltip"
								title="<c:out value="${language.getLanguageValue('tls-sled', '/tls-sled/aide/cible')}" />"
								data-placement="right"> <c:out
									value="${language.getLanguageValue('tls-sled', '/tls-sled/options/cible')}" />
							</label>
							<div class="input-group col-lg-2 col-mg-4 col-sm-6">
								<input type="text" class="form-control" placeholder="Virtual host"
									name="vhost" id="vhost" onkeyup="updateCommand()"
									onselect="updateCommand()" autofocus> <span
									class="input-group-addon" id="basic-addon2"
									data-toggle="tooltip"
									title="<c:out value="${language.getLanguageValue('tls-sled', '/tls-sled/aide/cible')}" />"
									data-placement="bottom"> <i class="fa fa-question fa-lg"></i>
								</span>
							</div>
							
							<br>
							<label for="help-options-principales" data-toggle="tooltip" class="col-lg-12 col-md-12 col-sm-12"
								title="<c:out value="${language.getLanguageValue('tls-sled', '/tls-sled/aide/cible')}" />"
								data-placement="right"> <c:out
									value="${language.getLanguageValue('tls-sled', '/tls-sled/options/cible')}" />
							</label><br>
							
							<div class="col-lg-2 col-md-2 col-sm-2">
								<label data-toggle="tooltip"
									title="<c:out value="${language.getLanguageValue('the-harvester', '/the-harvester/aide/verify')}" />"
									data-placement="right" class="checkbox-inline"><input onclick="updateCommand()"
									type="checkbox" id="cgidirs" name="cgidirs" value="-Cgidirs">${language.getLanguageValue('the-harvester', '/the-harvester/options/options/verify')}</label>
									</div>
									
								<div class="input-group col-lg-2 col-mg-4 col-sm-6" id="cgidirs-box" style="display: none;">
									<input type="text" class="form-control" placeholder="All"
										name="cgidirs-input" id="cgidirs-input" onkeyup="updateCommand()"
										onselect="updateCommand()" > <span
										class="input-group-addon" id="basic-addon2"
										data-toggle="tooltip"
										title="<c:out value="${language.getLanguageValue('tls-sled', '/tls-sled/aide/cible')}" />"
										data-placement="bottom"> <i class="fa fa-question fa-lg"></i>
									</span>
								</div>
							
								<div class="col-lg-2 col-md-2 col-sm-2">
								<label data-toggle="tooltip"
									title="<c:out value="${language.getLanguageValue('the-harvester', '/the-harvester/aide/reverse-dns')}" />"
									data-placement="right" class="checkbox-inline"><input onclick="updateCommand()"
									type="checkbox" id="reverse-dns" name="reverse-dns" value="-n">${language.getLanguageValue('the-harvester', '/the-harvester/options/options/reverse-dns')}</label>
									</div>
									
								<div class="col-lg-2 col-md-2 col-sm-2">
								<label data-toggle="tooltip"
									title="<c:out value="${language.getLanguageValue('the-harvester', '/the-harvester/aide/tld')}" />"
									data-placement="right" class="checkbox-inline"><input onclick="updateCommand()"
									type="checkbox" id="tld-discovery" name="tld-discovery" value="-t">${language.getLanguageValue('the-harvester', '/the-harvester/options/options/tld')}</label>
									</div>	
									
							
							
							
							<br><br>
							<label for="help-options-principales" data-toggle="tooltip" class="col-lg-12 col-md-12 col-sm-12"
								title="<c:out value="${language.getLanguageValue('tls-sled', '/tls-sled/aide/cible')}" />"
								data-placement="right"> <c:out
									value="${language.getLanguageValue('tls-sled', '/tls-sled/options/cible')}" />
							</label><br>
							
									<div class="col-lg-3 col-md-3 col-sm-2">
									<label data-toggle="tooltip"
										title="<c:out value="${language.getLanguageValue('the-harvester', '/the-harvester/aide/verify')}" />"
										data-placement="right" class="checkbox-inline"><input onclick="updateCommand()"
										type="checkbox" id="cgidirs" name="cgidirs" value="-Cgidirs">${language.getLanguageValue('the-harvester', '/the-harvester/options/options/verify')}</label>
										</div>
								
									<div class="col-lg-3 col-md-3 col-sm-2">
									<label data-toggle="tooltip"
										title="<c:out value="${language.getLanguageValue('the-harvester', '/the-harvester/aide/reverse-dns')}" />"
										data-placement="right" class="checkbox-inline"><input onclick="updateCommand()"
										type="checkbox" id="reverse-dns" name="reverse-dns" value="-n">${language.getLanguageValue('the-harvester', '/the-harvester/options/options/reverse-dns')}</label>
										</div>
										
									<div class="col-lg-3 col-md-3 col-sm-2">
									<label data-toggle="tooltip"
										title="<c:out value="${language.getLanguageValue('the-harvester', '/the-harvester/aide/tld')}" />"
										data-placement="right" class="checkbox-inline"><input onclick="updateCommand()"
										type="checkbox" id="tld-discovery" name="tld-discovery" value="-t">${language.getLanguageValue('the-harvester', '/the-harvester/options/options/tld')}</label>
										</div>
								
								
									<div class="col-lg-3 col-md-3 col-sm-2">
									<label data-toggle="tooltip"
										title="<c:out value="${language.getLanguageValue('the-harvester', '/the-harvester/aide/verify')}" />"
										data-placement="right" class="checkbox-inline"><input onclick="updateCommand()"
										type="checkbox" id="cgidirs" name="cgidirs" value="-Cgidirs">${language.getLanguageValue('the-harvester', '/the-harvester/options/options/verify')}</label>
										</div>
								
									<div class="col-lg-3 col-md-3 col-sm-2">
									<label data-toggle="tooltip"
										title="<c:out value="${language.getLanguageValue('the-harvester', '/the-harvester/aide/reverse-dns')}" />"
										data-placement="right" class="checkbox-inline"><input onclick="updateCommand()"
										type="checkbox" id="reverse-dns" name="reverse-dns" value="-n">${language.getLanguageValue('the-harvester', '/the-harvester/options/options/reverse-dns')}</label>
										</div>
										
									<div class="col-lg-3 col-md-3 col-sm-2">
									<label data-toggle="tooltip"
										title="<c:out value="${language.getLanguageValue('the-harvester', '/the-harvester/aide/tld')}" />"
										data-placement="right" class="checkbox-inline"><input onclick="updateCommand()"
										type="checkbox" id="tld-discovery" name="tld-discovery" value="-t">${language.getLanguageValue('the-harvester', '/the-harvester/options/options/tld')}</label>
										</div>	
									
									<div class="col-lg-3 col-md-3 col-sm-2">
									<label data-toggle="tooltip"
										title="<c:out value="${language.getLanguageValue('the-harvester', '/the-harvester/aide/tld')}" />"
										data-placement="right" class="checkbox-inline"><input onclick="updateCommand()"
										type="checkbox" id="tld-discovery" name="tld-discovery" value="-t">${language.getLanguageValue('the-harvester', '/the-harvester/options/options/tld')}</label>
										</div>	
										
										
								
								
								
							<div class="col-lg-6 col-md-6 col-sm-12">
								<div class="checkbox input-group">
									<label><input type="checkbox" id="fix-limit" name="fix-limit" onclick="updateCommand()">${language.getLanguageValue('the-harvester', '/the-harvester/options/options/limit')}</label>
									<div class="input-group" id="limit-number" style="display: none;">
										<input type="number" class="form-control" min="0" max="10000" 
												placeholder="100" name="max-number" id="max-number"
												onkeyup="updateCommand()" onselect="updateCommand()"
												> 
												<span class="input-group-addon"
												id="basic-addon2" data-toggle="tooltip"
												title="<c:out value="${language.getLanguageValue('the-harvester', '/the-harvester/aide/limit')}" />"
												data-placement="bottom"> <i
												class="fa fa-question fa-lg"></i>
											</span>
									</div>
								</div>
							</div>
								
								
							<div class="col-lg-6 col-md-6 col-sm-12">
								<div class="checkbox input-group">
									<label><input type="checkbox" id="fix-limit" name="fix-limit" onclick="updateCommand()">${language.getLanguageValue('the-harvester', '/the-harvester/options/options/limit')}</label>
									<div class="input-group" id="limit-number" style="display: none;">
										<input type="number" class="form-control" min="0" max="10000" 
												placeholder="100" name="max-number" id="max-number"
												onkeyup="updateCommand()" onselect="updateCommand()"
												> 
												<span class="input-group-addon"
												id="basic-addon2" data-toggle="tooltip"
												title="<c:out value="${language.getLanguageValue('the-harvester', '/the-harvester/aide/limit')}" />"
												data-placement="bottom"> <i
												class="fa fa-question fa-lg"></i>
											</span>
									</div>
								</div>
							</div>
								
								
							<div class="col-lg-6 col-md-6 col-sm-12">
								<div class="checkbox input-group">
									<label><input type="checkbox" id="fix-limit" name="fix-limit" onclick="updateCommand()">${language.getLanguageValue('the-harvester', '/the-harvester/options/options/limit')}</label>
									<div class="input-group" id="limit-number" style="display: none;">
										<input type="number" class="form-control" min="0" max="10000" 
												placeholder="100" name="max-number" id="max-number"
												onkeyup="updateCommand()" onselect="updateCommand()"
												> 
												<span class="input-group-addon"
												id="basic-addon2" data-toggle="tooltip"
												title="<c:out value="${language.getLanguageValue('the-harvester', '/the-harvester/aide/limit')}" />"
												data-placement="bottom"> <i
												class="fa fa-question fa-lg"></i>
											</span>
									</div>
								</div>
							</div>
								
								
							<div class="col-lg-6 col-md-6 col-sm-12">
								<div class="checkbox input-group">
									<label><input type="checkbox" id="fix-limit" name="fix-limit" onclick="updateCommand()">${language.getLanguageValue('the-harvester', '/the-harvester/options/options/limit')}</label>
									<div class="input-group" id="limit-number" style="display: none;">
										<input type="number" class="form-control" min="0" max="10000" 
												placeholder="100" name="max-number" id="max-number"
												onkeyup="updateCommand()" onselect="updateCommand()"
												> 
												<span class="input-group-addon"
												id="basic-addon2" data-toggle="tooltip"
												title="<c:out value="${language.getLanguageValue('the-harvester', '/the-harvester/aide/limit')}" />"
												data-placement="bottom"> <i
												class="fa fa-question fa-lg"></i>
											</span>
									</div>
								</div>
							</div>
								
								
							<div class="col-lg-6 col-md-6 col-sm-12">
								<div class="checkbox input-group">
									<label><input type="checkbox" id="fix-limit" name="fix-limit" onclick="updateCommand()">${language.getLanguageValue('the-harvester', '/the-harvester/options/options/limit')}</label>
									<div class="input-group" id="limit-number" style="display: none;">
										<input type="number" class="form-control" min="0" max="10000" 
												placeholder="100" name="max-number" id="max-number"
												onkeyup="updateCommand()" onselect="updateCommand()"
												> 
												<span class="input-group-addon"
												id="basic-addon2" data-toggle="tooltip"
												title="<c:out value="${language.getLanguageValue('the-harvester', '/the-harvester/aide/limit')}" />"
												data-placement="bottom"> <i
												class="fa fa-question fa-lg"></i>
											</span>
									</div>
								</div>
							</div>					
						</div>

						<br>

						<div class="command col-lg-12 col-md-12 col-sm-&2" id="commad" data-toggle="tooltip"
							title="C'est la ligne qui sera envoyée dans le terminal de notre système Kali Linux"
							data-placement="bottom">> nikto</div>

						<div style="text-align: right">
							<br>
							<button type="submit" class="btn btn-default"
								aria-label="Right Align">
								<c:out
									value="${language.getLanguageValue('tls-sled', '/tls-sled/actions/bouton-envoyer')}" />
							</button>
						</div>

						<div>
							<p class="${empty form.errors ? 'succes' : 'error'}">${form.result}</p>
						</div>
					</form>
				</div>
				<div id="response_panel" class="hidden">
					<div class=command id=response></div>
				</div>
			</div>
		</div>

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="bootstrap/js/bootstrap.js"></script>
		
		<script>
		
			//history();
		
			/*
			* That function permits to unselect all items selected in the 'info-source'
			* multiselect box
			*/
			/* function removeAllItems(){
				  $('option', $('#info-source')).each(function(element) {
					    $(this).removeAttr('selected').prop('selected', false);
					  });
					  $("#info-source").multiselect('refresh');
					  updateCommand();
			} */
			
			/*
			* Print the input associated to the below checkboxes
			* 
			*/
 			$('#cgidirs').click(function() {
			    $("#cgidirs-box").toggle(this.checked);
			});
			
			/* 
			$('#use-dns').click(function() {
			    $("#dns-name").toggle(this.checked);
			});
			
			
			$('#fix-limit').click(function() {
			    $("#limit-number").toggle(this.checked);
			});
			
			function toogleCheckboxes()
			{
				if (document.getElementById('startN-check').checked)
					{
						$("#start-result").toggle(this.checked);
					}
				if (document.getElementById('use-dns').checked)
					{
						$("#dns-name").toggle(this.checked);
					}
				if (document.getElementById('fix-limit').checked)
					{
						$("#limit-number").toggle(this.checked);
					}
			}
			

			var domain = document.getElementById('domain'),
				scan_type = document.getElementById('info-source'),
				verify_hostname = document.getElementById('verify-hostname'),
				reverse_dns = document.getElementById('reverse-dns'),
				tld_discovery = document.getElementById('tld-discovery'),
				shodan = document.getElementById('shodan'),
				start_number = document.getElementById('start-number'),
				dns_name = document.getElementById('dns'),
				max_number = document.getElementById('max-number'),
				command = document.getElementById('command');
			
			
			function getLimit()
			{
				var max_number_txt = '';
				
				if (document.getElementById("fix-limit").checked)
					{
						if (max_number.value.length == 0)
							{
								max_number_txt = '-l ' + '&lt;limit&gt;';
							}
						else
							{
								max_number_txt = '-l ' + max_number.value;
							}
					}
				
				return max_number_txt;
			}
			
			
			
			function getDNSName()
			{
				var dns_name_txt = '';
				
				if (document.getElementById("use-dns").checked)
					{
						if (dns_name.value.length == 0)
							{
								dns_name_txt = '-e ' + '&lt;dns&gt;';
							}
						else
							{
								dns_name_txt = '-e ' + dns_name.value;
							}
					}
				
				return dns_name_txt;
			}
			
			
			function getStartNumber()
			{
				var start_number_txt = '';
				
				if (document.getElementById("startN-check").checked)
					{
						if (start_number.value.length == 0)
							{
								start_number_txt = '-s ' + '&lt;start&gt;';
							}
						else
							{
								start_number_txt = '-s ' + start_number.value;
							}
					}
				
				return start_number_txt;
			}
			
			
			function getDomain()
			{
				var domain_txt = '';
				
				if(domain.value.length == 0){
					domain_txt = '&lt;domain&gt;';
				}else{
					domain_txt = domain.value;
				}
				
				return domain_txt;
			}
			
			
			function getInformationSource()
			{
				var info_source_txt = '-b &lt;source&gt;';
				
				for(i=0;i<scan_type.length;i++)
				{
					if(scan_type[i].selected == true)
					{
						if (info_source_txt == '-b &lt;source&gt;')
							{
								info_source_txt = '-b ';
							}
						
						if(scan_type[i].value != 'multiselect-all')
							{
								info_source_txt += scan_type[i].value;
							}
						info_source_txt += " ";
					}
				}
								
				return info_source_txt;
			}*/
			
			function updateCommand(){
				
				/*var domain_txt = '';
				var scan_type_txt = '';
				var verify_hostname_txt = '';
				var reverse_dns_txt = '';
				var tld_discovery_txt = '';
				var shodan_txt = '';
				var dns_name_txt = '';
				var start_number_txt = '';
				var max_number_txt = '';
				
				var command_string = '';
				
				console.log(getStartNumber());
				
				domain_txt = getDomain();
				info_source_txt =  getInformationSource();
				dns_name_txt = getDNSName();
				start_number_txt = getStartNumber();
				max_number_txt = getLimit();
				
				if (verify_hostname.checked)
					{
						verify_hostname_txt = verify_hostname.value;
					}
				
				if (reverse_dns.checked)
					{
						reverse_dns_txt = reverse_dns.value;
					}
				
				if (tld_discovery.checked)
					{
						tld_discovery_txt = tld_discovery.value;
					}
				
				if (shodan.checked)
					{
						shodan_txt = shodan.value;
					}
				
				command_string ='> theharvester ' + domain_txt + ' ' + info_source_txt + ' ' + verify_hostname_txt + ' ' + reverse_dns_txt + ' ' + tld_discovery_txt + ' ' + shodan_txt + ' ' + dns_name_txt + ' ' + start_number_txt + ' ' + max_number_txt;
				command.innerHTML = command_string ;*/
			}
			
			updateCommand();
			/*
			toogleCheckboxes();

			$(document).ready(function() {
				$('[data-toggle="tooltip"]').tooltip();
			});
			
			
			/*
			* Create the multiselct view
			*
			*/
		   /* $(document).ready(function() {
		        $('#info-source').multiselect({
		            includeSelectAllOption: true,
		            enableFiltering: true,
		            enableCaseInsensitiveFiltering: true
		        });
		    }); */
		</script>
	</section>
	
	<c:import url="credits.jsp"></c:import>
</body>
</html>