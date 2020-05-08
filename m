From: Joerg Roedel <joro@8bytes.org>
Date: Fri, 08 May 2020 15:31:49 +0000
Subject: Re: [PATCH] iommu/virtio: reverse arguments to list_add
Message-Id: <20200508153149.GA10908@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1588704467-13431-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1588704467-13431-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: eugene.volanschi@inria.fr, Jean-Philippe Brucker <jean-philippe@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org

On Tue, May 05, 2020 at 08:47:47PM +0200, Julia Lawall wrote:
> Elsewhere in the file, there is a list_for_each_entry with
> &vdev->resv_regions as the second argument, suggesting that
> &vdev->resv_regions is the list head.  So exchange the
> arguments on the list_add call to put the list head in the
> second argument.
> 
> Fixes: 2a5a31487445 ("iommu/virtio: Add probe request")
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied for v5.7, thanks.
