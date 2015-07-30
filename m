From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Jul 2015 08:30:58 +0000
Subject: Re: [patch] staging: comedi: das16: remove a duplicate condition
Message-Id: <20150730083057.GF5096@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150729213632.GE21784@mwanda>
In-Reply-To: <20150729213632.GE21784@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jul 30, 2015 at 09:18:56AM +0200, walter harms wrote:
> 
> 
> Am 29.07.2015 23:36, schrieb Dan Carpenter:
> > We checked that "it->options[3]" was non-zero on the line before so
> > there is no need to check again.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/staging/comedi/drivers/das16.c b/drivers/staging/comedi/drivers/das16.c
> > index d7cf4b1..056bca9 100644
> > --- a/drivers/staging/comedi/drivers/das16.c
> > +++ b/drivers/staging/comedi/drivers/das16.c
> > @@ -1032,8 +1032,7 @@ static int das16_attach(struct comedi_device *dev, struct comedi_devconfig *it)
> >  
> >  	/*  check that clock setting is valid */
> >  	if (it->options[3]) {
> > -		if (it->options[3] != 0 &&
> > -		    it->options[3] != 1 && it->options[3] != 10) {
> > +		if (it->options[3] != 1 && it->options[3] != 10) {
> >  			dev_err(dev->class_dev,
> >  				"Invalid option. Master clock must be set to 1 or 10 (MHz)\n");
> >  			return -EINVAL;
> 
> mmh, acording to the error messages 1 or 10 is allowed, obviously 0 is/was also valid.
> I would suggest to put that into one if () to make things more obvious.
> It 0 is also valid a minor tweak to the error msg would be nice.

Zero values are not used.  If you are going to set it then it has to be
1 or 10.  The message makes sense and matches the logic of the code.

regards,
dan carpenter

