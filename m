From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 15 Aug 2019 17:06:07 +0000
Subject: Re: [PATCH -next] btf: fix return value check in btf_vmlinux_init()
Message-Id: <CAEf4Bzb8JMnLXVpgF3PcZbZz8zRCX6HNWbsnfJkankjqX3rzRg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190815142432.101401-1-weiyongjun1@huawei.com>
In-Reply-To: <20190815142432.101401-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Aug 15, 2019 at 7:21 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> In case of error, the function kobject_create_and_add() returns NULL
> pointer not ERR_PTR(). The IS_ERR() test in the return value check
> should be replaced with NULL test.
>
> Fixes: 341dfcf8d78e ("btf: expose BTF info through sysfs")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---


Argh... Thanks for the fix! Fix the comment below addressed:

Acked-by: Andrii Nakryiko <andriin@fb.com>

>  kernel/bpf/sysfs_btf.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/kernel/bpf/sysfs_btf.c b/kernel/bpf/sysfs_btf.c
> index 4659349fc795..be5557deb958 100644
> --- a/kernel/bpf/sysfs_btf.c
> +++ b/kernel/bpf/sysfs_btf.c
> @@ -30,16 +30,13 @@ static struct kobject *btf_kobj;
>
>  static int __init btf_vmlinux_init(void)
>  {
> -       int err;
> -
>         if (!_binary__btf_vmlinux_bin_start)
>                 return 0;
>
>         btf_kobj = kobject_create_and_add("btf", kernel_kobj);
> -       if (IS_ERR(btf_kobj)) {
> -               err = PTR_ERR(btf_kobj);
> +       if (!btf_kobj) {
>                 btf_kobj = NULL;

This is now not necessary, please drop (and don't forget to remove {}
for this single-line if afterwards).

> -               return err;
> +               return -ENOMEM;
>         }
>
>         bin_attr_btf_vmlinux.size = _binary__btf_vmlinux_bin_end -
>
>
>
