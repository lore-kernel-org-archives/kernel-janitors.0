From: Greg KH <greg@kroah.com>
Date: Thu, 14 Oct 2004 22:43:53 +0000
Subject: Re: [KJ] [Patch 2.6] resend of macro to go through all pci devices
Message-Id: <20041014224353.GA14644@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32864586395288908=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <250830000.1097787576@w-hlinder.beaverton.ibm.com>
In-Reply-To: <250830000.1097787576@w-hlinder.beaverton.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============32864586395288908==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 14, 2004 at 10:10:54PM +0100, Matthew Wilcox wrote:
> On Thu, Oct 14, 2004 at 01:59:36PM -0700, Hanna Linder wrote:
> > I wrote this macro last week and was recently asked to resend it in case people
> > missed the original submission. I have been using it during my conversion to
> > pci_get_device and it seems to be fine.
> 
> Why not:
> 
> #define for_each_pci_dev(d, v, p) while ((d = pci_get_device(v, p, d)) != NULL)
> 
> That seems more generally useful to me.

Would it be useful for places in the code today?  I mostly see the
PCI_ANY, PCI_ANY usages.  We really don't want to encourage the use of
this macro at all, so we shouldn't make it too useful :)

thanks,

greg k-h

--===============32864586395288908==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32864586395288908==--
