From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 17 Nov 2012 18:10:56 +0000
Subject: Re: [patch] USB: usbtest: prevent a divide by zero bug
Message-Id: <20121117181055.GP11515@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121117150610.GA19951@elgon.mountain>
In-Reply-To: <20121117150610.GA19951@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Nov 17, 2012 at 06:48:55PM +0100, walter harms wrote:
> 
> 
> Am 17.11.2012 16:06, schrieb Dan Carpenter:
> > If param->length is zero, then this could lead to a divide by zero bug
> > later in the function when we do: size %= max;
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
> > index f10bd97..7667b12 100644
> > --- a/drivers/usb/misc/usbtest.c
> > +++ b/drivers/usb/misc/usbtest.c
> > @@ -423,6 +423,9 @@ alloc_sglist(int nents, int max, int vary)
> >  	unsigned		i;
> >  	unsigned		size = max;
> >  
> > +	if (max = 0)
> > +		return NULL;
> > +
> 
>   maybe you should be more defensive and check from (max <= 0)
> 

Nah...  Testing for = 0 is ok.

regards,
dan carpenter

