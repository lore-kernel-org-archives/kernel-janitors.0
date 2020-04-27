From: Daniel Borkmann <daniel@iogearbox.net>
Date: Mon, 27 Apr 2020 21:37:03 +0000
Subject: Re: [PATCH bpf-next v3 1/2] bpf: Change error code when ops is NULL
Message-Id: <6f975e8c-34f5-4bcb-d99d-d1977866bedf@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200426063635.130680-1-maowenan@huawei.com>
 <20200426063635.130680-2-maowenan@huawei.com>
In-Reply-To: <20200426063635.130680-2-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>, ast@kernel.org, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org, andrii.nakryiko@gmail.com, dan.carpenter@oracle.com
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

On 4/26/20 8:36 AM, Mao Wenan wrote:
> There is one error printed when use BPF_MAP_TYPE_SOCKMAP to create map:
> libbpf: failed to create map (name: 'sock_map'): Invalid argument(-22)
> 
> This is because CONFIG_BPF_STREAM_PARSER is not set, and
> bpf_map_types[type] return invalid ops. It is not clear to show the
> cause of config missing with return code -EINVAL.
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>   kernel/bpf/syscall.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index d85f37239540..8ae78c98d91e 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -113,7 +113,7 @@ static struct bpf_map *find_and_alloc_map(union bpf_attr *attr)
>   	type = array_index_nospec(type, ARRAY_SIZE(bpf_map_types));
>   	ops = bpf_map_types[type];
>   	if (!ops)
> -		return ERR_PTR(-EINVAL);
> +		return ERR_PTR(-EOPNOTSUPP);
>   
>   	if (ops->map_alloc_check) {
>   		err = ops->map_alloc_check(attr);
> 

Unless I'm missing the use-case, why not using bpftool's feature probe to check for
availability (alternatively via 'feature probe kernel macros' if you need this into
inside the BPF prog for ifdef etc)?

   bpftool feature probe kernel | grep sockmap
   eBPF map_type sockmap is NOT available

Thanks,
Daniel
