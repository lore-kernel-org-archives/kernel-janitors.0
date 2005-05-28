From: Dave Jones <davej@redhat.com>
Date: Sat, 28 May 2005 00:24:46 +0000
Subject: Re: [KJ] [PATCH] drivers/scsi/gdth.c Use the DMA_32BIT_MASK constant
Message-Id: <20050528002446.GC27693@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36811857150982874=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200505280316.51652.haris@mpa.gr>
In-Reply-To: <200505280316.51652.haris@mpa.gr>
To: kernel-janitors@vger.kernel.org

--===============36811857150982874==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 28, 2005 at 03:16:51AM +0300, Henry wrote:
 > -                if (!pci_set_dma_mask(pcistr[ctr].pdev, 0xffffffffffffffffULL)) {
 > +                if (!pci_set_dma_mask(pcistr[ctr].pdev, DMA_32BIT_MASK)) {

This should be DMA_64BIT_MASK

		Dave

--===============36811857150982874==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36811857150982874==--
