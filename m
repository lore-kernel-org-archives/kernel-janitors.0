From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Aug 2020 19:30:12 +0000
Subject: Re: [PATCH][V3] of/address: check for invalid range.cpu_addr
Message-Id: <20200817193012.GA1405869@bogus>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200817113208.523805-1-colin.king@canonical.com>
In-Reply-To: <20200817113208.523805-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 17 Aug 2020 12:32:08 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently invalid CPU addresses are not being sanity checked resulting in
> SATA setup failure on a SynQuacer SC2A11 development machine. The original
> check was removed by and earlier commit, so add a sanity check back in
> to avoid this regression.
> 
> Fixes: 7a8b64d17e35 ("of/address: use range parser for of_dma_get_range")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: print message using pr_err and don't print range.cpu_addr as it's always
>     going to be OF_BAD_ADDR so the information is pointless.
> V3: print the bus address to help diagnose issues
> 
> ---
>  drivers/of/address.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Applied, thanks!
