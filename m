From: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 03 Aug 2009 20:46:32 +0000
Subject: Re: [PATCH 1/5] drivers/video: Add kmalloc NULL tests
Message-Id: <20090803134632.7cff1658.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907301559530.8734@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907301559530.8734@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Ming Lei <tom.leiming@gmail.com>

On Thu, 30 Jul 2009 16:00:33 +0200 (CEST)
Julia Lawall <julia@diku.dk> wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> Check that the result of kmalloc is not NULL before passing it to other
> functions.
> 
> The semantic match that finds this problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @@
> expression *x;
> identifier f;
> constant char *C;
> @@
> 
> x = \(kmalloc\|kcalloc\|kzalloc\)(...);
> ... when != x = NULL
>     when != x != NULL
>     when != (x || ...)
> (
> kfree(x)
> |
> f(...,C,...,x,...)
> |
> *f(...,x,...)
> |
> *x->f
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  drivers/video/au1100fb.c            |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/video/au1100fb.c b/drivers/video/au1100fb.c
> index 378f277..1766846 100644
> --- a/drivers/video/au1100fb.c
> +++ b/drivers/video/au1100fb.c
> @@ -716,6 +716,10 @@ int au1100fb_setup(char *options)
>  			/* Mode option (only option that start with digit) */
>  			else if (isdigit(this_opt[0])) {
>  				mode = kmalloc(strlen(this_opt) + 1, GFP_KERNEL);
> +				if (!mode) {
> +					print_err("memory allocation failed");
> +					return -ENOMEM;
> +				}
>  				strncpy(mode, this_opt, strlen(this_opt) + 1);
>  			}
>  			/* Unsupported option */

We may as well clean up that open-coded kstrdup() too?

--- a/drivers/video/au1100fb.c~drivers-video-add-kmalloc-null-tests-fix
+++ a/drivers/video/au1100fb.c
@@ -715,12 +715,11 @@ int au1100fb_setup(char *options)
 			}
 			/* Mode option (only option that start with digit) */
 			else if (isdigit(this_opt[0])) {
-				mode = kmalloc(strlen(this_opt) + 1, GFP_KERNEL);
+				mode = kstrdup(this_opt, GFP_KERNEL);
 				if (!mode) {
 					print_err("memory allocation failed");
 					return -ENOMEM;
 				}
-				strncpy(mode, this_opt, strlen(this_opt) + 1);
 			}
 			/* Unsupported option */
 			else {
_

