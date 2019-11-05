From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Nov 2019 13:16:05 +0000
Subject: Re: [PATCH -next] usb: roles: Hide option USB_ROLE_SWITCH
Message-Id: <20191105131605.GF10409@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191104135312.GD996639@ulmo>
 <20191104144850.91305-1-maowenan@huawei.com>
 <20191105124218.GB12204@kuha.fi.intel.com>
In-Reply-To: <20191105124218.GB12204@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Mao Wenan <maowenan@huawei.com>, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Nov 05, 2019 at 02:42:18PM +0200, Heikki Krogerus wrote:
> On Mon, Nov 04, 2019 at 10:48:50PM +0800, Mao Wenan wrote:
> > The USB role switch class is, after all,
> > not useful by itself. Hiding USB_ROLE_SWITCH
> > so we can avoid any of the pitfalls associated
> > with user-visible symbols and "select".
> > 
> > Signed-off-by: Mao Wenan <maowenan@huawei.com>
> > ---
> >  drivers/usb/roles/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/roles/Kconfig b/drivers/usb/roles/Kconfig
> > index f8b31aa..1da58d4 100644
> > --- a/drivers/usb/roles/Kconfig
> > +++ b/drivers/usb/roles/Kconfig
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  
> >  config USB_ROLE_SWITCH
> > -	tristate "USB Role Switch Support"
> > +	tristate
> >  	help
> >  	  USB Role Switch is a device that can select the USB role - host or
> >  	  device - for a USB port (connector). In most cases dual-role capable
> 
> You didn't actually convert the "depends on USB_ROLE_SWTICH" to
> "select USB_ROLE_SWITCH" before this. You also left the help text that
> is now useless.
> 
> I really think that instead of this, we should just convert all
> "select USB_ROLE_SWTICH" to "depends on USB_ROLE_SWITCH".

The you have to find USB_ROLE_SWITCH first when you want to enable your
hardware...  It's feels really confusing when you want to create a
.config file...

I sometimes think maybe I'm too stupid to configure a kernel these days
and that's sort of sad because how is Aunt Tillie supposed to manage?

regards,
dan carpenter
