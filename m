From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 10 Sep 2005 12:18:59 +0000
Subject: [KJ] [PATCH 3/4] drivers/net/wan: Replace custom macro with
Message-Id: <20050910121859.GD1218@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31495722110078805=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============31495722110078805==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace the custom is_digit()/is_hex_digit() macros with
isdigit()/isxdigit() from <linux/ctype.h> Additionaly remove unused
macro is_alpha() from <linux/wanpipe.h>

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 drivers/net/wan/cycx_x25.c |    5 +++--
 drivers/net/wan/sdla_fr.c  |    4 ++--
 drivers/net/wan/sdla_x25.c |    8 ++++----
 include/linux/cyclomx.h    |    2 --
 include/linux/wanpipe.h    |    9 ---------
 5 files changed, 9 insertions(+), 19 deletions(-)

diff -urpN -X dontdiff linux-2.6.13/drivers/net/wan/cycx_x25.c linux-2.6.13~macro_removal/drivers/net/wan/cycx_x25.c
--- linux-2.6.13/drivers/net/wan/cycx_x25.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.13~macro_removal/drivers/net/wan/cycx_x25.c	2005-09-10 12:38:31.000000000 +0200
@@ -78,6 +78,7 @@
 
 #define CYCLOMX_X25_DEBUG 1
 
+#include <linux/ctype.h>	/* isdigit() */
 #include <linux/errno.h>	/* return codes */
 #include <linux/if_arp.h>       /* ARPHRD_HWX25 */
 #include <linux/kernel.h>	/* printk(), and other useful stuff */
@@ -418,7 +419,7 @@ static int cycx_wan_new_if(struct wan_de
 
 		/* Set channel timeouts (default if not specified) */
 		chan->idle_tmout = conf->idle_timeout ? conf->idle_timeout : 90;
-	} else if (is_digit(conf->addr[0])) {	/* PVC */
+	} else if (isdigit(conf->addr[0])) {	/* PVC */
 		s16 lcn = dec_to_uint(conf->addr, 0);
 
 		if (lcn >= card->u.x.lo_pvc && lcn <= card->u.x.hi_pvc)
@@ -1531,7 +1532,7 @@ static unsigned dec_to_uint(u8 *str, int
 	if (!len)
 		len = strlen(str);
 
-	for (; len && is_digit(*str); ++str, --len)
+	for (; len && isdigit(*str); ++str, --len)
 		val = (val * 10) + (*str - (unsigned) '0');
 
 	return val;
diff -urpN -X dontdiff linux-2.6.13/drivers/net/wan/sdla_fr.c linux-2.6.13~macro_removal/drivers/net/wan/sdla_fr.c
--- linux-2.6.13/drivers/net/wan/sdla_fr.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.13~macro_removal/drivers/net/wan/sdla_fr.c	2005-09-10 12:38:31.000000000 +0200
@@ -822,7 +822,7 @@ static int new_if(struct wan_device* wan
 	chan->card = card;
 
 	/* verify media address */
-	if (is_digit(conf->addr[0])) {
+	if (isdigit(conf->addr[0])) {
 
 		dlci = dec_to_uint(conf->addr, 0);
 
@@ -3458,7 +3458,7 @@ static unsigned int dec_to_uint (unsigne
 	if (!len) 
 		len = strlen(str);
 
-	for (val = 0; len && is_digit(*str); ++str, --len)
+	for (val = 0; len && isdigit(*str); ++str, --len)
 		val = (val * 10) + (*str - (unsigned)'0');
 
 	return val;
diff -urpN -X dontdiff linux-2.6.13/drivers/net/wan/sdla_x25.c linux-2.6.13~macro_removal/drivers/net/wan/sdla_x25.c
--- linux-2.6.13/drivers/net/wan/sdla_x25.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.13~macro_removal/drivers/net/wan/sdla_x25.c	2005-09-10 12:38:31.000000000 +0200
@@ -957,7 +957,7 @@ static int new_if(struct wan_device* wan
 		chan->hold_timeout = (conf->hold_timeout) ? 
 					conf->hold_timeout : 10;
 
-	}else if (is_digit(conf->addr[0])){	/* PVC */
+	}else if (isdigit(conf->addr[0])){	/* PVC */
 		int lcn = dec_to_uint(conf->addr, 0);
 
 		if ((lcn >= card->u.x.lo_pvc) && (lcn <= card->u.x.hi_pvc)){
@@ -3875,7 +3875,7 @@ static unsigned int dec_to_uint (unsigne
 	if (!len) 
 		len = strlen(str);
 
-	for (val = 0; len && is_digit(*str); ++str, --len)
+	for (val = 0; len && isdigit(*str); ++str, --len)
 		val = (val * 10) + (*str - (unsigned)'0');
 	
 	return val;
@@ -3896,9 +3896,9 @@ static unsigned int hex_to_uint (unsigne
 	for (val = 0; len; ++str, --len)
 	{
 		ch = *str;
-		if (is_digit(ch))
+		if (isdigit(ch))
 			val = (val << 4) + (ch - (unsigned)'0');
-		else if (is_hex_digit(ch))
+		else if (isxdigit(ch))
 			val = (val << 4) + ((ch & 0xDF) - (unsigned)'A' + 10);
 		else break;
 	}
diff -urpN -X dontdiff linux-2.6.13/include/linux/cyclomx.h linux-2.6.13~macro_removal/include/linux/cyclomx.h
--- linux-2.6.13/include/linux/cyclomx.h	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.13~macro_removal/include/linux/cyclomx.h	2005-09-10 12:38:31.000000000 +0200
@@ -37,8 +37,6 @@
 #include <linux/cycx_x25.h>
 #endif
 
-#define	is_digit(ch) (((ch)>=(unsigned)'0'&&(ch)<=(unsigned)'9')?1:0)
-
 /* Adapter Data Space.
  * This structure is needed because we handle multiple cards, otherwise
  * static data would do it.
diff -urpN -X dontdiff linux-2.6.13/include/linux/wanpipe.h linux-2.6.13~macro_removal/include/linux/wanpipe.h
--- linux-2.6.13/include/linux/wanpipe.h	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.13~macro_removal/include/linux/wanpipe.h	2005-09-10 12:38:31.000000000 +0200
@@ -265,15 +265,6 @@ typedef struct {
 #include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 
-
-#define	is_digit(ch) (((ch)>=(unsigned)'0'&&(ch)<=(unsigned)'9')?1:0)
-#define	is_alpha(ch) ((((ch)>=(unsigned)'a'&&(ch)<=(unsigned)'z')||\
-	 	  ((ch)>=(unsigned)'A'&&(ch)<=(unsigned)'Z'))?1:0)
-#define	is_hex_digit(ch) ((((ch)>=(unsigned)'0'&&(ch)<=(unsigned)'9')||\
-	 	  ((ch)>=(unsigned)'a'&&(ch)<=(unsigned)'f')||\
-	 	  ((ch)>=(unsigned)'A'&&(ch)<=(unsigned)'F'))?1:0)
-
-
 /****** Data Structures *****************************************************/
 
 /* Adapter Data Space.

--===============31495722110078805==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31495722110078805==--
