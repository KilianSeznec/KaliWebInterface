<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="nav.jsp"></c:import>
<body>

	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" media="screen" rel="stylesheet" type="text/css">

	<section>
		<div class="panel panel-default col-md-12 col-lg-12" style="padding:0px;">
		  
		  <c:import url="top_page.jsp"></c:import>
		  
		  <div class="panel-footer">
			<div class="row">
			
				<h3 class=col-lg-12>
					<span	data-toggle="tooltip" 
							title="<c:out value="${language.getLanguageValue('/site/tools/$tool/desc-tool')}"/>"
							data-placement="right">
							
						The Harvester
						
					</span>
					
					<div class="help-picture"
						data-toggle="tooltip" 
						title="<c:out value="${language.getLanguageValue('/site/tools/$tool/desc-tool')}" />"
						data-placement="left">
					</div>
				</h3>
					
				</div>
			<form method="POST" action="<c:url value="/zenmap.html" ></c:url>">
					<div>
						<label for="domain" data-toggle="tooltip"
							title="<c:out value="${language.getLanguageValue('/site/tools/$tool/aide/domaine')}" />"
							data-placement="right"> <c:out value="${language.getLanguageValue('/site/tools/$tool/options/domaine')}" />
						</label>
						<div class="input-group col-lg-2 col-mg-4 col-sm-6">
							<input type="text" class="form-control" placeholder="Hostname"
								name="domain" id="domain" onkeyup="updateCommand()"
								onselect="updateCommand()" autofocus required> 
							<span
								class="input-group-addon" id="basic-addon2"
								data-toggle="tooltip"
								title="<c:out value="${language.getLanguageValue('/site/tools/$tool/aide/domaine')}" />"
								data-placement="bottom"> <i class="fa fa-question fa-lg"></i>
							</span>
						</div>
						<p class="error">${form.errors['domain']}</p>
					</div>


					<div>
						<label for="info-source" data-toggle="tooltip"
							title="<c:out value="${language.getLanguageValue('/site/tools/$tool/aide/info-source')}" />"
							data-placement="right"> <c:out value="${language.getLanguageValue('/site/tools/$tool/options/info-source/nom')}" />
						</label>
						<div class="input-group col-lg-2 col-mg-4 col-sm-6">
							<select class="form-control ui fluid dropdown input-group col-lg-12 col-mg-12 col-sm-12" name="info-source" id="info-source" onchange="updateCommand()" autofocus required multiple style="buttonWidth: 500px""">
								<optgroup label="${language.getLanguageValue('/site/tools/$tool/options/info-source/group-search-engine')}">
									<option value="google" id="google"><c:out value="${language.getLanguageValue('/site/tools/$tool/options/info-source/google')}" /></option>
									<option value="google-cse" id="google-cse"><c:out value="${language.getLanguageValue('/site/tools/$tool/options/info-source/google-cse')}" /></option>
									<option value="bing" id="bing"><c:out value="${language.getLanguageValue('/site/tools/$tool/options/info-source/bing')}" /></option>
									<option value="bing-api" id="bing-api"><c:out value="${language.getLanguageValue('/site/tools/$tool/options/info-source/bing-api')}" /></option>
								</optgroup>
								<optgroup label="${language.getLanguageValue('/site/tools/$tool/options/info-source/group-social-network')}">
									<option value="pgp" id="pgp"><c:out value="${language.getLanguageValue('/site/tools/$tool/options/info-source/pgp')}" /></option>
									<option value="linkedin" id="linkedin"><c:out value="${language.getLanguageValue('/site/tools/$tool/options/info-source/linkedin')}" /></option>
									<option value="google-profiles" id="google-profiles"><c:out value="${language.getLanguageValue('/site/tools/$tool/options/info-source/google-profiles')}" /></option>
									<option value="jigsaw" id="jigsaw"><c:out value="${language.getLanguageValue('/site/tools/$tool/options/info-source/jigsaw')}" /></option>
									<option value="twitter" id="twitter"><c:out value="${language.getLanguageValue('/site/tools/$tool/options/info-source/twitter')}" /></option>
									<option value="google-plus" id="google-plus"><c:out value="${language.getLanguageValue('/site/tools/$tool/options/info-source/google-plus')}" /></option>
								</optgroup>
							</select>
							<button type="button" id="select_all" name="select_all" class="btn btn-success">Select all</button>
							<button type="button" id="select_all" name="select_all" class="btn btn-danger glyphicon glyphicon-remove"></button>
							<span
								class="input-group-addon" id="basic-addon2"
								data-toggle="tooltip"
								title="<c:out value="${language.getLanguageValue('/site/tools/$tool/aide/cible')}" />"
								data-placement="bottom"> <i class="fa fa-question fa-lg"></i>
							</span>
						</div>
					</div>

					<br>

					<div 	class=command id=command 
						data-toggle="tooltip" 
						title="C'est la ligne qui sera envoyée dans le terminal de notre système Kali Linux"
						data-placement="bottom">
					> nmap
				</div>
				
				<div style="text-align:right">
					<br>
					<button type="submit" class="btn btn-default" aria-label="Right Align">
						<c:out value="${language.getLanguageValue('/site/tools/$tool/actions/bouton-envoyer')}" />
					</button>
				</div>
				
				<div>
					<p class="${empty form.errors ? 'succes' : 'error'}">${form.result}</p>
				</div>
			</form>
		  </div>
		</div>
		
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="bootstrap/js/bootstrap.js"></script>
		<script type="text/javascript" src="bootstrap/js/angular.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/angularjs-multiple-select.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap-multiselect.js"></script>
		

		<script>
			var domain = document.getElementById('domain'),
				scan_type = document.getElementById('info-source'),
				command = document.getElementById('command');
			
			function updateCommand(){
				
				var hostname_txt = '';
				var scan_txt = '';
				var command_string = '';
				var scan_index = scan_type.selectedIndex;
					
				if(domain.value.length == 0){
					hostname_txt = '&lt;hostname&gt;';
				}else{
					hostname_txt = hostname.value;
				}
				
				switch(scan_index)
				{
					case 0:
						scan_txt = '-T4 -A -v';
						break;
					case 1:
						scan_txt = '-sS -sU T4 -A -v';
						break;
					case 2:
						scan_txt = '-p 1-65535 -T4 -A -v';
						break;
					case 3:
						scan_txt = '-T4 -A -v -Pn';
						break;
					case 4:
						scan_txt = '-T4 -F';
						break;
					case 5:
						scan_txt = '-sV -T4 -O -F --version-light';
						break;
					case 6:
						scan_txt = '-sn';
						break;
					case 7:
						scan_txt = '-sn --traceroute';
						break;
					case 8:
						scan_txt = '-v';
						break;
					case 9:
						scan_txt = 'S80,443 -PA3389 -PU4-sS -sU -T4 -A -v -PE -PP -P0125 -PY -g 53 --script "default or (discovery and safe)"';
						break;
					default:
						scan_txt = '&lt;scan_type&gt;';
				}
				
				command_string ='> nmap ' + hostname_txt + ' ' + scan_txt;
				command.innerHTML = command_string ;
			}
			
			updateCommand();

			$(document).ready(function() {
				$('[data-toggle="tooltip"]').tooltip();
			});
			
		    $(document).ready(function() {
		        $('#info-source').multiselect();
		    });
		    
		    $('#select_all').click(function() {
		        $('#info-source option').prop('selected', true);
		    });
		</script>
	</section>
</body>
</html>