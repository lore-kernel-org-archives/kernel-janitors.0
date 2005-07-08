From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Fri, 08 Jul 2005 20:33:03 +0000
Subject: Re: [KJ] [PATCH] drivers/ide/ide-tape.c : Use of time_after macro
Message-Id: <42CEE2FF.2070707@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070101060606070207000605"
List-Id: <kernel-janitors.vger.kernel.org>
References: <42CED33B.4000600@feitoza.com.br>
In-Reply-To: <42CED33B.4000600@feitoza.com.br>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------070101060606070207000605
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Alexey Dobriyan wrote:
> On Friday 08 July 2005 23:25, Marcelo Feitoza Parisi wrote:
> 
>>Use of the time_after() macro, defined at linux/jiffies.h, which deal
>>with wrapping correctly and are nicer to read.
> 
> 
> OK, you're using Thunderbird, but at least include description of what patch
> does into attachment.
> 
> 
Re-sending patch, with description in the attachment.

--------------070101060606070207000605
Content-Type: text/x-patch;
 name="ide-tape.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ide-tape.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/ide/ide-tape.c	2005-07-07 19:13:15.000000000 -0300
+++ linux-kj/drivers/ide/ide-tape.c	2005-07-07 20:37:14.581539360 -0300
@@ -443,6 +443,7 @@
 #include <linux/smp_lock.h>
 #include <linux/completion.h>
 #include <linux/bitops.h>
+#include <linux/jiffies.h>
 
 #include <asm/byteorder.h>
 #include <asm/irq.h>
@@ -2333,7 +2334,7 @@
 	}
 	if (time_after(jiffies, tape->insert_time))
 		tape->insert_speed = tape->insert_size / 1024 * HZ / (jiffies - tape->insert_time);
-	if (jiffies - tape->avg_time >= HZ) {
+	if (time_after_eq(jiffies, tape->avg_time + HZ)) {
 		tape->avg_speed = tape->avg_size * HZ / (jiffies - tape->avg_time) / 1024;
 		tape->avg_size = 0;
 		tape->avg_time = jiffies;

--------------070101060606070207000605
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------070101060606070207000605--
