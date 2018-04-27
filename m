From: Martin KaFai Lau <kafai@fb.com>
Date: Fri, 27 Apr 2018 17:18:05 +0000
Subject: Re: [PATCH 1/2] bpf: btf: silence uninitialize variable warnings
Message-Id: <20180427171803.4zq3ts4owhhau6ds@kafai-mbp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180427140409.GA19583@mwanda>
In-Reply-To: <20180427140409.GA19583@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Apr 27, 2018 at 05:04:09PM +0300, Dan Carpenter wrote:
> Smatch complains that size can be uninitialized if btf_type_id_size()
> returns NULL.  It seems reasonable enough to check for that.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This goes to the BPF tree (linux-next).
> 
> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> index 22e1046a1a86..e631b6fd60d3 100644
> --- a/kernel/bpf/btf.c
> +++ b/kernel/bpf/btf.c
> @@ -1229,7 +1229,8 @@ static int btf_array_check_member(struct btf_verifier_env *env,
>  	}
>  
>  	array_type_id = member->type;
> -	btf_type_id_size(btf, &array_type_id, &array_size);
> +	if (!btf_type_id_size(btf, &array_type_id, &array_size))
> +		return -EINVAL;
This check is not needed.  It does not happen for array.

>  	struct_size = struct_type->size;
>  	bytes_offset = BITS_ROUNDDOWN_BYTES(struct_bits_off);
>  	if (struct_size - bytes_offset < array_size) {
> @@ -1351,6 +1352,8 @@ static void btf_array_seq_show(const struct btf *btf, const struct btf_type *t,
>  
>  	elem_type_id = array->type;
>  	elem_type = btf_type_id_size(btf, &elem_type_id, &elem_size);
> +	if (!elem_type)
> +		return;
This case has already been checked in verification phase.  No need
to recheck everything again..

>  	elem_ops = btf_type_ops(elem_type);
>  	seq_puts(m, "[");
>  	for (i = 0; i < array->nelems; i++) {
