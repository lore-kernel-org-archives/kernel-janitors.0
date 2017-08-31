From: Greg KH <gregkh@linuxfoundation.org>
Date: Thu, 31 Aug 2017 16:57:08 +0000
Subject: Re: [PATCH] driver core: bus: Fix a potential double free
Message-Id: <20170831165708.GA26329@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170829192349.15666-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170829192349.15666-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 29, 2017 at 09:23:49PM +0200, Christophe JAILLET wrote:
> The .release function of driver_ktype is 'driver_release()'.
> This function frees the container_of this kobject.
> 
> So, this memory must not be freed explicitly in the error handling path of
> 'bus_add_driver()'. Otherwise a double free will occur.

Oh, nice catch!

> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> I have left the 'drv->p = NULL' even if it looks useless to me. It does not
> hurt. I have also left a comment to explain why we do not free 'drv->p'
> explicitly before zeroing this pointer.

We need that for when people do static structures.  Like as is done for
drivers.  Well, I think that's why we need it, can't really remember,
might as well be safe, the error handling paths here are crazy at
times...

thnaks,

greg k-h
