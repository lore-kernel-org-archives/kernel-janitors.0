From: Jiri Kosina <jkosina@suse.cz>
Date: Mon, 26 Sep 2011 23:34:46 +0000
Subject: Re: [patch] HID: hiddev: potential info leak in hiddev_ioctl()
Message-Id: <alpine.LNX.2.00.1109270134210.24692@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110923062113.GE4387@elgon.mountain>
In-Reply-To: <20110923062113.GE4387@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-usb@vger.kernel.org, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 23 Sep 2011, Dan Carpenter wrote:

> Smatch has a new check for Rosenberg type information leaks where
> structs are copied to the user with uninitialized stack data in them.
> 
> In this case, the hiddev_devinfo struct has a two byte hole.
> 
> struct hiddev_devinfo {
>         __u32                      bustype;              /*     0     4 */
>         __u32                      busnum;               /*     4     4 */
>         __u32                      devnum;               /*     8     4 */
>         __u32                      ifnum;                /*    12     4 */
>         __s16                      vendor;               /*    16     2 */
>         __s16                      product;              /*    18     2 */
>         __s16                      version;              /*    20     2 */
> 
>         /* XXX 2 bytes hole, try to pack */
> 
>         __u32                      num_applications;     /*    24     4 */
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
> index 7c1188b..4ef02b2 100644
> --- a/drivers/hid/usbhid/hiddev.c
> +++ b/drivers/hid/usbhid/hiddev.c
> @@ -641,6 +641,8 @@ static long hiddev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  			struct usb_device *dev = hid_to_usb_dev(hid);
>  			struct usbhid_device *usbhid = hid->driver_data;
>  
> +			memset(&dinfo, 0, sizeof(dinfo));
> +
>  			dinfo.bustype = BUS_USB;
>  			dinfo.busnum = dev->bus->busnum;
>  			dinfo.devnum = dev->devnum;

Applied, thanks Dan.

-- 
Jiri Kosina
SUSE Labs
