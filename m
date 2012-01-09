From: Greg KH <gregkh@suse.de>
Date: Mon, 09 Jan 2012 22:47:55 +0000
Subject: Re: [PATCH 00/16] Some work on quickstart driver in staging
Message-Id: <20120109224755.GA11229@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326147815-11451-1-git-send-email-szymon@janc.net.pl>
In-Reply-To: <1326147815-11451-1-git-send-email-szymon@janc.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jan 09, 2012 at 11:23:19PM +0100, Szymon Janc wrote:
> Hi,
> 
> While investigating an issue (for which I'll send a separate email) with
> quickstart on my laptop I tried to make driver a little bit closer to
> migration from staging to mainline. So, patches below fix some small issues
> with whitespace, memleak, use of standard kernel API etc.
> 
> I know that some of those patches are probably a matter of taste so please
> comment.

I will after the merge window is over (after 3.3-rc1 is out) and I have
a chance to look at these.

thanks,

greg k-h
