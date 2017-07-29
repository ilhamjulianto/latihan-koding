#!/bin/bash
function mainface {
	clear
	echo "   ____                            _                      _    "
	echo "  / __ \                          | |                    | |   "
	echo " | |  | |_   _____ _ __ _ __   ___| |___      _____  _ __| | __"
	echo " | |  | \ \ / / _ \ '__| '_ \ / _ \ __\ \ /\ / / _ \| '__| |/ /"
	echo " | |__| |\ V /  __/ |  | | | |  __/ |_ \ V  V / (_) | |  |   < "
	echo "  \____/  \_/ \___|_|  |_| |_|\___|\__| \_/\_/ \___/|_|  |_|\_|"
	echo ""
	echo "-----------------------------------------------------------------"
	echo " OpenSSL Self-Signed Certificate Tool v0.1  | kzofajar@gmail.com"
	echo "-----------------------------------------------------------------"
	echo ""
}

function toolabout {
	echo " Version 0.1 (26/07/2017)"
	echo "-------------"
	echo "This tool is created to helps you create a fully Self-Signed"
	echo "Certificate from Root, Intermediate, and Website Certificate"
	echo "Without remembering very long commands."
	echo ""
	echo "This tool's workflows is based on one of my blog posts"
	echo "(http://penguinstunnel.blogspot.co.id) about Self-Signed Cert."
	echo ""
	echo "Created by Fajar Ru @home"
	echo "Thank you for using this tool! :)"
	echo ""
	echo " Credits"
	echo "----------"
	echo ""
	echo "OVN ASCII Art, Created with (http://patorjk.com/software/taag/)"
	echo "My Self-Signed Cert Post Reference (https://jamielinux.com/)"
	echo ""
}

