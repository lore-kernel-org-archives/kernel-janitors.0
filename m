From: Brandon Philips <brandon@ifup.org>
Date: Sat, 04 Nov 2006 08:16:57 +0000
Subject: [KJ] [PATCH] keyboard: save a char pointer in k_cur
Message-Id: <20061104081657.GA5156@plankton.ifup.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

To save a char pointer in the final assembly change to alternate string
form.

Signed-off-by: Brandon Philips <brandon@ifup.org>
---
 drivers/char/keyboard.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6/drivers/char/keyboard.c
=================================--- linux-2.6.orig/drivers/char/keyboard.c
+++ linux-2.6/drivers/char/keyboard.c
@@ -710,7 +710,7 @@ static void k_fn(struct vc_data *vc, uns
 
 static void k_cur(struct vc_data *vc, unsigned char value, char up_flag)
 {
-	static const char *cur_chars = "BDCA";
+	static const char cur_chars[] = "BDCA";
 
 	if (up_flag)
 		return;

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
