From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 01 Jul 2015 08:01:33 +0000
Subject: Re: [PATCH] Staging: unisys: virtpci: fixed a brace coding style issue
Message-Id: <alpine.DEB.2.10.1507010959260.2374@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <55930BB1.10502@zoho.com> <20150701065749.GA2411@sudip-PC> <55939890.6090903@zoho.com>
In-Reply-To: <55939890.6090903@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sohny Thomas <sohnythomas@zoho.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, benjamin.romer@unisys.com, david.kershner@unisys.com, bryan.thompson@unisys.com, erik.arfvidson@unisys.com, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, sparmaintainer@unisys.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Wed, 1 Jul 2015, Sohny Thomas wrote:

> Thanks for review, my answers inline
>
> On 01-07-2015 12:27, Sudip Mukherjee wrote:
> > On Wed, Jul 01, 2015 at 03:05:45AM +0530, Sohny Thomas wrote:
> > >
> > > FIX 2 unnecessary braces found by checkpatch.pl
> > >
> > > Signed-off-by: Sohny Thomas <sohnythomas@zoho.com>
> > > ---
> > >   drivers/staging/unisys/virtpci/virtpci.c | 11 ++++++-----
> > >   1 file changed, 6 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/staging/unisys/virtpci/virtpci.c
> > > b/drivers/staging/unisys/virtpci/virtpci.c
> > > index d5ad017..f3674de 100644
> > > --- a/drivers/staging/unisys/virtpci/virtpci.c
> > > +++ b/drivers/staging/unisys/virtpci/virtpci.c
> > > @@ -190,9 +190,10 @@ static int write_vbus_chp_info(struct
> > > spar_vbus_channel_protocol *chan,
> > >   		return -1;
> > >
> > >   	off = sizeof(struct channel_header) + chan->hdr_info.chp_info_offset;
> > > -	if (chan->hdr_info.chp_info_offset = 0) {
> > > +
> > > +	if (chan->hdr_info.chp_info_offset = 0)
> > >   		return -1;
> > > -	}
> > > +
> > why you are inserting new line here?
> I did it so that its readable, will remove it if not required
> >
> > >   	memcpy(((u8 *)(chan)) + off, info, sizeof(*info));
> > >   	return 0;
> > >   }
> > > @@ -484,10 +485,10 @@ static int delete_vhba(struct del_virt_guestpart
> > > *delparams)
> > >
> > >   	i = virtpci_device_del(NULL /*no parent bus */, VIRTHBA_TYPE,
> > >   			       &scsi.wwnn, NULL);
> > > -	if (i) {
> > > +	if (i)
> > >   		return 1;
> > > -	}
> > > -	return 0;
> > > +	else
> > > +		return 0;
> > No, now this will introduce a new checkpatch warning that "else is not
> > required after return". why did you introduce this "else"?
> I did this so that the code is more readable and understandable, I checked and
> checkpatch didn't call this out , so its clean.
>
> Otherwise the above code looks like this
>
> if(i)
>    return 1;
> return 0;

That looks fine.

I haven't looked at the code in detail.  Is it normal that the return
values seem to be 0 1 and -1?  Which values represent success and which
represent an error?  It is nicer to have the errors under if and success
as a direct return at the end.

julia
