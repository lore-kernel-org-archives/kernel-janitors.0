From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 13 Nov 2020 17:38:12 +0000
Subject: Re: [PATCH] ALSA: firewire: Clean up a locking issue in copy_resp_to_buf()
Message-Id: <s5hv9e9dunv.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201113101241.GB168908@mwanda>
In-Reply-To: <20201113101241.GB168908@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

On Fri, 13 Nov 2020 11:12:41 +0100,
Dan Carpenter wrote:
> 
> The spin_lock/unlock_irq() functions cannot be nested.  The problem is
> that presumably we would want the IRQs to be re-enabled on the second
> call the spin_unlock_irq() but instead it will be enabled at the first
> call so IRQs will be enabled earlier than expected.
> 
> In this situation the copy_resp_to_buf() function is only called from
> one function and it is called with IRQs disabled.  We can just use
> the regular spin_lock/unlock() functions.
> 
> Fixes: 555e8a8f7f14 ("ALSA: fireworks: Add command/response functionality into hwdep interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Thanks, applied now with Cc to stable.


Takashi
