From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 15 Mar 2005 12:40:49 +0000
Subject: Re: [KJ] [PATCH] drivers/scsi/lasi700.c: Use the DMA_32BIT_MASK
Message-Id: <20050315124049.GB21986@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============019982264604903044=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050314200647.GC1887@neon>
In-Reply-To: <20050314200647.GC1887@neon>
To: kernel-janitors@vger.kernel.org

--===============019982264604903044==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 14, 2005 at 09:06:47PM +0100, Tobias Klauser wrote:
> Description: Use the DMA_32BIT_MASK constants from dma-mapping.h
> when calling dma_set_mask().

Thanks, committed to the parisc tree and will be merged shortly.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============019982264604903044==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============019982264604903044==--
