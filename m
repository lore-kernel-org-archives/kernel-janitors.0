From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Tue, 05 Nov 2019 15:26:24 +0000
Subject: Re: [PATCH -next] usb: roles: Hide option USB_ROLE_SWITCH
Message-Id: <20191105152624.GC12204@kuha.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191104135312.GD996639@ulmo>
 <20191104144850.91305-1-maowenan@huawei.com>
 <20191105124218.GB12204@kuha.fi.intel.com>
 <20191105131605.GF10409@kadam>
In-Reply-To: <20191105131605.GF10409@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mao Wenan <maowenan@huawei.com>, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Tue, Nov 05, 2019 at 04:16:05PM +0300, Dan Carpenter wrote:
> On Tue, Nov 05, 2019 at 02:42:18PM +0200, Heikki Krogerus wrote:
> > On Mon, Nov 04, 2019 at 10:48:50PM +0800, Mao Wenan wrote:
> > > The USB role switch class is, after all,
> > > not useful by itself. Hiding USB_ROLE_SWITCH
> > > so we can avoid any of the pitfalls associated
> > > with user-visible symbols and "select".
> > > 
> > > Signed-off-by: Mao Wenan <maowenan@huawei.com>
> > > ---
> > >  drivers/usb/roles/Kconfig | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/roles/Kconfig b/drivers/usb/roles/Kconfig
> > > index f8b31aa..1da58d4 100644
> > > --- a/drivers/usb/roles/Kconfig
> > > +++ b/drivers/usb/roles/Kconfig
> > > @@ -1,7 +1,7 @@
> > >  # SPDX-License-Identifier: GPL-2.0
> > >  
> > >  config USB_ROLE_SWITCH
> > > -	tristate "USB Role Switch Support"
> > > +	tristate
> > >  	help
> > >  	  USB Role Switch is a device that can select the USB role - host or
> > >  	  device - for a USB port (connector). In most cases dual-role capable
> > 
> > You didn't actually convert the "depends on USB_ROLE_SWTICH" to
> > "select USB_ROLE_SWITCH" before this. You also left the help text that
> > is now useless.
> > 
> > I really think that instead of this, we should just convert all
> > "select USB_ROLE_SWTICH" to "depends on USB_ROLE_SWITCH".
> 
> The you have to find USB_ROLE_SWITCH first when you want to enable your
> hardware...  It's feels really confusing when you want to create a
> .config file...

Unfortunately selecting the class alone is not enough. The USB role
switch on the system may be a dual-role capable USB controller, but it
may also be a mux that has its own separate driver.

It's equally or even more confusing for the user if the USB drivers
are enabled, including the dual-role mode, but the connector still
works only in one role, or in worst case not at all (if there is no
mux driver and the mux is left in "safe mode" so that the pins on the
connector are not connected to anything).

I still think that we should make these drivers depend on the class
instead of just selecting it. That way we at least give the user a
hint that there are also separate USB role switch drivers that may be
needed.

> I sometimes think maybe I'm too stupid to configure a kernel these days
> and that's sort of sad because how is Aunt Tillie supposed to manage?

We can always use something like conditional comments in the
Kconfig files to make sure that the user is told that in order to
select the driver, a dependency must be satisfied:

        config MY_AWESOME_DRIVER
                tristate "My awesome driver!"
                depends on USB_ROLE_SWITCH
                help
                  That's right! IT REALLY IS AWESOME!

        comment "My awesome driver depends on USB_ROLE_SWITCH..."
                depends on USB_ROLE_SWITCH=n

thanks,

-- 
heikki
