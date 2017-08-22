From: David Daney <ddaney@caviumnetworks.com>
Date: Tue, 22 Aug 2017 22:29:15 +0000
Subject: Re: [PATCH][next] MIPS,bpf: fix missing break in switch statement
Message-Id: <93479b06-c3a2-a08a-fe5c-d8f155efeacc@caviumnetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170822220349.5648-1-colin.king@canonical.com>
In-Reply-To: <20170822220349.5648-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, "David S . Miller" <davem@davemloft.net>, Daniel Borkmann <daniel@iogearbox.net>, linux-mips@linux-mips.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/22/2017 03:03 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a missing break causing a fall-through and setting
> ctx.use_bbit_insns to the wrong value. Fix this by adding the
> missing break.
> 
> Detected with cppcheck:
> "Variable 'ctx.use_bbit_insns' is reassigned a value before the old
> one has been used. 'break;' missing?"
> 
> Fixes: 8d8d18c3283f ("MIPS,bpf: Fix using smp_processor_id() in preemptible splat.")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Crap!  That slipped through.  Thanks for fixing it.

Tested and ...

Acked-by: David Daney <david.daney@cavium.com>

> ---
>   arch/mips/net/ebpf_jit.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/net/ebpf_jit.c b/arch/mips/net/ebpf_jit.c
> index 44ddc12cbb0e..7646891c4e9b 100644
> --- a/arch/mips/net/ebpf_jit.c
> +++ b/arch/mips/net/ebpf_jit.c
> @@ -1892,6 +1892,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>   	case CPU_CAVIUM_OCTEON2:
>   	case CPU_CAVIUM_OCTEON3:
>   		ctx.use_bbit_insns = 1;
> +		break;
>   	default:
>   		ctx.use_bbit_insns = 0;
>   	}
> 

