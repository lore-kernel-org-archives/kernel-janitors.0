From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 20 Sep 2012 23:29:42 +0000
Subject: Re: [battery:master 23/24] drivers/mfd/88pm860x-core.c:803:39: warning: assignment from incompatible
Message-Id: <20120920232942.GA13061@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120920225658.GA12235@localhost>
In-Reply-To: <20120920225658.GA12235@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 20, 2012 at 04:13:43PM -0700, Anton Vorontsov wrote:
> On Fri, Sep 21, 2012 at 06:56:58AM +0800, Fengguang Wu wrote:
> > Hi Jett.Zhou,
> > 
> > FYI, there are new compile warnings show up in
> > 
> > tree:   git://git.infradead.org/battery-2.6.git master
> > head:   f1ade35253f5026170a5fe17f87d0249f03629dd
> 
> Are you sure?
> Because f1ade35253f50 is used to fix this exact warning. :-)

Yes. Because I'm building every commit, and thus got the warning in:

> > commit: a830d28b48bf92944e57058e87d17cee5a7cd2a1 [23/24] power_supply: Enable battery-charger for 88pm860x

> I think you're building with HEAD = a830d28b48bf9294, but why?
> (And 23/24 makes me think that you're indeed missing the latest
> commit.)

This report is for [23/24] a830d28b. The head ([24/24] f1ade35253f50)
fixes the warning. Oh well, some warnings may not hurt bisectability
while others do lead to runtime errors, so I can hardly avoid false
reports on such fixed-in-HEAD warnings..

But if your tree never rebases, I can definitely avoid sending reports
for such intermediate errors/warnings.

> p.s. Anyways, kudos for this automated build system!

Thank you!

Cheers,
Fengguang

> > config: x86_64-randconfig-s362 (attached as .config)
> > 
> > All error/warnings:
> > 
> > drivers/mfd/88pm860x-core.c: In function 'device_power_init':
> > drivers/mfd/88pm860x-core.c:803:39: warning: assignment from incompatible pointer type [enabled by default]
