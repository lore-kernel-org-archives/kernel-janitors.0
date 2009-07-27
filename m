From: Greg KH <gregkh@suse.de>
Date: Mon, 27 Jul 2009 19:20:30 +0000
Subject: Re: [PATCH] Staging: hv: Transform typedef HANDLE into void *
Message-Id: <20090727192030.GA4201@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907272111.35259.npalix@diku.dk>
In-Reply-To: <200907272111.35259.npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Palix <npalix@diku.dk>
Cc: hjanssen@microsoft.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jul 27, 2009 at 09:11:34PM +0200, Nicolas Palix wrote:
> 
> Remove typedef HANDLE which aliases a void pointer and use void *
> anywhere HANDLE was used.

No, I would like to change this to be the "real" pointer that the HANDLE
was used for, instead of just a void pointer.  These need to point to
real structures.  I did this already for the locks, and can be done for
pretty much everything else as well.

> -int WorkQueueQueueWorkItem(HANDLE hWorkQueue, PFN_WORKITEM_CALLBACK workItem, void* context)
> +int WorkQueueQueueWorkItem(void *hWorkQueue, PFN_WORKITEM_CALLBACK workItem, void *context)
>  {
>  	WORKQUEUE *wq = (WORKQUEUE *)hWorkQueue;

Here's an example.  This should really be a pointer to a "work queue"
and not a void pointer at all.  Changes like that would be gladly
accepted.

thanks,

greg k-h
