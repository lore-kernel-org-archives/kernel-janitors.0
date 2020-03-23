From: Yonghong Song <yhs@fb.com>
Date: Mon, 23 Mar 2020 05:32:13 +0000
Subject: Re: [PATCH] bpf: fix build warning - missing prototype
Message-Id: <b08375c6-81ce-b96d-0b87-299f966f4d84@fb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200322140844.4674-1-jpmenil@gmail.com>
In-Reply-To: <20200322140844.4674-1-jpmenil@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Philippe Menil <jpmenil@gmail.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andriin@fb.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org



On 3/22/20 7:08 AM, Jean-Philippe Menil wrote:
> Fix build warning when building net/bpf/test_run.o with W=1 due
> to missing prototype for bpf_fentry_test{1..6}.
> 
> These functions are only used in test_run.c so just make them static.
> Therefore inline keyword should sit between storage class and type.

This won't work. These functions are intentionally global functions
so that their definitions will be in vmlinux BTF and fentry/fexit kernel
selftests can run against them.

See file 
linux/tools/testing/selftests/bpf/progs/{fentry_test.c,fexit_test.c}.

> 
> Signed-off-by: Jean-Philippe Menil <jpmenil@gmail.com>
> ---
>   net/bpf/test_run.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
> index d555c0d8657d..c0dcd29f682c 100644
> --- a/net/bpf/test_run.c
> +++ b/net/bpf/test_run.c
> @@ -113,32 +113,32 @@ static int bpf_test_finish(const union bpf_attr *kattr,
>    * architecture dependent calling conventions. 7+ can be supported in the
>    * future.
>    */
> -int noinline bpf_fentry_test1(int a)
> +static noinline int bpf_fentry_test1(int a)
>   {
>   	return a + 1;
>   }
>   
> -int noinline bpf_fentry_test2(int a, u64 b)
> +static noinline int bpf_fentry_test2(int a, u64 b)
>   {
>   	return a + b;
>   }
>   
> -int noinline bpf_fentry_test3(char a, int b, u64 c)
> +static noinline int bpf_fentry_test3(char a, int b, u64 c)
>   {
>   	return a + b + c;
>   }
>   
> -int noinline bpf_fentry_test4(void *a, char b, int c, u64 d)
> +static noinline int bpf_fentry_test4(void *a, char b, int c, u64 d)
>   {
>   	return (long)a + b + c + d;
>   }
>   
> -int noinline bpf_fentry_test5(u64 a, void *b, short c, int d, u64 e)
> +static noinline int bpf_fentry_test5(u64 a, void *b, short c, int d, u64 e)
>   {
>   	return a + (long)b + c + d + e;
>   }
>   
> -int noinline bpf_fentry_test6(u64 a, void *b, short c, int d, void *e, u64 f)
> +static noinline int bpf_fentry_test6(u64 a, void *b, short c, int d, void *e, u64 f)
>   {
>   	return a + (long)b + c + d + (long)e + f;
>   }
> 
