From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Fri, 02 Aug 2013 02:40:35 +0000
Subject: Re: [PATCH] USBIP:stub_dev.c fixing string splitted into multiple line issue
Message-Id: <51FB1953.5050401@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375292922-13724-1-git-send-email-kumargauravgupta3@gmail.com>
In-Reply-To: <1375292922-13724-1-git-send-email-kumargauravgupta3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thursday 01 August 2013 10:27 AM, Jiany Wu wrote:
> I have the same idea with julia.
> It is more difficult to check the log if we use MACRO instead of the 
> strings.
> If we search in the system log, according to the string, we will find 
> out the macro first. later we also need to find out where the macro is 
> using.
>
>
> 2013/8/1 Julia Lawall <julia.lawall@lip6.fr <mailto:julia.lawall@lip6.fr>>
>
>     On Wed, 31 Jul 2013, Kumar Gaurav wrote:
>
>     > Fixed  String splitted into multiple line issue using macro
>
>     I'm not an expert on this kind of style issue, but I prefer
>     strings that
>     look like strings.
>
>     julia
>
>     > Signed-off-by: Kumar Gaurav <kumargauravgupta3@gmail.com
>     <mailto:kumargauravgupta3@gmail.com>>
>     > ---
>     >  drivers/staging/usbip/stub_dev.c |   17 ++++++++++-------
>     >  1 file changed, 10 insertions(+), 7 deletions(-)
>     >
>     > diff --git a/drivers/staging/usbip/stub_dev.c
>     b/drivers/staging/usbip/stub_dev.c
>     > index 83d629a..3b881e1 100644
>     > --- a/drivers/staging/usbip/stub_dev.c
>     > +++ b/drivers/staging/usbip/stub_dev.c
>     > @@ -30,6 +30,8 @@
>     >   * In most cases, wildcard matching will be okay because driver
>     binding can be
>     >   * changed dynamically by a userland program.
>     >   */
>     > +#define USBIP_REG_INTF "register new interface (bus %u dev %u
>     ifn %u)\n"
>     > +#define USBIP_REG_DEV "register new device (bus %u dev %u ifn
>     %u)\n"
>     >  static struct usb_device_id stub_table[] = {
>     >  #if 0
>     >       /* just an example */
>     > @@ -357,8 +359,9 @@ static int stub_probe(struct usb_interface
>     *interface,
>     >       busid_priv = get_busid_priv(udev_busid);
>     >       if (!busid_priv || (busid_priv->status = STUB_BUSID_REMOV) ||
>     >           (busid_priv->status = STUB_BUSID_OTHER)) {
>     > -             dev_info(&interface->dev, "%s is not in
>     match_busid table... "
>     > -                      "skip!\n", udev_busid);
>     > +             dev_info(&interface->dev,
>     > +                      "%s is not in match_busid table... skip!\n",
>     > +                     udev_busid);
>     >
>     >               /*
>     >                * Return value should be ENODEV or ENOXIO to
>     continue trying
>     > @@ -386,8 +389,7 @@ static int stub_probe(struct usb_interface
>     *interface,
>     >                       return -ENODEV;
>     >
>     >               busid_priv->interf_count++;
>     > -             dev_info(&interface->dev, "usbip-host: register
>     new interface "
>     > -                      "(bus %u dev %u ifn %u)\n",
>     > +             dev_info(&interface->dev, USBIP_REG_INTF,
>     >                        udev->bus->busnum, udev->devnum,
>     >  interface->cur_altsetting->desc.bInterfaceNumber);
>     >
>     > @@ -412,8 +414,8 @@ static int stub_probe(struct usb_interface
>     *interface,
>     >       if (!sdev)
>     >               return -ENOMEM;
>     >
>     > -     dev_info(&interface->dev, "usbip-host: register new device "
>     > -              "(bus %u dev %u ifn %u)\n", udev->bus->busnum,
>     udev->devnum,
>     > +     dev_info(&interface->dev, USBIP_REG_DEV,
>     > +              udev->bus->busnum, udev->devnum,
>     >  interface->cur_altsetting->desc.bInterfaceNumber);
>     >
>     >       busid_priv->interf_count = 0;
>     > @@ -426,7 +428,8 @@ static int stub_probe(struct usb_interface
>     *interface,
>     >
>     >       err = stub_add_files(&interface->dev);
>     >       if (err) {
>     > -             dev_err(&interface->dev, "stub_add_files for
>     %s\n", udev_busid);
>     > +             dev_err(&interface->dev, "stub_add_files for %s\n",
>     > +                     udev_busid);
>     >               usb_set_intfdata(interface, NULL);
>     >               usb_put_intf(interface);
>     >               usb_put_dev(udev);
>     > --
>     > 1.7.9.5
>     >
>     > --
>     > To unsubscribe from this list: send the line "unsubscribe
>     kernel-janitors" in
>     > the body of a message to majordomo@vger.kernel.org
>     <mailto:majordomo@vger.kernel.org>
>     > More majordomo info at http://vger.kernel.org/majordomo-info.html
>     >
>     --
>     To unsubscribe from this list: send the line "unsubscribe
>     kernel-janitors" in
>     the body of a message to majordomo@vger.kernel.org
>     <mailto:majordomo@vger.kernel.org>
>     More majordomo info at http://vger.kernel.org/majordomo-info.html
>
>
Thanks you all for suggestions. I'll try finding some other way.

Regargs
Kumar Gaurav
