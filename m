From: David Miller <davem@davemloft.net>
Date: Fri, 12 Apr 2019 23:54:59 +0000
Subject: Re: [PATCH] vxge: fix return of a free'd memblock on a failed dma mapping
Message-Id: <20190412.165459.691438507916310102.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190412134512.28164-1-colin.king@canonical.com>
In-Reply-To: <20190412134512.28164-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jdmason@kudzu.us, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 12 Apr 2019 14:45:12 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently if a pci dma mapping failure is detected a free'd
> memblock address is returned rather than a NULL (that indicates
> an error). Fix this by ensuring NULL is returned on this error case.
> 
> Addresses-Coverity: ("Use after free")
> Fixes: 528f727279ae ("vxge: code cleanup and reorganization")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
