From: Greg KH <greg@kroah.com>
Date: Fri, 23 Mar 2007 18:41:44 +0000
Subject: Re: [KJ] replacing all "register_chrdev" with newer calls?
Message-Id: <20070323184144.GA6529@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703230928050.8701@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0703230928050.8701@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Mar 23, 2007 at 09:32:50AM -0400, Robert P. J. Day wrote:
> 
>   not sure if this is worth it, but is there any value to replacing
> the old-style register_chrdev() calls with the newer
> register_chrdev_region() calls?
> 
>   it's not as if the register_chrdev() routine has been marked for
> deletion anytime soon, so it may be easier to leave it as is.

I'd say leave it alone for now.

thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
