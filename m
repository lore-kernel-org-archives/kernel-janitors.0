From: Greg KH <greg@kroah.com>
Date: Wed, 14 Jan 2004 19:46:59 +0000
Subject: Re: [Kernel-janitors] Kconfig cleanups
Message-Id: <20040114194659.GN6107@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040114065742.GG10711@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20040114065742.GG10711@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jan 14, 2004 at 06:57:42AM +0000, Matthew Wilcox wrote:
> 
> It's not clear to me whether this works better split up into many smaller
> patches or not.  I'm happy to do that if people feel it's worthwhile.
> 
> This patch attempts to reduce the number of inappropriate questions being
> asked by menuconfig.

I picked out the i2c specific pieces here and applied them to my tree to
send to Linus.

And PLEASE generate these patches so they can be applied with -p1, you
should know better :)

thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
