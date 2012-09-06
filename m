From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@linux-vserver.org>
Date: Thu, 06 Sep 2012 20:12:52 +0000
Subject: Re: [PATCH] HID: picoLCD: Remove use of deprecated function
Message-Id: <20120906221252.1402ba50@neptune.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346942780-8091-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1346942780-8091-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Emil Goode <emilgoode@gmail.com>
Cc: jkosina@suse.cz, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Tejun Heo <tj@kernel.org>

On Thu, 06 September 2012 Emil Goode <emilgoode@gmail.com> wrote:
> The flush_delayed_work_sync function is deprecated,
> we can instead call flush_delayed_work directly.
> 
> Sparse is giving a warning:
> drivers/hid/hid-picolcd_fb.c:611:2: warning:
> 	‘flush_delayed_work_sync’ is deprecated
> 	(declared at include/linux/workqueue.h:454)
> 	[-Wdeprecated-declarations]
> 
> Signed-off-by: Emil Goode <emilgoode@gmail.com>

Acked-by: Bruno Prémont <bonbons@linux-vserver.org>

This matches a patch by Tejun a few weeks ago which was partially
skipped in -next due to merge conflict with code split in picoLCD.

See http://comments.gmane.org/gmane.linux.kernel.next/23740

For the sake of proper bisectability, this should go in after
Tejun's workqueue changes (if needed at all depending on how merge
happens during pull by Linus).

Bruno

> ---
>  drivers/hid/hid-picolcd_fb.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
> index 0008a51..eb00357 100644
> --- a/drivers/hid/hid-picolcd_fb.c
> +++ b/drivers/hid/hid-picolcd_fb.c
> @@ -608,7 +608,7 @@ void picolcd_exit_framebuffer(struct picolcd_data *data)
>  	/* make sure there is no running update - thus that fbdata->picolcd
>  	 * once obtained under lock is guaranteed not to get free() under
>  	 * the feet of the deferred work */
> -	flush_delayed_work_sync(&info->deferred_work);
> +	flush_delayed_work(&info->deferred_work);
>  
>  	data->fb_info = NULL;
>  	unregister_framebuffer(info);
