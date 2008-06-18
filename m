From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 18 Jun 2008 22:39:41 +0000
Subject: Re: [PATCH] firmware: convert tg3 driver to request_firmware()
Message-Id: <1213828781.26255.1343.camel@pmac.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1213799313.4794.20.camel@fc6.satnam>
In-Reply-To: <1213799313.4794.20.camel@fc6.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 2008-06-18 at 15:32 -0700, David Miller wrote:
> From: David Woodhouse <dwmw2@infradead.org>
> Date: Wed, 18 Jun 2008 23:26:51 +0100
> 
> > On Wed, 2008-06-18 at 16:53 -0400, David S. Miller wrote:
> > > And NACK on this patch.
> > 
> > For what reason?
> 
> Something that worked previously with no effort on the
> user's part now will not work automatically as it should.
> 
> This is a step backwards, and I will not provide support
> for any change that rips the firmware out of tg3 or does
> not enable the in-tree firmware built statically into the
> driver by default.

The patch does not remove the ability to build the firmware statically
into the kernel image. You can still do that just fine.

It merely adds the _option_ to load it from userspace, as is recommended
practice for current drivers.

-- 
dwmw2

