From: Ian Abbott <abbotti@mev.co.uk>
Date: Wed, 08 Nov 2017 11:04:18 +0000
Subject: Re: [PATCH] staging: comedi: usbdux: remove redundant initialization of val
Message-Id: <0d7da92b-bcf7-2e1e-af62-cf715327e2ed@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171107190724.8075-1-colin.king@canonical.com>
In-Reply-To: <20171107190724.8075-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, H Hartley Sweeten <hsweeten@visionengravers.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/11/17 19:07, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The early initialization of val is redundant as the value is never
> read and is updated inside a for-loop. Remove the initialization
> and move the declaration and initialization to the for-loop scope.
> Cleans up clang warning:
> 
> drivers/staging/comedi/drivers/usbdux.c:812:15: warning: Value stored
> to 'val' during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/staging/comedi/drivers/usbdux.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/comedi/drivers/usbdux.c b/drivers/staging/comedi/drivers/usbdux.c
> index f4f05d29d30d..ede064b47aac 100644
> --- a/drivers/staging/comedi/drivers/usbdux.c
> +++ b/drivers/staging/comedi/drivers/usbdux.c
> @@ -809,7 +809,6 @@ static int usbdux_ao_insn_write(struct comedi_device *dev,
>   {
>   	struct usbdux_private *devpriv = dev->private;
>   	unsigned int chan = CR_CHAN(insn->chanspec);
> -	unsigned int val = s->readback[chan];
>   	__le16 *p = (__le16 *)&devpriv->dux_commands[2];
>   	int ret = -EBUSY;
>   	int i;
> @@ -825,7 +824,7 @@ static int usbdux_ao_insn_write(struct comedi_device *dev,
>   	devpriv->dux_commands[4] = chan << 6;
>   
>   	for (i = 0; i < insn->n; i++) {
> -		val = data[i];
> +		unsigned int val = data[i];
>   
>   		/* one 16 bit value */
>   		*p = cpu_to_le16(val);
> 

Thanks for catching that.  It looks like it has been redundant since 
commit 65a847477f63 ("staging: comedi: usbdux: use comedi_subdevice 
'readback'").

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk> )=-
-=(                          Web: http://www.mev.co.uk/  )=-
