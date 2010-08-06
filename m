From: Jiri Kosina <jkosina@suse.cz>
Date: Fri, 06 Aug 2010 12:53:39 +0000
Subject: Re: [patch] hid: picolcd: testing the wrong variable
Message-Id: <alpine.LNX.2.00.1008061453300.29919@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100806062848.GL9031@bicker>
In-Reply-To: <20100806062848.GL9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: =?ISO-8859-15?Q?Bruno_Pr=E9mont?= <bonbons@linux-vserver.org>, Jaya Kumar <jayakumar.lkml@gmail.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 6 Aug 2010, Dan Carpenter wrote:

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

Thanks a lot for spotting this. Applied.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
