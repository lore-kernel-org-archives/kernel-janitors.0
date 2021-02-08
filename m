From: Joerg Roedel <joro@8bytes.org>
Date: Mon, 08 Feb 2021 08:13:01 +0000
Subject: Re: [PATCH] MAINTAINERS: repair file pattern in MEDIATEK IOMMU DRIVER
Message-Id: <20210208081301.GB7302@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210208061025.29198-1-lukas.bulwahn@gmail.com>
 <1612766125.19482.3.camel@mhfsdcap03>
In-Reply-To: <1612766125.19482.3.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yong Wu <yong.wu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org, Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Will Deacon <will@kernel.org>

On Mon, Feb 08, 2021 at 02:35:25PM +0800, Yong Wu wrote:
> On Mon, 2021-02-08 at 07:10 +0100, Lukas Bulwahn wrote:
> > Commit 6af4873852c4 ("MAINTAINERS: Add entry for MediaTek IOMMU") mentions
> > the pattern 'drivers/iommu/mtk-iommu*', but the files are actually named
> > with an underscore, not with a hyphen.
> > 
> > Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> > 
> >   warning: no file matches  F:    drivers/iommu/mtk-iommu*
> > 
> > Repair this minor typo in the file pattern.
> > 
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > applies cleanly on next-20210205
> > 
> > Yong, please ack.
> 
> +Joerg.
> 
> sorry for the typo.
> 
> Acked-by: Yong Wu <yong.wu@mediatek.com>

Applied, thanks.
