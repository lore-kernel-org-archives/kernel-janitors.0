From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Nov 2015 18:20:22 +0000
Subject: Re: [patch] vfio: make an array larger
Message-Id: <20151104182022.GJ7289@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151104132624.GC20966@mwanda>
 <1446656080.3692.112.camel@redhat.com>
In-Reply-To: <1446656080.3692.112.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Frank Blaschka <frank.blaschka@de.ibm.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Sorry, I should have said that I am on linux-next at the start.

> > -static u8 pci_cap_length[] = {
> > +static u8 pci_cap_length[PCI_CAP_ID_MAX + 1] = {
> >  	[PCI_CAP_ID_BASIC]	= PCI_STD_HEADER_SIZEOF, /* pci config header */
> >  	[PCI_CAP_ID_PM]		= PCI_PM_SIZEOF,
> >  	[PCI_CAP_ID_AGP]	= PCI_AGP_SIZEOF,
> 
> This doesn't make a whole lot of sense to me.  The last entry we define
> is:
> 
>         [PCI_CAP_ID_AF]         = PCI_CAP_AF_SIZEOF,

Yes.

> };
> 
> and PCI_CAP_ID_MAX is defined as:
> 
> #define  PCI_CAP_ID_MAX         PCI_CAP_ID_AF

No.  I am on linux-next and we appear to have added a new element
beyond PCI_CAP_ID_AF.

#define  PCI_CAP_ID_AF          0x13    /* PCI Advanced Features */
#define  PCI_CAP_ID_EA          0x14    /* PCI Enhanced Allocation */
#define  PCI_CAP_ID_MAX         PCI_CAP_ID_EA

> 
> So the array is implicitly sized to PCI_CAP_ID_MAX + 1 already, this
> doesn't make it any larger.

In linux-next it makes it larger.  But also explicitly using
PCI_CAP_ID_MAX + 1 is cleaner as well as fixing the bug in case we add
more elements later again.

regards,
dan carpenter

