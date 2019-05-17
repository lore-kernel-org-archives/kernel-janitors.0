From: Quentin Deslandes <quentin.deslandes@itdev.co.uk>
Date: Fri, 17 May 2019 13:15:43 +0000
Subject: Re: [PATCH v3] staging: vt6656: returns error code on vnt_int_start_interrupt fail
Message-Id: <20190517131539.GA9842@qd-ubuntu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190516093046.1400-1-quentin.deslandes@itdev.co.uk>
 <20190517075331.3658-1-quentin.deslandes@itdev.co.uk>
 <20190517091723.GA4602@kroah.com>
In-Reply-To: <20190517091723.GA4602@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Mukesh Ojha <mojha@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Forest Bond <forest@alittletooquiet.net>, Ojaswin Mujoo <ojaswin25111998@gmail.com>

On Fri, May 17, 2019 at 11:17:23AM +0200, Greg Kroah-Hartman wrote:
> On Fri, May 17, 2019 at 07:53:49AM +0000, Quentin Deslandes wrote:
> > Returns error code from 'vnt_int_start_interrupt()' so the device's private
> > buffers will be correctly freed and 'struct ieee80211_hw' start function
> > will return an error code.
> > 
> > Signed-off-by: Quentin Deslandes <quentin.deslandes@itdev.co.uk>
> > ---
> > v2: returns 'status' value to caller instead of removing it.
> > v3: add patch version details. Thanks to Greg K-H for his help.
> 
> Looking better!
> 
> But a few minor things below:
> 
> > 
> >  drivers/staging/vt6656/int.c      |  4 +++-
> >  drivers/staging/vt6656/int.h      |  2 +-
> >  drivers/staging/vt6656/main_usb.c | 12 +++++++++---
> >  3 files changed, 13 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/staging/vt6656/int.c b/drivers/staging/vt6656/int.c
> > index 504424b19fcf..f3ee2198e1b3 100644
> > --- a/drivers/staging/vt6656/int.c
> > +++ b/drivers/staging/vt6656/int.c
> > @@ -39,7 +39,7 @@ static const u8 fallback_rate1[5][5] = {
> >  	{RATE_54M, RATE_54M, RATE_36M, RATE_18M, RATE_18M}
> >  };
> >  
> > -void vnt_int_start_interrupt(struct vnt_private *priv)
> > +int vnt_int_start_interrupt(struct vnt_private *priv)
> >  {
> >  	unsigned long flags;
> >  	int status;
> > @@ -51,6 +51,8 @@ void vnt_int_start_interrupt(struct vnt_private *priv)
> >  	status = vnt_start_interrupt_urb(priv);
> >  
> >  	spin_unlock_irqrestore(&priv->lock, flags);
> > +
> > +	return status;
> >  }
> >  
> >  static int vnt_int_report_rate(struct vnt_private *priv, u8 pkt_no, u8 tsr)
> > diff --git a/drivers/staging/vt6656/int.h b/drivers/staging/vt6656/int.h
> > index 987c454e99e9..8a6d60569ceb 100644
> > --- a/drivers/staging/vt6656/int.h
> > +++ b/drivers/staging/vt6656/int.h
> > @@ -41,7 +41,7 @@ struct vnt_interrupt_data {
> >  	u8 sw[2];
> >  } __packed;
> >  
> > -void vnt_int_start_interrupt(struct vnt_private *priv);
> > +int vnt_int_start_interrupt(struct vnt_private *priv);
> >  void vnt_int_process_data(struct vnt_private *priv);
> >  
> >  #endif /* __INT_H__ */
> > diff --git a/drivers/staging/vt6656/main_usb.c b/drivers/staging/vt6656/main_usb.c
> > index ccafcc2c87ac..71e10b9ae253 100644
> > --- a/drivers/staging/vt6656/main_usb.c
> > +++ b/drivers/staging/vt6656/main_usb.c
> > @@ -483,6 +483,7 @@ static void vnt_tx_80211(struct ieee80211_hw *hw,
> >  
> >  static int vnt_start(struct ieee80211_hw *hw)
> >  {
> > +	int err = 0;
> >  	struct vnt_private *priv = hw->priv;
> >  
> >  	priv->rx_buf_sz = MAX_TOTAL_SIZE_WITH_ALL_HEADERS;
> > @@ -496,15 +497,20 @@ static int vnt_start(struct ieee80211_hw *hw)
> >  
> >  	if (vnt_init_registers(priv) == false) {
> >  		dev_dbg(&priv->usb->dev, " init register fail\n");
> > +		err = -ENOMEM;
> 
> Why ENOMEM?  vnt_init_registers() should return a proper error code,
> based on what went wrong, not true/false.  So fix that up first, and
> then you can do this patch.
> 
> See, your one tiny coding style fix is turning into real cleanups, nice!
> 
> >  		goto free_all;
> >  	}
> >  
> > -	if (vnt_key_init_table(priv))
> > +	if (vnt_key_init_table(priv)) {
> > +		err = -ENOMEM;
> 
> Same here, vnt_key_init_table() should return a real error value, and
> then just return that here.
> 
> >  		goto free_all;
> > +	}
> >  
> >  	priv->int_interval = 1;  /* bInterval is set to 1 */
> >  
> > -	vnt_int_start_interrupt(priv);
> > +	err = vnt_int_start_interrupt(priv);
> > +	if (err)
> > +		goto free_all;
> 
> Like this, that is the correct thing.
> 
> So, this is now going to be a patch series, fixing up those two
> functions (and any functions they call possibly), and then this can be
> the last patch of the series.
> 
> thanks,
> 
> greg k-h

Thank you for your help, this is getting really exciting! However, I had
a look at these function (vnt_init_registers() and vnt_key_init_table())
and some questions popped in my mind.

If I understand correctly, your request is to fix these function so they
can return an error code instead of just failing, as I did with
vnt_int_start_interrupt() in the third patch, which is also the most
logical behaviour.

So, vnt_init_registers() is a big function (~240 lines), which should
return a proper error code. For this, all the function called in
vnt_init_registers() should also return a proper error code, right?

What about functions called that does not return any value, but their only
action is to call a function that return a status code? As I learn with this
patch, discarding error values is not a acceptable behaviour. Why would we write
functions returning an error code solely to discard it? So such function should
be changed too?

I listed up to 22 function that need to be updated in order to correctly
propagate errors up to vnt_start() so it could "nicely" fail and here is
the last problem: regarding this fair amount of changes, how to ensure
the device will work as well as before? I don't have this device at home
or at work and it doesn't seems easy to find.

Thank you,
Quentin
