From: Christoph Hellwig <hch@lst.de>
Date: Wed, 20 Nov 2019 10:43:57 +0000
Subject: Re: [PATCH] dma-debug: clean up put_hash_bucket()
Message-Id: <20191120104357.GA3800@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119061819.k6754frfv2wj7swd@kili.mountain>
In-Reply-To: <20191119061819.k6754frfv2wj7swd@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Nov 19, 2019 at 09:18:19AM +0300, Dan Carpenter wrote:
> The put_hash_bucket() is a bit cleaner if it takes an unsigned long
> directly instead of a pointer to unsigned long.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks reasonable to me, I'll apply it to the dma-mapping tree fo 5.5.
