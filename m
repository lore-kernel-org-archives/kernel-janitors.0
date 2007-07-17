From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 17 Jul 2007 15:57:31 +0000
Subject: Re: [KJ] [PATCH] Removal of compiler warnings in ipc/msg.c
Message-Id: <20070717155731.GC14791@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <efa8e58e0707170238g9eda0e5rfa435afd30a4c3ef@mail.gmail.com>
In-Reply-To: <efa8e58e0707170238g9eda0e5rfa435afd30a4c3ef@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jul 17, 2007 at 11:38:19AM +0200, Rune V. Sj??en wrote:
> Hello, this is my first patch so please be gentle.
> It fixes some compiler warnings in ipc/msg.c
> 
> ipc/msg.c: In function 'sys_msgctl':
> ipc/msg.c:388: warning: 'setbuf.qbytes' may be used uninitialized in
> this function

These warnings are bogus -- it would be more helpful to look at
making GCC smarter so it doesn't emit this warning in this particular
case.  I can prove quite easily that all paths to uses of qbytes
initialise it.

-- 
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
