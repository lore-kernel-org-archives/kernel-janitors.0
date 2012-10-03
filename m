From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Oct 2012 11:17:58 +0000
Subject: re: X.509: Add an ASN.1 decoder
Message-Id: <20121003111758.GA3954@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello David Howells,

The patch 788380fa26a6: "X.509: Add an ASN.1 decoder" from Sep 24, 
2012, leads to the following warning:
lib/asn1_decoder.c:320 asn1_ber_decoder()
	 warn: unsigned 'len' is never less than zero.

lib/asn1_decoder.c
   315          skip_data:
   316                  if (!(flags & FLAG_CONS)) {
   317                          if (flags & FLAG_INDEFINITE_LENGTH) {
   318                                  len = asn1_find_indefinite_length(
   319                                          data + dp, datalen - dp, &errmsg, &dp);
   320                                  if (len < 0)
                                            ^^^^^^^
asn1_find_indefinite_length() returns -1 on error but "len" is unsigned.

   321                                          goto error;
   322                          }
   323                          pr_debug("- LEAF: %zu\n", len);
   324                          dp += len;
   325                  }

regards,
dan carpenter

