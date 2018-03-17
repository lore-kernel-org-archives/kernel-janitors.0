From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 17 Mar 2018 04:33:15 +0000
Subject: Re: [PATCH v2] platform/x86: Fix memory leaks in build_tokens_sysfs()
Message-Id: <20180317043315.cahfrmy63pztquhz@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180316121015.GA14282@mwanda>
In-Reply-To: <20180316121015.GA14282@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Mar 16, 2018 at 08:35:44PM +0200, Andy Shevchenko wrote:
> On Fri, Mar 16, 2018 at 2:10 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > We're freeing "value_name" which is NULL, so that's a no-op, but we
> > intended to free "location_name" instead.  And then we don't free the
> > names in token_location_attrs[0] and token_value_attrs[0].
> >
> > Fixes: 33b9ca1e53b4 ("platform/x86: dell-smbios: Add a sysfs interface for SMBIOS tokens")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2: style changes (move from a for loop to a while loop) and this driver
> >     has been renamed.
> >
> > diff --git a/drivers/platform/x86/dell-smbios-base.c b/drivers/platform/x86/dell-smbios-base.c
> > index 2485c80a9fdd..ec31d149f82e 100644
> > --- a/drivers/platform/x86/dell-smbios-base.c
> > +++ b/drivers/platform/x86/dell-smbios-base.c
> > @@ -514,7 +514,7 @@ static int build_tokens_sysfs(struct platform_device *dev)
> >                 continue;
> >
> >  loop_fail_create_value:
> > -               kfree(value_name);
> > +               kfree(location_name);
> >                 goto out_unwind_strings;
> >         }
> >         smbios_attribute_group.attrs = token_attrs;
> > @@ -525,7 +525,7 @@ static int build_tokens_sysfs(struct platform_device *dev)
> >         return 0;
> >
> >  out_unwind_strings:
> > -       for (i = i-1; i > 0; i--) {
> > +       while (--i >= 0) {
> 
> Simple
> 
> while (i--) {
> 
> please.
> 
> Darren or me can fix this when apply, if you agree on the change.
> 

Yes, please fix it yourself when you apply it.

regards,
dan carpenter

