From: Ralf Baechle <ralf@linux-mips.org>
Date: Wed, 13 Apr 2005 13:36:27 +0000
Subject: [KJ] Re: [PATCH] net/ioc3-eth: Use the DMA_{32,
Message-Id: <20050413133627.GI5253@linux-mips.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3751384776707436=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050413133147.GA9864@argon.tklauser.home>
In-Reply-To: <20050413133147.GA9864@argon.tklauser.home>
To: Tobias Klauser <tklauser@nuerscht.ch>
Cc: kernel-janitors@lists.osdl.org, linux-mips@linux-mips.org

--===============3751384776707436==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 13, 2005 at 03:31:52PM +0200, Tobias Klauser wrote:

> Use the DMA_{32,64}BIT_MASK constants from dma-mapping.h when calling
> pci_set_dma_mask() or pci_set_consistent_dma_mask()
> This patch includes dma-mapping.h explicitly because patches caused
> errors on some architectures otherwise.
> See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details
> 
> Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

Looks good,

  Ralf

--===============3751384776707436==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3751384776707436==--
