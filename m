From: Jeff Garzik <jgarzik@pobox.com>
Date: Sun, 20 Feb 2005 17:39:16 +0000
Subject: [KJ] Re: [PATCH 04/19] drivers/scsi/ahci: Use the DMA_{64,
Message-Id: <20050220173916.GB5495@havoc.gtf.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39978285343666609=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050220165530.GD14375@helium.tklauser.home>
In-Reply-To: <20050220165530.GD14375@helium.tklauser.home>
To: Tobias Klauser <tklauser@nuerscht.ch>
Cc: kernel-janitors@lists.osdl.org, linux-scsi@vger.kernel.org

--===============39978285343666609==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 20, 2005 at 05:55:30PM +0100, Tobias Klauser wrote:
> Hello,
> 
> Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
> when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
> See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Please CC libata patches to (1) the person that maintains libata [me]
and (2) linux-ide@vger.kernel.org.

	Jeff




--===============39978285343666609==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39978285343666609==--
