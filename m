From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Fri, 26 Jan 2007 17:42:27 +0000
Subject: Re: [KJ] is CONFIG_UNWIND_INFO still a live kernel config choice?
Message-Id: <20070126094227.4a2ab84c.randy.dunlap@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701261210130.26996@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701261210130.26996@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 26 Jan 2007 12:11:22 -0500 (EST) Robert P. J. Day wrote:

> 
>   there's only a single test in the entire source tree for that
> variable in include/asm-i386/dwarf2.h, but nothing else checks it and
> nothing sets it.  is this a dead setting?

It was not working in all cases.  Linus finally had enough of it
and reverted the code.  I expect that the Novell developer who
wrote it will eventually try to merge it again, but it could be
cleaned up completely until then.

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
