From: John Fastabend <john.fastabend@gmail.com>
Date: Sat, 22 Jul 2017 19:07:09 +0000
Subject: Re: [PATCH net-next] bpf: dev_map_alloc() shouldn't return NULL
Message-Id: <5973A25D.8030903@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170722074004.3abeucov67n3sbqs@mwanda>
In-Reply-To: <20170722074004.3abeucov67n3sbqs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/22/2017 12:40 AM, Dan Carpenter wrote:
> We forgot to set the error code on two error paths which means that we
> return ERR_PTR(0) which is NULL.  The caller, find_and_alloc_map(), is
> not expecting that and will have a NULL dereference.
> 
> Fixes: 546ac1ffb70d ("bpf: add devmap, a map for storing net device references")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
> index 899364d097f5..d439ee0eadb1 100644
> --- a/kernel/bpf/devmap.c
> +++ b/kernel/bpf/devmap.c
> @@ -114,6 +114,7 @@ static struct bpf_map *dev_map_alloc(union bpf_attr *attr)
>  	if (err)
>  		goto free_dtab;
>  
> +	err = -ENOMEM;
>  	/* A per cpu bitfield with a bit per possible net device */
>  	dtab->flush_needed = __alloc_percpu(
>  				BITS_TO_LONGS(attr->max_entries) *
> 

Thanks.

Acked-by: John Fastabend <john.fastabend@gmail.com>
