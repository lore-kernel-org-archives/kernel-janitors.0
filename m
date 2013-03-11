From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Mar 2013 21:46:10 +0000
Subject: Re: [PATCH 1/4] drivers: android: binder: Move the node release code to a separate function
Message-Id: <20130311214610.GC9138@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1363030315-10229-1-git-send-email-mirsal@mirsal.fr>
 <1363030315-10229-2-git-send-email-mirsal@mirsal.fr>
In-Reply-To: <1363030315-10229-2-git-send-email-mirsal@mirsal.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mirsal Ennaime <mirsal@mirsal.fr>
Cc: Greg Kroah-Hartman <greg@kroah.com>, devel@driverdev.osuosl.org, Brian Swetland <swetland@google.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>

On Mon, Mar 11, 2013 at 08:31:52PM +0100, Mirsal Ennaime wrote:
>  static void binder_deferred_release(struct binder_proc *proc)
>  {
>  	struct binder_transaction *t;
>  	struct rb_node *n;
> -	int threads, nodes, incoming_refs, outgoing_refs, buffers, active_transactions, page_count;
> +	int threads, nodes, incoming_refs, outgoing_refs, nd_refs,
> +		buffers, active_transactions, page_count;

Don't introduce the new "nd_refs" variable.

regards,
dan carpenter

