// CDs com Table function e parametros
@EndUserText.label: 'CDS Table Function com parametros'
define table function ZCDS_MAGF_M3A2_PARAMETER
with parameters
    @Environment.systemField: #CLIENT
    client : abap.clnt,
    p_connid : s_conn_id  
returns {
  key client    : abap.clnt;
  key carrid    : s_carrid;
  key connid    : s_conn_id;
      carrname  : s_carrname;
      currcode  : s_currcode;
      url       : s_url;
      countryfr : land1;
      airpfrom  : s_fromairp;
      countryto : land1;
      cityfrom  : s_from_cit;
      cityto    : s_to_city;
}
implemented by method zcl_amdp_magf_m3a2_par=>get_flights;
