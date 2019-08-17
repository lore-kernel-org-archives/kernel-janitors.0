From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 17 Aug 2019 08:25:34 +0000
Subject: Re: [PATCH][next] bus: moxtet: fix unsigned comparison to less than zero
Message-Id: <20190817082534.GB4451@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190816224106.11583-1-colin.king@canonical.com>
 <20190817020434.4ef2dc5f@nic.cz>
In-Reply-To: <20190817020434.4ef2dc5f@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Behun <marek.behun@nic.cz>, Arnd Bergmann <arnd@arndb.de>
Cc: Colin King <colin.king@canonical.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Aug 17, 2019 at 02:04:34AM +0200, Marek Behun wrote:
> On Fri, 16 Aug 2019 23:41:06 +0100
> Colin King <colin.king@canonical.com> wrote:
> 
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently the size_t variable res is being checked for
> > an error failure however the unsigned variable is never
> > less than zero so this test is always false. Fix this by
> > making variable res ssize_t
> > 
> > Addresses-Coverity: ("Unsigned compared against 0")
> > Fixes: 5bc7f990cd98 ("bus: Add support for Moxtet bus")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/bus/moxtet.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/bus/moxtet.c b/drivers/bus/moxtet.c
> > index 1ee4570e7e17..288a9e4c6c7b 100644
> > --- a/drivers/bus/moxtet.c
> > +++ b/drivers/bus/moxtet.c
> > @@ -514,7 +514,7 @@ static ssize_t output_write(struct file *file, const char __user *buf,
> >  	struct moxtet *moxtet = file->private_data;
> >  	u8 bin[TURRIS_MOX_MAX_MODULES];
> >  	u8 hex[sizeof(bin) * 2 + 1];
> > -	size_t res;
> > +	ssize_t res;
> >  	loff_t dummy = 0;
> >  	int err, i;
> >  
> 
> Hi Colin,
> thanks. Should I just Ack this, or do I need to send patch to the
> developer who commited my patches?

According to MAINTAINERS, you're the maintainer and not Arnd.  You
should forward this to him.  But in the future it might be easier if
Arnd added himself to the MAINTAINERS file for this.

You're probably better off if you have a subsystem mailing list for this
driver instead of using LKML.  That way more people can get involved
with the development if they want to.

Anyway, as the maintainer, you need to collect patches and forward them
on to Arnd or someone else.  Since you are handling the patches, that
means you need to Sign them to certify that you haven't added any of
SCOs private super secret UNIXWARE intellectual property.  You can't
just use the Acked-by, you have to use the Signed-off-by tag.

If Arnd or someone else is collecting the patches then you could use
Reviewed-by or Acked-by.  Acked-by basically means you approve the
patch and often it's going through a different maintainer's tree.  Or it
can be you like the approach the patch is taking.  It's sort of vague.
I seldom Ack patches because I'm not a maintainer in an official sense,
but I do give people a Reviewed-by tag if I review their patch and I
want to make their day a little happier.  Also if it's a huge patch
series and I want to help out Greg to know that he can skip reviewing
the patch if he wants to.

regards,
dan carpenter
