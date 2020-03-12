From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Mar 2020 12:55:39 +0000
Subject: Re: [PATCH] iommu/vt-d: Unlock on error paths
Message-Id: <20200312125539.GG11561@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200312113730.GF20562@mwanda>
 <0f0dcaca-5c33-c78c-6d38-2bbae26cbff2@linux.intel.com>
In-Reply-To: <0f0dcaca-5c33-c78c-6d38-2bbae26cbff2@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, Megha Dey <megha.dey@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux-foundation.org

On Thu, Mar 12, 2020 at 08:02:41PM +0800, Lu Baolu wrote:
> On 2020/3/12 19:37, Dan Carpenter wrote:
> > There were a couple places where we need to unlock before returning.
> > 
> > Fixes: 91391b919e19 ("iommu/vt-d: Populate debugfs if IOMMUs are detected")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >   drivers/iommu/intel-iommu-debugfs.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/intel-iommu-debugfs.c b/drivers/iommu/intel-iommu-debugfs.c
> > index 8d24c4d85cc2..6a495b103972 100644
> > --- a/drivers/iommu/intel-iommu-debugfs.c
> > +++ b/drivers/iommu/intel-iommu-debugfs.c
> > @@ -289,11 +289,12 @@ static int dmar_translation_struct_show(struct seq_file *m, void *unused)
> >   		sts = dmar_readl(iommu->reg + DMAR_GSTS_REG);
> >   		if (!(sts & DMA_GSTS_TES)) {
> >   			seq_puts(m, "DMA Remapping is not enabled\n");
> > -			return 0;
> > +			goto unlock;
> >   		}
> >   		root_tbl_walk(m, iommu);
> >   		seq_putc(m, '\n');
> >   	}
> > +unlock:
> >   	rcu_read_unlock();
> >   	return 0;
> > @@ -444,7 +445,7 @@ static int ir_translation_struct_show(struct seq_file *m, void *unused)
> >   		sts = dmar_readl(iommu->reg + DMAR_GSTS_REG);
> >   		if (!(sts & DMA_GSTS_IRES)) {
> >   			seq_puts(m, "Interrupt Remapping is not enabled\n");
> > -			return 0;
> > +			goto unlock;
> >   		}
> >   		if (iommu->ir_table) {
> > @@ -475,6 +476,7 @@ static int ir_translation_struct_show(struct seq_file *m, void *unused)
> >   		}
> >   		seq_putc(m, '\n');
> >   	}
> > +unlock:
> >   	rcu_read_unlock();
> >   	return 0;
> > 
> 
> Thanks a lot for the catch. I think it could be further cleanup. How
> about below changes?

Obviously that solves the issues with forgetting to drop the lock but
I'm not qualified to comment on the rest.  (And I can't really review
it anyway because the patch was damaged in sending the email).

regards,
dan carepnter
