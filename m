From: Hans de Goede <hdegoede@redhat.com>
Date: Thu, 15 Jan 2015 10:56:06 +0000
Subject: Re: [patch] [media] gspca: underflow in vidioc_s_parm()
Message-Id: <54B79CC6.1050705@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150107110421.GB14864@mwanda>
In-Reply-To: <20150107110421.GB14864@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

On 07-01-15 12:04, Dan Carpenter wrote:
> "n" is a user controlled integer.  The code here doesn't handle the case
> where "n" is negative and this causes a static checker warning.
>
> 	drivers/media/usb/gspca/gspca.c:1571 vidioc_s_parm()
> 	warn: no lower bound on 'n'
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I haven't followed through to see if this is a real problem.

Thanks for the report, it is a real problem, but since
parm->parm.capture.readbuffers is unsigned I've chosen to fix it
by making n unsigned too instead.

Regards,

Hans

>
> diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
> index 43d6505..27f7da1 100644
> --- a/drivers/media/usb/gspca/gspca.c
> +++ b/drivers/media/usb/gspca/gspca.c
> @@ -1565,6 +1565,8 @@ static int vidioc_s_parm(struct file *filp, void *priv,
>   	int n;
>
>   	n = parm->parm.capture.readbuffers;
> +	if (n < 0)
> +		return -EINVAL;
>   	if (n = 0 || n >= GSPCA_MAX_FRAMES)
>   		parm->parm.capture.readbuffers = gspca_dev->nbufread;
>   	else
>
