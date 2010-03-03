From: Dan Carpenter <error27@gmail.com>
Date: Wed, 03 Mar 2010 07:10:23 +0000
Subject: verifying whitespace patches don't change anything was Re: [PATCH]
Message-Id: <20100303071023.GF5086@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1266338116-27482-1-git-send-email-tim@weberpafrica.com> <20100218160547.GJ21785@kroah.com>
In-Reply-To: <20100218160547.GJ21785@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <greg@kroah.com>
Cc: tim@weberpafrica.com, gregkh@suse.de, devel@driverdev.osuosl.org, Tim Schofield <tim.schofield1960@googlemail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Feb 18, 2010 at 08:05:47AM -0800, Greg KH wrote:
> On Tue, Feb 16, 2010 at 04:35:16PM +0000, tim@weberpafrica.com wrote:
> > From: Tim Schofield <tim.schofield1960@googlemail.com>
> > 
> > ---
> >  drivers/staging/rtl8192e/r8180_93cx6.c |   22 ++++++++++++++--------
> >  1 files changed, 14 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8192e/r8180_93cx6.c b/drivers/staging/rtl8192e/r8180_93cx6.c
> > index 262ed5f..60fba80 100644
> > --- a/drivers/staging/rtl8192e/r8180_93cx6.c
> > +++ b/drivers/staging/rtl8192e/r8180_93cx6.c
> > @@ -23,12 +23,14 @@
> >  static void eprom_cs(struct net_device *dev, short bit)
> >  {
> >  	if (bit)
> > +		/* enable EPROM */
> >  		write_nic_byte(dev, EPROM_CMD,
> >  			       (1<<EPROM_CS_SHIFT) | \
> > -			       read_nic_byte(dev, EPROM_CMD)); //enable EPROM
> > +			       read_nic_byte(dev, EPROM_CMD));
> >  	else
> > +		/* disable EPROM */
> >  		write_nic_byte(dev, EPROM_CMD, read_nic_byte(dev, EPROM_CMD)\
> > -			       &~(1<<EPROM_CS_SHIFT)); //disable EPROM
> > +			       &~(1<<EPROM_CS_SHIFT));
> 
> This does not do what you think it does (hint, you need {} if you want
> to have more than one line in an if statement...)
> 
> Can you always verify that your coding style changes do not actually
> break the code?  A simple comparison of the .ko file before and after
> should be sufficient.
> 

That's what I thought too, but every debug macro has a __LINE__ in it so 
if you add a new line at the start of the file it makes a ton of changes in
the final binary .ko file.

Is there a trick to this?

I hacked sparse to always use 12345 as the line, but if, for example, you 
remove uneeded parenthesis that would still count as a code change.

regards,
dan carpenter

diff --git a/pre-process.c b/pre-process.c
index 34b21ff..d3ae7a0 100644
--- a/pre-process.c
+++ b/pre-process.c
@@ -154,7 +154,8 @@ static int expand_one_symbol(struct token **list)
 		return expand(list, sym);
 	}
 	if (token->ident = &__LINE___ident) {
-		replace_with_integer(token, token->pos.line);
+//		replace_with_integer(token, token->pos.line);
+		replace_with_integer(token, 12345);
 	} else if (token->ident = &__FILE___ident) {
 		replace_with_string(token, stream_name(token->pos.stream));
 	} else if (token->ident = &__DATE___ident) {
