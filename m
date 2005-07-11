From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Mon, 11 Jul 2005 18:26:12 +0000
Subject: Re: [KJ] [PATCH] drivers/net/3c523.c : Use of time_after macro
Message-Id: <42D2B9C4.8090707@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080801000200030705060902"
List-Id: <kernel-janitors.vger.kernel.org>
References: <425A4AAB.9060400@feitoza.com.br>
In-Reply-To: <425A4AAB.9060400@feitoza.com.br>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080801000200030705060902
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Nishanth Aravamudan wrote:
> On 08.07.2005 [15:37:41 -0300], Marcelo Feitoza Parisi wrote:
> 
>>Use of the time_after() macro, defined at linux/jiffies.h, which deal
>>with wrapping correctly and are nicer to read.
>>
>>Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
>>
>>--- linux/drivers/net/3c523.c   2005-07-07 19:11:50.000000000 -0300
>>+++ linux-kj/drivers/net/3c523.c        2005-07-07 20:32:54.379096144 -0300
>>@@ -105,6 +105,7 @@
>> #include <linux/mca-legacy.h>
>> #include <linux/ethtool.h>
>> #include <linux/bitops.h>
>>+#include <linux/jiffies.h>
>>
>> #include <asm/uaccess.h>
>> #include <asm/processor.h>
>>@@ -658,7 +659,7 @@
>>
>>        s = jiffies;            /* warning: only active with interrupts
>>on !! */
>>        while (!(cfg_cmd->cmd_status & STAT_COMPL)) {
>>-               if (jiffies - s > 30*HZ/100)
>>+               if (time_after(jiffies, s + 30*HZ/100))
> 
> 
> Just personal preference, but it seems like it might be nice to rename
> "s" to "stop" and do the addition at initialization, e.g. instead of
> 
> s = jiffies;
> 
> do
> 
> stop = jiffies + msecs_to_jiffies(300);
> 
> and then the time_after() call becomes
> 
> if (time_after(jiffies, stop))
> 
> But your code is fine as is...
> 
> -Nish
> 
> 
Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

--------------080801000200030705060902
Content-Type: text/x-patch;
 name="3c523.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="3c523.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/3c523.c	2005-07-07 19:11:50.000000000 -0300
+++ linux-kj/drivers/net/3c523.c	2005-07-11 15:24:08.071329832 -0300
@@ -105,6 +105,7 @@
 #include <linux/mca-legacy.h>
 #include <linux/ethtool.h>
 #include <linux/bitops.h>
+#include <linux/jiffies.h>
 
 #include <asm/uaccess.h>
 #include <asm/processor.h>
@@ -619,7 +620,7 @@
 static int init586(struct net_device *dev)
 {
 	void *ptr;
-	unsigned long s;
+	unsigned long stop;
 	int i, result = 0;
 	struct priv *p = (struct priv *) dev->priv;
 	volatile struct configure_cmd_struct *cfg_cmd;
@@ -656,9 +657,9 @@
 	p->scb->cmd = CUC_START;	/* cmd.-unit start */
 	elmc_id_attn586();
 
-	s = jiffies;		/* warning: only active with interrupts on !! */
+	stop = jiffies + msecs_to_jiffies(300);		/* warning: only active with interrupts on !! */
 	while (!(cfg_cmd->cmd_status & STAT_COMPL)) {
-		if (jiffies - s > 30*HZ/100)
+		if (time_after(jiffies, stop))
 			break;
 	}
 
@@ -682,9 +683,9 @@
 	p->scb->cmd = CUC_START;	/* cmd.-unit start */
 	elmc_id_attn586();
 
-	s = jiffies;
+	stop = jiffies + msecs_to_jiffies(300);
 	while (!(ias_cmd->cmd_status & STAT_COMPL)) {
-		if (jiffies - s > 30*HZ/100)
+		if (time_after(jiffies, stop))
 			break;
 	}
 
@@ -707,9 +708,9 @@
 	p->scb->cmd = CUC_START;	/* cmd.-unit start */
 	elmc_attn586();
 
-	s = jiffies;
+	stop = jiffies + msecs_to_jiffies(300);
 	while (!(tdr_cmd->cmd_status & STAT_COMPL)) {
-		if (jiffies - s > 30*HZ/100) {
+		if (time_after(jiffies, stop)) {
 			printk(KERN_WARNING "%s: %d Problems while running the TDR.\n", dev->name, __LINE__);
 			result = 1;
 			break;
@@ -796,9 +797,9 @@
 			p->scb->cbl_offset = make16(mc_cmd);
 			p->scb->cmd = CUC_START;
 			elmc_id_attn586();
-			s = jiffies;
+			stop = jiffies + msecs_to_jiffies(300);
 			while (!(mc_cmd->cmd_status & STAT_COMPL)) {
-				if (jiffies - s > 30*HZ/100)
+				if (time_after(jiffies, stop))
 					break;
 			}
 			if (!(mc_cmd->cmd_status & STAT_COMPL)) {

--------------080801000200030705060902
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080801000200030705060902--
