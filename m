From: walter harms <wharms@bfs.de>
Date: Wed, 14 Aug 2019 07:17:15 +0000
Subject: Re: [PATCH] scsi: mvumi: fix 32 bit shift of a u32 value
Message-Id: <5D53B57B.3000905@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190813180113.14245-1-colin.king@canonical.com>
In-Reply-To: <20190813180113.14245-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jianyun Li <jyli@marvell.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



Am 13.08.2019 20:01, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the top 32 bits of a 64 bit address is being calculated
> by shifting a u32 twice by 16 bits and then being cast into a 64
> bit address.  Shifting a u32 twice by 16 bits always ends up with
> a zero.  Fix this by casting the u32 to a 64 bit address first
> and then shifting it 32 bits.
> 
> Addresses-Coverity: ("Operands don't affect result")
> Fixes: f0c568a478f0 ("[SCSI] mvumi: Add Marvell UMI driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/scsi/mvumi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
> index 8906aceda4c4..62df69f1e71e 100644
> --- a/drivers/scsi/mvumi.c
> +++ b/drivers/scsi/mvumi.c
> @@ -296,7 +296,7 @@ static void mvumi_delete_internal_cmd(struct mvumi_hba *mhba,
>  			sgd_getsz(mhba, m_sg, size);
>  
>  			phy_addr = (dma_addr_t) m_sg->baseaddr_l |
> -				(dma_addr_t) ((m_sg->baseaddr_h << 16) << 16);
> +				   (dma_addr_t) m_sg->baseaddr_h << 32;
>  

All the casts make it hard to read, i would propose an alternativ version:
phy_addr = m_sg->baseaddr_h;
phy_addr <<= 32;
phy_addr |= m_sg->baseaddr_l;

JM2C and totaly untested.

re,
 wh

>  			dma_free_coherent(&mhba->pdev->dev, size, cmd->data_buf,
>  								phy_addr);
