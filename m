From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Nov 2013 08:25:25 +0000
Subject: Re: [PATCH] tty: replace mutex_lock() with tty_write_lock()
Message-Id: <20131122082525.GA5302@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1385061132-7254-1-git-send-email-andi.platschek@gmail.com>
In-Reply-To: <1385061132-7254-1-git-send-email-andi.platschek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Platschek <andi.platschek@gmail.com>
Cc: gregkh@linuxfoundation.org, jslaby@suse.cz, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Nov 21, 2013 at 08:12:12PM +0100, Andreas Platschek wrote:
> Use tty_write_lock()/tty_write_unlock() consistently.
> 
> This takes care of the following sparse warning:
> drivers/tty/tty_io.c:1169:17: warning: context imbalance in 'tty_write_message' - unexpected unlock
> 

I don't think we can do this.  mutex_lock() always succeeds and
tty_write_lock() can fail.

I think we just have to live with the error message.

regards,
dan carpenter

