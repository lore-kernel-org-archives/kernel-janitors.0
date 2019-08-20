From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
Date: Tue, 20 Aug 2019 07:28:26 +0000
Subject: Re: [PATCH -next] bpf: Use PTR_ERR_OR_ZERO in xsk_map_inc()
Message-Id: <93fafdab-8fb3-0f2b-8f36-0cf297db3cd9@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190820013652.147041-1-yuehaibing@huawei.com>
In-Reply-To: <20190820013652.147041-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: YueHaibing <yuehaibing@huawei.com>, magnus.karlsson@intel.com, jonathan.lemon@gmail.com, ast@kernel.org, daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2019-08-20 03:36, YueHaibing wrote:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   kernel/bpf/xskmap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/bpf/xskmap.c b/kernel/bpf/xskmap.c
> index 4cc28e226398..942c662e2eed 100644
> --- a/kernel/bpf/xskmap.c
> +++ b/kernel/bpf/xskmap.c
> @@ -21,7 +21,7 @@ int xsk_map_inc(struct xsk_map *map)
>   	struct bpf_map *m = &map->map;
>   
>   	m = bpf_map_inc(m, false);
> -	return IS_ERR(m) ? PTR_ERR(m) : 0;
> +	return PTR_ERR_OR_ZERO(m);
>   }
>   
>   void xsk_map_put(struct xsk_map *map)
>

Acked-by: Björn Töpel <bjorn.topel@intel.com>

Thanks for the patch!

For future patches: Prefix AF_XDP socket work with "xsk:" and use "PATCH
bpf-next" to let the developers know what tree you're aiming for.



Cheers!
Björn


> 
> 
