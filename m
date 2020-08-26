From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 26 Aug 2020 18:22:32 +0000
Subject: Re: [PATCH] memory: omap-gpmc: Fix a couple off by ones
Message-Id: <20200826182232.GA11327@kozik-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200825104707.GB278587@mwanda>
In-Reply-To: <20200825104707.GB278587@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jon-hunter@ti.com>, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 25, 2020 at 01:47:07PM +0300, Dan Carpenter wrote:
> These comparisons should be >= instead of > to prevent reading one
> element beyond the end of the gpmc_cs[] array.
> 
> Fixes: cdd6928c589a ("ARM: OMAP2+: Add device-tree support for NOR flash")
> Fixes: f37e4580c409 ("ARM: OMAP2: Dynamic allocator for GPMC memory space")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/memory/omap-gpmc.c | 4 ++--

Thanks, applied.

Best regards,
Krzysztof
