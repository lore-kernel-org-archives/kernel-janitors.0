From: Song Liu <liu.song.a23@gmail.com>
Date: Wed, 30 May 2018 17:18:42 +0000
Subject: Re: [PATCH][next] bpf: devmap: remove redundant assignment of dev = dev
Message-Id: <CAPhsuW6oxA+PHN=eFp2fXJ+PJXw6vr72bCuRSaVxFaSecVC8Fw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180530150916.16808-1-colin.king@canonical.com>
In-Reply-To: <20180530150916.16808-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Networking <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>

On Wed, May 30, 2018 at 8:09 AM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The assignment dev = dev is redundant and should be removed.
>
> Detected by CoverityScan, CID#1469486 ("Evaluation order violation")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Song Liu <songliubraving@fb.com>

> ---
>  kernel/bpf/devmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
> index ae16d0c373ef..1fe3fe60508a 100644
> --- a/kernel/bpf/devmap.c
> +++ b/kernel/bpf/devmap.c
> @@ -352,7 +352,7 @@ int dev_map_enqueue(struct bpf_dtab_netdev *dst, struct xdp_buff *xdp,
>  static void *dev_map_lookup_elem(struct bpf_map *map, void *key)
>  {
>         struct bpf_dtab_netdev *obj = __dev_map_lookup_elem(map, *(u32 *)key);
> -       struct net_device *dev = dev = obj ? obj->dev : NULL;
> +       struct net_device *dev = obj ? obj->dev : NULL;
>
>         return dev ? &dev->ifindex : NULL;
>  }
> --
> 2.17.0
>
