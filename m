From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 08 Mar 2005 15:41:53 +0000
Subject: Re: [KJ] [PATCH] drivers/message/fusion/mptbase.c: Use the DMA_{64,
Message-Id: <20050308154153.GM28741@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74942504695873069=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050308144558.GF5311@localhost.localdomain>
In-Reply-To: <20050308144558.GF5311@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============74942504695873069==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 08, 2005 at 03:45:58PM +0100, Tobias Klauser wrote:
> Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
> when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
> See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

You missed this line:

        u64              mask = 0xffffffffffffffffULL;

In fact, looks to me like you can remove the variable and just use the
DMA_64BIT_MASK constant.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============74942504695873069==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74942504695873069==--
