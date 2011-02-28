From: Greg KH <gregkh@suse.de>
Date: Mon, 28 Feb 2011 21:06:03 +0000
Subject: Re: [patch] Staging: generic_serial: fix double locking bug
Message-Id: <20110228210603.GA8320@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110228192831.GI18043@bicker>
In-Reply-To: <20110228192831.GI18043@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Feb 28, 2011 at 10:28:31PM +0300, Dan Carpenter wrote:
> spin_lock_irqsave() is not nestable.  The second time that it gets
> called it overwrites the "flags" variable and so IRQs can't be restored
> properly.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> Oh.  Crap.  I don't want to adopt these drivers.  But I already wrote
> the patch before I read the TODO file, so I'm still going to submit it.

Heh, don't worry, you don't "own" them, I'll just take this fix for now
and still leave them in the "abandoned" category :)

thanks,

greg k-h
