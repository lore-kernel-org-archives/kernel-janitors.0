From: Ilya Dryomov <idryomov@gmail.com>
Date: Tue, 02 Feb 2021 12:35:35 +0000
Subject: Re: [PATCH] ceph: Fix an Oops in error handling
Message-Id: <CAOi1vP_GSHBFwDeuAatpTbuJM90ootzZ31-oK1FKKM93JOmf_g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YBjne8A1gn0mvQtT@mwanda>
In-Reply-To: <YBjne8A1gn0mvQtT@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jeff Layton <jlayton@kernel.org>, Ceph Development <ceph-devel@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Feb 2, 2021 at 6:47 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "req" pointer is an error pointer and not NULL so this check needs
> to be fixed.
>
> Fixes: 1cf7fdf52d5a ("ceph: convert readpage to fscache read helper")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/ceph/addr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index 5eec6f66fe52..fb0238a4d34f 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -273,7 +273,7 @@ static void ceph_netfs_issue_op(struct netfs_read_subrequest *subreq)
>         if (err)
>                 iput(inode);
>  out:
> -       if (req)
> +       if (!IS_ERR_OR_NULL(req))
>                 ceph_osdc_put_request(req);
>         if (err)
>                 netfs_subreq_terminated(subreq, err);

Hi Dan,

I think a better fix would be to set req to NULL in the offending
IS_ERR branch since ceph_osdc_new_request() never returns NULL or
use two separate goto labels.

While at it, the initialization of req and the check on req before
calling ceph_osdc_put_request() are redundant.

Thanks,

                Ilya
