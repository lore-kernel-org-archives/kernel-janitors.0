From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sat, 31 Jul 2010 18:18:45 +0000
Subject: Re: [PATCH 04/10] x86: mce: fix error handling
Message-Id: <20100731181845.GB9378@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280335185-23265-1-git-send-email-segooon@gmail.com>
 <4C5063D4.4070108@linux.intel.com>
 <20100728171327.GA24149@albatros>
 <4C5066CB.7010009@linux.intel.com>
 <20100729093511.GB7143@albatros>
 <4C514F04.80603@linux.intel.com>
 <4C51538C.1090803@bfs.de>
In-Reply-To: <4C51538C.1090803@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Andi Kleen <ak@linux.intel.com>, kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Borislav Petkov <borislav.petkov@amd.com>, linux-kernel@vger.kernel.org

On Thu, Jul 29, 2010 at 12:10 +0200, walter harms wrote:
> 
> 
> Andi Kleen schrieb:
> > 
> >> IMO memmory allocation fails are dangerous in kernel mode. As it is
> >> probably not exploitable because of boot time, it can destroy some
> >> sensitive data like dirty disk caches those are going to be written on
> >> disk.
> > 
> > It's true for runtime, but not for normal boot time.
> > 
> > Anyways if it happens on boot time the only thing you can do is panic,
> > but someone else
> > will likely panic anyways for you. Just ignoring it like your patch
> > effectively does
> > (because nothing will ever look at the ENOMEMs for an initcall) is wrong
> > though
> > In this case it's actually better to oops like the original code does.
> > 
> > BTW even with your patch likely later code will crash anyways because it
> > doesn't
> > expect init code to fail.
> > 
> 
> NTL it is nice to have a error message. for users it is worse if you crash suddenly
> with out warning than having a crash with "OOM" before because it gives you a clue
> what is going on.
> short:
> please think of users that are not kernel developers give them a hint what went wrong.
> 
> to make thinks more easy on boot we could replace kalloc() with kmalloc_or_die().
The thing is that this driver does not call kmalloc() explicitly, it
uses function those call functions those call kmalloc() :)

If we call BUG_ON() in init code, it would not make big overhead and
would make fault exactly when bug was detected, independent from caller
checks. Andi, are you fine with it?

> When anyone runs out of mem on boottime you can panic() instantly.
> 
> just my to cents,
>  wh
> 
