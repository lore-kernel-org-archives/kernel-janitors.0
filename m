From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 21 Jun 2019 05:08:22 +0000
Subject: Re: [PATCH][next] libbpf: fix spelling mistake "conflictling" -> "conflicting"
Message-Id: <CAEf4BzZhg0uJtPecF8t5MfXF=V7ycDrcB1RNXDNtjuFmvuAmCw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190619162742.985-1-colin.king@canonical.com>
In-Reply-To: <20190619162742.985-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>

On Wed, Jun 19, 2019 at 9:28 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There are several spelling mistakes in pr_warning messages. Fix these.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Oh, the beauty of copy/pasting same typo 4 times :)

Thanks for fixing! Can you please re-submit with [PATCH bpf-next]
subject prefix, as it's intended for bpf-next tree. With that:

Acked-by: Andrii Nakryiko <andriin@fb.com>

>  tools/lib/bpf/libbpf.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>

<snip>
