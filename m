From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
Date: Mon, 25 May 2020 14:42:09 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust entry in XDP SOCKETS to actual file name
Message-Id: <9d930e0e-5c77-11b8-6a8b-982fac711f6d@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200525141553.7035-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200525141553.7035-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>, Maxim Mikityanskiy <maximmi@mellanox.com>, maciej.fijalkowski@intel.com, Alexei Starovoitov <ast@kernel.org>, bpf@vger.kernel.org
Cc: netdev@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2020-05-25 16:15, Lukas Bulwahn wrote:
> Commit 2b43470add8c ("xsk: Introduce AF_XDP buffer allocation API") added a
> new header file include/net/xsk_buff_pool.h, but commit 28bee21dc04b
> ("MAINTAINERS, xsk: Update AF_XDP section after moves/adds") added a file
> entry referring to include/net/xsk_buffer_pool.h.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>    warning: no file matches  F:  include/net/xsk_buffer_pool.h
> 
> Adjust the entry in XDP SOCKETS to the actual file name.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Björn, please pick this minor non-urgent patch.
> 
> applies to next-20200525 on top of the commits mentioned above
>

Thanks Lukas!

Daniel/Alexei, this should go to the bpf-next tree.


Thanks!
Björn


>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a442b48f24b..895c5202fe9b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18667,7 +18667,7 @@ L:	netdev@vger.kernel.org
>   L:	bpf@vger.kernel.org
>   S:	Maintained
>   F:	include/net/xdp_sock*
> -F:	include/net/xsk_buffer_pool.h
> +F:	include/net/xsk_buff_pool.h
>   F:	include/uapi/linux/if_xdp.h
>   F:	net/xdp/
>   F:	samples/bpf/xdpsock*
> 
