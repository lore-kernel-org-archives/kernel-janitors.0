From: Christoph Hellwig <hch@lst.de>
Date: Wed, 25 Nov 2020 18:29:28 +0000
Subject: Re: [PATCH] dma-mapping: fix an uninitialized pointer read due to typo in argp assignment
Message-Id: <20201125182928.GA10377@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201125135535.1880307-1-colin.king@canonical.com>
 <1b430a80dec14cb9aa612ff7e5dddac4@hisilicon.com>
In-Reply-To: <1b430a80dec14cb9aa612ff7e5dddac4@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, Colin King <colin.king@canonical.com>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>

Ooops, that was my edit.  I'll make sure to fold the fix into the
original commit.
