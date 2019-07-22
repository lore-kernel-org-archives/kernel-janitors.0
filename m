From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Date: Mon, 22 Jul 2019 06:55:11 +0000
Subject: Re: [PATCH] dlm: fix a typo
Message-Id: <e561b3e8-e3da-b81c-2b06-3be4fa3d1c61@metux.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190721104322.30019-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190721104322.30019-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, ccaulfie@redhat.com, teigland@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 21.07.19 12:43, Christophe JAILLET wrote:
> s/locksapce/lockspace
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   fs/dlm/lockspace.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
> index 00fa700f4e83..9c95df8a36e9 100644
> --- a/fs/dlm/lockspace.c
> +++ b/fs/dlm/lockspace.c
> @@ -870,7 +870,7 @@ static int release_lockspace(struct dlm_ls *ls, int force)
>    * until this returns.
>    *
>    * Force has 4 possible values:
> - * 0 - don't destroy locksapce if it has any LKBs
> + * 0 - don't destroy lockspace if it has any LKBs
>    * 1 - destroy lockspace if it has remote LKBs but not if it has local LKBs
>    * 2 - destroy lockspace regardless of LKBs
>    * 3 - destroy lockspace as part of a forced shutdown
> 

Reviewed-By: Enrico Weigelt <info@metux.net>


-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
