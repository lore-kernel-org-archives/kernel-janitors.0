From: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 02 Aug 2010 23:01:29 +0000
Subject: Re: [PATCH] video: igafb: introduce lost 'return'
Message-Id: <20100802160129.8ca0cf05.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280594070-3328-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280594070-3328-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 31 Jul 2010 20:34:30 +0400
Kulikov Vasiliy <segooon@gmail.com> wrote:

> If iga_init() fails, code releases resources and continues to use it.
> It seems that after releasing resources 'return' should be.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/video/igafb.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/video/igafb.c b/drivers/video/igafb.c
> index 15d2001..c4e6fc0 100644
> --- a/drivers/video/igafb.c
> +++ b/drivers/video/igafb.c
> @@ -531,6 +531,7 @@ int __init igafb_init(void)
>  		iounmap(info->screen_base);
>  		kfree(par->mmap_map);
>  		kfree(info);
> +		return -ENODEV;
>          }
>  
>  #ifdef CONFIG_SPARC

Fair enough.

We may as well do this, too:

--- a/drivers/video/igafb.c~drivers-video-igafbc-make-igafb_setup-and-igafb_init-static
+++ a/drivers/video/igafb.c
@@ -368,7 +368,7 @@ static int __init iga_init(struct fb_inf
 	return 1;
 }
 
-int __init igafb_init(void)
+static int __init igafb_init(void)
 {
         struct fb_info *info;
         struct pci_dev *pdev;
@@ -557,7 +557,7 @@ int __init igafb_init(void)
 	return 0;
 }
 
-int __init igafb_setup(char *options)
+static int __init igafb_setup(char *options)
 {
     char *this_opt;
 
_

