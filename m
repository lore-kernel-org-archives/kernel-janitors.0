From: Christophe Lucas <c.lucas@ifrance.com>
Date: Mon, 14 Feb 2005 15:50:21 +0000
Subject: Re: [KJ] [PATCH] drivers/char/watchdog/* : pci_request_regions
Message-Id: <20050214155021.GP20620@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============031058392561329695=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050214150111.GH20620@rhum.iomeda.fr>
In-Reply-To: <20050214150111.GH20620@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============031058392561329695==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Matthew Wilcox (matthew@wil.cx) wrote:
> On Mon, Feb 14, 2005 at 04:01:11PM +0100, Christophe Lucas wrote:
> > If PCI request regions fails, then someone else is using the
> > hardware we wish to use. For that one case, calling
> > pci_disable_device() is rather rude.
> > See : http://www.ussg.iu.edu/hypermail/linux/kernel/0502.1/1061.html
> 
> Actually, that isn't necessarily true.  If the request_regions call fails,
> that can mean there's a resource conflict.  If so, leaving the device
> enabled is the worst possible thing to do as we'll now have two devices
> trying to respond to the same io accesses.

Ok, if I understand this kj TODO entry is not trusted for now !?
Sorry, for CondingStyle, if it could help, I can resend these patch with
CodingStyle correction. I stop for now to send patches about this entry.

Have a good day.

	Christophe


--===============031058392561329695==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============031058392561329695==--
