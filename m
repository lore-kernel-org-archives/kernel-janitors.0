From: Domen Puncer <domen@coderock.org>
Date: Wed, 24 Nov 2004 15:29:11 +0000
Subject: [KJ] [patch 2/8] ifdef typos: arch_ppc_syslib_ppc4xx_dma.c
Message-Id: <20041124152911.GB14789@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18530746097985951=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============18530746097985951==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

ppc4xx_dma.h defines PPC4xx_DMA_64BIT.

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/arch/ppc/syslib/ppc4xx_dma.c	2004-08-17 11:44:59.000000000 +0200
+++ str2/arch/ppc/syslib/ppc4xx_dma.c	2004-11-24 15:18:29.000000000 +0100
@@ -48,7 +48,7 @@ ppc4xx_set_src_addr(int dmanr, phys_addr
 		return;
 	}
 
-#ifdef PPC4xx_DMA64BIT
+#ifdef PPC4xx_DMA_64BIT
 	mtdcr(DCRN_DMASAH0 + dmanr*2, (u32)(src_addr >> 32));
 #else
 	mtdcr(DCRN_DMASA0 + dmanr*2, (u32)src_addr);
@@ -63,7 +63,7 @@ ppc4xx_set_dst_addr(int dmanr, phys_addr
 		return;
 	}
 
-#ifdef PPC4xx_DMA64BIT
+#ifdef PPC4xx_DMA_64BIT
 	mtdcr(DCRN_DMADAH0 + dmanr*2, (u32)(dst_addr >> 32));
 #else
 	mtdcr(DCRN_DMADA0 + dmanr*2, (u32)dst_addr);

--===============18530746097985951==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18530746097985951==--
