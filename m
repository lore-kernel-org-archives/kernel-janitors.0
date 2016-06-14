From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Jun 2016 11:16:30 +0000
Subject: [patch 1/2] staging: ks7010: parsing bugs in ks_wlan_read_config_file()
Message-Id: <20160614111630.GA25457@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The check for the NUL terminator is wrong so it looks like this could
read beyond the end of the buffer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/ks7010/ks7010_config.c b/drivers/staging/ks7010/ks7010_config.c
index 4b495cb..fb90012 100644
--- a/drivers/staging/ks7010/ks7010_config.c
+++ b/drivers/staging/ks7010/ks7010_config.c
@@ -358,7 +358,7 @@ int ks_wlan_read_config_file(struct ks_wlan_private *priv)
 					break;
 				wk_p++;
 				for (j = 0; *wk_p != '"'; j++) {
-					if (wk_p = '\0') {
+					if (*wk_p = '\0') {
 						break;
 					}
 					priv->reg.ssid.body[j] = *wk_p++;
@@ -443,7 +443,7 @@ int ks_wlan_read_config_file(struct ks_wlan_private *priv)
 					break;
 				wk_p++;
 				for (j = 0; *wk_p != '"'; j++) {
-					if (wk_p = '\0') {
+					if (*wk_p = '\0') {
 						break;
 					}
 					priv->reg.rom_file[j] = *wk_p++;
