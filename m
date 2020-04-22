From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Apr 2020 09:33:29 +0000
Subject: Re: [PATCH bpf-next 1/2] bpf: Change error code when ops is NULL
Message-Id: <20200422093329.GI2659@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200422083010.28000-1-maowenan@huawei.com>
 <20200422083010.28000-2-maowenan@huawei.com>
In-Reply-To: <20200422083010.28000-2-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: ast@kernel.org, daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org, netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Apr 22, 2020 at 04:30:09PM +0800, Mao Wenan wrote:
> There is one error printed when use type
> BPF_MAP_TYPE_SOCKMAP to create map:
> libbpf: failed to create map (name: 'sock_map'): Invalid argument(-22)
> 
> This is because CONFIG_BPF_STREAM_PARSER is not set, and
> bpf_map_types[type] return invalid ops. It is not clear
> to show the cause of config missing with return code -EINVAL,
> so add pr_warn() and change error code to describe the reason.

Since you're going to have to redo the commit any way, maybe you should
put the line breaks at 72 characters.  I think you're using 65 character
line breaks, but that's only for the Subject.

> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  kernel/bpf/syscall.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index d85f37239540..f67bc063bf75 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -112,9 +112,11 @@ static struct bpf_map *find_and_alloc_map(union bpf_attr *attr)
>  		return ERR_PTR(-EINVAL);
>  	type = array_index_nospec(type, ARRAY_SIZE(bpf_map_types));
>  	ops = bpf_map_types[type];
> -	if (!ops)
> -		return ERR_PTR(-EINVAL);
> -
> +	if (!ops) {
> +		pr_warn("map type %d not supported or
> +			 kernel config not opened\n", type);

This pr_warn() will be badly formatted in dmesg because of the new line
and the tabs.  I tried to add a checkpatch.pl warning for this but maybe
it only works with -f?...

regards,
dan carpenter
