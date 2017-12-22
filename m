From: Kinglong Mee <kinglongmee@gmail.com>
Date: Fri, 22 Dec 2017 01:11:38 +0000
Subject: Re: [PATCH] nfsd: fix incorrect indentation on goto statement
Message-Id: <CAB6yy36XSS0p1sQw3UJqS-c9xZCzebARFtQTLBpnn75D82iMNg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171222003551.11110-1-colin.king@canonical.com>
In-Reply-To: <20171222003551.11110-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "J . Bruce Fields" <bfields@fieldses.org>, Jeff Layton <jlayton@kernel.org>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Dec 22, 2017 at 8:35 AM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The goto statement requires one more level of indentation, add it.

Those "break" in this switch need one more level too,
it's nice to add them in this patch.

thanks,
Kinglong Mee

>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/nfsd/nfs4state.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
> index b29b5a185a2c..3bb720a59b49 100644
> --- a/fs/nfsd/nfs4state.c
> +++ b/fs/nfsd/nfs4state.c
> @@ -6159,7 +6159,7 @@ nfsd4_lockt(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
>                 default:
>                         dprintk("NFSD: nfs4_lockt: bad lock type!\n");
>                         status = nfserr_inval;
> -               goto out;
> +                       goto out;
>         }
>
>         lo = find_lockowner_str(cstate->clp, &lockt->lt_owner);
> --
> 2.14.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
