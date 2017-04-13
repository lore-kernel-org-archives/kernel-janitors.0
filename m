From: Colin King <colin.king@canonical.com>
Date: Thu, 13 Apr 2017 14:13:46 +0000
Subject: [PATCH] staging: rtl8723bs: remove redundant comparisons of unsigned ints with >= 0
Message-Id: <20170413141346.9791-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, Larry Finger <Larry.Finger@lwfinger.net>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The comparison of mode >= 0 is redundant as mode is a u32 and this
is always true.  Remove this redundant code.

Detected with CoverityScan ("Unsigned compared against 0")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/core/rtw_debug.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
index 51cef55d3f76..fc6b94d59c37 100644
--- a/drivers/staging/rtl8723bs/core/rtw_debug.c
+++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
@@ -1031,7 +1031,7 @@ ssize_t proc_set_ht_enable(struct file *file, const char __user *buffer, size_t
 	if (buffer && !copy_from_user(tmp, buffer, sizeof(tmp))) {
 		sscanf(tmp, "%d ", &mode);
 
-		if (pregpriv && mode >= 0 && mode < 2) {
+		if (pregpriv && mode < 2) {
 			pregpriv->ht_enable = mode;
 			printk("ht_enable =%d\n", pregpriv->ht_enable);
 		}
@@ -1150,7 +1150,7 @@ ssize_t proc_set_rx_ampdu(struct file *file, const char __user *buffer, size_t c
 
 		sscanf(tmp, "%d ", &mode);
 
-		if (pregpriv && mode >= 0 && mode < 2) {
+		if (pregpriv && mode < 2) {
 			pmlmeinfo->bAcceptAddbaReq = mode;
 			DBG_871X("pmlmeinfo->bAcceptAddbaReq =%d\n", pmlmeinfo->bAcceptAddbaReq);
 			if (mode = 0) {
@@ -1191,7 +1191,7 @@ ssize_t proc_set_en_fwps(struct file *file, const char __user *buffer, size_t co
 	if (buffer && !copy_from_user(tmp, buffer, sizeof(tmp))) {
 		sscanf(tmp, "%d ", &mode);
 
-		if (pregpriv && mode >= 0 && mode < 2) {
+		if (pregpriv && mode < 2) {
 			pregpriv->check_fw_ps = mode;
 			DBG_871X("pregpriv->check_fw_ps =%d\n", pregpriv->check_fw_ps);
 		}
-- 
2.11.0

