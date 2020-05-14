gl input "C:\Users\acer\Dropbox\projects\chad\input"
gl temp "C:\Users\acer\Dropbox\projects\chad\temp"
gl output "C:\Users\acer\Dropbox\projects\chad\output"

local g_list "Dep_tchad_region Region_region"
foreach g of local d_list {
insheet using "$output\OD_length_`g'_INSEED_ren.csv", comma clear
ren x o_nn
tempfile temp temp2
save `temp', replace

insheet using "$temp\dests_snapped_`g'.csv", comma clear
keep name pop nomreg nn
ren nn d_nn
save `temp2', replace

insheet using "$temp\origins_snapped_`g'.csv", comma clear
keep lon lat id nn
order id lon lat id nn
ren nn o_nn
merge 1:1 o_nn using `temp', nogen
reshape long x, i(id) j(d_nn)
merge m:1 d_nn using `temp2', nogen
sort id d_nn
ren x dist
save "$output/OD_`g'_inseed.dta", replace
outsheet using "$output/OD_`g'_inseed.csv", comma replace
}

