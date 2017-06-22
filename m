From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 22 Jun 2017 09:28:34 +0000
Subject: Re: [PATCH] kasan: make function get_wild_bug_type static
Message-Id: <CACT4Y+Yqadr1obZCqpQVTp4DrjOLrshnyPp6L8owoqUybttvSQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170622090049.10658-1-colin.king@canonical.com>
In-Reply-To: <20170622090049.10658-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, kasan-dev <kasan-dev@googlegroups.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Thu, Jun 22, 2017 at 11:00 AM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The helper function get_wild_bug_type does not need to be in global scope,
> so make it static.
>
> Cleans up sparse warning:
> "symbol 'get_wild_bug_type' was not declared. Should it be static?"
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Dmitry Vyukov <dvyukov@google.com>

> ---
>  mm/kasan/report.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index beee0e980e2d..04bb1d3eb9ec 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -107,7 +107,7 @@ static const char *get_shadow_bug_type(struct kasan_access_info *info)
>         return bug_type;
>  }
>
> -const char *get_wild_bug_type(struct kasan_access_info *info)
> +static const char *get_wild_bug_type(struct kasan_access_info *info)
>  {
>         const char *bug_type = "unknown-crash";
>
> --
> 2.11.0
>
