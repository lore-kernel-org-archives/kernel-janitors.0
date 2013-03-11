From: Joe Perches <joe@perches.com>
Date: Mon, 11 Mar 2013 20:25:28 +0000
Subject: Re: [PATCH 3/4] drivers: android: binder: Remove excessive indentation
Message-Id: <1363033528.2056.48.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1363030315-10229-1-git-send-email-mirsal@mirsal.fr>
	 <1363030315-10229-4-git-send-email-mirsal@mirsal.fr>
In-Reply-To: <1363030315-10229-4-git-send-email-mirsal@mirsal.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mirsal Ennaime <mirsal@mirsal.fr>
Cc: Greg Kroah-Hartman <greg@kroah.com>, Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>, Brian Swetland <swetland@google.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2013-03-11 at 20:31 +0100, Mirsal Ennaime wrote:
> Remove one level of indentation from the binder proc page release code
> by using slightly different control semantics.
[]
> diff --git a/drivers/staging/android/binder.c b/drivers/staging/android/binder.c
[]
> @@ -3002,18 +3002,20 @@ static void binder_deferred_release(struct binder_proc *proc)
>  	if (proc->pages) {
>  		int i;
>  		for (i = 0; i < proc->buffer_size / PAGE_SIZE; i++) {
> -			if (proc->pages[i]) {
> -				void *page_addr = proc->buffer + i * PAGE_SIZE;
> -				binder_debug(BINDER_DEBUG_BUFFER_ALLOC,
> -					"binder_release: %d: page %d at %p not freed\n",
> -					proc->pid, i,
> -					page_addr);
> -				unmap_kernel_range((unsigned long)page_addr,
> -					PAGE_SIZE);
> -				__free_page(proc->pages[i]);
> -				page_count++;
> -			}
> +			if (!proc->pages[i])
> +				continue;
> +
> +			void *page_addr = proc->buffer + i * PAGE_SIZE;

Please declare variables immediately after an open brace.

		for (i = 0; i < proc->buffer_size / PAGE_SIZE; i++) {
			void *page_addr;

			if (!proc->pages[i])
				continue;

			page_addr = proc->buffer + i * PAGE_SIZE;

			etc...



