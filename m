From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 18 Feb 2019 14:24:08 +0000
Subject: Re: [PATCH] scsi: mvumi: fix 32 bit shift of a 32 bit unsigned int
Message-Id: <20190218142408.GQ2304@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190216144424.21438-1-colin.king@canonical.com>
In-Reply-To: <20190216144424.21438-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Feb 18, 2019 at 01:42:02PM +0100, Walter Harms wrote:
> Am 18.02.2019 10:37, schrieb Dan Carpenter:
> > On Sat, Feb 16, 2019 at 05:27:16PM +0100, Walter Harms wrote:
> >> Am 16.02.2019 15:44, schrieb Colin King:
> >>> From: Colin Ian King <colin.king@canonical.com>
> >>>
> >>> Currently m_sg->baseaddr_h (a 32 bit unsigned int) is being shifted by a
> >>> total of 32 bits; this always produces a 0 result.  Fix this by casting
> >>> it to a dma_addr_t (a 64 bit unsigned int) before performing the shift.
> >>>
> >>> Detected by CoverityScan, CID#147270 ("Operands don't affect result")
> >>>
> >>> Fixes: f0c568a478f0 ("[SCSI] mvumi: Add Marvell UMI driver")
> >>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >>> ---
> >>>  drivers/scsi/mvumi.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
> >>> index 36f64205ecfa..d3582accfd09 100644
> >>> --- a/drivers/scsi/mvumi.c
> >>> +++ b/drivers/scsi/mvumi.c
> >>> @@ -313,7 +313,7 @@ static void mvumi_delete_internal_cmd(struct mvumi_hba
> >>> *mhba,
> >>>  			sgd_getsz(mhba, m_sg, size);
> >>>  
> >>>  			phy_addr = (dma_addr_t) m_sg->baseaddr_l |
> >>> -				(dma_addr_t) ((m_sg->baseaddr_h << 16) << 16);
> >>> +				(((dma_addr_t) m_sg->baseaddr_h << 16) << 16);
> >>>  
> >>>  			dma_free_coherent(&mhba->pdev->dev, size, cmd->data_buf,
> >>>  								phy_addr);
> >>
> >> i would suggest to try a version with less casts to make it more readable
> >> like this untested suggestion:
> >>
> >> phy_addr =(m_sg->baseaddr_h << 16)| m_sg->baseaddr_l;
> >> phy_addr <<= 16;
> >>
> > 
> > That would be a behavior change but it also might be a bugfix?  Why
> > doesn't the code just do:
> > 
> > 	phy_addr = ((dma_addr_t)m_sg->baseaddr_h << 32) | m_sg->baseaddr_l;
> > 
> 
> phy_addr = ((dma_addr_t)m_sg->baseaddr_h << 32) | m_sg->baseaddr_l<<16;
                                                                    ^^^^
In the original code, we don't do this shift.

regards,
dan carpenter
