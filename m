From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 16 Feb 2004 22:36:42 +0000
Subject: Re: [Kernel-janitors] [PATCH] Check return code in mm/vmscan.c
Message-Id: <20040216143642.48b2c176.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132524.GA21909@eugeneteo.net>
	<20040103222706.GM6982@parcelfarce.linux.theplanet.co.uk>
	<20040104051125.GF20458@eugeneteo.net>
In-Reply-To: <20040104051125.GF20458@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eugene Teo <eugene.teo@eugeneteo.net>
Cc: linux-mm@kvack.org, kernel-janitors@osdl.org

On Sun, 4 Jan 2004 13:11:26 +0800 Eugene Teo <eugene.teo@eugeneteo.net> wrote:

| <quote sender="Matthew Wilcox">
| > On Sat, Jan 03, 2004 at 09:25:24PM +0800, Eugene Teo wrote:
| > > http://www.anomalistic.org/patches/vmscan-check-ret-kernel_thread-fix-2.6.1-rc1-mm1.patch
| > > 
| > > diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/mm/vmscan.c 2.6.1-rc1-mm1-fix/mm/vmscan.c
| > > --- 2.6.1-rc1-mm1/mm/vmscan.c	2004-01-03 20:33:39.000000000 +0800
| > > +++ 2.6.1-rc1-mm1-fix/mm/vmscan.c	2004-01-03 21:16:30.000000000 +0800
| > > @@ -1093,10 +1093,16 @@
| > >  
| > >  static int __init kswapd_init(void)
| > >  {
| > > +	int ret;
| > >  	pg_data_t *pgdat;
| > >  	swap_setup();
| > > -	for_each_pgdat(pgdat)
| > > -		kernel_thread(kswapd, pgdat, CLONE_KERNEL);
| > > +	for_each_pgdat(pgdat) {
| > > +		ret = kernel_thread(kswapd, pgdat, CLONE_KERNEL);
| > > +		if (ret < 0) {
| > > +			printk("%s: unable to start kernel thread\n", __FUNCTION__);
| > > +			return ret;
| > > +		}
| > > +	}
| > >  	total_memory = nr_free_pagecache_pages();
| > >  	return 0;
| > >  }
| > 
| > If your new code is triggered, we've just failed to set up total_memory.
| > I expect the system to behave very oddly after this ;-)
| 
| a panic call seems to be more appropriate :)
| 
| Here is the new fix. Patch compiles, and tested.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Eugene, patch is tested how?  What do you mean by "tested"?
In what conditions?

| http://www.anomalistic.org/patches/vmscan-check-ret-kernel_thread-fix-2.6.1-rc1-mm1.patch
| 
| diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/mm/vmscan.c 2.6.1-rc1-mm1-fix/mm/vmscan.c
| --- 2.6.1-rc1-mm1/mm/vmscan.c	2004-01-04 10:29:24.000000000 +0800
| +++ 2.6.1-rc1-mm1-fix/mm/vmscan.c	2004-01-04 13:04:52.000000000 +0800
| @@ -1093,10 +1093,14 @@
|  
|  static int __init kswapd_init(void)
|  {
| +	int ret;
|  	pg_data_t *pgdat;
|  	swap_setup();
| -	for_each_pgdat(pgdat)
| -		kernel_thread(kswapd, pgdat, CLONE_KERNEL);
| +	for_each_pgdat(pgdat) {
| +		ret = kernel_thread(kswapd, pgdat, CLONE_KERNEL);
| +		if (ret < 0)
| +			panic("%s: unable to initialise kswapd\n", __FUNCTION__);
| +	}
|  	total_memory = nr_free_pagecache_pages();
|  	return 0;
|  }
| 

--
~Randy
kernel-janitors project:  http://janitor.kernelnewbies.org/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
