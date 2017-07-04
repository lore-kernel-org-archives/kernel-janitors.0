From: Daniel Borkmann <daniel@iogearbox.net>
Date: Tue, 04 Jul 2017 15:26:39 +0000
Subject: Re: [PATCH][bpf-next] bpf: add missing break in for the TCP_BPF_SNDCWND_CLAMP case
Message-Id: <595BB3AF.3000304@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170704152112.18623-1-colin.king@canonical.com>
In-Reply-To: <20170704152112.18623-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alexei Starovoitov <ast@kernel.org>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lawrence Brakmo <brakmo@fb.com>

[ +Lawrence ]

On 07/04/2017 05:21 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There appears to be a missing break in the TCP_BPF_SNDCWND_CLAMP case.
> Currently the non-error path where val is greater than zero falls through
> to the default case that sets the error return to -EINVAL. Add in
> the missing break.
>
> Detected by CoverityScan, CID#1449376 ("Missing break in switch")
>
> Fixes: 13bf96411ad2 ("bpf: Adds support for setting sndcwnd clamp")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Daniel Borkmann <daniel@iogearbox.net>

> ---
>   net/core/filter.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 94169572d002..c7f737058d89 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -2867,6 +2867,7 @@ BPF_CALL_5(bpf_setsockopt, struct bpf_sock_ops_kern *, bpf_sock,
>   					tp->snd_cwnd_clamp = val;
>   					tp->snd_ssthresh = val;
>   				}
> +				break;
>   			default:
>   				ret = -EINVAL;
>   			}
>

