From: Marco Elver <elver@google.com>
Date: Fri, 17 Apr 2020 09:23:05 +0000
Subject: Re: [PATCH -next] kcsan: Use GFP_ATOMIC under spin lock
Message-Id: <CANpmjNMzwqFaaA-zQh0Nv4SUdoJUFO_yTmTjfbMFqyxBea1U+Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200417025837.49780-1-weiyongjun1@huawei.com>
In-Reply-To: <20200417025837.49780-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: Dmitry Vyukov <dvyukov@google.com>, kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, 17 Apr 2020 at 04:56, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> A spin lock is taken here so we should use GFP_ATOMIC.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Good catch, thank you!

Reviewed-by: Marco Elver <elver@google.com>


> ---
>  kernel/kcsan/debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/kcsan/debugfs.c b/kernel/kcsan/debugfs.c
> index 1a08664a7fab..023e49c58d55 100644
> --- a/kernel/kcsan/debugfs.c
> +++ b/kernel/kcsan/debugfs.c
> @@ -230,7 +230,7 @@ static ssize_t insert_report_filterlist(const char *func)
>                 /* initial allocation */
>                 report_filterlist.addrs >                         kmalloc_array(report_filterlist.size,
> -                                     sizeof(unsigned long), GFP_KERNEL);
> +                                     sizeof(unsigned long), GFP_ATOMIC);
>                 if (report_filterlist.addrs = NULL) {
>                         ret = -ENOMEM;
>                         goto out;
> @@ -240,7 +240,7 @@ static ssize_t insert_report_filterlist(const char *func)
>                 size_t new_size = report_filterlist.size * 2;
>                 unsigned long *new_addrs >                         krealloc(report_filterlist.addrs,
> -                                new_size * sizeof(unsigned long), GFP_KERNEL);
> +                                new_size * sizeof(unsigned long), GFP_ATOMIC);
>
>                 if (new_addrs = NULL) {
>                         /* leave filterlist itself untouched */
>
>
>
>
>
