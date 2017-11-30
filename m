From: Adrian Hunter <adrian.hunter@intel.com>
Date: Thu, 30 Nov 2017 11:45:10 +0000
Subject: Re: [PATCH] mmc: block: make function mmc_cqe_issue_type static
Message-Id: <969757e5-79e3-c12c-259f-9461b5a40f34@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171130113738.3851-1-colin.king@canonical.com>
In-Reply-To: <20171130113738.3851-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 30/11/17 13:37, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The function mmc_cqe_issue_type is local to the source and does
> not need to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> drivers/mmc/core/queue.c:62:21: warning: symbol 'mmc_cqe_issue_type'
> was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/core/queue.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
> index d8394007bc99..5db388081789 100644
> --- a/drivers/mmc/core/queue.c
> +++ b/drivers/mmc/core/queue.c
> @@ -59,8 +59,8 @@ static inline bool mmc_cqe_can_dcmd(struct mmc_host *host)
>  	return host->caps2 & MMC_CAP2_CQE_DCMD;
>  }
>  
> -enum mmc_issue_type mmc_cqe_issue_type(struct mmc_host *host,
> -				       struct request *req)
> +static enum mmc_issue_type mmc_cqe_issue_type(struct mmc_host *host,
> +					      struct request *req)
>  {
>  	switch (req_op(req)) {
>  	case REQ_OP_DRV_IN:
> 

