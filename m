From: Ian Abbott <abbotti@mev.co.uk>
Date: Wed, 11 Jul 2018 17:15:55 +0000
Subject: Re: [PATCH] staging: comedi: remove redundant variable segpos
Message-Id: <e3dc8042-d3f4-791a-10a4-369bea691c38@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180711103229.30066-1-colin.king@canonical.com>
In-Reply-To: <20180711103229.30066-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, H Hartley Sweeten <hsweeten@visionengravers.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/07/18 11:32, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable segpos is being assigned but is never used hence it is redundant
> and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'segpos' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/staging/comedi/drivers/pcl816.c | 4 ++--
>   drivers/staging/comedi/drivers/pcl818.c | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)

Looks good, thanks!

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || Web: www.mev.co.uk )=-
-=( MEV Ltd. is a company registered in England & Wales. )=-
-=( Registered number: 02862268.  Registered address:    )=-
-=( 15 West Park Road, Bramhall, STOCKPORT, SK7 3JZ, UK. )=-