function dirsetup {
	# ASK LOCATION
	echo -n "Enter a location where the certificates will be located (e.g: /home/yourname/openssl): "
	read _startplace

	echo "Creating Directory ($_startplace)..."
			$(mkdir -p $_startplace/certs $_startplace/crl $_startplace/newcerts $_startplace/private && chmod 700 $_startplace/private)
			$(touch $_startplace/index.txt && echo 1000 > $_startplace/serial)
			
			$(mkdir -p $_startplace/intermediate/certs $_startplace/intermediate/csr $_startplace/intermediate/crl $_startplace/intermediate/newcerts $_startplace/intermediate/private && chmod 700 $_startplace/intermediate/private)
			$(touch $_startplace/intermediate/index.txt && echo 1000 > $_startplace/intermediate/serial)
			sleep 0.5

			echo "Creating Root Certificate Configuration..." && sleep 0.2

			# CA CONFIGURATION
			echo "

			[ ca ]
			default_ca = CA_default

			[ CA_default ]
			dir               = "$_startplace"
			certs             = \$dir/certs
			crl_dir           = \$dir/crl
			new_certs_dir     = \$dir/newcerts
			database          = \$dir/index.txt
			serial            = \$dir/serial
			RANDFILE          = \$dir/private/.rand
			
			private_key       = \$dir/private/ca.key.pem
			certificate       = \$dir/certs/ca.cert.pem

			crlnumber         = \$dir/crlnumber
			crl               = \$dir/crl/ca.crl.pem
			crl_extensions    = crl_ext
			default_crl_days  = 30

			default_md        = sha256

			name_opt          = ca_default
			cert_opt          = ca_default
			default_days      = 375
			preserve          = no
			policy            = policy_strict

			[ policy_strict ]
			countryName             = match
			stateOrProvinceName     = match
			organizationName        = match
			organizationalUnitName  = optional
			commonName              = supplied
			emailAddress            = optional

			[ policy_loose ]
			countryName             = optional
			stateOrProvinceName     = optional
			localityName            = optional
			organizationName        = optional
			organizationalUnitName  = optional
			commonName              = supplied
			emailAddress            = optional

			[ req ]
			default_bits        = 2048
			distinguished_name  = req_distinguished_name
			string_mask         = utf8only

			default_md          = sha256

			x509_extensions     = v3_ca

			[ req_distinguished_name ]
			countryName                     = Country Name (2 letter code)
			stateOrProvinceName             = State or Province Name
			localityName                    = Locality Name
			0.organizationName              = Organization Name
			organizationalUnitName          = Organizational Unit Name
			commonName                      = Common Name
			emailAddress                    = Email Address

			countryName_default             = ID
			stateOrProvinceName_default     = Central Java
			localityName_default            = Klaten
			0.organizationName_default      = Overnetwork
			organizationalUnitName_default  =
			emailAddress_default            =

			[ v3_ca ]
			subjectKeyIdentifier = hash
			authorityKeyIdentifier = keyid:always,issuer
			basicConstraints = critical, CA:true
			keyUsage = critical, digitalSignature, cRLSign, keyCertSign

			[ v3_intermediate_ca ]
			subjectKeyIdentifier = hash
			authorityKeyIdentifier = keyid:always,issuer
			basicConstraints = critical, CA:true, pathlen:0
			keyUsage = critical, digitalSignature, cRLSign, keyCertSign

			[ usr_cert ]
			basicConstraints = CA:FALSE
			nsCertType = client, email
			nsComment = 'OpenSSL Generated Client Certificate'
			subjectKeyIdentifier = hash
			authorityKeyIdentifier = keyid,issuer
			keyUsage = critical, nonRepudiation, digitalSignature, keyEncipherment
			extendedKeyUsage = clientAuth, emailProtection

			[ server_cert ]
			basicConstraints = CA:FALSE
			nsCertType = server
			nsComment = 'OpenSSL Generated Server Certificate'
			subjectKeyIdentifier = hash
			authorityKeyIdentifier = keyid,issuer:always
			keyUsage = critical, digitalSignature, keyEncipherment
			extendedKeyUsage = serverAuth

			[ crl_ext ]
			authorityKeyIdentifier=keyid:always

			[ ocsp ]
			basicConstraints = CA:FALSE
			subjectKeyIdentifier = hash
			authorityKeyIdentifier = keyid,issuer
			keyUsage = critical, digitalSignature
			extendedKeyUsage = critical, OCSPSigning
			" >> $_startplace/openssl.cnf

			echo "Creating Intermediate Certificate Configuration..." && sleep 0.2

			# INTERMEDIATE CONFIGURATION
			echo "
			[ ca ]
			default_ca = CA_default

			[ CA_default ].
			dir               = "$_startplace/intermediate"
			certs             = \$dir/certs
			crl_dir           = \$dir/crl
			new_certs_dir     = \$dir/newcerts
			database          = \$dir/index.txt
			serial            = \$dir/serial
			RANDFILE          = \$dir/private/.rand

			private_key       = \$dir/private/intermediate.key.pem
			certificate       = \$dir/certs/intermediate.cert.pem

			crlnumber         = \$dir/crlnumber
			crl               = \$dir/crl/intermediate.crl.pem
			crl_extensions    = crl_ext
			default_crl_days  = 30

			default_md        = sha256

			name_opt          = ca_default
			cert_opt          = ca_default
			default_days      = 375
			preserve          = no
			policy            = policy_loose

			[ policy_strict ]
			countryName             = match
			stateOrProvinceName     = match
			organizationName        = match
			organizationalUnitName  = optional
			commonName              = supplied
			emailAddress            = optional

			[ policy_loose ]
			countryName             = optional
			stateOrProvinceName     = optional
			localityName            = optional
			organizationName        = optional
			organizationalUnitName  = optional
			commonName              = supplied
			emailAddress            = optional

			[ req ]
			default_bits        = 2048
			distinguished_name  = req_distinguished_name
			string_mask         = utf8only

			default_md          = sha256

			x509_extensions     = v3_ca

			[ req_distinguished_name ]
			countryName                     = Country Name (2 letter code)
			stateOrProvinceName             = State or Province Name
			localityName                    = Locality Name
			0.organizationName              = Organization Name
			organizationalUnitName          = Organizational Unit Name
			commonName                      = Common Name
			emailAddress                    = Email Address

			countryName_default             = ID
			stateOrProvinceName_default     = Central Java
			localityName_default            = Klaten
			0.organizationName_default      = Overnetwork
			organizationalUnitName_default  =
			emailAddress_default            =

			[ v3_ca ]
			subjectKeyIdentifier = hash
			authorityKeyIdentifier = keyid:always,issuer
			basicConstraints = critical, CA:true
			keyUsage = critical, digitalSignature, cRLSign, keyCertSign

			[ v3_intermediate_ca ]
			subjectKeyIdentifier = hash
			authorityKeyIdentifier = keyid:always,issuer
			basicConstraints = critical, CA:true, pathlen:0
			keyUsage = critical, digitalSignature, cRLSign, keyCertSign

			[ usr_cert ]
			basicConstraints = CA:FALSE
			nsCertType = client, email
			nsComment = 'OpenSSL Generated Client Certificate'
			subjectKeyIdentifier = hash
			authorityKeyIdentifier = keyid,issuer
			keyUsage = critical, nonRepudiation, digitalSignature, keyEncipherment
			extendedKeyUsage = clientAuth, emailProtection

			[ server_cert ]
			basicConstraints = CA:FALSE
			nsCertType = server
			nsComment = 'OpenSSL Generated Server Certificate'
			subjectKeyIdentifier = hash
			authorityKeyIdentifier = keyid,issuer:always
			keyUsage = critical, digitalSignature, keyEncipherment
			extendedKeyUsage = serverAuth

			[ crl_ext ]
			authorityKeyIdentifier=keyid:always

			[ ocsp ]
			basicConstraints = CA:FALSE
			subjectKeyIdentifier = hash
			authorityKeyIdentifier = keyid,issuer
			keyUsage = critical, digitalSignature
			extendedKeyUsage = critical, OCSPSigning
			" >> $_startplace/intermediate/openssl.cnf
			
			echo "Done!"
			sleep 0.2
}

