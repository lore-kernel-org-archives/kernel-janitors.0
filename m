From: Bing Zhao <bzhao@marvell.com>
Date: Thu, 10 Oct 2013 18:02:05 +0000
Subject: RE: [patch] mwifiex: potential integer underflow in mwifiex_ret_wmm_get_status()
Message-Id: <477F20668A386D41ADCC57781B1F70430F45346AA2@SC-VEXCH1.marvell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130925085729.GC6661@elgon.mountain>
 <477F20668A386D41ADCC57781B1F70430F45077CDA@SC-VEXCH1.marvell.com>
 <20130925182359.GV6247@mwanda>
 <477F20668A386D41ADCC57781B1F70430F45077E52@SC-VEXCH1.marvell.com>
 <477F20668A386D41ADCC57781B1F70430F45078155@SC-VEXCH1.marvell.com>
 <20130926210703.GE6247@mwanda>
 <477F20668A386D41ADCC57781B1F70430F4507819C@SC-VEXCH1.marvell.com>
 <20131010172633.GC2691@tuxdriver.com>
In-Reply-To: <20131010172633.GC2691@tuxdriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi John,

> OK, I'm confused by this thread...I'm dropping it.

Yes, please drop it.

> 
> Dan & Bing,
> 
> Please repost as a series of patches that I don't have to piece
> together from a series of replies...

I'm working on some more patches that fix the similar issue.
I will repost Dan's patch along with these patches in a series.

Thanks,
Bing
