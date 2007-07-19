From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 19 Jul 2007 19:08:18 +0000
Subject: Re: [PATCH] [trivial]: remove unused return within void return function
Message-Id: <20070719190818.GA6524@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11848234112179-git-send-email-crquan@gmail.com>
In-Reply-To: <11848234112179-git-send-email-crquan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jul 19, 2007 at 01:36:51PM +0800, Denis Cheng wrote:
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -478,7 +478,6 @@ error_out:
>  		nbd_end_request(req);
>  		spin_lock(q->queue_lock);
>  	}
> -	return;
>  }

Yes, but we have many such places.

