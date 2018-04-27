From: Martin KaFai Lau <kafai@fb.com>
Date: Fri, 27 Apr 2018 17:20:25 +0000
Subject: Re: [PATCH 2/2] bpf: btf: remove a couple conditions
Message-Id: <20180427172023.6japncdd3nbqauzn@kafai-mbp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180427140459.GB19583@mwanda>
In-Reply-To: <20180427140459.GB19583@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Apr 27, 2018 at 05:04:59PM +0300, Dan Carpenter wrote:
> We know "err" is zero so we can remove these and pull the code in one
> indent level.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Thanks for the simplification!

Acked-by: Martin KaFai Lau <kafai@fb.com>

> ---
> This applies to the BPF tree (linux-next)
> 
> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> index e631b6fd60d3..7cb0905f37c2 100644
> --- a/kernel/bpf/btf.c
> +++ b/kernel/bpf/btf.c
> @@ -1973,16 +1973,14 @@ static struct btf *btf_parse(void __user *btf_data, u32 btf_data_size,
>  	if (err)
>  		goto errout;
>  
> -	if (!err && log->level && bpf_verifier_log_full(log)) {
> +	if (log->level && bpf_verifier_log_full(log)) {
>  		err = -ENOSPC;
>  		goto errout;
>  	}
>  
> -	if (!err) {
> -		btf_verifier_env_free(env);
> -		btf_get(btf);
> -		return btf;
> -	}
> +	btf_verifier_env_free(env);
> +	btf_get(btf);
> +	return btf;
>  
>  errout:
>  	btf_verifier_env_free(env);
