From: Pavel Machek <pavel@ucw.cz>
Date: Sat, 21 Jul 2007 09:36:47 +0000
Subject: Re: [PATCH] [trivial]: remove unused return within void return function
Message-Id: <20070721093647.GB1902@elf.ucw.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11848234112179-git-send-email-crquan@gmail.com>
In-Reply-To: <11848234112179-git-send-email-crquan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu 2007-07-19 13:36:51, Denis Cheng wrote:
> Signed-off-by: Denis Cheng <crquan@gmail.com>
ACK.

							Pavel
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -478,7 +478,6 @@ error_out:
>  		nbd_end_request(req);
>  		spin_lock(q->queue_lock);
>  	}
> -	return;
>  }
>  
>  static int nbd_ioctl(struct inode *inode, struct file *file,

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
