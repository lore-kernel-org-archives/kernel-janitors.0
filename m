From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Thu, 03 Dec 2020 15:15:02 +0000
Subject: Re: [PATCH][next] samples/bpf: Fix spelling mistake "recieving" -> "receiving"
Message-Id: <CAJ+HfNiFcyqGYCNigs22k4=g_GQ_hJiZ=eE7f+hguOyN2ScdsA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201203114452.1060017-1-colin.king@canonical.com>
In-Reply-To: <20201203114452.1060017-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>
Cc: Mariusz Dudek <mariuszx.dudek@intel.com>, Andrii Nakryiko <andrii@kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>, Netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 3 Dec 2020 at 12:46, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in an error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Björn Töpel <bjorn.topel@intel.com>

> ---
>  samples/bpf/xdpsock_user.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/samples/bpf/xdpsock_user.c b/samples/bpf/xdpsock_user.c
> index 0fee7f3aef3c..9553c7c47fc4 100644
> --- a/samples/bpf/xdpsock_user.c
> +++ b/samples/bpf/xdpsock_user.c
> @@ -1570,7 +1570,7 @@ recv_xsks_map_fd(int *xsks_map_fd)
>
>         err = recv_xsks_map_fd_from_ctrl_node(sock, xsks_map_fd);
>         if (err) {
> -               fprintf(stderr, "Error %d recieving fd\n", err);
> +               fprintf(stderr, "Error %d receiving fd\n", err);
>                 return err;
>         }
>         return 0;
> --
> 2.29.2
>
