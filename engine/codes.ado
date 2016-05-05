/*

							  Stata Weaver Package
					   Developed by E. F. Haghish (2014)
			  Center for Medical Biometry and Medical Informatics
						University of Freiburg, Germany
						
						  haghish@imbi.uni-freiburg.de

		
                  The Weaver Package comes with no warranty    	
	
	Description
	===========
	
	shows Stata codes and hides the Results. 
				  
	Weaver version 1.0  August, 2014
	Weaver version 1.1  August, 2014
	Weaver version 1.2  August, 2014
	Weaver version 1.3  September, 2014 
	Weaver version 1.4  October, 2014
	Weaver version 2.0  August, 2015 
	Weaver version 3.1  September, 2015 
*/

		
program codes
version 11	
	
	****************************************************************************
	* the "cod" command
	*
	* - execute the command
	* - append the command to Weaver log
	****************************************************************************
	
	version `c(userversion)': `0'				
				
    tempname canvas
	cap file open `canvas' using `"$weaverFullPath"', write text append  
	
	if "$weaverMarkup" == "html" {
		if "$weaverstyle" == "minimal" {
			cap file write `canvas' `"<pre class="sh_stata" >. "' 				///
			`"`macval(0)'"' _n 
		}
		else {
			cap file write `canvas' `"<pre class="sh_stata" >"' 				///
			`"`macval(0)'"' _n 
		}
		cap file write `canvas' "</pre>" _n(3) 
	}
	
	if "$weaverMarkup" == "latex" {
		cap file write `canvas'  												///
		`"\begin{verbatim}. `macval(0)'\end{verbatim}"' 
	}
		
	if "$weaver" == "" {
		di as txt _n(2) "{hline}"
		di as error "{bf:Warning}" 
		di as txt "{help weaver}'s html log file is off!" 
		di as txt "{hline}{smcl}"	_n
	}
	
end
	
