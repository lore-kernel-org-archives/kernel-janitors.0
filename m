From: Steven Rostedt <rostedt@goodmis.org>
Date: Sat, 19 Jul 2014 01:31:38 +0000
Subject: Re: How to automate checkpatch && get_maintainers && git send-email of commits range?
Message-Id: <20140719013138.GA21252@home.goodmis.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CANZNk81LiTM9vY0dRV=T0BCT9k-BxU45Ojw_PyOcpdmtXHKM2Q@mail.gmail.com>
	<20140718222215.GF18775@thunk.org>
In-Reply-To: <20140718222215.GF18775@thunk.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Fri, Jul 18, 2014 at 06:22:15PM -0400, Theodore Ts'o wrote:
> 
> And then think very hard about which patches people need to see in
> order to be able to evaluate a patch.  For example, if you have patch
> 1 out of a series which adds a new function, and then patches 2
> through 1000 modify a thousand different drivers to use that new
> function, if you use an automated get_maintainers.pl script to send
> each patch to just the maintainer, then the device driver maintainer
> might not see patch #1 which is critical context to understanding the
> patch that you want to make to his driver.  And then you will have
> several hundred very angry and annoyed developers wondering why you
> sent them patch 345/1000, with no other context, and wondering what
> the heck they are supposed to do with the email that you have just
> launched into their inbox.

I'm still stuck in the old stone/quilt age, where I use quilt mail to
send my patch bombs. Although, I have scripts that pulls my patches out
from git with format-patch, and then creates a quilt queue from them.
I do this for that very reason that I want to review all patches before
I hit send, and quilt mail is very basic and sends what I tell it.
I still a bit gun shy from using git sendmail as I never got that to
work (note, the last time I tried, it was still doing the staircase
threads with patches by default).

I'm still content with quilt, but the one thing I don't care about it
is that all Cc'd on the 0/1000 patch gets Cc'd on all patches. I wish
there was a way to tell quilt that they should only get Cc'd on the
cover patch and no more, unless the patch has them Cc'd. The reason this
bothers me is that I tend to do exactly what you stated above. I will
just Cc patch 345/1000 to someone with no context of what that patch
is.

I figured people would do the same thing that I do when I get that 345th
patch. As I'm subscribed to LKML, I will just go into my lkml folder and
search for that patch and see how that thread applies to me with full
context. I'm assuming that's what others may do too.

-- Steve

