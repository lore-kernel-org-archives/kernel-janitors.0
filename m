From: Dan Carpenter <error27@gmail.com>
Date: Wed, 03 Feb 2010 06:12:26 +0000
Subject: Re: [PATCH] drivers/acpi/ec.c fix a small memory leak
Message-Id: <20100203061225.GB32535@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1265112730.4804.8.camel@ICE-BOX> <4B684650.9070807@suse.de>
In-Reply-To: <4B684650.9070807@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Alexey Starikovskiy <astarikovskiy@suse.de>
Cc: Darren Jenkins <darrenrjenkins@gmail.com>, Kernel Janitors <kernel-janitors@vger.kernel.org>, Len Brown <lenb@kernel.org>, linux ACPI <linux-acpi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Feb 02, 2010 at 06:35:44PM +0300, Alexey Starikovskiy wrote:
> NAK
> 
> saved_ec is allocated if flag EC_FLAGS_VALIDATE_ECDT is true.
> EC_FLAGS_SKIP_DSDT_SCAN have no sense in such case, thus this new code path
> is never executed.
> On the other hand, unconditionally freeing pointer, which is might be NULL, is not
> right either.

As near as I can tell you are right that the code cannot leak memory.  But Darren 
is right to think that it's calling kfree() on a NULL pointer is OK.  His patch does 
not introduce any errors.

The logic here is basically spaghetti.  Every person who looks at it is going to 
think it's a leak.  Lots of people are going to look at it, because the static
checkers all think it's a leak too.  Someone could send a cleanup patch that makes it
readable.

regards,
dan carpenter

> So, this patch introduced more problems as it tries to solve...
> 
> Regards,
> Alex.
> 
> Darren Jenkins пишет:
> > Plug a very small leak in acpi_ec_ecdt_probe()
> > 
> > Coverity CID: 13319
> > 
> > Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com> 
> > 
> > diff --git drivers/acpi/ec.c drivers/acpi/ec.c
> > index d6471bb..13061dc 100644
> > --- drivers/acpi/ec.c
> > +++ drivers/acpi/ec.c
> > @@ -1009,8 +1009,10 @@ int __init acpi_ec_ecdt_probe(void)
> >  	/* fall through */
> >  	}
> >  
> > -	if (EC_FLAGS_SKIP_DSDT_SCAN)
> > +	if (EC_FLAGS_SKIP_DSDT_SCAN) {
> > +		kfree(saved_ec);
> >  		return -ENODEV;
> > +	}
> >  
> >  	/* This workaround is needed only on some broken machines,
> >  	 * which require early EC, but fail to provide ECDT */
> > 
> > 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
