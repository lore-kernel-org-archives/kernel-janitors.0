From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 23 Jun 2020 18:56:31 +0000
Subject: Re: [PATCH][next] libbpf: fix spelling mistake "kallasyms" -> "kallsyms"
Message-Id: <CAEf4Bzbp8h9w0w56kHnaXW37+zoHapRR0Sjc7=vaH7i5ceF9fw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200623084207.149253-1-colin.king@canonical.com>
In-Reply-To: <20200623084207.149253-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>

On Tue, Jun 23, 2020 at 1:43 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a pr_warn message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Acked-by: Andrii Nakryiko <andriin@fb.com>

>  tools/lib/bpf/libbpf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> index 18461deb1b19..deea27aadcef 100644
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@ -5741,7 +5741,7 @@ static int bpf_object__read_kallsyms_file(struct bpf_object *obj)
>                 if (ret = EOF && feof(f))
>                         break;
>                 if (ret != 3) {
> -                       pr_warn("failed to read kallasyms entry: %d\n", ret);
> +                       pr_warn("failed to read kallsyms entry: %d\n", ret);
>                         err = -EINVAL;
>                         goto out;
>                 }
> --
> 2.27.0
>
