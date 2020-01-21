From: Olga Kornievskaia <aglo@umich.edu>
Date: Tue, 21 Jan 2020 21:56:31 +0000
Subject: Re: [PATCH] nfsd4: fix double free in nfsd4_do_async_copy()
Message-Id: <CAN-5tyEEPq6JX7mMRwX+7DTJJ3zy3-=SVqfqQyXvvbOQxqgDJQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200113132307.frp6ur5zhzolu5ys@kili.mountain>
In-Reply-To: <20200113132307.frp6ur5zhzolu5ys@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "J. Bruce Fields" <bfields@redhat.com>
Cc: Olga Kornievskaia <kolga@netapp.com>, Chuck Lever <chuck.lever@oracle.com>, linux-nfs <linux-nfs@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Jan 13, 2020 at 8:24 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This frees "copy->nf_src" before and again after the goto.
>
> Fixes: ce0887ac96d3 ("NFSD add nfs4 inter ssc to nfsd4_copy")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/nfsd/nfs4proc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/fs/nfsd/nfs4proc.c b/fs/nfsd/nfs4proc.c
> index 1e14b3ed5674..c90c24c35b2e 100644
> --- a/fs/nfsd/nfs4proc.c
> +++ b/fs/nfsd/nfs4proc.c
> @@ -1469,7 +1469,6 @@ static int nfsd4_do_async_copy(void *data)
>                 copy->nf_src->nf_file = nfs42_ssc_open(copy->ss_mnt, &copy->c_fh,
>                                               &copy->stateid);
>                 if (IS_ERR(copy->nf_src->nf_file)) {
> -                       kfree(copy->nf_src);
>                         copy->nfserr = nfserr_offload_denied;
>                         nfsd4_interssc_disconnect(copy->ss_mnt);
>                         goto do_callback;
> --
> 2.11.0
>

Reviewed-by: Olga Kornievskaia <kolga@netapp.com>

Bruce, can you add this to your nfsd-next?
