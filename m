From: Matthew Wilcox <matthew@wil.cx>
Date: Thu, 16 Aug 2007 11:24:02 +0000
Subject: Re: debug printk's
Message-Id: <20070816112402.GI16277@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070816070719.550CB179C7E@place.org>
In-Reply-To: <20070816070719.550CB179C7E@place.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Aug 16, 2007 at 02:07:19AM -0500, Paul Jimenez wrote:
> So: 187 definitions of dprintk and 130 definitions of DPRINTK.  Plus
> 10 mixed-case fans and various and sundry miscellaneous versions.  Note
> this is not *uses*, it's the number of *definitions*.
> 
> So, to clarify my original question a bit: is there policy we can refer
> to to justify cleaning this up?

pr_debug() in include/linux/kernel.h, which also refers to dev_dbg(),
neither of which you mentioned ;-)

But take it slowly, co-ordinate with the driver author, and don't try to
tell people that it's policy -- it's a best practice, sure, but people
are free to ignore it if it makes their life easier.

-- 
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
