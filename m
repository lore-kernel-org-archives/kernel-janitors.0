From: Matthew Wilcox <matthew@wil.cx>
Date: Sat, 09 Oct 2004 18:18:59 +0000
Subject: Re: [KJ] [RFT 2.6] pci-gart.c replace pci_find_device with
Message-Id: <20041009181859.GW16153@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68456127467026096=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <87680000.1097276112@w-hlinder.beaverton.ibm.com> <1097342134.3903.14.camel@sfeldma-mobl2.dsl-verizon.net>
In-Reply-To: <1097342134.3903.14.camel@sfeldma-mobl2.dsl-verizon.net>
To: Scott Feldman <sfeldma@pobox.com>
Cc: Hanna Linder <hannal@us.ibm.com>, kernel-janitors <kernel-janitors@lists.osdl.org>, ak@suse.de, lkml <linux-kernel@vger.kernel.org>, greg@kroah.com

--===============68456127467026096==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 09, 2004 at 10:15:34AM -0700, Scott Feldman wrote:
> On Fri, 2004-10-08 at 15:55, Hanna Linder wrote:
> > @@ -81,7 +81,7 @@ static u32 gart_unmapped_entry; 
> >  
> >  #define for_all_nb(dev) \
> >  	dev = NULL;	\
> > -	while ((dev = pci_find_device(PCI_VENDOR_ID_AMD, 0x1103, dev))!=NULL)\
> > +	while ((dev = pci_get_device(PCI_VENDOR_ID_AMD, 0x1103, dev))!=NULL)\
> >  	     if (dev->bus->number == 0 && 				     \
> >  		    (PCI_SLOT(dev->devfn) >= 24) && (PCI_SLOT(dev->devfn) <= 31))
> 
> for_each_pci_dev?

for_each_pci_dev() doesn't take a VENDOR/DEVICE ID pair.
I think this is a mistake.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============68456127467026096==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68456127467026096==--
