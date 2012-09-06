From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 06 Sep 2012 09:06:35 +0000
Subject: Re: [omap-dss2:work:omap5-dt 83/133] include/linux/of.h:318:1: error: unknown type name 'device_node
Message-Id: <20120906090635.GA25198@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <50485535.6060203@ti.com>
In-Reply-To: <50485535.6060203@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 06, 2012 at 11:58:44AM +0300, Tomi Valkeinen wrote:
> On Thu, 2012-09-06 at 16:45 +0800, Fengguang Wu wrote:
> > Hi Tomi,
> > 
> > On Thu, Sep 06, 2012 at 10:55:47AM +0300, Tomi Valkeinen wrote:
> > > Hi Fengguang,
> > > 
> > > Why are you compiling work/omap5-dt branch? That's not a stable one.
> > 
> > Sorry, shall I skip all of you work/* branches?
> 
> I don't know, depends on your purpose. Only master and for-next branches
> in my tree can be considered stable, other branches may contain just
> about anything. So if you've got some kind of automatic build tester, I
> don't think it will do any good to test other branches than those two.

Got it. I'll blacklist all + whitelist master and for-next.

Thanks,
Fengguang
