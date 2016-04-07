package webproject.form;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.validator.routines.DomainValidator;
import org.apache.commons.validator.routines.InetAddressValidator;

import webproject.commun.Command;
import webproject.commun.Constants;
import webproject.commun.ToolName;
import webproject.commun.Tools;

public class TlsSledForm {

	private String 				result = "";
	private Map<String, String> errors = new HashMap<String, String>();

	public TlsSledForm(){}

	public String getResult() {
		return result;
	}

	public Map<String, String> getErrors() {
		return errors;
	}

	public Command validateTlsSled(HttpServletRequest request){
		String hostname = Tools.getFieldValue(request, Constants.FIELD_HOSTNAME);
		String port = Tools.getFieldValue(request, Constants.FIELD_PORT);

		try{
			hostnameValidation(hostname);
		} catch (Exception e) {
			setError(Constants.FIELD_HOSTNAME, e.getMessage());
		}

		try{
			Integer.parseInt(port);
		} catch (Exception e) {
			setError(Constants.FIELD_PORT, "Le numéro de port n'est pas un nombre entier");
		}

		
		//add this command to history
		Command command = new Command(ToolName.TlsSled);
		command.setArguments(Constants.FIELD_HOSTNAME, hostname);
		command.setArguments(Constants.FIELD_PORT, port);
		
		if (errors.isEmpty()) {
			// pas d'erreur, on envois la requete
			String commandString = "tlssled "+ hostname+" "+port;
			System.out.println(commandString);
			
			command.setSuccess(true);
			result = "Succ�s de la commande";
		} else {
			command.setSuccess(false);
			result = "Echec de la commande";
		}

		return command;
	}

	private void hostnameValidation(String hostname) throws Exception {
		DomainValidator dv = DomainValidator.getInstance();
		if(dv.isValid(hostname)){
			return;
		}

		InetAddressValidator iav = InetAddressValidator.getInstance();
		if(iav.isValid(hostname)){
			return;
		}

		throw new Exception("Cet hostname est invalide");
	}

	/**
	 * Ajoute un message correspondant au champ spécifié à la map des erreurs.
	 */
	private void setError(String field, String message) {
		errors.put(field, message);
	}

}
