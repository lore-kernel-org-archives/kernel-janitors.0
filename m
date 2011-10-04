From: Grant Edwards <grant.edwards@comtrol.com>
Date: Tue, 04 Oct 2011 17:14:53 +0000
Subject: Re: FW: puzzle for puzzle lovers
Message-Id: <20111004171453.GA6163@comtrol.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111004072631.GA18470@longonot.mountain>
In-Reply-To: <20111004072631.GA18470@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Oct 04, 2011 at 07:55:44PM +0300, Dan Carpenter wrote:

> Wow.  Thanks for your response.
> 
> Kernel-janitors is sort of a newbie list, and people email me often
> ask for something to look at.  As I mentioned in my email, I was
> pretty sure the code worked.

I'm pretty sure it worked at some point in the past. :)

I don't know that any of the kernel maintainers have hardware to test
with, and we concentrate on our version of the driver that supports a
wide range of kernel versions.

> But I thought it would make a good code reading exercise for someone.

Parts of that driver are actually based on what was originally a
library of DOS code from 25 years ago, so some of it is rather oddly
structured.

> But you _nailed_ it.  You nailed it to a basketball and then slam
> dunked it!
> 
> Btw, I'm sorry if someone forwarded this to you as a support request.

Somebody here just happened to notice it and thought I might find it
interesting.  I only put that disclaimer on there because I copied the
mailing list and I assume it would be publically visible.

> I didn't mean to bother the maintainers with this.

I checked our supported driver, and it has the same problem with
pc104_1[] through pc104_4[] being 8 elements when they need to be 32.
Depending on what value get's grabbed off the ends of those arrays, I
think it might potentially cause a problem for 16- and 32-port ISA
boards.  I'm going to fix that in our driver, though I don't know how
many ISA boards are still in use out there. :)

-- 
Grant




