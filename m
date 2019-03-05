From: Song Liu <liu.song.a23@gmail.com>
Date: Tue, 05 Mar 2019 20:57:02 +0000
Subject: Re: [PATCH][bpf-next] bpf: hbm: fix spelling mistake "deault" -> "default"
Message-Id: <CAPhsuW4BATiS5btfY1SSOUgMscRemGfj56rUHNzX9NGdt7wqag@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190305173113.26119-1-colin.king@canonical.com>
In-Reply-To: <20190305173113.26119-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>

On Tue, Mar 5, 2019 at 9:41 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There are a couple of typos, fix these.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

I guess this could go to bpf tree.

Acked-by: Song Liu <songliubraving@fb.com>


> ---
>  samples/bpf/hbm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/samples/bpf/hbm.c b/samples/bpf/hbm.c
> index 8408ccb7409f..a79828ab273f 100644
> --- a/samples/bpf/hbm.c
> +++ b/samples/bpf/hbm.c
> @@ -18,7 +18,7 @@
>   *             Default is /hbm1
>   *    -r <rate>        Rate limit in Mbps
>   *    -s       Get HBM stats (marked, dropped, etc.)
> - *    -t <time>        Exit after specified seconds (deault is 0)
> + *    -t <time>        Exit after specified seconds (default is 0)
>   *    -w       Work conserving flag. cgroup can increase its bandwidth
>   *             beyond the rate limit specified while there is available
>   *             bandwidth. Current implementation assumes there is only
> @@ -376,7 +376,7 @@ static void Usage(void)
>                "               Default is /hbm1\n"
>                "    -r <rate>  Rate in Mbps\n"
>                "    -s         Update HBM stats\n"
> -              "    -t <time>  Exit after specified seconds (deault is 0)\n"
> +              "    -t <time>  Exit after specified seconds (default is 0)\n"
>                "    -w         Work conserving flag. cgroup can increase\n"
>                "               bandwidth beyond the rate limit specified\n"
>                "               while there is available bandwidth. Current\n"
> --
> 2.20.1
>
