From: Randy Dunlap <rdunlap@xenotime.net>
Date: Thu, 28 Dec 2006 15:49:04 +0000
Subject: Re: [KJ] what is the flow of patch submissions to the KJ list?
Message-Id: <20061228074904.988d4d71.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0612231301420.15621@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0612231301420.15621@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 23 Dec 2006 13:03:24 -0500 (EST) Robert P. J. Day wrote:

> 
>   i'm curious as to the flow of patch submissions to this list.  if
> one is just submitting things like typo fixes, things like that are
> not really worth cluttering up the LKML.  but if they're submitted
> here, by what path do they eventually work their way to the main tree?

There's no formal answer to that.  Some subsystem maintainers
pick up patches from this KJ mailing list (e.g., ALSA, USB, netdev),
so it helps to cc: them on KJ patches.

For patches that are not picked up by another maintainer, the idea
is to roll them into a KJ patchset, let that mature a bit, and then
forward them either to their appropriate subsystem maintainer or
to Andrew Morton or Linus for merging.


>   is there a git repo just for the KJ tree?  or how does it work?

MAINTAINERS file doesn't list a git repo or quilt patchset etc.,
although AFAIK Alexey has been putting quilt patchsets at
http://coderock.org/kj/

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
