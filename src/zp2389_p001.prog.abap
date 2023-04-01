*&---------------------------------------------------------------------*
*& Report ZP2389_P001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZP2389_P001.


*DATA:
*      lv_sign_key_x                TYPE xstring,
*      lv_hmac_result               TYPE string.
*
*DATA(lv_binary_secret) = cl_abap_hmac=>string_to_xstring('SECRETKEY').
*
*    cl_abap_hmac=>calculate_hmac_for_char(
*      EXPORTING
*        if_algorithm           = 'SHA256'           "Hash Algorithm
*        if_key                 = lv_binary_secret   "HMAC Key
*        if_data                = 'abc'   "Data
*      IMPORTING
*        ef_hmacb64string       = lv_hmac_result  "HMAC value as base64-encoded string
*    ).


* MD5, SHA1, SHA256, SHA384, SHA512
DATA lv_algo TYPE string value 'MD5'.
* zu kodierende String-Daten
DATA lv_data TYPE string value 'DAVUT'.

* Hash-Wert als Hex-Encoded String
DATA: lv_hashstring TYPE string.
* Hash-Wert binär als XString
DATA: lv_hashxstring TYPE xstring.
* Hash-Wert als Base64-Encoded String
DATA: lv_hashb64string TYPE string.

*TRY.
* Generische Hash-Funktion (Char-Input)
    cl_abap_message_digest=>calculate_hash_for_char( EXPORTING
                                                       if_algorithm     = lv_algo
                                                       if_data          = lv_data
                                                     IMPORTING
                                                       ef_hashstring    = lv_hashstring
                                                       ef_hashxstring   = lv_hashxstring
                                                       ef_hashb64string = lv_hashb64string ).
    cl_demo_output=>write_data( lv_algo ).
    cl_demo_output=>write_data( lv_data ).
    cl_demo_output=>write_data( lv_hashstring ).
    cl_demo_output=>write_data( lv_hashxstring ).
    cl_demo_output=>write_data( lv_hashb64string ).
    cl_demo_output=>display( ).
*  CATCH cx_root INTO DATA(e_txt).
*    WRITE: / e_txt->get_text( ).
*ENDTRY.
