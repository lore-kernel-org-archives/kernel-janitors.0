From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 22 Apr 2020 23:27:05 +0000
Subject: Re: [PATCH bpf-next 2/2] libbpf: Return err if bpf_object__load failed
Message-Id: <CAEf4BzaNZe63WxPrv0kAq-VjdoC8gOfrsmNLYBuK6nBu1Wh8kA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200422083010.28000-1-maowenan@huawei.com> <20200422083010.28000-3-maowenan@huawei.com>
In-Reply-To: <20200422083010.28000-3-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, john fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Apr 22, 2020 at 1:30 AM Mao Wenan <maowenan@huawei.com> wrote:
>
> bpf_object__load() has various return code, when
> it failed to load object, it must return err instead
> of return -EINVAL.
>
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---

This patch looks good. The other one in this series - not so sure..

Acked-by: Andrii Nakryiko <andriin@fb.com>

>  tools/lib/bpf/libbpf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> index 8f480e29a6b0..8e1dc6980fac 100644
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@ -7006,7 +7006,7 @@ int bpf_prog_load_xattr(const struct bpf_prog_load_attr *attr,
>         err = bpf_object__load(obj);
>         if (err) {
>                 bpf_object__close(obj);
> -               return -EINVAL;
> +               return err;
>         }
>
>         *pobj = obj;
> --
> 2.20.1
>
