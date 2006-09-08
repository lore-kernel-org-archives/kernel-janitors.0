From: Russell King <rmk@arm.linux.org.uk>
Date: Fri, 08 Sep 2006 07:08:06 +0000
Subject: Re: [KJ] [PATCH 00/72] arm: add KERN_ constants to files in
Message-Id: <20060908070806.GA9039@flint.arm.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060908015622.10114.66478.sendpatchset@david.homenet>
In-Reply-To: <20060908015622.10114.66478.sendpatchset@david.homenet>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 07, 2006 at 11:24:48PM -0400, Jim Nelson wrote:
> Matthew Wilcox wrote:
> > On Thu, Sep 07, 2006 at 09:56:22PM -0400, James Nelson wrote:
> >> This series of patches add appropriate KERN_ constants to printk()s in the rest of
> >> the files in /arch/arm.  It also reworks some debug #defines to make their operation
> >> more clear.
> > 
> > Posting a 72 part series is completely unreasonable.  Never do this again.
> > Find a better way of splitting it up -- maybe by directory.  One patch
> > per file is ridiculous.
> 
> You are right.  I will have to re-work the script I use to package everything up
> - I haven't done this much work in one shot before...

I also don't understand why you've sent several series of almost one patch
per file for ARM.

Please do as Matthew suggests - I won't be applying these as is.  Thanks.

-- 
Russell King
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
