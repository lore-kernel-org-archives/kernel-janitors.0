From: Emil Goode <emilgoode@gmail.com>
Date: Wed, 28 May 2014 16:18:39 +0000
Subject: Re: [PATCH] mfd: fix unintentional NULL check in menelaus_set_voltage()
Message-Id: <20140528161839.GA16693@lianli>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401284030-9650-1-git-send-email-emilgoode@gmail.com>
 <20140528152011.GB1954@lee--X1>
In-Reply-To: <20140528152011.GB1954@lee--X1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello,

On Wed, May 28, 2014 at 04:20:11PM +0100, Lee Jones wrote:
> On Wed, 28 May 2014, Emil Goode wrote:
> 
> > The struct menelaus_vtg pointer vtg cannot be NULL here
> > so the condition is never true and if it ever was true
> > it would lead to a NULL pointer dereference when we goto
> > label set_voltage.
> > 
> > Before the below patch was applied the code was:
> > 
> > if (vtg = 0)
> > 
> > The intention was to check if vtg_val is 0.
> > 
> > commit 59a9f7a32adf6537b4e4db8ca204eeb77d7a634e
> > ("mfd: menelaus: Use NULL instead of 0")
> > 
> > Signed-off-by: Emil Goode <emilgoode@gmail.com>
> > ---
> > Hello,
> > 
> > This is only build tested, it would be good to get a comment
> > from someone who is familiar with this code.
> > 
> > Found using coccinelle.
> > 
> > Best regards,
> > 
> > Emil Goode
> > 
> >  drivers/mfd/menelaus.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mfd/menelaus.c b/drivers/mfd/menelaus.c
> > index ad25bfa..4859597 100644
> > --- a/drivers/mfd/menelaus.c
> > +++ b/drivers/mfd/menelaus.c
> > @@ -466,7 +466,7 @@ static int menelaus_set_voltage(const struct menelaus_vtg *vtg, int mV,
> >  	struct i2c_client *c = the_menelaus->client;
> >  
> >  	mutex_lock(&the_menelaus->lock);
> > -	if (!vtg)
> > +	if (vtg_val = 0)
> 
> I would prefer:
> 
>   if (!vtg_val)

Ok, I will resend.

Best regards,

Emil Goode
