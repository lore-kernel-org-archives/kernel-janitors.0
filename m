From: Michael Veeck <michael.veeck@gmx.net>
Date: Sun, 15 Aug 2004 11:43:16 +0000
Subject: [Kernel-janitors] [PATCH] minmax-removal
Message-Id: <411F4C54.4090609@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080107030502070101070007"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080107030502070101070007
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.8.1) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Since I dont have the hardware those patches are not tested.

Best regards
Veeck

Signed-off-by: Michael Veeck <michael.veeck@gmx.net>





--------------080107030502070101070007
Content-Type: text/plain;
 name="minmax-arch-ia64-hp.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax-arch-ia64-hp.patch"

--- linux-2.6.8-old/arch/ia64/hp/sim/simserial.c	2004-08-14 11:49:01.000000000 +0200
+++ linux-2.6.8-new/arch/ia64/hp/sim/simserial.c	2004-08-15 12:58:49.555972544 +0200
@@ -50,10 +50,6 @@
 #define _INLINE_ inline
 #endif
 
-#ifndef MIN
-#define MIN(a,b)	((a) < (b) ? (a) : (b))
-#endif
-
 #define IRQ_T(info) ((info->flags & ASYNC_SHARE_IRQ) ? SA_SHIRQ : SA_INTERRUPT)
 
 #define SSC_GETCHAR	21
@@ -275,7 +271,7 @@ static _INLINE_ void transmit_chars(stru
 	 * Then from the beginning of the buffer until necessary
 	 */
 
-	count = MIN(CIRC_CNT(info->xmit.head, info->xmit.tail, SERIAL_XMIT_SIZE),
+	count = min(CIRC_CNT(info->xmit.head, info->xmit.tail, SERIAL_XMIT_SIZE),
 		    SERIAL_XMIT_SIZE - info->xmit.tail);
 	console->write(console, info->xmit.buf+info->xmit.tail, count);
 

--------------080107030502070101070007
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080107030502070101070007--
