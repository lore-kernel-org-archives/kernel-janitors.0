From: Sunil Kovvuri <sunil.kovvuri@gmail.com>
Date: Fri, 19 Oct 2018 13:48:46 +0000
Subject: Re: [PATCH net-next] octeontx2-af: Remove set but not used variable 'block'
Message-Id: <CA+sq2CekhmaVQddoy2T0e5B9KwG2=_8d+KVFavqfnJfAFSPs2A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539953488-191102-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539953488-191102-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>, Geetha sowjanya <gakula@marvell.com>, jerinj@marvell.com, "David S. Miller" <davem@davemloft.net>, Linux Netdev List <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Oct 19, 2018 at 6:11 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/net/ethernet/marvell/octeontx2/af/rvu_npa.c: In function 'rvu_npa_init':
> drivers/net/ethernet/marvell/octeontx2/af/rvu_npa.c:446:20: warning:
>  variable 'block' set but not used [-Wunused-but-set-variable]
>
> It never used since introduction in
> commit 7a37245ef23f ("octeontx2-af: NPA block admin queue init")
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/net/ethernet/marvell/octeontx2/af/rvu_npa.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_npa.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_npa.c
> index 0e43a69..7531fdc 100644
> --- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_npa.c
> +++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_npa.c
> @@ -443,15 +443,12 @@ static int npa_aq_init(struct rvu *rvu, struct rvu_block *block)
>  int rvu_npa_init(struct rvu *rvu)
>  {
>         struct rvu_hwinfo *hw = rvu->hw;
> -       struct rvu_block *block;
>         int blkaddr, err;
>
>         blkaddr = rvu_get_blkaddr(rvu, BLKTYPE_NPA, 0);
>         if (blkaddr < 0)
>                 return 0;
>
> -       block = &hw->block[blkaddr];
> -
>         /* Initialize admin queue */
>         err = npa_aq_init(rvu, &hw->block[blkaddr]);
>         if (err)
>

Thanks for the patch.
Which GCC version do you use ?
Before submitting patches I did test compiling specifically with these
"make  arch=X86 -j8 -Werror=unused-function -Wunused-but-set-variable"
but that didn't throw these warnings.

Thanks,
Sunil.
