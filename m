From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 17 Jul 2007 21:36:45 +0000
Subject: Re: should in-tree kernel source accommodate older kernel versions?
Message-Id: <Pine.LNX.4.64.0707171735300.19294@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0707171718450.18509@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0707171718450.18509@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 17 Jul 2007, Matthew Wilcox wrote:

> On Tue, Jul 17, 2007 at 05:22:56PM -0400, Robert P. J. Day wrote:
> >   should kernel source that's in the current source tree still try to
> > accommodate older kernel versions?  as an example, this is from
>
> This has been discussed before, and the current thinking is to
> remove support for versions of the kernel older than 2.6.0.

*that* part was self-evident.  i'm talking more specifically about
older versions of 2.6.x, in particular features that aren't even
*supported* anymore in the current tree.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
