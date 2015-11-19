From: Paul Moore <paul@paul-moore.com>
Date: Thu, 19 Nov 2015 20:53:55 +0000
Subject: Re: [PATCH] kernel-audit: Delete unnecessary checks before two function calls
Message-Id: <2673022.mRz1O5OCy7@sifl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <5317A59D.4@users.sourceforge.net> <56486FBC.3070103@users.sourceforge.net>
In-Reply-To: <56486FBC.3070103@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Eric Paris <eparis@redhat.com>, linux-audit@redhat.com, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sunday, November 15, 2015 12:42:52 PM SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 15 Nov 2015 12:38:33 +0100
> 
> The functions consume_skb() and kfree_skb() test whether their argument
> is NULL and then return immediately.
> Thus the tests around their calls are not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  kernel/audit.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Merged, thanks.

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 5ffcbd3..1e8e228 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -509,8 +509,7 @@ static void flush_hold_queue(void)
>  	 * if auditd just disappeared but we
>  	 * dequeued an skb we need to drop ref
>  	 */
> -	if (skb)
> -		consume_skb(skb);
> +	consume_skb(skb);
>  }
> 
>  static int kauditd_thread(void *dummy)
> @@ -1232,9 +1231,7 @@ static void audit_buffer_free(struct audit_buffer *ab)
> if (!ab)
>  		return;
> 
> -	if (ab->skb)
> -		kfree_skb(ab->skb);
> -
> +	kfree_skb(ab->skb);
>  	spin_lock_irqsave(&audit_freelist_lock, flags);
>  	if (audit_freelist_count > AUDIT_MAXFREE)
>  		kfree(ab);

-- 
paul moore
www.paul-moore.com

