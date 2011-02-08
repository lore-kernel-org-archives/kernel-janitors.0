From: Dan Carpenter <error27@gmail.com>
Date: Tue, 08 Feb 2011 22:45:13 +0000
Subject: [patch] Staging: rtl8712: fix math errors in snprintf()
Message-Id: <20110208224513.GQ4384@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The original code had calls to snprintf(p, 7, "wpa_ie=") but that string
is 8 characters (because snprintf() puts a NUL terminator on the end).
So instead of an '=' the what gets written to buf is a NUL terminator
followed by the rest of the string.

And actually the %02x formats are three chars as well when you include
the terminator.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Compile tested only.

diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
index 685a7b1..ddd068c 100644
--- a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
+++ b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
@@ -280,18 +280,20 @@ static inline char *translate_scan(struct _adapter *padapter,
 	/* parsing WPA/WPA2 IE */
 	{
 		u16 wpa_len = 0, rsn_len = 0;
-		u8 *p;
+		int n;
 		sint out_len = 0;
 		out_len = r8712_get_sec_ie(pnetwork->network.IEs,
 					   pnetwork->network.
 					   IELength, rsn_ie, &rsn_len,
 					   wpa_ie, &wpa_len);
 		if (wpa_len > 0) {
-			p = buf;
 			memset(buf, 0, MAX_WPA_IE_LEN);
-			p += snprintf(p, 7, "wpa_ie=");
-			for (i = 0; i < wpa_len; i++)
-				p += snprintf(p, 2, "%02x", wpa_ie[i]);
+			n = sprintf(buf, "wpa_ie=");
+			for (i = 0; i < wpa_len; i++) {
+				n += snprintf(buf + n, MAX_WPA_IE_LEN - n, "%02x", wpa_ie[i]);
+				if (n >= MAX_WPA_IE_LEN)
+					break;
+			}
 			memset(&iwe, 0, sizeof(iwe));
 			iwe.cmd = IWEVCUSTOM;
 			iwe.u.data.length = (u16)strlen(buf);
@@ -304,11 +306,13 @@ static inline char *translate_scan(struct _adapter *padapter,
 				&iwe, wpa_ie);
 		}
 		if (rsn_len > 0) {
-			p = buf;
 			memset(buf, 0, MAX_WPA_IE_LEN);
-			p += snprintf(p, 7, "rsn_ie=");
-			for (i = 0; i < rsn_len; i++)
-				p += snprintf(p, 2, "%02x", rsn_ie[i]);
+			n = sprintf(buf, "rsn_ie=");
+			for (i = 0; i < rsn_len; i++) {
+				n += snprintf(buf + n, MAX_WPA_IE_LEN - n, "%02x", rsn_ie[i]);
+				if (n >= MAX_WPA_IE_LEN)
+					break;
+			}
 			memset(&iwe, 0, sizeof(iwe));
 			iwe.cmd = IWEVCUSTOM;
 			iwe.u.data.length = strlen(buf);
