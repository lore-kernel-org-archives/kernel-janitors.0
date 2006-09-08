From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 08 Sep 2006 02:29:22 +0000
Subject: Re: [KJ] [PATCH 00/72] arm: add KERN_ constants to files in
Message-Id: <20060908022921.GX2558@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060908015622.10114.66478.sendpatchset@david.homenet>
In-Reply-To: <20060908015622.10114.66478.sendpatchset@david.homenet>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 07, 2006 at 09:56:22PM -0400, James Nelson wrote:
> This series of patches add appropriate KERN_ constants to printk()s in the rest of
> the files in /arch/arm.  It also reworks some debug #defines to make their operation
> more clear.

Posting a 72 part series is completely unreasonable.  Never do this again.
Find a better way of splitting it up -- maybe by directory.  One patch
per file is ridiculous.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
