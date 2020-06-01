From: Mike Marshall <hubcap@omnibond.com>
Date: Mon, 01 Jun 2020 11:15:04 +0000
Subject: Re: [PATCH] orangefs: remove redundant assignment to variable ret
Message-Id: <CAOg9mSQWuE06DJtfSn-d2cBK+RMZ0ndnw6m29pWEdw3jQq3erQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200524224802.27850-1-colin.king@canonical.com>
In-Reply-To: <20200524224802.27850-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi Colin... thanks for the patch, I have applied it
to the orangefs for-next tree...

-Mike

On Sun, May 24, 2020 at 6:48 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable ret is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/orangefs/orangefs-mod.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/orangefs/orangefs-mod.c b/fs/orangefs/orangefs-mod.c
> index c010c1fddafc..289b648ae196 100644
> --- a/fs/orangefs/orangefs-mod.c
> +++ b/fs/orangefs/orangefs-mod.c
> @@ -79,7 +79,7 @@ DECLARE_WAIT_QUEUE_HEAD(orangefs_request_list_waitq);
>
>  static int __init orangefs_init(void)
>  {
> -       int ret = -1;
> +       int ret;
>         __u32 i = 0;
>
>         if (op_timeout_secs < 0)
> --
> 2.25.1
>
