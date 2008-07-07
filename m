From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 07 Jul 2008 10:14:47 +0000
Subject: Re: round_jiffies() question
Message-Id: <20080707101446.GW14894@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6d291e080807062052n16073eb4t53c88f09df430c6e@mail.gmail.com>
In-Reply-To: <6d291e080807062052n16073eb4t53c88f09df430c6e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Jul 06, 2008 at 10:52:50PM -0500, Stoyan Gaydarov wrote:
> I was just wondering when should round_jiffies() be used instead of
> assigning the timer expiration with a specific jiffies value? Is the
> round_jiffies() function call beneficial everywhere or just some
> places?

round_jiffies() is used to improve the effectiveness of power
management.  By making sure that timers go off at the same time rather
than staggered, we can keep the processor in deep sleep states for
longer.  So it's always beneficial to use it but some places will see
more benefit than others.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
