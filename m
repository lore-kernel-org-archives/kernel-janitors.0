From: Mike Marshall <hubcap@omnibond.com>
Date: Fri, 07 Sep 2018 18:01:48 +0000
Subject: Re: [PATCH] orangefs: rate limit the client not running info message
Message-Id: <CAOg9mSTSiqaAiSuxN5uqQWoMF1W5ZXFgZ36jFHOFHRVe7CMraw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180905145401.19772-1-colin.king@canonical.com>
In-Reply-To: <20180905145401.19772-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mike Marshall <hubcap@omnibond.com>

Thanks... I've applied your patch to 4.19-rc2 and run it through xfstests.
It is in my linux-next tree now.

I put that in there because I'm really just an old system administrator,
and I would always be happy when I could tail dmesg and see some
hint at why something wasn't doing as I expected.

I just looked in ratelimit.h and at the ratelimit macros in printk.h,
I should try to think about those more when adding sysadmin-alert
messages.

-Mike
On Wed, Sep 5, 2018 at 10:54 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently accessing various /sys/fs/orangefs files will spam the
> kernel log with the following info message when the client is not
> running:
>
> [  491.489284] sysfs_service_op_show: Client not running :-5:
>
> Rate limit this info message to make it less spammy.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/orangefs/orangefs-sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/orangefs/orangefs-sysfs.c b/fs/orangefs/orangefs-sysfs.c
> index dd28079f518c..19739aaee675 100644
> --- a/fs/orangefs/orangefs-sysfs.c
> +++ b/fs/orangefs/orangefs-sysfs.c
> @@ -323,7 +323,7 @@ static ssize_t sysfs_service_op_show(struct kobject *kobj,
>         /* Can't do a service_operation if the client is not running... */
>         rc = is_daemon_in_service();
>         if (rc) {
> -               pr_info("%s: Client not running :%d:\n",
> +               pr_info_ratelimited("%s: Client not running :%d:\n",
>                         __func__,
>                         is_daemon_in_service());
>                 goto out;
> --
> 2.17.1
>
