From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 04 Aug 2020 06:46:27 +0000
Subject: Re: [PATCH] memory: jz4780_nemc: Fix an error pointer vs NULL check in probe()
Message-Id: <20200804064627.GB10089@kozik-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200803143607.GC346925@mwanda>
In-Reply-To: <20200803143607.GC346925@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Aug 03, 2020 at 05:36:07PM +0300, Dan Carpenter wrote:
> The devm_ioremap() function returns NULL on error, it doesn't return
> error pointers.  This bug could lead to an Oops during probe.
> 
> Fixes: f046e4a3f0b9 ("memory: jz4780_nemc: Only request IO memory the driver will use")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/memory/jz4780-nemc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, good patch. The pull request with offending patch was merged
into arm-soc so I expect soon will be merged to Linus' tree. Therefore
I'll apply this after merge window to current fixes.

Best regards,
Krzysztof
