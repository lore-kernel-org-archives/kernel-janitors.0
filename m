From: Greg KH <greg@kroah.com>
Date: Thu, 11 Mar 2004 18:56:07 +0000
Subject: [Kernel-janitors] Re: [PATCH] class_register() always returns 0
Message-Id: <20040311185607.GB20223@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Mar 05, 2004 at 09:24:56AM -0800, Leann Ogasawara wrote:
> Hi All,
> 
> I noticed that the class_register() function in drivers/base/class.c
> always returns 0 and thus will never fail.  Patch below inserts simple
> error checking to return any errors if they occur.  Feedback welcome. 
> Thanks,

Looks good, applied, thanks.

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
