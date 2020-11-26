From: Christoph Hellwig <hch@lst.de>
Date: Thu, 26 Nov 2020 17:06:57 +0000
Subject: Re: [PATCH] dma-mapping: Fix sizeof() mismatch on tsk allocation
Message-Id: <20201126170657.GA21791@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201125140523.1880669-1-colin.king@canonical.com>
 <a6c5e5ed9a66485da301c1e91b56ccc7@hisilicon.com>
 <20201125182941.GB10377@lst.de>
 <cf79f1ba-aeba-6237-81c8-ca7efc1425e2@canonical.com>
In-Reply-To: <cf79f1ba-aeba-6237-81c8-ca7efc1425e2@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>

On Wed, Nov 25, 2020 at 06:49:19PM +0000, Colin Ian King wrote:
> On 25/11/2020 18:29, Christoph Hellwig wrote:
> > I'll fold this one in as well.
> > 
> OK, so two SoB's disappear?

Yes, and are replaced by an annotation about folded fixes, just like
for all kinds of other commits.
