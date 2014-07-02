From: Emil Goode <emilgoode@gmail.com>
Date: Wed, 02 Jul 2014 17:26:20 +0000
Subject: Re: [PATCH] Staging: rtl8192e: Fix potential NULL pointer dereference
Message-Id: <20140702172620.GA4848@lianli>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1404293151-15804-1-git-send-email-emilgoode@gmail.com>
 <20140702163334.GA19349@kroah.com>
In-Reply-To: <20140702163334.GA19349@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rashika Kheria <rashika.kheria@gmail.com>, Valentina Manea <valentina.manea.m@gmail.com>, Josh Triplett <josh@joshtriplett.org>, Andrea Merello <andrea.merello@gmail.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Greg,

On Wed, Jul 02, 2014 at 09:33:34AM -0700, Greg Kroah-Hartman wrote:
> On Wed, Jul 02, 2014 at 11:25:51AM +0200, Emil Goode wrote:
> > We need to make sure the struct rtllib_device pointer ieee is not NULL
> > after the goto rx_dropped label since it is dereferenced there.
> > 
> > Signed-off-by: Emil Goode <emilgoode@gmail.com>
> > ---
> >  drivers/staging/rtl8192e/rtllib_rx.c |    3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
> > index 60de54c..7db3e74 100644
> > --- a/drivers/staging/rtl8192e/rtllib_rx.c
> > +++ b/drivers/staging/rtl8192e/rtllib_rx.c
> > @@ -1496,7 +1496,8 @@ int rtllib_rx(struct rtllib_device *ieee, struct sk_buff *skb,
> >  	return ret;
> >  
> >   rx_dropped:
> > -	ieee->stats.rx_dropped++;
> > +	if (ieee)
> > +		ieee->stats.rx_dropped++;
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL(rtllib_rx);
> 
> Is this something that is hitting users today in the tree, or is this
> just a bug you found looking at the code?

It's a static checker fix and I'm not aware of any impact on users.
If you want I will resend with that information added?

Best regards,

Emil Goode
