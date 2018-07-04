From: "Winkler, Tomas" <tomas.winkler@intel.com>
Date: Wed, 04 Jul 2018 13:57:44 +0000
Subject: RE: [PATCH] mei: bus: type promotion bug in mei_nfc_if_version()
Message-Id: <5B8DA87D05A7694D9FA63FD143655C1B9D95BC46@hasmsx108.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704093449.vryluk7khaudstgp@kili.mountain>
 <alpine.DEB.2.20.1807041358580.4387@hadrien>
 <20180704121600.hrezydpvpe4hyie3@mwanda>
In-Reply-To: <20180704121600.hrezydpvpe4hyie3@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Julia Lawall <julia.lawall@lip6.fr>
Cc: "Usyskin, Alexander" <alexander.usyskin@intel.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> 
> On Wed, Jul 04, 2018 at 01:59:14PM +0200, Julia Lawall wrote:
> >
> >
> > On Wed, 4 Jul 2018, Dan Carpenter wrote:
> >
> > > We accidentally removed the check for negative returns without
> > > considering the issue of type promotion.  The "if_version_length"
> > > variable is type size_t so if __mei_cl_recv() returns a negative
> > > then "bytes_recv" is type promoted to a high positive value and
> > > treated as success.
> > >
> > > Fixes: 582ab27a063a ("mei: bus: fix received data size check in NFC
> > > fixup")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > >
> > > diff --git a/drivers/misc/mei/bus-fixup.c
> > > b/drivers/misc/mei/bus-fixup.c index 0208c4b027c5..fa0236a5e59a
> > > 100644
> > > --- a/drivers/misc/mei/bus-fixup.c
> > > +++ b/drivers/misc/mei/bus-fixup.c
> > > @@ -267,7 +267,7 @@ static int mei_nfc_if_version(struct mei_cl *cl,
> > >
> > >  	ret = 0;
> > >  	bytes_recv = __mei_cl_recv(cl, (u8 *)reply, if_version_length, 0);
> > > -	if (bytes_recv < if_version_length) {
> > > +	if (bytes_recv < 0 || bytes_recv < if_version_length) {
> >
> > Is this preferred to adding an int cast?
> 
> I don't think it matters.  I kind of like explicitly testing for negative but
> maybe later people will just remove the check like we did here?  You could
> do it a bunch of different ways:
> 
> 1: if (ret < 0 || ret < ARRAY_SIZE(xxx))
> 2: if (ret < (int)ARRAY_SIZE(xxx))
> 3: if (ret != ARRAY_SIZE(xxx))
> 
> They're all equivalent.  I guess I don't like casting too much.  My first
> approach to fixing this was just to declare if_version_length as an int, but
> then I saw that originally there was a "bytes_recv < 0"
> check and decided to go that way instead.

Actually bytes_recv should be probably of ssize_t type,  so could be the if_version_length. 

How did you find this, I haven't seen it in reported by sparse, smatch and I believe -Wsign-compare is suppressed in compilation warnings.
Thanks
Tomas
