From: Greg KH <greg@kroah.com>
Date: Fri, 19 Nov 2010 18:13:41 +0000
Subject: Re: [patch] Staging: spectra: update blk_queue_ordered()
Message-Id: <20101119181341.GA7228@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101118050544.GO31724@bicker>
In-Reply-To: <20101118050544.GO31724@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Nov 18, 2010 at 09:00:50AM +0200, Pekka Enberg wrote:
> On 11/18/10 7:05 AM, Dan Carpenter wrote:
> >blk_queue_ordered() isn't around anymore so this causes a compile error.
> >That change was in 4913efe456c "block: deprecate barrier and replace
> >blk_queue_ordered() with blk_queue_flush()"
> >
> >Signed-off-by: Dan Carpenter<error27@gmail.com>
> 
> Acked-by: Pekka Enberg <penberg@kernel.org>

Heh, someone else already sent me this patch, it's on the way to Linus
shortly.

thanks,

greg k-h
