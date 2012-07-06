From: Martyn Welch <martyn.welch@ge.com>
Date: Fri, 06 Jul 2012 10:35:46 +0000
Subject: Re: [patch 2/2] Staging: vme: silence a Sparse warning
Message-Id: <4FF6BF82.8040704@ge.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120706082149.GB12470@elgon.mountain>
In-Reply-To: <20120706082149.GB12470@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 06/07/12 09:21, Dan Carpenter wrote:
> Sparse complains that "arg" is not a __user pointer.  The "argp" and
> "arg" variables are equivalent but argp is declared as a __user pointer.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/staging/vme/devices/vme_user.c b/drivers/staging/vme/devices/vme_user.c
> index be198c0..4363ed5 100644
> --- a/drivers/staging/vme/devices/vme_user.c
> +++ b/drivers/staging/vme/devices/vme_user.c
> @@ -471,7 +471,7 @@ static int vme_user_ioctl(struct inode *inode, struct file *file,
>  	case CONTROL_MINOR:
>  		switch (cmd) {
>  		case VME_IRQ_GEN:
> -			copied = copy_from_user(&irq_req, (char *)arg,
> +			copied = copy_from_user(&irq_req, argp,
>  						sizeof(struct vme_irq_id));
>  			if (copied != 0) {
>  				printk(KERN_WARNING "Partial copy from userspace\n");
> 

Looks OK to me:

Acked-By: Martyn Welch <martyn.welch@ge.com>

-- 
Martyn Welch (Lead Software Engineer)  | Registered in England and Wales
GE Intelligent Platforms               | (3828642) at 100 Barbirolli Square
T +44(0)1327322748                     | Manchester, M2 3AB
E martyn.welch@ge.com                  | VAT:GB 927559189


