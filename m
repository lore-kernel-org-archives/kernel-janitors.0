From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Mon, 14 Feb 2005 22:02:52 +0000
Subject: [KJ] [PATCH][RESUBMIT][10/21] drivers/net/tulip/* - compile warning
Message-Id: <42113C2C.23357.52BE7E@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83704452287384434=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============83704452287384434==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - cast pointer arguments to correct 
pointer type to silence compiler warning

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/net/tulip/dmfe.c linux-2.6.11-rc3-mm2/drivers/net/tulip/dmfe.c
--- linux-2.6.11-rc3-mm2-original/drivers/net/tulip/dmfe.c	2005-02-12 12:06:25.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/net/tulip/dmfe.c	2005-02-12 17:07:32.000000000 +0200
@@ -1806,7 +1806,7 @@ static void dmfe_parse_srom(struct dmfe_
 	if ( ( (int) srom[18] & 0xff) == SROM_V41_CODE) {
 		/* SROM V4.01 */
 		/* Get NIC support media mode */
-		db->NIC_capability = le16_to_cpup(srom + 34);
+		db->NIC_capability = le16_to_cpup((const __le16 *)(srom + 34));
 		db->PHY_reg4 = 0;
 		for (tmp_reg = 1; tmp_reg < 0x10; tmp_reg <<= 1) {
 			switch( db->NIC_capability & tmp_reg ) {
@@ -1818,7 +1818,7 @@ static void dmfe_parse_srom(struct dmfe_
 		}
 
 		/* Media Mode Force or not check */
-		dmfe_mode = le32_to_cpup(srom + 34) & le32_to_cpup(srom + 36);
+		dmfe_mode = le32_to_cpup((const __le32 *)(srom + 34)) & le32_to_cpup((const __le32 *)(srom + 36));
 		switch(dmfe_mode) {
 		case 0x4: dmfe_media_mode = DMFE_100MHF; break;	/* 100MHF */
 		case 0x2: dmfe_media_mode = DMFE_10MFD; break;	/* 10MFD */




--===============83704452287384434==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83704452287384434==--
