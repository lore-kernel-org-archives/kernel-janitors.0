From: Joe Perches <joe@perches.com>
Date: Fri, 11 Jun 2010 16:52:36 +0000
Subject: Re: [PATCH] staging/wlags49_hs: Fix build error when CONFIG_SYSFS
Message-Id: <1276275156.1637.52.camel@Joe-Laptop.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1276238148.22216.30.camel@lenovo>
	 <1276238502.1556.512.camel@Joe-Laptop.home>
	 <AANLkTikH_CAVo7sblakUfhI-ysIXk2z1KZz0YkjCDL3m@mail.gmail.com>
In-Reply-To: <AANLkTikH_CAVo7sblakUfhI-ysIXk2z1KZz0YkjCDL3m@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Javier Martinez Canillas <martinez.javier@gmail.com>
Cc: Henk de Groot <pe1dnn@amsat.org>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@suse.de>, kernel-janitors <kernel-janitors@vger.kernel.org>, linux-kernel@vger.kernel.org

On Fri, 2010-06-11 at 08:46 -0400, Javier Martinez Canillas wrote:
> >>  extern void register_wlags_sysfs(struct net_device *);
> >>  extern void unregister_wlags_sysfs(struct net_device *);
> >>  #else
> >> -static void register_wlags_sysfs(struct net_device *) { return; };
> >> -static void unregister_wlags_sysfs(struct net_device *) { return; };
> >> +#define register_wlags_sysfs(net_device) { }
> >> +#define unregister_wlags_sysfs(net_device) { }
> >>  #endif
> > Yes, that works, but a better fix would be to remove the
> > semicolons after the function close braces.
> > ---
> Why would it be better? With a macro you avoid the overhead of a
> function call that does nothing.

Check the generated code.
$ make drivers/staging/wlags49_h2/wl_sysfs.lst

> I personally think a macro fit better in this case.

Check the general kernel use of macros vs functions.
Functions verify proper arguments, macros do not.


