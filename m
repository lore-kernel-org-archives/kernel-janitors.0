From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 13 Jul 2018 15:13:30 +0000
Subject: Re: [PATCH 1/2] samples: bpf: ensure that we don't load over MAX_PROGS programs
Message-Id: <a3397e41-7e57-d4c2-96e0-427d9386444a@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180713151139.aiqginrahbimfsop@kili.mountain>
In-Reply-To: <20180713151139.aiqginrahbimfsop@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 13/07/18 16:11, Dan Carpenter wrote:
> I can't see that we check prog_cnt to ensure it doesn't go over
> MAX_PROGS.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/samples/bpf/bpf_load.c b/samples/bpf/bpf_load.c
> index 89161c9ed466..904e775d1a44 100644
> --- a/samples/bpf/bpf_load.c
> +++ b/samples/bpf/bpf_load.c
> @@ -107,6 +107,9 @@ static int load_and_attach(const char *event, struct bpf_insn *prog, int size)
>  		return -1;
>  	}
>  
> +	if (prog_cnt = MAX_PROGS)
> +		return -1;
> +

Should that be "if (prog_cnt >= MAX_PROGS)" ?

>  	fd = bpf_load_program(prog_type, prog, insns_cnt, license, kern_version,
>  			      bpf_log_buf, BPF_LOG_BUF_SIZE);
>  	if (fd < 0) {
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

