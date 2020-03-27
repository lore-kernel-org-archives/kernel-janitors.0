From: Daniel Borkmann <daniel@iogearbox.net>
Date: Fri, 27 Mar 2020 20:34:05 +0000
Subject: Re: [PATCH v3] bpf: fix build warning - missing prototype
Message-Id: <3164e566-d54e-2254-32c4-d7fee47c37ea@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200326235426.ei6ae2z5ek6uq3tt@ast-mbp>
 <20200327075544.22814-1-jpmenil@gmail.com>
In-Reply-To: <20200327075544.22814-1-jpmenil@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Philippe Menil <jpmenil@gmail.com>, alexei.starovoitov@gmail.com
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org

On 3/27/20 8:55 AM, Jean-Philippe Menil wrote:
> Fix build warnings when building net/bpf/test_run.o with W=1 due
> to missing prototype for bpf_fentry_test{1..6}.
> 
> Instead of declaring prototypes, turn off warnings with
> __diag_{push,ignore,pop} as pointed by Alexei.
> 
> Signed-off-by: Jean-Philippe Menil <jpmenil@gmail.com>

Looks better, but this doesn't apply cleanly. Please respin to latest bpf-next tree, thanks.

> ---
>   net/bpf/test_run.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
> index d555c0d8657d..cc1592413fc3 100644
> --- a/net/bpf/test_run.c
> +++ b/net/bpf/test_run.c
> @@ -113,6 +113,9 @@ static int bpf_test_finish(const union bpf_attr *kattr,
>    * architecture dependent calling conventions. 7+ can be supported in the
>    * future.
>    */
> +__diag_push();
> +__diag_ignore(GCC, 8, "-Wmissing-prototypes",
> +	      "Global functions as their definitions will be in vmlinux BTF);
>   int noinline bpf_fentry_test1(int a)
>   {
>   	return a + 1;
> @@ -143,6 +146,8 @@ int noinline bpf_fentry_test6(u64 a, void *b, short c, int d, void *e, u64 f)
>   	return a + (long)b + c + d + (long)e + f;
>   }
>   
> +__diag_pop();
> +
>   static void *bpf_test_init(const union bpf_attr *kattr, u32 size,
>   			   u32 headroom, u32 tailroom)
>   {
> 
