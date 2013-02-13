From: Joerg Roedel <joro@8bytes.org>
Date: Wed, 13 Feb 2013 11:13:57 +0000
Subject: Re: [PATCH 2/5] iommu: remove redundant NULL check before dma_ops_domain_free().
Message-Id: <20130213111357.GD25591@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1360641713-24895-1-git-send-email-tipecaml@gmail.com>
	<1360641713-24895-3-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1360641713-24895-3-git-send-email-tipecaml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyril Roelandt <tipecaml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Feb 12, 2013 at 05:01:50AM +0100, Cyril Roelandt wrote:
> dma_ops_domain_free on a NULL pointer is a no-op, so the NULL check in
> amd_iommu_init_dma_ops() can be removed.
> 
> Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
> ---
>  drivers/iommu/amd_iommu.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to x86/amd, Thanks.


