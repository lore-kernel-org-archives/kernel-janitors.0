From: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <mb@lightnvm.io>
Date: Mon, 20 Feb 2017 11:13:30 +0000
Subject: Re: [PATCH] lightnvm: Fix error handling
Message-Id: <19ff1456-8890-125c-d999-d0ceb04e2224@lightnvm.io>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170219140928.12968-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170219140928.12968-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 02/19/2017 03:09 PM, Christophe JAILLET wrote:
> According to error handling in this function, it is likely that going to
> 'out' was expected here.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/lightnvm/rrpc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/lightnvm/rrpc.c b/drivers/lightnvm/rrpc.c
> index e00b1d7b976f..e68efbcf1188 100644
> --- a/drivers/lightnvm/rrpc.c
> +++ b/drivers/lightnvm/rrpc.c
> @@ -1275,8 +1275,10 @@ static int rrpc_bb_discovery(struct nvm_tgt_dev *dev, struct rrpc_lun *rlun)
>  	}
>
>  	nr_blks = nvm_bb_tbl_fold(dev->parent, blks, nr_blks);
> -	if (nr_blks < 0)
> -		return nr_blks;
> +	if (nr_blks < 0) {
> +		ret = nr_blks;
> +		goto out;
> +	}
>
>  	for (i = 0; i < nr_blks; i++) {
>  		if (blks[i] = NVM_BLK_T_FREE)
>

Thanks Christophe. Applied for 4.12.
