From: Greg KH <greg@kroah.com>
Date: Wed, 29 Sep 2004 21:11:35 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2-mm4 bttv-driver.c][4/8]
Message-Id: <20040929211135.GA24407@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66837600364161087=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <15470000.1096491322@w-hlinder.beaverton.ibm.com> <20040929220344.A17872@infradead.org>
In-Reply-To: <20040929220344.A17872@infradead.org>
To: Christoph Hellwig <hch@infradead.org>, Hanna Linder <hannal@us.ibm.com>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, kraxel@bytesex.org

--===============66837600364161087==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 29, 2004 at 10:03:44PM +0100, Christoph Hellwig wrote:
> On Wed, Sep 29, 2004 at 01:55:22PM -0700, Hanna Linder wrote:
> > 
> > As pci_find_device is going away need to replace it. This file did not use the dev returned
> > from pci_find_device so is replaceable by pci_dev_present. I was not able to test it
> > as I do not have the hardware.
> 
> I think this check should just go away completely.  

Good point.  Especially as pci_module_init() can never return -ENODEV
anymore :)

Hanna, care to respin this patch?

thanks,

greg k-h

--===============66837600364161087==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66837600364161087==--
