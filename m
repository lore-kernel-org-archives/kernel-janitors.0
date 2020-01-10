From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Date: Fri, 10 Jan 2020 11:16:14 +0000
Subject: Re: [PATCH][next] PM: hibernate: fix spelling mistake "shapshot" -> "snapshot"
Message-Id: <1732016.surcVlZrUL@kreacher>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200110100812.236881-1-colin.king@canonical.com>
In-Reply-To: <20200110100812.236881-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Friday, January 10, 2020 11:08:12 AM CET Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a pr_info message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  kernel/power/snapshot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
> index 353c5e9070ed..befe3c94767c 100644
> --- a/kernel/power/snapshot.c
> +++ b/kernel/power/snapshot.c
> @@ -1841,7 +1841,7 @@ int hibernate_preallocate_memory(void)
>  
>   out:
>  	stop = ktime_get();
> -	pr_info("Allocated %lu pages for shapshot\n", pages);
> +	pr_info("Allocated %lu pages for snapshot\n", pages);
>  	swsusp_show_speed(start, stop, pages, "Allocated");
>  
>  	return 0;
> 

Applied, thanks!
