From: Johan Hovold <johan@kernel.org>
Date: Fri, 11 Oct 2019 14:08:31 +0000
Subject: Re: [PATCH] USB: legousbtower: fix a signedness bug in tower_probe()
Message-Id: <20191011140831.GJ13531@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191011133525.GB22905@mwanda>
 <5DA088DE.5040902@bfs.de>
 <20191011135855.GE4774@kadam>
In-Reply-To: <20191011135855.GE4774@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: walter harms <wharms@bfs.de>, Juergen Stuber <starblue@users.sourceforge.net>, Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Oct 11, 2019 at 04:58:56PM +0300, Dan Carpenter wrote:
> On Fri, Oct 11, 2019 at 03:51:26PM +0200, walter harms wrote:
> > 
> > 
> > Am 11.10.2019 15:35, schrieb Dan Carpenter:
> > > The problem is that sizeof() is unsigned long so negative error codes
> > > are type promoted to high positive values and the condition becomes
> > > false.
> > > 
> > > Fixes: 1d427be4a39d ("USB: legousbtower: fix slab info leak at probe")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > >  drivers/usb/misc/legousbtower.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
> > > index 9d4c52a7ebe0..835908fe1e65 100644
> > > --- a/drivers/usb/misc/legousbtower.c
> > > +++ b/drivers/usb/misc/legousbtower.c
> > > @@ -881,7 +881,7 @@ static int tower_probe (struct usb_interface *interface, const struct usb_device
> > >  				  get_version_reply,
> > >  				  sizeof(*get_version_reply),
> > >  				  1000);
> > > -	if (result < sizeof(*get_version_reply)) {
> > > +	if (result < 0 || result < sizeof(*get_version_reply)) {
> > >  		if (result >= 0)
> > >  			result = -EIO;
> > >  		dev_err(idev, "get version request failed: %d\n", result);
> > 
> > i am not an USB expert but it seems that this is a complicated way
> > to check for result != sizeof(*get_version_reply).
> 
> Yeah.  You're right.  That would look nicer.  I will resend.

Your version, or adding an explicit cast to int, may be preferred as
they document that there's something to watch out for here.

Either way you have my ack.

Johan
