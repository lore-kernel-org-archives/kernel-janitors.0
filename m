From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Tue, 05 Nov 2019 12:37:27 +0000
Subject: Re: [PATCH -next] usb: gadget: Add dependency for USB_TEGRA_XUDC
Message-Id: <20191105123727.GA12204@kuha.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191104025945.172620-1-maowenan@huawei.com>
 <20191104100410.GB996639@ulmo>
In-Reply-To: <20191104100410.GB996639@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <treding@nvidia.com>
Cc: Mao Wenan <maowenan@huawei.com>, felipe.balbi@linux.intel.com, gregkh@linuxfoundation.org, nkristam@nvidia.com, arnd@arndb.de, johan@kernel.org, krzk@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Nov 04, 2019 at 11:04:10AM +0100, Thierry Reding wrote:
> On Mon, Nov 04, 2019 at 10:59:45AM +0800, Mao Wenan wrote:
> > If CONFIG_USB_TEGRA_XUDC=y and CONFIG_USB_ROLE_SWITCH=m,
> > below erros can be seen:
> > drivers/usb/gadget/udc/tegra-xudc.o: In function `tegra_xudc_remove':
> > tegra-xudc.c:(.text+0x6b0): undefined reference to `usb_role_switch_unregister'
> > drivers/usb/gadget/udc/tegra-xudc.o: In function `tegra_xudc_probe':
> > tegra-xudc.c:(.text+0x1b88): undefined reference to `usb_role_switch_register'
> > drivers/usb/gadget/udc/tegra-xudc.o: In function `tegra_xudc_usb_role_sw_work':
> > tegra-xudc.c:(.text+0x5ecc): undefined reference to `usb_role_switch_get_role'
> > 
> > This patch add dependency USB_ROLE_SWITCH for UDC driver.
> > 
> > Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
> > Signed-off-by: Mao Wenan <maowenan@huawei.com>
> > ---
> >  drivers/usb/gadget/udc/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
> > index acaec3a..d103154 100644
> > --- a/drivers/usb/gadget/udc/Kconfig
> > +++ b/drivers/usb/gadget/udc/Kconfig
> > @@ -445,6 +445,7 @@ config USB_TEGRA_XUDC
> >  	tristate "NVIDIA Tegra Superspeed USB 3.0 Device Controller"
> >  	depends on ARCH_TEGRA || COMPILE_TEST
> >  	depends on PHY_TEGRA_XUSB
> > +	depends on USB_ROLE_SWITCH
> 
> It looks like most other drivers that use the USB role switch class do
> "select" here. Now, that's suboptimal because USB_ROLE_SWITCH is a user-
> visible symbol, which can lead to conflicts, so it should be avoided. I
> think that in this case it might make sense to hide USB_ROLE_SWITCH and
> then convert all "depends on USB_ROLE_SWITCH" occurrences to "select
> USB_ROLE_SWITCH". The USB role switch class is, after all, not useful by
> itself. It always needs a host and/or gadget driver to make use of it.

USB host/gadget drivers actually never operate the role switches. If
the USB controller on the system is dual-role capable, then the driver
for that controller can supply the role switch, but it doesn't operate
it. Note that on some systems the USB host and USB peripheral
controllers are separate, and there is a mux (like the Intel USB role
mux) between them and the connector. On those systems the driver for
the mux represents the USB role switch.

The operation of the switch is done from the USB Type-C drivers with
USB Type-C connectors and from what ever driver can sense the ID-pin
and VBUS with micro-B/AB connectors, but with other type of
connectors the role swapping has to be done from user space. The use
case for that is probable something like Apple CarPlay that requires
the system to be able to swap the role even if the connector was good
old Type-A connector.

The point is in any case that the user of the switch is always
separate from the supplier of the switch.

I'm not sure hiding the option and converting all "depends on
USB_ROLE_SWITCH" to "select USB_ROLE_SWITCH" is the correct thing to
do. I would do the opposite and convert all "select USB_ROLE_SWTICH"
to "depends on USB_ROLE_SWITCH", and leave the option user selectable.

thanks,

-- 
heikki
