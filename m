From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 14 Apr 2010 15:59:53 +0000
Subject: Re: [PATCH] usb/serial/generic: Fix compile error
Message-Id: <20100414155951.GA2450@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1270999742.11481.44.camel@lenovo>
In-Reply-To: <1270999742.11481.44.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Apr 14, 2010 at 08:45:19AM -0700, Randy Dunlap wrote:
> On Sun, 11 Apr 2010 20:04:46 -0700 Dmitry Torokhov wrote:
> 
> > Hi Javier,
> > 
> > On Sun, Apr 11, 2010 at 11:29:02AM -0400, Javier Martinez Canillas wrote:
> > > usb/serial/generic.c gives me a compile error when CONFIG_MAGIC_SYSRQ is
> > > not defined.
> > > 
> > > The problem is that usb_serial_handle_sysrq_char() calls handle_sysrq()
> > > that only is defined if CONFIG_MAGIC_SYSRQ is defined.
> > > 
> > > This patch add an empty handle_sysrq inline function if
> > > CONFIG_MAGIC_SYSRQ is not defined and generic.c compiles cleanly.
> > > 
> > 
> > Thanks for the patch. I will fold it into the one where I managed to
> > loose the static inline if you do not mind.
> 
> can we get this patch into linux-next also, please?
> It still fails in 2 places when MAGIC_SYSRQ is disabled.
> 

Should be there...

-- 
Dmitry
