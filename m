From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 27 Sep 2012 17:10:26 +0000
Subject: Re: [PATCH usb:usb-next] USB: ezusb: make some vars/funcs static
Message-Id: <20120927171026.GA25153@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120927062413.GA28643@localhost>
In-Reply-To: <20120927062413.GA28643@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 27, 2012 at 02:24:13PM +0800, Fengguang Wu wrote:
> Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
> ---
>  drivers/usb/misc/ezusb.c |   16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
> head:   70c048a238c780c226eb4b115ebaa908cb3b34ec
> commit: 70c048a238c780c226eb4b115ebaa908cb3b34ec [72/73] USB: ezusb: move ezusb.c from drivers/usb/serial to drivers/usb/misc
> 
> + drivers/usb/misc/ezusb.c:25:22: sparse: symbol 'ezusb_fx1' was not declared. Should it be static?
> + drivers/usb/misc/ezusb.c:30:22: sparse: symbol 'ezusb_fx2' was not declared. Should it be static?
> + drivers/usb/misc/ezusb.c:39:5: sparse: symbol 'ezusb_writememory' was not declared. Should it be static?
> + drivers/usb/misc/ezusb.c:63:5: sparse: symbol 'ezusb_set_reset' was not declared. Should it be static?
> + drivers/usb/misc/ezusb.c:73:5: sparse: symbol 'ezusb_fx1_set_reset' was not declared. Should it be static?
> + drivers/usb/misc/ezusb.c:79:5: sparse: symbol 'ezusb_fx2_set_reset' was not declared. Should it be static?
> + drivers/usb/misc/ezusb.c:147:5: sparse: symbol 'ezusb_fx1_ihex_firmware_download' was not declared. Should it be static?
> + drivers/usb/misc/ezusb.c:154:5: sparse: symbol 'ezusb_fx2_ihex_firmware_download' was not declared. Should it be static?

Put all of this information (well the sparse warnings) up above in the
changelog area of the patch, it's good to have.

> @@ -36,7 +36,7 @@ struct ezusb_fx_type ezusb_fx2 = {
>  #define WRITE_INT_RAM 0xA0
>  #define WRITE_EXT_RAM 0xA3
>  
> -int ezusb_writememory(struct usb_device *dev, int address,
> +static int ezusb_writememory(struct usb_device *dev, int address,
>  				unsigned char *data, int length, __u8 request)
>  {
>  	int result;
> @@ -60,7 +60,7 @@ int ezusb_writememory(struct usb_device
>  }
>  EXPORT_SYMBOL_GPL(ezusb_writememory);

You just marked a symbol that is exported as static?  What is going on
here?  This can't be correct, is there a .h file somewhere that we need
to add these exported symbols to which would fix up sparse, right?

Rene, why have functions exported that no one uses outside of the
module?

As it is, I can't take this patch, sorry.

greg k-h
