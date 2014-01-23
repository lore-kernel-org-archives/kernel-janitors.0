From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 23 Jan 2014 08:24:27 +0000
Subject: [patch] staging: cxt1e1: cleanup mfg_template[] a bit
Message-Id: <20140123082426.GB28688@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

1) Make it static.
2) Change it to u8 data instead of short.
3) This means we can memcpy() it to the correct location instead of
   using a for loop.
4) With memcpy() we can use the union member we want directly instead of
   copying to the generic .bytes union member.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/cxt1e1/pmc93x6_eeprom.c b/drivers/staging/cxt1e1/pmc93x6_eeprom.c
index 137b63cb5537..78cc1709ebdb 100644
--- a/drivers/staging/cxt1e1/pmc93x6_eeprom.c
+++ b/drivers/staging/cxt1e1/pmc93x6_eeprom.c
@@ -90,7 +90,7 @@ static int  ByteReverseBuilt = FALSE;
  *------------------------------------------------------------------------
  */
 
-short       mfg_template[sizeof (FLD_TYPE2)] +static u8 mfg_template[sizeof(FLD_TYPE2)]  {
     PROM_FORMAT_TYPE2,          /* type; */
     0x00, 0x1A,                 /* length[2]; */
@@ -491,13 +491,11 @@ pmc_init_seeprom (u_int32_t addr, u_int32_t serialNum)
     PROMFORMAT  buffer;         /* Memory image of structure */
     u_int32_t   crc;            /* CRC of structure */
     time_t      createTime;
-    int         i;
 
     createTime = get_seconds ();
 
     /* use template data */
-    for (i = 0; i < sizeof (FLD_TYPE2); ++i)
-        buffer.bytes[i] = mfg_template[i];
+    memcpy(&buffer.fldType2, mfg_template, sizeof(buffer.fldType2));
 
     /* Update serial number field in buffer */
     pmcSetBuffValue (&buffer.fldType2.Serial[3], serialNum, 3);
