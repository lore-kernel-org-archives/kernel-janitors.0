From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Thu, 29 Jan 2004 19:04:56 +0000
Subject: [Kernel-janitors] [PATCH] Fix warning in
Message-Id: <1075403095.5628.59.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1074877605.5269.10.camel@telecentrolivre>
In-Reply-To: <1074877605.5269.10.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


hi guys,

When !CONFIG_PROC_FS, I'm getting this warning:

drivers/net/wireless/strip.c:1169: warning: `strip_seq_fops' defined but not used

This patch fixes that.

diff -X dontdiff -Nru linux-2.6.2-rc2-bk2/drivers/net/wireless/strip.c linux-2.6.2-rc2-bk2~/drivers/net/wireless/strip.c
--- linux-2.6.2-rc2-bk2/drivers/net/wireless/strip.c	2003-10-08 16:24:25.000000000 -0300
+++ linux-2.6.2-rc2-bk2~/drivers/net/wireless/strip.c	2004-01-29 15:05:20.000000000 -0200
@@ -953,6 +953,7 @@
  * ascii representation of the number plus 9 charactes for the " seconds"
  * and the null character.
  */
+#ifdef CONFIG_PROC_FS
 static char *time_delta(char buffer[], long time)
 {
 	time -= jiffies;
@@ -1173,6 +1174,7 @@
 	.llseek  = seq_lseek,
 	.release = seq_release,
 };
+#endif

-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
