From: Ian Abbott <abbotti@mev.co.uk>
Date: Fri, 03 Nov 2017 14:00:18 +0000
Subject: Re: [PATCH] staging: comedi: usbduxfast: Improve unlocking of a mutex in usbduxfast_ai_insn_read()
Message-Id: <faf75ea4-e1cf-1959-2705-7da1d49bddde@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b0acc12a-e48c-d51a-f7e3-606e66e6fe7b@users.sourceforge.net>
In-Reply-To: <b0acc12a-e48c-d51a-f7e3-606e66e6fe7b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 02/11/17 19:40, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 2 Nov 2017 20:30:31 +0100
> 
> * Add a jump target so that a call of the function "mutex_unlock" is stored
>    only twice in this function implementation.
> 
> * Replace five calls by goto statements.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/staging/comedi/drivers/usbduxfast.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/comedi/drivers/usbduxfast.c b/drivers/staging/comedi/drivers/usbduxfast.c
> index 608403c7586b..e5884faf7275 100644
> --- a/drivers/staging/comedi/drivers/usbduxfast.c
> +++ b/drivers/staging/comedi/drivers/usbduxfast.c
> @@ -777,8 +777,8 @@ static int usbduxfast_ai_insn_read(struct comedi_device *dev,
>   	if (devpriv->ai_cmd_running) {
>   		dev_err(dev->class_dev,
>   			"ai_insn_read not possible, async cmd is running\n");
> -		mutex_unlock(&devpriv->mut);
> -		return -EBUSY;
> +		ret = -EBUSY;
> +		goto unlock;
>   	}
>   
>   	/* set command for the first channel */
> @@ -798,10 +798,8 @@ static int usbduxfast_ai_insn_read(struct comedi_device *dev,
>   	usbduxfast_cmd_data(dev, 6, 0x01, 0x00, rngmask, 0x00);
>   
>   	ret = usbduxfast_send_cmd(dev, SENDADCOMMANDS);
> -	if (ret < 0) {
> -		mutex_unlock(&devpriv->mut);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		goto unlock;
>   
>   	for (i = 0; i < PACKETS_TO_IGNORE; i++) {
>   		ret = usb_bulk_msg(usb, usb_rcvbulkpipe(usb, BULKINEP),
> @@ -809,8 +807,7 @@ static int usbduxfast_ai_insn_read(struct comedi_device *dev,
>   				   &actual_length, 10000);
>   		if (ret < 0) {
>   			dev_err(dev->class_dev, "insn timeout, no data\n");
> -			mutex_unlock(&devpriv->mut);
> -			return ret;
> +			goto unlock;
>   		}
>   	}
>   
> @@ -820,14 +817,13 @@ static int usbduxfast_ai_insn_read(struct comedi_device *dev,
>   				   &actual_length, 10000);
>   		if (ret < 0) {
>   			dev_err(dev->class_dev, "insn data error: %d\n", ret);
> -			mutex_unlock(&devpriv->mut);
> -			return ret;
> +			goto unlock;
>   		}
>   		n = actual_length / sizeof(u16);
>   		if ((n % 16) != 0) {
>   			dev_err(dev->class_dev, "insn data packet corrupted\n");
> -			mutex_unlock(&devpriv->mut);
> -			return -EINVAL;
> +			ret = -EINVAL;
> +			goto unlock;
>   		}
>   		for (j = chan; (j < n) && (i < insn->n); j = j + 16) {
>   			data[i] = ((u16 *)(devpriv->inbuf))[j];
> @@ -838,6 +834,10 @@ static int usbduxfast_ai_insn_read(struct comedi_device *dev,
>   	mutex_unlock(&devpriv->mut);
>   
>   	return insn->n;

Minor niggle: You could also remove that call to mutex_unlock() by 
replacing the above three lines with:

	ret = insn->n;

which will fall through to the 'unlock:' label below.

> +
> +unlock:
> +	mutex_unlock(&devpriv->mut);
> +	return ret;
>   }
>   
>   static int usbduxfast_upload_firmware(struct comedi_device *dev,
> 


-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk> )=-
-=(                          Web: http://www.mev.co.uk/  )=-
