From: Matthew Wilcox <matthew@wil.cx>
Date: Wed, 03 Mar 2010 12:18:19 +0000
Subject: Re: verifying whitespace patches don't change anything was Re:
Message-Id: <20100303121819.GH6567@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1266338116-27482-1-git-send-email-tim@weberpafrica.com> <20100218160547.GJ21785@kroah.com> <20100303071023.GF5086@bicker>
In-Reply-To: <20100303071023.GF5086@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Greg KH <greg@kroah.com>, tim@weberpafrica.com, gregkh@suse.de, devel@driverdev.osuosl.org, Tim Schofield <tim.schofield1960@googlemail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Mar 03, 2010 at 10:10:23AM +0300, Dan Carpenter wrote:
> On Thu, Feb 18, 2010 at 08:05:47AM -0800, Greg KH wrote:
> > On Tue, Feb 16, 2010 at 04:35:16PM +0000, tim@weberpafrica.com wrote:
> > > From: Tim Schofield <tim.schofield1960@googlemail.com>
> > > 
> > > ---
> > >  drivers/staging/rtl8192e/r8180_93cx6.c |   22 ++++++++++++++--------
> > >  1 files changed, 14 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/staging/rtl8192e/r8180_93cx6.c b/drivers/staging/rtl8192e/r8180_93cx6.c
> > > index 262ed5f..60fba80 100644
> > > --- a/drivers/staging/rtl8192e/r8180_93cx6.c
> > > +++ b/drivers/staging/rtl8192e/r8180_93cx6.c
> > > @@ -23,12 +23,14 @@
> > >  static void eprom_cs(struct net_device *dev, short bit)
> > >  {
> > >  	if (bit)
> > > +		/* enable EPROM */
> > >  		write_nic_byte(dev, EPROM_CMD,
> > >  			       (1<<EPROM_CS_SHIFT) | \
> > > -			       read_nic_byte(dev, EPROM_CMD)); //enable EPROM
> > > +			       read_nic_byte(dev, EPROM_CMD));
> > >  	else
> > > +		/* disable EPROM */
> > >  		write_nic_byte(dev, EPROM_CMD, read_nic_byte(dev, EPROM_CMD)\
> > > -			       &~(1<<EPROM_CS_SHIFT)); //disable EPROM
> > > +			       &~(1<<EPROM_CS_SHIFT));
> > 
> > This does not do what you think it does (hint, you need {} if you want
> > to have more than one line in an if statement...)

Sorry, Greg, you're wrong in this case.  /* */ does not count as a line.
Here's an example:

$ cat foo.c 
#include <stdio.h>

int main(void)
{
        if (0)
                /* foo */
                printf("Hello, World\n");
        return 0;
}

$ gcc -o foo foo.c -W -Wall -O2 -g
$ ./foo
[no output]


I think a much more cogent criticism of this patch would be that the comment
is entirely unnecessary for this function with a simple change:

-static void eprom_cs(struct net_device *dev, short bit)
+static void eprom_cs(struct net_device *dev, short enable)
 {
-	if (bit)
+	if (enable)
 		write_nic_byte(dev, EPROM_CMD,
 			       (1<<EPROM_CS_SHIFT) | \
-			       read_nic_byte(dev, EPROM_CMD)); //enable EPROM
+			       read_nic_byte(dev, EPROM_CMD));
 	else
 		write_nic_byte(dev, EPROM_CMD, read_nic_byte(dev, EPROM_CMD)\
-			       &~(1<<EPROM_CS_SHIFT)); //disable EPROM
+			       &~(1<<EPROM_CS_SHIFT));

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
