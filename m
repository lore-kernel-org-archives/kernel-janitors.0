From: Song Liu <song@kernel.org>
Date: Thu, 04 Jun 2020 18:37:09 +0000
Subject: Re: [PATCH v2 bpf-next] bpf: Fix an error code in check_btf_func()
Message-Id: <CAPhsuW7BK+4sJ42YpseWkHf0brW65se5HkQCkq-ONHx--sW4iw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAADnVQJPwtan12Htu-0VhvuC3M-o_kbnPpN=SXVC-amn9BcZCw@mail.gmail.com>
 <20200604085436.GA943001@mwanda>
In-Reply-To: <20200604085436.GA943001@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, bpf <bpf@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Jun 4, 2020 at 1:55 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This code returns success if the "info_aux" allocation fails but it
> should return -ENOMEM.
>
> Fixes: 8c1b6e69dcc1 ("bpf: Compare BTF types of functions arguments with actual types")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Song Liu <songliubraving@fb.com>

> ---
> v2: style change
>
