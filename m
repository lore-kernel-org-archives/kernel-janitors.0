From: Jeff Garzik <jeff@garzik.org>
Date: Sun, 22 Oct 2006 22:00:32 +0000
Subject: Re: [KJ] make pdfdocs broken in 2.6.19rc2 and needs fixes
Message-Id: <453BEA00.4000601@garzik.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200610222347.42418.ak@suse.de>
In-Reply-To: <200610222347.42418.ak@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Andi Kleen wrote:
> When you do make pdfdocs  with 2.6.19rc2-git7 you get tons of error 
> messages and  then some corrupted PDFs in the end.
> 
> Fixing that (I suppose it will just need comment fixes and
> should not affect the code) should be a relatively easy task for 
> a newbie and  would be useful for the 2.6.19 release.

What userland were you using?  Unfortunately with 'make *docs' that matters.

Unquestionably, there is breakage regardless of distro.

	Jeff



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
