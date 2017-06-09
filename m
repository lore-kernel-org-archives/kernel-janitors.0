From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 09 Jun 2017 09:55:47 +0000
Subject: Re: [PATCH v3 1/1] w1: Add subsystem kernel public interface
Message-Id: <20170609095547.GA26558@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170605135208.24807-1-afd@ti.com>
 <20170605135208.24807-2-afd@ti.com>
 <56941496682285@web32j.yandex.ru>
 <20170608121940.wydtrbstglx7tcdx@earth>
In-Reply-To: <20170608121940.wydtrbstglx7tcdx@earth>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: Evgeniy Polyakov <zbr@ioremap.net>, "Andrew F. Davis" <afd@ti.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jun 08, 2017 at 02:19:40PM +0200, Sebastian Reichel wrote:
> Hi,
> 
> On Mon, Jun 05, 2017 at 08:04:45PM +0300, Evgeniy Polyakov wrote:
> > 05.06.2017, 16:52, "Andrew F. Davis" <afd@ti.com>:
> > > Like other subsystems we should be able to define slave devices outside
> > > of the w1 directory. To do this we move public facing interface
> > > definitions to include/linux/w1.h and rename the internal definition
> > > file to w1_internal.h.
> > >
> > > As w1_family.h and w1_int.h contained almost entirely public
> > > driver interface definitions we simply removed these files and
> > > moved the remaining definitions into w1_internal.h.
> > >
> > > With this we can now start to move slave devices out of w1/slaves and
> > > into the subsystem based on the function they implement, again like
> > > other drivers.
> > >
> > > Signed-off-by: Andrew F. Davis <afd@ti.com>
> > > Reviewed-by: Sebastian Reichel <sre@kernel.org>
> > 
> > Thank you, looks good to me.
> > 
> > Acked-by: Evgeniy Polyakov <zbr@ioremap.net>
> > 
> > Greg, please pull it into your tree
> 
> It would be nice, if I can get an immutable branch for
> the power-supply subsystem to ease merge process of
> MAX1721x driver.

Once it moves into my char-misc-next branch, it will be immutable.  Give
it a day or so...

thanks,

greg k-h
