From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 03 Jun 2020 17:57:14 +0000
Subject: Re: [PATCH bpf-next] bpf: Fix an error code in check_btf_func()
Message-Id: <CAADnVQJPwtan12Htu-0VhvuC3M-o_kbnPpN=SXVC-amn9BcZCw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200603175509.GE18931@mwanda>
In-Reply-To: <20200603175509.GE18931@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, bpf <bpf@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jun 3, 2020 at 10:55 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This code returns success if kcalloc() but it should return -ENOMEM.
>
> Fixes: 8c1b6e69dcc1 ("bpf: Compare BTF types of functions arguments with actual types")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  kernel/bpf/verifier.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 5c7bbaac81ef9..25363f134bf0c 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -7581,8 +7581,10 @@ static int check_btf_func(struct bpf_verifier_env *env,
>         if (!krecord)
>                 return -ENOMEM;
>         info_aux = kcalloc(nfuncs, sizeof(*info_aux), GFP_KERNEL | __GFP_NOWARN);
> -       if (!info_aux)
> +       if (!info_aux) {
> +               ret = -ENOMEM;
>                 goto err_free;
> +       }

Thanks for the fix.
I think it's better to do 'int ret = -ENOMEM;' instead.
