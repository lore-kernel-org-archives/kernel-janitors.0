From: Greg KH <greg@kroah.com>
Date: Fri, 13 Feb 2004 20:42:07 +0000
Subject: Re: [Kernel-janitors] [PATCH] - 2.6.2 - security.h - compiler cleanups
Message-Id: <20040213204207.GD14048@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200402122141.59608.ron@rongage.org>
In-Reply-To: <200402122141.59608.ron@rongage.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Feb 12, 2004 at 09:41:59PM -0500, Ron Gage wrote:
> Well, it's probably useless, but I like clean compiles.
> 
> This "large" patch eliminates a bunch of "parameter defined but not used" 
> warnings in the kernel.  The problems surround the stub functions in 
> security.h that haven't been coded yet.

What compiler version are you using that you see these "warnings"?  I
don't see them here using 3.3.2.

And I really don't think that any kernel developer will accept these
patches, I know I sure will not.

Oh yeah, isn't there a gcc __attribute__ that will also turn off the
warning?

thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
