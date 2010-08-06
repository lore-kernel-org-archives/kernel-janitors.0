From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@linux-vserver.org>
Date: Fri, 06 Aug 2010 08:08:04 +0000
Subject: Re: [patch] hid: picolcd: testing the wrong variable
Message-Id: <20100806100804.4b920829@pluto.restena.lu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100806062848.GL9031@bicker>
In-Reply-To: <20100806062848.GL9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Jiri Kosina <jkosina@suse.cz>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

Thanks for spotting!

But while fixing this one also fix the ordering (which was never
reached due to this wrong check) a few lines later.

Patch (combined) at the end.

Thanks,
Bruno


On Fri, 6 Aug 2010 08:28:49 Dan Carpenter <error27@gmail.com> wrote:
> "ref_cnt" is a point to the reference count and it's non-null.  We really
> want to test the reference count itself.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/hid/hid-picolcd.c b/drivers/hid/hid-picolcd.c
> index 346f0e3..c0bdeba 100644
> --- a/drivers/hid/hid-picolcd.c
> +++ b/drivers/hid/hid-picolcd.c
> @@ -547,7 +547,7 @@ static void picolcd_fb_destroy(struct fb_info *info)
>  	ref_cnt--;
>  	mutex_lock(&info->lock);
>  	(*ref_cnt)--;
> -	may_release = !ref_cnt;
> +	may_release = !*ref_cnt;
>  	mutex_unlock(&info->lock);
>  	if (may_release) {
>  		framebuffer_release(info);

--- a/drivers/hid/hid-picolcd.c
+++ b/drivers/hid/hid-picolcd.c
@@ -547,11 +547,11 @@ static void picolcd_fb_destroy(struct fb
 	ref_cnt--;
 	mutex_lock(&info->lock);
 	(*ref_cnt)--;
-	may_release = !ref_cnt;
+	may_release = !*ref_cnt;
 	mutex_unlock(&info->lock);
 	if (may_release) {
-		framebuffer_release(info);
 		vfree((u8 *)info->fix.smem_start);
+		framebuffer_release(info);
 	}
 }
 
