From: Greg KH <greg@kroah.com>
Date: Thu, 23 Sep 2004 22:50:35 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2-mm2] Create new function to
Message-Id: <20040923225035.GB14274@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58383362454055243=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <2480000.1095978400@w-hlinder.beaverton.ibm.com>
In-Reply-To: <2480000.1095978400@w-hlinder.beaverton.ibm.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, davej@codemonkey.org.uk, hpa@zytor.com

--===============58383362454055243==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 23, 2004 at 03:26:40PM -0700, Hanna Linder wrote:
> + * @from: Previous PCI device found in search, or %NULL for new search.

from is not needed in a function like this.  Just vendor and device
should work.

> +static inline int pci_dev_present(unsigned int vendor, unsigned int device, struct pci_dev *from)
> +{return -1; }
> +

This should return 0, not -1.

Care to redo your patches based on this?

thanks,

greg k-h

--===============58383362454055243==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58383362454055243==--
