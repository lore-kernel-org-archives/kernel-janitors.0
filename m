From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Thu, 04 Mar 2004 19:02:04 +0000
Subject: [Kernel-janitors] [TRIVIAL] - Fix for bug #320.
Message-Id: <1078426923.26163.10.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi all,

This trivial patch fixes the bug #320:

http://bugme.osdl.org/show_bug.cgi?id20

The additional comment:

http://bugme.osdl.org/show_bug.cgi?id20#c1

Is wrong, because it will send the command twice.

We only want to see if the command got success, thus is not necessary
to test against < 0 (if the return value is not 1, we got a error).

Note that I'm using the function (bad) style.

diff -Nparu linux-2.6.4-rc2/drivers/char/ip2/i2lib.c linux-2.6.4-rc2~/drivers/char/ip2/i2lib.c
--- linux-2.6.4-rc2/drivers/char/ip2/i2lib.c	2003-10-08 16:24:51.000000000 -0300
+++ linux-2.6.4-rc2~/drivers/char/ip2/i2lib.c	2004-03-04 14:40:09.000000000 -0300
@@ -1249,7 +1249,7 @@ i2RetryFlushOutput(i2ChanStrPtr pCh)
 
 	}
 	if ( old_flags & STOPFL_FLAG ) {
-		if ( 1 = i2QueueCommands(PTYPE_INLINE, pCh, 0, 1, CMD_STOPFL) > 0 ) {
+		if (1 = i2QueueCommands(PTYPE_INLINE, pCh, 0, 1, CMD_STOPFL)) {
 			old_flags = 0;	// Success - clear flags
 		}
 

-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
