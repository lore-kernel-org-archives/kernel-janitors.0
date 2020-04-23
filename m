From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 23 Apr 2020 05:43:24 +0000
Subject: Re: [PATCH bpf-next v2 1/2] bpf: Change error code when ops is NULL
Message-Id: <CAADnVQLfqLBzsjK0KddZM7WTL3unzWw+v18L0pw8HQnWsEVUzA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200422093329.GI2659@kadam> <20200423033314.49205-1-maowenan@huawei.com>
 <20200423033314.49205-2-maowenan@huawei.com>
In-Reply-To: <20200423033314.49205-2-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Andrii Nakryiko <andrii.nakryiko@gmail.com>

On Wed, Apr 22, 2020 at 8:31 PM Mao Wenan <maowenan@huawei.com> wrote:
>
> There is one error printed when use BPF_MAP_TYPE_SOCKMAP to create map:
> libbpf: failed to create map (name: 'sock_map'): Invalid argument(-22)
>
> This is because CONFIG_BPF_STREAM_PARSER is not set, and
> bpf_map_types[type] return invalid ops. It is not clear to show the
> cause of config missing with return code -EINVAL, so add pr_warn() and
> change error code to describe the reason.
>
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  kernel/bpf/syscall.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index d85f37239540..7686778457c7 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -112,9 +112,10 @@ static struct bpf_map *find_and_alloc_map(union bpf_attr *attr)
>                 return ERR_PTR(-EINVAL);
>         type = array_index_nospec(type, ARRAY_SIZE(bpf_map_types));
>         ops = bpf_map_types[type];
> -       if (!ops)
> -               return ERR_PTR(-EINVAL);
> -
> +       if (!ops) {
> +               pr_warn("map type %d not supported or kernel config not opened\n", type);
> +               return ERR_PTR(-EOPNOTSUPP);
> +       }

I don't think users will like it when kernel spams dmesg.
If you need this level of verbosity please teach consumer of libbpf to
print them.
It's not a job of libbpf either.
