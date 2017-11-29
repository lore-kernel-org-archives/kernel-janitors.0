From: Vinod Koul <vinod.koul@intel.com>
Date: Wed, 29 Nov 2017 14:28:35 +0000
Subject: Re: [PATCH] dmaengine: ioat: Fix error handling path
Message-Id: <20171129141634.GI32417@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171117213753.21050-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20171117213753.21050-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: dan.j.williams@intel.com, dave.jiang@intel.com, bianpan2016@163.com, arvind.yadav.cs@gmail.com, kjlx@templeofstupid.com, geliangtang@gmail.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Nov 17, 2017 at 10:37:53PM +0100, Christophe JAILLET wrote:
> If the last test in 'ioat_dma_self_test()' fails, we must release all
> the allocated resources and not just part of them.

Applied, thanks

-- 
~Vinod
