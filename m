From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Sat, 30 Oct 2004 22:52:58 +0000
Subject: [KJ] Re: 2.6.10-rc1-kjt1: ixgb_ethtool.c doesn't compile
Message-Id: <20041030225258.GA1697@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65058172037395634=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041024151241.GA1920@stro.at> <20041029235137.GG6677@stusta.de>
In-Reply-To: <20041029235137.GG6677@stusta.de>
To: Adrian Bunk <bunk@stusta.de>
Cc: kj <kernel-janitors@osdl.org>, linux-kernel@vger.kernel.org

--===============65058172037395634==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 30, 2004 at 01:51:37AM +0200, Adrian Bunk wrote:
> On Sun, Oct 24, 2004 at 05:12:41PM +0200, maximilian attems wrote:
> >...
> > splitted out 168 patches:
> > http://debian.stro.at/kjt/2.6.10-rc1-kjt1/split/
> 
> Could you provide a .tar.gz (or .tar.bz) of the splitted patches 
> (similar to how Andrew does for -mm)?
> 
> > thanks for feedback.
> > maks
> >...
> 
> msleep_interruptible-drivers_net_ixgb_ixgb_ethtool.patch doesn't 
> compile:
> 
> <--  snip  -->
> 
> ...
>   CC      drivers/net/ixgb/ixgb_ethtool.o
> drivers/net/ixgb/ixgb_ethtool.c: In function `ixgb_ethtool_led_blink':
> drivers/net/ixgb/ixgb_ethtool.c:407: error: `id' undeclared (first use in this function)
> drivers/net/ixgb/ixgb_ethtool.c:407: error: (Each undeclared identifier is reported only once
> drivers/net/ixgb/ixgb_ethtool.c:407: error: for each function it appears in.)
> make[3]: *** [drivers/net/ixgb/ixgb_ethtool.o] Error 1

Here's the corrected patch, thanks again for catching this Adrian:

Description: Uses msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.10-rc1-vanilla/drivers/net/ixgb/ixgb_ethtool.c	2004-10-30 15:33:27.000000000 -0700
+++ 2.6.10-rc1/drivers/net/ixgb/ixgb_ethtool.c	2004-10-30 15:49:43.000000000 -0700
@@ -31,6 +31,7 @@
 #include "ixgb.h"
 
 #include <asm/uaccess.h>
+#include <linux/delay.h>
 
 extern char ixgb_driver_name[];
 extern char ixgb_driver_version[];
@@ -402,11 +403,10 @@ ixgb_ethtool_led_blink(struct net_device
 
 	mod_timer(&adapter->blink_timer, jiffies);
 
-	set_current_state(TASK_INTERRUPTIBLE);
 	if (data)
-		schedule_timeout(data * HZ);
+		msleep_interruptible(data * 1000);
 	else
-		schedule_timeout(MAX_SCHEDULE_TIMEOUT);
+		msleep_interruptible(jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
 
 	del_timer_sync(&adapter->blink_timer);
 	ixgb_led_off(&adapter->hw);

--===============65058172037395634==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65058172037395634==--
