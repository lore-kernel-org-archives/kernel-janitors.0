From: Greg KH <greg@kroah.com>
Date: Fri, 24 Sep 2004 21:19:12 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2-mm2] Create new function to
Message-Id: <20040924211912.GC7619@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16154881158217838=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <2480000.1095978400@w-hlinder.beaverton.ibm.com> <20040924200231.A30391@infradead.org>
In-Reply-To: <20040924200231.A30391@infradead.org>
To: Christoph Hellwig <hch@infradead.org>, Hanna Linder <hannal@us.ibm.com>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, davej@codemonkey.org.uk, hpa@zytor.com

--===============16154881158217838==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 24, 2004 at 08:02:31PM +0100, Christoph Hellwig wrote:
> On Thu, Sep 23, 2004 at 03:26:40PM -0700, Hanna Linder wrote:
> > 
> > Greg asked in a previous janitors thread:
> > "What we need is a simple "Is this pci device present right now" type
> > function, to solve the mess that logic like this needs."
> > 
> > OK. How about this one? It uses pci_get_device but instead of returning
> > the dev it returns 1 if the device is present and 0 if it isnt. This take the
> > burdon off the driver from having to know when to use pci_dev_put or
> > not and should be cleaner for future maintenance work.
> > 
> > Ive tested it with two patches that will follow.
> 
> Please include subdevice/subvendor id

Good idea, but do you see any places in the kernel that would use those
fields, instead of always setting them to PCI_ANY_ID?

thanks,

greg k-h

--===============16154881158217838==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16154881158217838==--
