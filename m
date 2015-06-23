From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 23 Jun 2015 08:11:28 +0000
Subject: Re: mtip32xx: fix crash on surprise removal of the drive
Message-Id: <alpine.DEB.2.10.1506231011010.2554@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150620123829.GA24933@mwanda>
In-Reply-To: <20150620123829.GA24933@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Tue, 23 Jun 2015, Dan Carpenter wrote:

> On Mon, Jun 22, 2015 at 10:24:51AM -0700, Asai Thambi SP wrote:
> >
> >
> > On 6/20/2015 5:38 AM, Dan Carpenter wrote:
> > > Hello Asai Thambi SP,
> > >
> > > The patch 2132a544727e: "mtip32xx: fix crash on surprise removal of
> > > the drive" from May 11, 2015, leads to the following static checker
> > > warning:
> > >
> > > 	drivers/block/mtip32xx/mtip32xx.c:4489 mtip_pci_remove()
> > > 	warn: 'dd' was already freed.
> > Thanks Dan.
> > We got this report as soon as patch was merged.
>
> I try to avoid sending duplicates.  Who sent you the report?  I looked
> through my kbuild zero bot emails and I don't think they sent it to you.

I probably sent it.  My emails to the mailing list are probably all still
being rejected.

julia


>
> regards,
> dan carpenter
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
>
