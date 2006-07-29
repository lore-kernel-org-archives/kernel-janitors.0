From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Sat, 29 Jul 2006 16:17:52 +0000
Subject: Re: [KJ] audit return code handling for kernel_thread [8/11]
Message-Id: <44CB8A30.2080809@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200607282007.k6SK7v9j009670@ra.tuxdriver.com>
In-Reply-To: <200607282007.k6SK7v9j009670@ra.tuxdriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nhorman@tuxdriver.com
Cc: bcollins@debian.org, kernel-janitors@osdl.org, linux-kernel@vger.kernel.org

nhorman@tuxdriver.com wrote:
> --- a/drivers/ieee1394/nodemgr.c
> +++ b/drivers/ieee1394/nodemgr.c
> @@ -426,7 +426,8 @@ static ssize_t fw_set_rescan(struct bus_
>  	 * something stupid and spawn this a lot of times, but that's
>  	 * root's fault. */
>  	if (state = 1)
> -		kernel_thread(nodemgr_rescan_bus_thread, NULL, CLONE_KERNEL);
> +		if (kernel_thread(nodemgr_rescan_bus_thread, NULL, CLONE_KERNEL) < 0)
> +			printk(KERN_WARNING "Could not start 1394 bus rescan thread\n");
>  
>  	return count;
>  }

Thanks, but (a) we don't need the warnig and (b) we even don't need to 
spawn a thread at this point. This call to kernel_thread has been 
removed from git-ieee1394 and -mm earlier this month.
http://www.kernel.org/git/?p=linux/kernel/git/bcollins/linux1394-2.6.git;a=commitdiff_plain;h@fd89cc54a8a67c81b5aa40b22c4f40b39e47b9
http://marc.theaimsgroup.com/?l=linux-mm-commits&m5189722112717
-- 
Stefan Richter
-===-=-=- -== ==-http://arcgraph.de/sr/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
