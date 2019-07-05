From: Vinod Koul <vkoul@kernel.org>
Date: Fri, 05 Jul 2019 07:28:46 +0000
Subject: Re: [PATCH] dmaengine: jz4780: Fix an endian bug in IRQ handler
Message-Id: <20190705071646.GZ2911@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190624134940.GC1754@mwanda>
In-Reply-To: <20190624134940.GC1754@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Paul Cercueil <paul@crapouillou.net>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

On 24-06-19, 16:49, Dan Carpenter wrote:
> The "pending" variable was a u32 but we cast it to an unsigned long
> pointer when we do the for_each_set_bit() loop.  The problem is that on
> big endian 64bit systems that results in an out of bounds read.

Applied, thanks

-- 
~Vinod
