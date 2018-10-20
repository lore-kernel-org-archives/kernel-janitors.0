From: Or Gerlitz <gerlitz.or@gmail.com>
Date: Sat, 20 Oct 2018 20:37:22 +0000
Subject: Re: [PATCH] net/mlx5: allocate enough space in
Message-Id: <CAJ3xEMhwcYYDWWLropG95T6TyE62OfJS+oPAFDZKLOVJSurNRQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181019200638.dea3r4uocbij6d6j@kili.mountain>
In-Reply-To: <20181019200638.dea3r4uocbij6d6j@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Saeed Mahameed <saeedm@mellanox.com>, Paul Blakey <paulb@mellanox.com>, kernel-janitors@vger.kernel.org, Linux Netdev List <netdev@vger.kernel.org>, Leon Romanovsky <leonro@mellanox.com>

On Fri, Oct 19, 2018 at 11:08 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> FDB_MAX_CHAIN is 3.  We wanted to allocate enough memory to hold four
> structs but there are missing parentheses so we only allocate enough
> memory for three structs and the first byte of the fourth one.

yeah, seems that we were wrong here and the fix is correct, at some
point I saw Kasan
screams but it was gone later, let me look, thanks for pointing it out.



> Fixes: 328edb499f99 ("net/mlx5: Split FDB fast path prio to multiple namespaces")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/fs_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c b/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c
> index 67ba4c975d81..9d73eb955f75 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c
> @@ -2470,7 +2470,7 @@ static int init_fdb_root_ns(struct mlx5_flow_steering *steering)
>                 return -ENOMEM;
>
>         steering->fdb_sub_ns = kzalloc(sizeof(steering->fdb_sub_ns) *
> -                                      FDB_MAX_CHAIN + 1, GFP_KERNEL);
> +                                      (FDB_MAX_CHAIN + 1), GFP_KERNEL);
>         if (!steering->fdb_sub_ns)
>                 return -ENOMEM;
>
> --
> 2.11.0
>
