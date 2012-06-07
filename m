From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Jun 2012 09:59:59 +0000
Subject: Re: [patch] sony-laptop: fix a couple signedness bugs
Message-Id: <20120607095959.GB13539@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120607082221.GA7582@elgon.mountain>
 <4FD078B2.3060909@bfs.de>
In-Reply-To: <4FD078B2.3060909@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Mattia Dongili <malattia@linux.it>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jun 07, 2012 at 11:47:30AM +0200, walter harms wrote:
> 
> 
> Am 07.06.2012 10:22, schrieb Dan Carpenter:
> > These need to be signed to handle negative error codes.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> > index 210d4ae..0a2f026 100644
> > --- a/drivers/platform/x86/sony-laptop.c
> > +++ b/drivers/platform/x86/sony-laptop.c
> > @@ -2113,7 +2113,7 @@ static ssize_t sony_nc_thermal_mode_show(struct device *dev,
> >  		struct device_attribute *attr, char *buffer)
> >  {
> >  	ssize_t count = 0;
> > -	unsigned int mode = sony_nc_thermal_mode_get();
> > +	int mode = sony_nc_thermal_mode_get();
> >  
> >  	if (mode < 0)
> >  		return mode;
> > @@ -2480,7 +2480,7 @@ static void sony_nc_backlight_ng_read_limits(int handle,
> >  	props->maxlvl = 0xff;
> >  
> >  	offset = sony_find_snc_handle(handle);
> 
> sony_find_snc_handle() should return an int, did something change ?

offset is a u64.  It has to be 64 bit.  I thought about changing it
to s64, but decided to just cast it here instead.

regards,
dan carpenter

> 
> > -	if (offset < 0)
> > +	if ((int)offset < 0)
> >  		return;
> >  
> >  	/* try to read the boundaries from ACPI tables, if we fail the above
> 
> 
> 