function create_root_cert {
	# ASK LOCATION
	echo -n "Enter your defined Certificate Location: "
	read _certlocation

	# ASK CERT EXPIRATION TIME
	echo ""
	echo -n "Enter Root Certificate expiration time in days: "
	read _rootcertexp

	# GENERATE PRIVATE KEY
	echo ""
	echo "Generating Root Private Key with AES256 4096-bit..."
	openssl genrsa -aes256 -out $_certlocation/private/ca.key.pem 4096
	chmod 400 $_certlocation/private/ca.key.pem

	# GENERATE CERTIFICATE WITH ENTERED EXPIRATION
	echo ""
	echo "Generating Root Certificate with " $_rootcertexp " Days Expiration..."
	openssl req -config $_certlocation/openssl.cnf -key $_certlocation/private/ca.key.pem -new -x509 -days $_rootcertexp -sha256 -extensions v3_ca -out $_certlocation/certs/ca.cert.pem

	# ADJUSTING ACCESS PRIVILEGES
	echo ""
	echo "Adjusting Privileges..."
	chmod 400 $_certlocation/private/ca.key.pem
	chmod 444 $_certlocation/certs/ca.cert.pem

	# CERTIFICATE CHECK
	echo ""
	echo "Done! Certificate Result:"
	openssl x509 -noout -text -in $_certlocation/certs/ca.cert.pem
}

function create_intermediate_cert {
	# ASK LOCATION
	echo -n "Enter your defined Certificate Location: "
	read _certlocation

	# ASK CERTIFICATE EXPIRATION
	echo ""
	echo "Enter Intermediate Certificate expiration time in days."
	echo "It must be less or no more than Root Certificate!"
	echo -n "Duration: "
	read _intcertexp

	# GENERATE INTERMEDIATE PRIVATE KEY
	echo ""
	echo "Generating Intermediate Private Key with AES256 4096-bit..."
	openssl genrsa -aes256 -out $_certlocation/intermediate/private/intermediate.key.pem 4096

	# GENERATE INTERMEDIATE CSR
	echo ""
	echo "Generating Intermediate Cert Signing Request..."
	echo "Please note that Intermediate CSR Data should be the same as Root except for CN!"
	openssl req -config $_certlocation/intermediate/openssl.cnf -new -sha256 -key $_certlocation/intermediate/private/intermediate.key.pem -out $_certlocation/intermediate/csr/intermediate.csr.pem
	
	# SIGNING INTERMEDIATE CSR TO CERTIFICATE
	echo ""
	echo "Generating and Signing Intermediate Certificate with " $_intcertexp " Days Expiration..."
	openssl ca -config $_certlocation/openssl.cnf -extensions v3_intermediate_ca -days $_intcertexp -notext -md sha256 -in $_certlocation/intermediate/csr/intermediate.csr.pem -out $_certlocation/intermediate/certs/intermediate.cert.pem

	# VERIFY INTERMEDIATE CERT TO ROOT CERT
	echo ""
	echo "Verifying Intermediate Certificate to Root..."
	openssl verify -CAfile $_certlocation/certs/ca.cert.pem $_certlocation/intermediate/certs/intermediate.cert.pem

	# CHAINING THIS INTERMEDIATE CERT WITH ROOT CERT INTO ONE FILE
	echo ""
	echo "Generating Certificate Chain..."
	cat $_certlocation/intermediate/certs/intermediate.cert.pem $_certlocation/certs/ca.cert.pem > $_certlocation/intermediate/certs/ca-chain.cert.pem

	# ADJUST ACCESS PRIVILEGES
	echo ""
	echo "Adjusting Privileges..."
	chmod 400 $_certlocation/intermediate/private/intermediate.key.pem
	chmod 444 $_certlocation/intermediate/certs/intermediate.cert.pem
	chmod 444 $_certlocation/intermediate/certs/ca-chain.cert.pem

	# INCREMENT CRL
	echo ""
	echo "Incrementing Certificate Revocation Lists..."
	echo 1000 > $_certlocation/intermediate/crlnumber

	# CERTIFICATE CHECK
	echo ""
	echo "Done! Certificate Result:"
	openssl x509 -noout -text -in $_certlocation/intermediate/certs/intermediate.cert.pem
}

