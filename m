From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 29 Sep 2015 00:28:30 +0000
Subject: Re: [patch] Input: ff-core - silence an underflow warning
Message-Id: <20150929002830.GD30653@dtor-ws>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150922132643.GA5751@mwanda>
In-Reply-To: <20150922132643.GA5751@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Sep 22, 2015 at 04:26:43PM +0300, Dan Carpenter wrote:
> My static checker complains that "value" comes from the user in
> evdev_do_ioctl() and we check that it's not too large here but we don't
> check that it's negative.  It's harmless because the ->set_gain() and
> ->set_autocenter() functions truncate it to a valid u16 value, but we
> may as well fix it just to make the static checker happy.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/input/ff-core.c b/drivers/input/ff-core.c
> index c642082..6a94c5f 100644
> --- a/drivers/input/ff-core.c
> +++ b/drivers/input/ff-core.c
> @@ -273,14 +273,14 @@ int input_ff_event(struct input_dev *dev, unsigned int type,
>  
>  	switch (code) {
>  	case FF_GAIN:
> -		if (!test_bit(FF_GAIN, dev->ffbit) || value > 0xffff)
> +		if (!test_bit(FF_GAIN, dev->ffbit) || value > 0xffffUL)
>  			break;
>  
>  		ff->set_gain(dev, value);
>  		break;
>  
>  	case FF_AUTOCENTER:
> -		if (!test_bit(FF_AUTOCENTER, dev->ffbit) || value > 0xffff)
> +		if (!test_bit(FF_AUTOCENTER, dev->ffbit) || value > 0xffffUL)

Why UL and not U?

Thanks.

>  			break;
>  
>  		ff->set_autocenter(dev, value);

-- 
Dmitry
