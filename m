From: Dan Carpenter <error27@gmail.com>
Date: Mon, 21 Feb 2011 09:43:29 +0000
Subject: Re: [PATCH 0/3] Staging: xgifb: Removes dead code and unused
Message-Id: <20110221094329.GG1898@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1298279347-8825-1-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1298279347-8825-1-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Feb 21, 2011 at 10:09:04AM +0100, Javier Martinez Canillas wrote:
> [PATCH 1/3] Staging: xgifb: Removes dead code
> [PATCH 2/3] Staging: xgifb: Remove unused functions
> [PATCH 3/3] Staging: xgifb: Remove unused spinlock conditional compilation logic

Acked-by: Dan Carpenter <error27@gmail.com>

Looks good.  If you wanted to send some follow on patches, there are
some related things you could delete as well.

1)  All references to XGIfb_accel in drivers/staging/xgifb/XGI_accel.h
and drivers/staging/xgifb/XGI_main_26.c

2) spinlock_t lockaccel; from the video_info struct in 
drivers/staging/xgifb/XGIfb.h

3) The fbcon_XGI_sync() function doesn't do anything.  You can delete
all references to it.  Leave the ->fb_sync function pointer NULL.

regards,
dan carpenter
