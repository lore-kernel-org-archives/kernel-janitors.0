From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 16 May 2005 09:08:16 +0000
Subject: [KJ] [REJECT] : [PATCH] sound/oss/cmpci.c : Use the DMA_32BIT_MASK
Message-Id: <20050516090815.GF6103@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88221750772837071=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============88221750772837071==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Christophe Lucas (clucas@rotomalug.org) wrote:
> Use the DMA_32BIT_MASK constant from dma-mapping.h
> when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
> See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details
> 
> Signed-off-by: Christophe Lucas <clucas@rotomalug.org>
> 

Wow !! Sorry I must be drunk on this monday morning.
Sorry Tobias, you have already send this patch here.

Have a nice day,


	~Christophe


--===============88221750772837071==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88221750772837071==--
