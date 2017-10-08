From: Vinod Koul <vinod.koul@intel.com>
Date: Sun, 08 Oct 2017 10:59:28 +0000
Subject: Re: [PATCH] dmaengine: stm32-dmamux: Fix a NULL vs IS_ERR() check in probe
Message-Id: <20171008104727.GM30097@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171003105450.nll2ogf44l3eq4ge@mwanda>
In-Reply-To: <20171003105450.nll2ogf44l3eq4ge@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Oct 03, 2017 at 01:54:50PM +0300, Dan Carpenter wrote:
> devm_ioremap_resource() doesn't return NULL, it returns error pointers.

Applied, thanks

-- 
~Vinod
