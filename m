From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 09 Jan 2007 04:15:30 +0000
Subject: Re: [KJ] Regarding in_interrupt()
Message-Id: <20070109041530.GB22659@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <adfc68cb0701081946q56cb32e4y3bdfb1888fb028eb@mail.gmail.com>
In-Reply-To: <adfc68cb0701081946q56cb32e4y3bdfb1888fb028eb@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jan 09, 2007 at 09:16:05AM +0530, Sudheer YSV wrote:
> As you know  in_interrupt() returns non zero if the kernel is in interrupt
> context.(ie in interrupt handler or bottom half).
> But in a SMP systems, if one CPU is in interrupt context and another CPU is
> in process contex, then what will be the
> result of in_interrupt().

It only tells you about the local CPU.  Why would you want to know about
a different CPU?

It would be good to stop exporting in_interrupt() to modules.  Most uses
of it in drivers are bugs.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
