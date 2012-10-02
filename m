From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 02 Oct 2012 17:16:04 +0000
Subject: [arm-soc:testing/defconfig-warnings 10/93] net/core/pktgen.c:682:9: sparse: undefined identifier '__
Message-Id: <20121002171604.GA5431@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Arnd,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git testing/defconfig-warnings
head:   a9213257ca71d8e4411fc4056c969ca66c0653d7
commit: 66276d54c82d5a5d998bf8cbfbd244272248b644 [10/93] warnings in net/core/pktgen.c

+ net/core/pktgen.c:682:9: sparse: undefined identifier '__do_div_asm'
  net/core/pktgen.c:890:30: sparse: bad constant expression
  net/core/pktgen.c: In function 'pktgen_if_show':
  net/core/pktgen.c:682:2: error: implicit declaration of function '__do_div_asm' [-Werror=implicit-function-declaration]
  cc1: some warnings being treated as errors

vim +682 net/core/pktgen.c

222f1806 (Luiz Capitulino    2006-03-20  666) 		seq_printf(seq, "MACDST_RND  ");
^1da177e (Linus Torvalds     2005-04-16  667) 
34954ddc (Francesco Fondelli 2006-09-27  668) 	if (pkt_dev->flags & F_VID_RND)
34954ddc (Francesco Fondelli 2006-09-27  669) 		seq_printf(seq, "VID_RND  ");
34954ddc (Francesco Fondelli 2006-09-27  670) 
34954ddc (Francesco Fondelli 2006-09-27  671) 	if (pkt_dev->flags & F_SVID_RND)
34954ddc (Francesco Fondelli 2006-09-27  672) 		seq_printf(seq, "SVID_RND  ");
34954ddc (Francesco Fondelli 2006-09-27  673) 
e99b99b4 (Robert Olsson      2010-03-18  674) 	if (pkt_dev->flags & F_NODE)
e99b99b4 (Robert Olsson      2010-03-18  675) 		seq_printf(seq, "NODE_ALLOC  ");
e99b99b4 (Robert Olsson      2010-03-18  676) 
222f1806 (Luiz Capitulino    2006-03-20  677) 	seq_puts(seq, "\n");
222f1806 (Luiz Capitulino    2006-03-20  678) 
fd29cf72 (Stephen Hemminger  2009-08-27  679) 	/* not really stopped, more like last-running-at */
fd29cf72 (Stephen Hemminger  2009-08-27  680) 	stopped = pkt_dev->running ? ktime_now() : pkt_dev->stopped_at;
fd29cf72 (Stephen Hemminger  2009-08-27  681) 	idle = pkt_dev->idle_acc;
66276d54 (Arnd Bergmann      2012-08-04 @682) 	__do_div_asm(idle, NSEC_PER_USEC);
^1da177e (Linus Torvalds     2005-04-16  683) 
222f1806 (Luiz Capitulino    2006-03-20  684) 	seq_printf(seq,
fd29cf72 (Stephen Hemminger  2009-08-27  685) 		   "Current:\n     pkts-sofar: %llu  errors: %llu\n",
222f1806 (Luiz Capitulino    2006-03-20  686) 		   (unsigned long long)pkt_dev->sofar,
fd29cf72 (Stephen Hemminger  2009-08-27  687) 		   (unsigned long long)pkt_dev->errors);
fd29cf72 (Stephen Hemminger  2009-08-27  688) 
fd29cf72 (Stephen Hemminger  2009-08-27  689) 	seq_printf(seq,
fd29cf72 (Stephen Hemminger  2009-08-27  690) 		   "     started: %lluus  stopped: %lluus idle: %lluus\n",

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
