From: Anton Vorontsov <cbouatmailru@gmail.com>
Date: Thu, 20 Sep 2012 23:13:43 +0000
Subject: Re: [battery:master 23/24] drivers/mfd/88pm860x-core.c:803:39: warning: assignment from incompatible
Message-Id: <20120920231343.GA8209@lizard>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120920225658.GA12235@localhost>
In-Reply-To: <20120920225658.GA12235@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 21, 2012 at 06:56:58AM +0800, Fengguang Wu wrote:
> Hi Jett.Zhou,
> 
> FYI, there are new compile warnings show up in
> 
> tree:   git://git.infradead.org/battery-2.6.git master
> head:   f1ade35253f5026170a5fe17f87d0249f03629dd

Are you sure?
Because f1ade35253f50 is used to fix this exact warning. :-)

I think you're building with HEAD = a830d28b48bf9294, but why?
(And 23/24 makes me think that you're indeed missing the latest
commit.)

p.s. Anyways, kudos for this automated build system!

> commit: a830d28b48bf92944e57058e87d17cee5a7cd2a1 [23/24] power_supply: Enable battery-charger for 88pm860x
> config: x86_64-randconfig-s362 (attached as .config)
> 
> All error/warnings:
> 
> drivers/mfd/88pm860x-core.c: In function 'device_power_init':
> drivers/mfd/88pm860x-core.c:803:39: warning: assignment from incompatible pointer type [enabled by default]
