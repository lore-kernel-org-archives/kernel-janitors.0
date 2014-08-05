From: Jens Axboe <axboe@kernel.dk>
Date: Tue, 05 Aug 2014 19:13:38 +0000
Subject: Re: [patch] partitions: aix.c: off by one bug
Message-Id: <53E12CE2.7080305@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140805080959.GA13605@mwanda>
In-Reply-To: <20140805080959.GA13605@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Philippe De Muyter <phdm@macqel.be>
Cc: Fabian Frederick <fabf@skynet.be>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/05/2014 02:09 AM, Dan Carpenter wrote:
> The lvip[] array has "state->limit" elements so the condition here
> should be >= instead of >.
> 
> Fixes: 6ceea22bbbc8 ('partitions: add aix lvm partition support files')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/block/partitions/aix.c b/block/partitions/aix.c
> index 0a6ed54..f3ed7b2 100644
> --- a/block/partitions/aix.c
> +++ b/block/partitions/aix.c
> @@ -253,7 +253,7 @@ int aix_partition(struct parsed_partitions *state)
>  				continue;
>  			}
>  			lv_ix = be16_to_cpu(p->lv_ix) - 1;
> -			if (lv_ix > state->limit) {
> +			if (lv_ix >= state->limit) {
>  				cur_lv_ix = -1;
>  				continue;
>  			}
> 

Applied, thanks.

-- 
Jens Axboe

