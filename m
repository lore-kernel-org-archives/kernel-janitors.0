From: walter harms <wharms@bfs.de>
Date: Sun, 09 Sep 2012 21:01:49 +0000
Subject: Re: [patch v2] [media] rc-core: prevent divide by zero bug in s_tx_carrier()
Message-Id: <504D03BD.8010203@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120909203142.GA12296@elgon.mountain>
In-Reply-To: <20120909203142.GA12296@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sean Young <sean@mess.org>, =?ISO-8859-1?Q?David_H=E4rdeman?= <david@hardeman.nu>, Ben Hutchings <ben@decadent.org.uk>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi all,
I am not sure if that is a good idea.
it should be in the hands of the driver who to use these 'val'
some driver may need a higher value like this one:

static int iguanair_set_tx_carrier(struct rc_dev *dev, uint32_t carrier)
{
	struct iguanair *ir = dev->priv;

	if (carrier < 25000 || carrier > 150000)
		return -EINVAL;

There are also examples where 0 has a special meaning (to be fair not
with this function). Example:
  cfsetospeed() ...  The zero baud rate, B0, is used to terminate the connection.

I have no clue who will use the 0 but ...

just my 2 cents,
re,
 wh

Am 09.09.2012 22:31, schrieb Dan Carpenter:
> Several of the drivers use carrier as a divisor in their s_tx_carrier()
> functions.  We should do a sanity check here like we do for
> LIRC_SET_REC_CARRIER.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Ben Hutchings pointed out that my first patch was not a complete
>     fix.
> 
> diff --git a/drivers/media/rc/ir-lirc-codec.c b/drivers/media/rc/ir-lirc-codec.c
> index 6ad4a07..28dc0f0 100644
> --- a/drivers/media/rc/ir-lirc-codec.c
> +++ b/drivers/media/rc/ir-lirc-codec.c
> @@ -211,6 +211,9 @@ static long ir_lirc_ioctl(struct file *filep, unsigned int cmd,
>  		if (!dev->s_tx_carrier)
>  			return -EINVAL;
>  
> +		if (val <= 0)
> +			return -EINVAL;
> +
>  		return dev->s_tx_carrier(dev, val);
>  
>  	case LIRC_SET_SEND_DUTY_CYCLE:




