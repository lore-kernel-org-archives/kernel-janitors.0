From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 18:48:05 +0000
Subject: [Kernel-janitors] Re: [PATCH] net/ns83820: replace
Message-Id: <20040727184805.GU2099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83011397394134789=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727183408.GA3629@kvack.org>
In-Reply-To: <20040727183408.GA3629@kvack.org>
To: kernel-janitors@vger.kernel.org

--===============83011397394134789==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 02:34:08PM -0400, Benjamin LaHaise wrote:
> The commit message doesn't seem correspond to the actual patch.  What 
> are you trying to "fix"?

Thanks for catching this - it was another typo. Please find the
corrected patch below.

-Nish

Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- linux-vanilla/drivers/net/ns83820.c	2004-06-15 22:20:04.000000000 -0700
+++ linux-dev/drivers/net/ns83820.c	2004-07-27 11:45:33.000000000 -0700
@@ -1958,8 +1958,7 @@ static int __devinit ns83820_init_one(st
 	if (reset_phy) {
 		printk(KERN_INFO "%s: resetting phy\n", ndev->name);
 		writel(dev->CFG_cache | CFG_PHY_RST, dev->base + CFG);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout((HZ+99)/100);
+		msleep(10);
 		writel(dev->CFG_cache, dev->base + CFG);
 	}
 

--===============83011397394134789==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83011397394134789==--
