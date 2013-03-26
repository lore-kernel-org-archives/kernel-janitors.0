From: Martyn Welch <martyn.welch@ge.com>
Date: Tue, 26 Mar 2013 16:36:02 +0000
Subject: Re: [PATCH] staging: vme: fix for a potential NULL pointer dereference
Message-Id: <5151CE72.5090800@ge.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1364189869-9275-1-git-send-email-gmate.amit@gmail.com>
In-Reply-To: <1364189869-9275-1-git-send-email-gmate.amit@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Amit Mehta <gmate.amit@gmail.com>
Cc: manohar.vanga@gmail.com, gregkh@linuxfoundation.org, yamanetoshi@gmail.com, joe@perches.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 25/03/13 05:37, Kumar Amit Mehta wrote:
> Audit the return value of cdev_alloc and hence fixes a potential NULL pointer
> dereferencing.
> 
> Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>

Looks good to me, thanks.

Signed-off-by: Martyn Welch <martyn.welch@ge.com>

> ---
>  drivers/staging/vme/devices/vme_user.c |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/vme/devices/vme_user.c b/drivers/staging/vme/devices/vme_user.c
> index d074b1e..da7f759 100644
> --- a/drivers/staging/vme/devices/vme_user.c
> +++ b/drivers/staging/vme/devices/vme_user.c
> @@ -710,6 +710,10 @@ static int vme_user_probe(struct vme_dev *vdev)
>  
>  	/* Register the driver as a char device */
>  	vme_user_cdev = cdev_alloc();
> +	if (!vme_user_cdev) {
> +		err = -ENOMEM;
> +		goto err_char;
> +	}
>  	vme_user_cdev->ops = &vme_user_fops;
>  	vme_user_cdev->owner = THIS_MODULE;
>  	err = cdev_add(vme_user_cdev, MKDEV(VME_MAJOR, 0), VME_DEVS);
> 


-- 
Martyn Welch (Lead Software Engineer)  | Registered in England and Wales
GE Intelligent Platforms               | (3828642) at 100 Barbirolli Square
T +44(0)1327322748                     | Manchester, M2 3AB
E martyn.welch@ge.com                  | VAT:GB 927559189
