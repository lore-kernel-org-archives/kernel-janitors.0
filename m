From: Stelian Pop <stelian@popies.net>
Date: Mon, 21 Mar 2005 16:01:38 +0000
Subject: [KJ] Re: [UPDATE PATCH] drivers/media/video/meye.c: Use the
Message-Id: <20050321160137.GB3677@crusoe.alcove-fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87807806313063397=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============87807806313063397==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 18, 2005 at 06:34:25PM +0100, Tobias Klauser wrote:

> Hi Stelian,
> 
> On Wed, Mar 16, 2005 at 05:49:06PM +0100, Stelian Pop wrote:
> > Thanks, applied to my tree. I will push it upstream later.
> 
> The previous patch does not compile cleanly on all architectures. Please
> use the attached one instead.
> 
> Use the DMA_32BIT_MASK constant from dma-mapping.h when calling
> pci_set_dma_mask() or pci_set_consistent_dma_mask()
> This patch includes dma-mapping.h explicitly because it caused errors
> on some architectures otherwise.
> See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details
> 

Thanks, I've replaced the previous patch with this one on my tree.

Stelian.
-- 
Stelian Pop <stelian@popies.net>

--===============87807806313063397==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87807806313063397==--
