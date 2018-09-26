From: Hans Holmberg <hans.ml.holmberg@owltronix.com>
Date: Wed, 26 Sep 2018 06:29:43 +0000
Subject: Re: [PATCH -next] lightnvm: pblk: fix error handling of pblk_lines_init()
Message-Id: <CANr-nt2AugGYaifCj7dbeZ+3b4A8JyxKjZZeQQ7yhXbnJVGhDQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537941384-25324-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1537941384-25324-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: Matias Bjorling <mb@lightnvm.io>, =?UTF-8?Q?Javier_Gonz=C3=A1lez?= <javier@javigon.com>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Sep 26, 2018 at 7:47 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> In the too many bad blocks error handling case, we should release all
> the alloced resources instead direct return, otherwise it will cause
> memory leak.
>
> Fixes: 2deeefc02dff ("lightnvm: pblk: fail gracefully on line alloc. failure")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/lightnvm/pblk-init.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/lightnvm/pblk-init.c b/drivers/lightnvm/pblk-init.c
> index 537e98f..a26f4e6 100644
> --- a/drivers/lightnvm/pblk-init.c
> +++ b/drivers/lightnvm/pblk-init.c
> @@ -1083,7 +1083,8 @@ static int pblk_lines_init(struct pblk *pblk)
>
>         if (!nr_free_chks) {
>                 pblk_err(pblk, "too many bad blocks prevent for sane instance\n");
> -               return -EINTR;
> +               ret = -EINTR;
> +               goto fail_free_lines;
>         }
>
>         pblk_set_provision(pblk, nr_free_chks);
>

Looks good to me.

Reviewed-by: Hans Holmberg <hans.holmberg@cnexlabs.com>
