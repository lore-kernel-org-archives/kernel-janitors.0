From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 30 Mar 2004 22:40:39 +0000
Subject: Re: [Kernel-janitors] old patches never die?
Message-Id: <20040330144039.059275a5.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040329014927.38963.qmail@web60501.mail.yahoo.com>
In-Reply-To: <20040329014927.38963.qmail@web60501.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 28 Mar 2004 17:49:27 -0800 (PST) Carl Spalletta wrote:

|   It seems as if a relatively small percentage of -kj patches ultimately
| get merged at kernel.org.  For example the kswapd_init_fail patch from
| 2.6.3-kj1 and 2.6.4-rc2-kj1 not only didn't get merged but the file (mm/vmscan.c)
| has since been patched (for a different purpose) at the same location. So that
| patch would have to be redone anyway:

Can you provide any data on the percentage of merges?


| --- linux-263/mm/vmscan.c	2004-02-17 19:57:16.000000000 -0800
| +++ linux-263-kj1/mm/vmscan.c	2004-02-18 14:42:03.000000000 -0800
| @@ -1087,10 +1087,14 @@ int shrink_all_memory(int nr_pages)
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
|   Perhaps it was deemed unnecessary to panic() if kswapd doesnt start ;).
| 
|   Generally speaking, what if anything can a janitor do to get positive or 
| negative feedback on a submission?

I'd certainly like to see more involvement by reviewers (as I've
said in the past).  Willy and GregKH are good about reviewing,
and sometimes DaveJ, Acme, jgarzik.  Oh, and Domen, Luiz, Michael, etc.

The patch in question is still in the KJ patchset, so that is some
kind of positive feedback.  I prefer to see some kind of feedback on
all patches, but sometimes there aren't enough hours in a day for that,
so it comes down to:  if I put it into the KJ patchset, that's positive
feedback.  Otherwise it should get some email comments.

--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
