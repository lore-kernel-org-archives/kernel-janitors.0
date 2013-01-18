From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Jan 2013 13:05:12 +0000
Subject: [patch] target: change sprintf to snprintf
Message-Id: <20130118130512.GA1634@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

"buf" is 128 characters and "vpd->device_identifier" is 256.  It makes
the static checkers complain.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Probably we should just raise VPD_TMP_BUF_SIZE to 300.

diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
index bd587b7..96b64d5 100644
--- a/drivers/target/target_core_transport.c
+++ b/drivers/target/target_core_transport.c
@@ -907,15 +907,18 @@ int transport_dump_vpd_ident(
 
 	switch (vpd->device_identifier_code_set) {
 	case 0x01: /* Binary */
-		sprintf(buf, "T10 VPD Binary Device Identifier: %s\n",
+		snprintf(buf, sizeof(buf),
+			"T10 VPD Binary Device Identifier: %s\n",
 			&vpd->device_identifier[0]);
 		break;
 	case 0x02: /* ASCII */
-		sprintf(buf, "T10 VPD ASCII Device Identifier: %s\n",
+		snprintf(buf, sizeof(buf),
+			"T10 VPD ASCII Device Identifier: %s\n",
 			&vpd->device_identifier[0]);
 		break;
 	case 0x03: /* UTF-8 */
-		sprintf(buf, "T10 VPD UTF-8 Device Identifier: %s\n",
+		snprintf(buf, sizeof(buf),
+			"T10 VPD UTF-8 Device Identifier: %s\n",
 			&vpd->device_identifier[0]);
 		break;
 	default:
