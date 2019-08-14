From: Alan Stern <stern@rowland.harvard.edu>
Date: Wed, 14 Aug 2019 14:46:04 +0000
Subject: Re: [PATCH] usb: host: ohci-pxa27x: Fix and & vs | typo
Message-Id: <Pine.LNX.4.44L0.1908141045070.1771-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190814140414.GU1974@kadam>
References: <20180223123300.GA1062@mwanda>
In-Reply-To: <20180223123300.GA1062@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 14 Aug 2019, Dan Carpenter wrote:

> I was looking at this code again today and I'm still convinced this
> patch is correct.  Should I resend?
> 
> regards,
> dan carpenter
> 
> On Fri, Feb 23, 2018 at 03:33:00PM +0300, Dan Carpenter wrote:
> > The code is supposed to clear the RH_A_NPS and RH_A_PSM bits, but it's
> > a no-op because of the & vs | typo.  This bug predates git and it was
> > only discovered using static analysis so it must not affect too many
> > people in real life.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > Not tested.
> > 
> > diff --git a/drivers/usb/host/ohci-pxa27x.c b/drivers/usb/host/ohci-pxa27x.c
> > index 3e2474959735..7679fb583e41 100644
> > --- a/drivers/usb/host/ohci-pxa27x.c
> > +++ b/drivers/usb/host/ohci-pxa27x.c
> > @@ -148,7 +148,7 @@ static int pxa27x_ohci_select_pmm(struct pxa27x_ohci *pxa_ohci, int mode)
> >  		uhcrhda |= RH_A_NPS;
> >  		break;
> >  	case PMM_GLOBAL_MODE:
> > -		uhcrhda &= ~(RH_A_NPS & RH_A_PSM);
> > +		uhcrhda &= ~(RH_A_NPS | RH_A_PSM);
> >  		break;
> >  	case PMM_PERPORT_MODE:
> >  		uhcrhda &= ~(RH_A_NPS);

The patch sure looks right to me.  FWIW:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
