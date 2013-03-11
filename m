From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Mar 2013 21:44:47 +0000
Subject: Re: [PATCH 4/4] drivers: android: binder: Fix compiler warning
Message-Id: <20130311214447.GB9138@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1363030315-10229-1-git-send-email-mirsal@mirsal.fr>
 <1363030315-10229-5-git-send-email-mirsal@mirsal.fr>
In-Reply-To: <1363030315-10229-5-git-send-email-mirsal@mirsal.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mirsal Ennaime <mirsal@mirsal.fr>
Cc: Greg Kroah-Hartman <greg@kroah.com>, devel@driverdev.osuosl.org, Brian Swetland <swetland@google.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>

On Mon, Mar 11, 2013 at 08:31:55PM +0100, Mirsal Ennaime wrote:
> Fix an instance of -Wdeclaration-after-statement
> 

That's a compiler warning you introduced yourself on the previous
patch.  Obviously, we're not going to accept the original patch. :P

> Signed-off-by: Mirsal Ennaime <mirsal@mirsal.fr>
> ---
>  drivers/staging/android/binder.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/android/binder.c b/drivers/staging/android/binder.c
> index 18a83e2..c833b53 100644
> --- a/drivers/staging/android/binder.c
> +++ b/drivers/staging/android/binder.c
> @@ -3001,11 +3001,12 @@ static void binder_deferred_release(struct binder_proc *proc)
>  	page_count = 0;
>  	if (proc->pages) {
>  		int i;
> +		void *page_addr;

Put a blank line after the variable declaration section.  Really
the "int i" should go at the start of the function and the page_addr
should go inside the for loop.

regards,
dan carpenter


