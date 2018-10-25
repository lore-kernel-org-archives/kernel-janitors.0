From: Sunil Kovvuri <sunil.kovvuri@gmail.com>
Date: Thu, 25 Oct 2018 04:30:19 +0000
Subject: Re: [PATCH] octeontx2-af: Use GFP_ATOMIC under spin lock
Message-Id: <CA+sq2CdzDfCRc9ZOG7hznm8pJOwozgVgFK-vnqq69VbB_percg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540431746-176759-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1540431746-176759-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>, Geetha sowjanya <gakula@marvell.com>, jerinj@marvell.com, Linux Netdev List <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Oct 25, 2018 at 7:02 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> The function nix_update_mce_list() is called from
> nix_update_bcast_mce_list(), and a spin lock is held
> here, so we should use GFP_ATOMIC instead.
>
> Fixes: 4b05528ebf0c ("octeontx2-af: Update bcast list upon NIXLF alloc/free")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
> index 8890c95..a618e48 100644
> --- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
> +++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
> @@ -1294,7 +1294,7 @@ static int nix_update_mce_list(struct nix_mce_list *mce_list,
>                 return 0;
>
>         /* Add a new one to the list, at the tail */
> -       mce = kzalloc(sizeof(*mce), GFP_KERNEL);
> +       mce = kzalloc(sizeof(*mce), GFP_ATOMIC);
>         if (!mce)
>                 return -ENOMEM;
>         mce->idx = idx;
>

Thanks for pointing this and for the patch.
FYI, this driver is no where near to complete, after net-next is open we will
start submitting rest of the patches. There is a subsequent patch
which changes most of the locks to mutex from spinlock, which will
fix this issue as well.

It would be great if above patch is ignored for now, as in it's
current state driver is
not complete and usable. Otherwise also fine, I will change change/fix
this again.

Regards,
Sunil.
