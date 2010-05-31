From: Dan Carpenter <error27@gmail.com>
Date: Mon, 31 May 2010 20:40:38 +0000
Subject: Re: [patch 1/2] input/tps6507x-ts: dereferencing before checking
Message-Id: <20100531204038.GA5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100531120122.GR5483@bicker> <20100531191723.GE30712@core.coreip.homeip.net>
In-Reply-To: <20100531191723.GE30712@core.coreip.homeip.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Todd Fischer <todd.fischer@ridgerun.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, May 31, 2010 at 12:17:23PM -0700, Dmitry Torokhov wrote:
> > --- a/drivers/input/touchscreen/tps6507x-ts.c
> > +++ b/drivers/input/touchscreen/tps6507x-ts.c
> > @@ -355,10 +355,11 @@ static int __devexit tps6507x_ts_remove(struct platform_device *pdev)
> >  {
> >  	struct tps6507x_dev *tps6507x_dev = platform_get_drvdata(pdev);
> >  	struct tps6507x_ts *tsc = tps6507x_dev->ts;
> > -	struct input_dev *input_dev = tsc->input_dev;
> > +	struct input_dev *input_dev;
> >  
> >  	if (!tsc)
> >  		return 0;
> > +	input_dev = tsc->input_dev;
> >  
> 
> Why would tsc ever be NULL?
> 
> Also I really do not like that pdev's driver data that is supposed to be
> driver-private data is being used by the parent. Parent should be using
> it's own drvdata and leave child's data alone. We should probably do in
> platform code what I2C is about to do and clear drvdata on unbind
> automatically to prevent this kind of misuse.
> 

Uh...  Sorry I was just messing with my static checker and didn't look
into it deeply enough.

All your points are valid ones of course.  This is fairly new driver so
we might be able to ask the maintainer.  :)  Todd, do you want to help
us out?

regards,
dan carpenter

