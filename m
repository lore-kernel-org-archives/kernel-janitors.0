From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 29 Apr 2005 09:15:57 +0000
Subject: Re: [KJ] [PATCH] drivers/net/tlan.c : Use the DMA_{32|64}_MASK
Message-Id: <20050429091557.GI29054@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73887582702321208=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050422084319.GC31439@rhum.iomeda.fr>
In-Reply-To: <20050422084319.GC31439@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============73887582702321208==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Christophe Lucas (clucas@rotomalug.org) wrote:
> Description:
> Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h when calling
> pci_set_dma_mask() or pci_set_consistent_dma_mask() instead of custom
> macros.
> This patch includes dma-mapping.h explicitly because it caused errors
> on some architectures otherwise.
> See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details
> 
> 
> Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Sorry, this patch has already been send by Tobias.

	~Christophe


--===============73887582702321208==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73887582702321208==--
