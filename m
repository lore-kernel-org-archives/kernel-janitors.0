From: "Mauricio Mauad" <mauad@consultant.com>
Date: Sat, 02 Sep 2006 23:32:39 +0000
Subject: [KJ] [PATCH] Pointed by kj-devel.pl over drivers/ide/ide.c
Message-Id: <20060902233239.4A23C49B6BE@ws1-3a.us4.outblaze.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

    I'm just sending you a very simple patch just to follow the guidelines
pointed on the TODO list. That's the way? If yes, I will send you some more.

diff --git a/drivers/ide/ide.c b/drivers/ide/ide.c
index 3fdab56..3276391 100644
--- a/drivers/ide/ide.c
+++ b/drivers/ide/ide.c
@@ -1427,8 +1427,8 @@ static int __init stridx (const char *s,
  */
 static int __init match_parm (char *s, const char *keywords[], int vals[], int max_vals)
 {
-       static const char *decimal = "0123456789";
-       static const char *hex = "0123456789abcdef";
+       static const char decimal[] = "0123456789";
+       static const char hex[] = "0123456789abcdef";
        int i, n;

        if (*s++ = '=') {


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
