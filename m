From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 29 Jul 2013 13:35:38 +0000
Subject: Re: [patch v2] virtio: console: cleanup an error message
Message-Id: <20130729133538.GG5053@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201307191228.41794.arnd@arndb.de>
	<20130722204100.GB22020@elgon.mountain>
	<20130729071131.GD15142@amit-x200.redhat.com>
	<20130729131231.GC3779@kroah.com>
In-Reply-To: <20130729131231.GC3779@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Amit Shah <amit.shah@redhat.com>, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, virtualization@lists.linux-foundation.org

On Mon, Jul 29, 2013 at 06:12:31AM -0700, Greg Kroah-Hartman wrote:
> On Mon, Jul 29, 2013 at 12:41:31PM +0530, Amit Shah wrote:
> > On (Mon) 22 Jul 2013 [23:41:00], Dan Carpenter wrote:
> > > The PTR_ERR(NULL) here is not useful.
> > > 
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > > v2: completely different
> > > 
> > > diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
> > > index 1b456fe..4cf46d8 100644
> > > --- a/drivers/char/virtio_console.c
> > > +++ b/drivers/char/virtio_console.c
> > > @@ -2215,10 +2215,8 @@ static int __init init(void)
> > >  	}
> > >  
> > >  	pdrvdata.debugfs_dir = debugfs_create_dir("virtio-ports", NULL);
> > > -	if (!pdrvdata.debugfs_dir) {
> > > -		pr_warning("Error %ld creating debugfs dir for virtio-ports\n",
> > > -			   PTR_ERR(pdrvdata.debugfs_dir));
> > > -	}
> > > +	if (!pdrvdata.debugfs_dir)
> > > +		pr_warning("Error creating debugfs dir for virtio-ports\n");
> > 
> > When debugfs is enabled and creating the dir fails, we'll print this
> > warning message.
> > 
> > When debugfs is disabled, we'll get an error return, and not print any
> > message.
> 
> Not true, you will still print the message if debugfs is disabled, as
> .debugfs_dir will not be NULL.
> 
> Why even print anything at all?  It's debugfs, you shouldn't really care
> that much about it :)
>

Yes yes.  That's what this code does.  It only checks for NULL.  The
debugfs was a little confusing at first but I get it now.

regards,
dan carpenter

