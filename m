From: Ian Abbott <abbotti@mev.co.uk>
Date: Mon, 31 Mar 2014 14:40:32 +0000
Subject: Re: [patch] staging: comedi: remove an unneeded variable
Message-Id: <53397E60.9010409@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140331075036.GB24854@mwanda>
In-Reply-To: <20140331075036.GB24854@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2014-03-31 08:50, Dan Carpenter wrote:
> "chanlist" was left over, we don't need it any more.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/staging/comedi/comedi_fops.c b/drivers/staging/comedi/comedi_fops.c
> index ea6dc36..1e91161 100644
> --- a/drivers/staging/comedi/comedi_fops.c
> +++ b/drivers/staging/comedi/comedi_fops.c
> @@ -1597,7 +1597,6 @@ static int do_cmdtest_ioctl(struct comedi_device *dev,
>   {
>   	struct comedi_cmd cmd;
>   	struct comedi_subdevice *s;
> -	unsigned int *chanlist = NULL;
>   	unsigned int __user *user_chanlist;
>   	int ret;
>
> @@ -1626,8 +1625,6 @@ static int do_cmdtest_ioctl(struct comedi_device *dev,
>   		ret = -EFAULT;
>   	}
>
> -	kfree(chanlist);
> -
>   	return ret;
>   }
>
>

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk>        )=-
-=( Tel: +44 (0)161 477 1898   FAX: +44 (0)161 718 3587         )=-
