From: Daniel Borkmann <daniel@iogearbox.net>
Date: Mon, 15 Jan 2018 10:35:06 +0000
Subject: Re: [PATCH] tools/bpftool: silence a static check warning
Message-Id: <2c2c2cf6-acf2-af9f-83ef-21dbcd0a5551@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180115081547.bf2u3aqitnm3bmtl@mwanda>
In-Reply-To: <20180115081547.bf2u3aqitnm3bmtl@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alexei Starovoitov <ast@kernel.org>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On 01/15/2018 09:15 AM, Dan Carpenter wrote:
> There is a static checker warning that proglen has an upper bound but no
> lower bound.  The allocation will just fail harmlessly so it's not a big
> deal.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/tools/bpf/bpf_jit_disasm.c b/tools/bpf/bpf_jit_disasm.c
> index 30044bc4f389..2d7bb5dc0b8c 100644
> --- a/tools/bpf/bpf_jit_disasm.c
> +++ b/tools/bpf/bpf_jit_disasm.c
> @@ -205,7 +205,7 @@ static uint8_t *get_last_jit_image(char *haystack, size_t hlen,
>  		regfree(&regex);
>  		return NULL;
>  	}
> -	if (proglen > 1000000) {
> +	if (proglen < 0 || proglen > 1000000) {

Could you just change proglen into unsigned? It's parsing the bpf_jit_dump()
and there we use proglen=%u anyway.

>  		printf("proglen of %d too big, stopping\n", proglen);
>  		return NULL;
>  	}
> 

Thanks,
Daniel
