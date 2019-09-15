From: Greg KH <gregkh@linuxfoundation.org>
Date: Sun, 15 Sep 2019 12:52:11 +0000
Subject: Re: [PATCH] usbip: vhci_hcd indicate failed message
Message-Id: <20190915125211.GA527125@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190915034332.21168-1-maowenan@huawei.com>
In-Reply-To: <20190915034332.21168-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Sep 15, 2019 at 11:43:32AM +0800, Mao Wenan wrote:
> If the return value of vhci_init_attr_group and
> sysfs_create_group is non-zero, which mean they failed
> to init attr_group and create sysfs group, so it would
> better add 'failed' message to indicate that.
> 
> Fixes: 0775a9cbc694 ("usbip: vhci extension: modifications to vhci driver")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/usb/usbip/vhci_hcd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index 000ab7225717..dd54c95d2498 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -1185,12 +1185,12 @@ static int vhci_start(struct usb_hcd *hcd)
>  	if (id = 0 && usb_hcd_is_primary_hcd(hcd)) {
>  		err = vhci_init_attr_group();
>  		if (err) {
> -			pr_err("init attr group\n");
> +			pr_err("init attr group failed\n");

dev_err() would also be good to use here.

>  			return err;
>  		}
>  		err = sysfs_create_group(&hcd_dev(hcd)->kobj, &vhci_attr_group);
>  		if (err) {
> -			pr_err("create sysfs files\n");
> +			pr_err("create sysfs failed\n");

Same here.

thanks,

greg k-h