function create_website_cert {
	# ASK LOCATION
	echo -n "Enter your defined Certificate Location: "
	read _certlocation

	# ASK CERTIFICATE EXPIRATION
	echo ""
	echo -n "Enter Certificate expiration time in days: "
	read _webcertexp

	# GENERATE WEB CERT PRIVATE KEY
	echo ""
	echo "Generating Private Key with AES256 2048-bit..."
	openssl genrsa -aes256 -out $_certlocation/intermediate/private/webcertificate.key.pem 2048

	# GENERATE WEB CSR
	echo ""
	echo "Generating Web Certificate Signing Request..."
	openssl req -config $_certlocation/intermediate/openssl.cnf -key $_certlocation/intermediate/private/webcertificate.key.pem -new -sha256 -out $_certlocation/intermediate/csr/webcertificate.csr.pem

	# SIGN WEB CSR TO CERTIFICATE
	echo ""
	echo "Generating and Signing Web Certificate with " $_webcertexp " Days Expire..."
	openssl ca -config $_certlocation/intermediate/openssl.cnf -extensions server_cert -days $_webcertexp -notext -md sha256 -in $_certlocation/intermediate/csr/webcertificate.csr.pem -out $_certlocation/intermediate/certs/webcertificate.cert.pem

	# VERIFY WEB CERT AGAINST CHAINED ROOT AND INTERMEDIATE CERT
	echo ""
	echo "Verifying Web Certificate..."
	openssl verify -CAfile $_certlocation/certs/ca-chain.cert.pem $_certlocation/certs/webcertificate.cert.pem

	# ADJUST ACCESS PRIVILEGES
	echo ""
	echo "Adjusting Privileges..."
	chmod 400 $_certlocation/intermediate/private/webcertificate.key.pem
	chmod 444 $_certlocation/intermediate/private/webcertificate.cert.pem
	
	# CERTIFICATE CHECK
	echo ""
	echo "Certificate Result:"
	openssl x509 -noout -text -in $_certlocation/intermediate/certs/webcertificate.cert.pem

	echo ""
	echo "These are your Hot Certificate, Please move these files ASAP to avoid being overwritten:"
	echo "- Certificate: " $_certlocation "/intermediate/certs/webcertificate.cert.pem"
	echo "- Private Key: " $_certlocation "/intermediate/private/webcertificate.key.pem"
	echo ""
	echo "Thank you for using this small tool! :) --Fajar Ru (kzofajar@gmail.com)"
}

	# MAINFACE FUNCTION
	mainface

	# MAINMENU
	pilihan=(
		'Directory & Config Setup' 
		'Create: Root Cert' 
		'Create: Intermediate Cert'
		'Create: Website Cert'
		'Help/About'
		'Exit'
		)
	PS3='Your Choice: '

	select opt in "${pilihan[@]}"
		do
			case $opt in
	    		"Directory & Config Setup")
					echo ""
					dirsetup
	    		;;
	    			
				"Create: Root Cert")
					echo ""
					create_root_cert
	    		;;

				"Create: Intermediate Cert")
					echo ""
					create_intermediate_cert

	    		;;

				"Create: Website Cert")
					echo ""
					create_website_cert
	    		;;

				"Help/About")
					mainface
					toolabout
	    		;;

				"Exit")
					echo 'Goodbye..'
					exit
	    		;;

				*) 
					echo 'Please choose a number.'
				;;
			esac
		done
