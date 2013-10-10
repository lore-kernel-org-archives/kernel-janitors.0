From: "John W. Linville" <linville@tuxdriver.com>
Date: Thu, 10 Oct 2013 17:26:33 +0000
Subject: Re: [patch] mwifiex: potential integer underflow in mwifiex_ret_wmm_get_status()
Message-Id: <20131010172633.GC2691@tuxdriver.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130925085729.GC6661@elgon.mountain>
 <477F20668A386D41ADCC57781B1F70430F45077CDA@SC-VEXCH1.marvell.com>
 <20130925182359.GV6247@mwanda>
 <477F20668A386D41ADCC57781B1F70430F45077E52@SC-VEXCH1.marvell.com>
 <477F20668A386D41ADCC57781B1F70430F45078155@SC-VEXCH1.marvell.com>
 <20130926210703.GE6247@mwanda>
 <477F20668A386D41ADCC57781B1F70430F4507819C@SC-VEXCH1.marvell.com>
In-Reply-To: <477F20668A386D41ADCC57781B1F70430F4507819C@SC-VEXCH1.marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bing Zhao <bzhao@marvell.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, Sep 26, 2013 at 02:57:21PM -0700, Bing Zhao wrote:
> Hi Dan,
> 
> > There are several other similar functions as well.  For example, the
> > while loops in mwifiex_ret_tx_rate_cfg() and mwifiex_get_power_level().
> 
> Thanks for pointing it out. We will have them fixed.
> 
> Regards,
> Bing

OK, I'm confused by this thread...I'm dropping it.

Dan & Bing,

Please repost as a series of patches that I don't have to piece
together from a series of replies...

John
-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
