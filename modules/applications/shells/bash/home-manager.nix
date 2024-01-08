{ config, pkgs, vars, ... }:

{
    programs = { 
  		bash = {
			enable = true;
			bashrcExtra = ''

				# Starship Prompt
				eval "$(starship init bash)"

				# Laravel SAIL Bootstrap
				sail_bootstrap() (
					docker run --rm \
						-u "$(id -u):$(id -g)" \
				    	-v "$(pwd):/var/www/html" \
				    	-w /var/www/html \
				   		laravelsail/php82-composer:latest \
					    composer install --ignore-platform-reqs
				)
			'';
	 	};
	};
}
