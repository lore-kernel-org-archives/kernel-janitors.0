From: Dan Carpenter <error27@gmail.com>
Date: Mon, 24 Jan 2011 05:05:47 +0000
Subject: Re: [PATCH v2] Staging: bcm: Fix potential buffer overflow and
Message-Id: <20110124050547.GV2721@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1295831548.3921.10.camel@javier-laptop>
In-Reply-To: <1295831548.3921.10.camel@javier-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jan 24, 2011 at 02:12:28AM +0100, Javier Martinez Canillas wrote:
> +	case IOCTL_BCM_CNTRLMSG_MASK:
> +	{

This should be indented two tabs.  One for the function and one for the
switch statement.

> +		unsigned long RxCntrlMsgBitMask = 0;
> +
> +		/* Copy Ioctl Buffer structure */
> +		Status = copy_from_user(&IoBuffer, argp, sizeof(IOCTL_BUFFER));
> +		if (Status) {
> +			BCM_DEBUG_PRINT(Adapter, DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,
> +					"copy of Ioctl buffer is failed from user space");
> +			Status = -EFAULT;
> +			break;
> +		}
>  
> -				/* Copy Ioctl Buffer structure */
> -				Status = copy_from_user(&IoBuffer, argp, sizeof(IOCTL_BUFFER));
> -				if(Status)
> -				{
> -					BCM_DEBUG_PRINT(Adapter,DBG_TYPE_OTHERS, OSAL_DBG, DBG_LVL_ALL,"copy of Ioctl buffer is failed from user space");
> -					break;
> -				}
> +		if (IoBuffer.InputLength > sizeof(unsigned long)) {

Personally I would say:
		if (IoBuffer.InputLength != sizeof(unsigned long)) {

There is no other size that makes sense here.  It's more helpful to
return an error directly.

regards,
dan carpenter
