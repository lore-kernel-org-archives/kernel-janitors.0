From: "Berg, Johannes" <johannes.berg@intel.com>
Date: Wed, 19 Sep 2012 06:18:44 +0000
Subject: RE: [mac80211-next:wip 63/82] debugfs.c:(.text+0x17c4b3): undefined reference to `__ieee80211_suspen
Message-Id: <1DC40B07CD6EC041A66726C271A73AE6195B1331@IRSMSX102.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120918234204.GB7140@localhost>
In-Reply-To: <20120918234204.GB7140@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Ouch, thanks. I need to fix that I guess. 

johannes

> -----Original Message-----
> From: Wu, Fengguang
> Sent: Wednesday, September 19, 2012 1:42 AM
> To: Berg, Johannes
> Cc: kernel-janitors@vger.kernel.org
> Subject: [mac80211-next:wip 63/82] debugfs.c:(.text+0x17c4b3): undefined
> reference to `__ieee80211_suspend'
> 
> Hi Johannes,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git
> wip
> head:   0b7b5376b7580f253acbe3746983bc19acbdb394
> commit: 3a6a0d8ee88d23e7dda28808c2c890c4db50ccb2 [63/82] mac80211:
> remove unneeded CONFIG_PM ifdef
> config: i386-randconfig-b034 (attached as .config)
> 
> All related error/warning messages:
> 
> net/built-in.o: In function `reset_write':
> debugfs.c:(.text+0x17c4b3): undefined reference to `__ieee80211_suspend'
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu, Yuanhan Liu                              Intel Corporation
Intel GmbH
Dornacher Strasse 1
85622 Feldkirchen/Muenchen, Deutschland
Sitz der Gesellschaft: Feldkirchen bei Muenchen
Geschaeftsfuehrer: Peter Gleissner, Christian Lamprechter, Hannes Schwaderer, Douglas Lusk
Registergericht: Muenchen HRB 47456
Ust.-IdNr./VAT Registration No.: DE129385895
Citibank Frankfurt a.M. (BLZ 502 109 00) 600119052

