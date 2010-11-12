From: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 12 Nov 2010 20:08:34 +0000
Subject: Re: [PATCH] fs: select: fix information leak to userspace
Message-Id: <20101112120834.33062900.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289421483-23907-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1289421483-23907-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 10 Nov 2010 23:38:02 +0300
Vasiliy Kulikov <segooon@gmail.com> wrote:

> On some architectures __kernel_suseconds_t is int.

On sparc and parisc.  On all other architectures this patch is a waste
of cycles.

>  On these archs
> struct timeval has padding bytes at the end.  This struct is copied to
> userspace with these padding bytes uninitialized.  This leads to leaking
> of contents of kernel stack memory.
> 
> This bug was added with v2.6.27-rc5-286-gb773ad4.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---
>  Compile tested.
> 
>  fs/select.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/fs/select.c b/fs/select.c
> index b7b10aa..32cf018 100644
> --- a/fs/select.c
> +++ b/fs/select.c
> @@ -306,6 +306,7 @@ static int poll_select_copy_remaining(struct timespec *end_time, void __user *p,
>  		rts.tv_sec = rts.tv_nsec = 0;
>  
>  	if (timeval) {
> +		memset(&rtv, 0, sizeof(rtv));
>  		rtv.tv_sec = rts.tv_sec;
>  		rtv.tv_usec = rts.tv_nsec / NSEC_PER_USEC;

How about this?

--- a/fs/select.c~fs-select-fix-information-leak-to-userspace-fix
+++ a/fs/select.c
@@ -306,7 +306,8 @@ static int poll_select_copy_remaining(st
 		rts.tv_sec = rts.tv_nsec = 0;
 
 	if (timeval) {
-		memset(&rtv, 0, sizeof(rtv));
+		if (sizeof(rtv) > sizeof(rtv.tv_sec) + sizeof(rtv.tv_usec))
+			memset(&rtv, 0, sizeof(rtv));
 		rtv.tv_sec = rts.tv_sec;
 		rtv.tv_usec = rts.tv_nsec / NSEC_PER_USEC;
 
_


The `if' gets eliminated at compile time.  With this approach we add
four bytes of text to the sparc64 build and zero bytes of text to the
x86_64 build.


