From: Jiri Slaby <jirislaby@gmail.com>
Date: Tue, 27 Jul 2010 22:24:39 +0000
Subject: Re: [PATCH] dvb: siano: free spinlock before schedule()
Message-Id: <4C4F5CA7.1030706@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280256161-7971-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280256161-7971-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>, Douglas Schilling Landgraf <dougsland@redhat.com>, Jiri Kosina <jkosina@suse.cz>, Roel Kluin <roel.kluin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Zidlicky <rz@linux-m68k.org>

On 07/27/2010 08:42 PM, Kulikov Vasiliy wrote:
> Calling schedule() holding spinlock with disables irqs is improper. As
> spinlock protects list coredev->buffers, it can be unlocked untill wakeup.
> This bug was introduced in a9349315f65cd6a16e8fab1f6cf0fd40f379c4db.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/media/dvb/siano/smscoreapi.c |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/dvb/siano/smscoreapi.c b/drivers/media/dvb/siano/smscoreapi.c
> index 7f2c94a..d93468c 100644
> --- a/drivers/media/dvb/siano/smscoreapi.c
> +++ b/drivers/media/dvb/siano/smscoreapi.c
> @@ -1113,9 +1113,11 @@ struct smscore_buffer_t *smscore_getbuffer(struct smscore_device_t *coredev)
>  	 */
>  
>  	prepare_to_wait(&coredev->buffer_mng_waitq, &wait, TASK_INTERRUPTIBLE);
> -
> -	if (list_empty(&coredev->buffers))
> +	if (list_empty(&coredev->buffers)) {
> +		spin_unlock_irqrestore(&coredev->bufferslock, flags);
>  		schedule();
> +		spin_lock_irqsave(&coredev->bufferslock, flags);
> +	}
>  
>  	finish_wait(&coredev->buffer_mng_waitq, &wait);

There is a better fix (which fixes the potential NULL dereference):
http://lkml.org/lkml/2010/6/7/175

Richard, could you address the comments there and resend?

regards,
-- 
js
