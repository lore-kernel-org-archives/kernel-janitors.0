From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Date: Thu, 28 Feb 2019 17:53:00 +0000
Subject: Re: [PATCH v2] tools/libbpf: signedness bug in btf_dedup_ref_type()
Message-Id: <20190228175300.GB9508@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a34432d0-b838-c004-ef79-052cd50996c0@fb.com>
 <20190228175035.GA30148@kadam>
In-Reply-To: <20190228175035.GA30148@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

Em Thu, Feb 28, 2019 at 08:50:35PM +0300, Dan Carpenter escreveu:
> The "ref_type_id" variable needs to be signed for the error handling
> to work.

Does the infiniband signedness change comes as a bonus? :-)

- Arnaldo
 
> Fixes: d5caef5b5655 ("btf: add BTF types deduplication algorithm")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Andrii Nakryiko <andriin@fb.com>
> ---
> v2: Use reverse Christmas tree style
> 
> This goes through the BPF tree probably, although it does apply to
> net-next.
> 
>  drivers/infiniband/ulp/iser/iscsi_iser.h | 2 +-
>  tools/lib/bpf/btf.c                      | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/infiniband/ulp/iser/iscsi_iser.h b/drivers/infiniband/ulp/iser/iscsi_iser.h
> index 120b40829560..ee7d3f6a666e 100644
> --- a/drivers/infiniband/ulp/iser/iscsi_iser.h
> +++ b/drivers/infiniband/ulp/iser/iscsi_iser.h
> @@ -197,7 +197,7 @@ struct iser_data_buf {
>  	struct scatterlist *sg;
>  	int                size;
>  	unsigned long      data_len;
> -	unsigned int       dma_nents;
> +	int		   dma_nents;
>  };
>  
>  /* fwd declarations */
> diff --git a/tools/lib/bpf/btf.c b/tools/lib/bpf/btf.c
> index 68b50e9bbde1..00a2f06e38fd 100644
> --- a/tools/lib/bpf/btf.c
> +++ b/tools/lib/bpf/btf.c
> @@ -2326,7 +2326,8 @@ static int btf_dedup_ref_type(struct btf_dedup *d, __u32 type_id)
>  	struct btf_type *t, *cand;
>  	/* if we don't find equivalent type, then we are representative type */
>  	__u32 new_id = type_id;
> -	__u32 h, ref_type_id;
> +	int ref_type_id;
> +	__u32 h;
>  
>  	if (d->map[type_id] = BTF_IN_PROGRESS_ID)
>  		return -ELOOP;
> -- 
> 2.17.1

-- 

- Arnaldo
