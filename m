From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 16 May 2005 09:49:17 +0000
Subject: Re: [KJ] [PATCH] sound/pci/mixart/mixart.c : Use the DMA_32BIT_MASK
Message-Id: <20050516094917.GA3030@nuerscht.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15503048437225697=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050516085902.GE6103@rhum.iomeda.fr>
In-Reply-To: <20050516085902.GE6103@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============15503048437225697==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 16, 2005 at 10:59:02AM +0200, Christophe Lucas wrote:
> Use the DMA_32BIT_MASK constant from dma-mapping.h
> when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
> See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Christophe,

I've got some of these hanging around here and will send them
alltogether as soon as I'm sure I catched _all_. So it might be a waste of
your time when you work on the same thing.

Thanks, Tobias

--===============15503048437225697==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15503048437225697==--
