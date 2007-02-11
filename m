From: Greg KH <greg@kroah.com>
Date: Sun, 11 Feb 2007 21:33:10 +0000
Subject: Re: [KJ] memory zeroing macros
Message-Id: <20070211213310.GA16343@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702101731480.6852@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702101731480.6852@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Feb 11, 2007 at 03:34:34PM -0500, burns.ethan@gmail.com wrote:
> On Sun, Feb 11, 2007 at 04:32:11AM -0500, Robert P. J. Day wrote:
> > or maybe this really is just not worth the effort.  who knows?
> 
> I don't think its worth the effort.  Changing the name on this wouldn't add
> any readability.  memset(dest, 0, len) is very clear, in my opinion.  Also,
> there's nothing really error prone about it...  I see no advantage.

Not true at all, 0 and len get switched a lot accidentally.  See the
archives for times people have swept the kernel tree to fix this issue
up.

thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
