From: Benjamin LaHaise <bcrl@kvack.org>
Date: Tue, 27 Jul 2004 18:34:08 +0000
Subject: [Kernel-janitors] Re: [PATCH] net/ns83820: replace
Message-Id: <20040727183408.GA3629@kvack.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============48821108559171766=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============48821108559171766==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The commit message doesn't seem correspond to the actual patch.  What 
are you trying to "fix"?

		-ben

On Tue, Jul 27, 2004 at 11:30:00AM -0700, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list. 
> 
> Applys-to: 2.6.7
> 
> Description: Replace schedule_timeout() with msleep() to guarantee the
> task delays for the desired time.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> 
> --- linux-vanilla/drivers/net/ns83820.c	2004-06-16 05:20:04.000000000 +0000
> +++ linux-dev/drivers/net/ns83820.c	2004-07-08 20:58:27.000000000 +0000
> @@ -1959,7 +1959,7 @@ static int __devinit ns83820_init_one(st
>  		printk(KERN_INFO "%s: resetting phy\n", ndev->name);
>  		writel(dev->CFG_cache | CFG_PHY_RST, dev->base + CFG);
>  		set_current_state(TASK_UNINTERRUPTIBLE);
> -		schedule_timeout((HZ+99)/100);
> +		schedule_timeout(10);
>  		writel(dev->CFG_cache, dev->base + CFG);
>  	}
>  
> --
> To unsubscribe, send a message with 'unsubscribe linux-ns83820' in
> the body to majordomo@kvack.org.
> 

-- 
"Time is what keeps everything from happening all at once." -- John Wheeler

--===============48821108559171766==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============48821108559171766==--
