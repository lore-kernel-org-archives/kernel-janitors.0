From: Greg KH <greg@kroah.com>
Date: Mon, 14 Feb 2005 18:43:53 +0000
Subject: Re: [KJ] [PATCH 12/18] drivers/scsi/ remove pci_find_{device, subsys}
Message-Id: <20050214184353.GL7815@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============021603144525336626=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502141140.33642.amitg@calsoftinc.com>
In-Reply-To: <200502141140.33642.amitg@calsoftinc.com>
To: kernel-janitors@vger.kernel.org

--===============021603144525336626==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 06:26:37PM +0000, Matthew Wilcox wrote:
> On Mon, Feb 14, 2005 at 11:40:32AM +0530, Amit Gud wrote:
> > Remove deprecated pci_find_device and pci_find_subsys
> 
> Almost all of these drivers should be converted to use the pci_driver
> model, not converted like this mechanical substitution.

And the mechanical substitution is incorrect :(

greg k-h

--===============021603144525336626==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============021603144525336626==--
