From: Andi Kleen <ak@linux.intel.com>
Date: Wed, 28 Jul 2010 17:20:11 +0000
Subject: Re: [PATCH 04/10] x86: mce: fix error handling
Message-Id: <4C5066CB.7010009@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280335185-23265-1-git-send-email-segooon@gmail.com> <4C5063D4.4070108@linux.intel.com> <20100728171327.GA24149@albatros>
In-Reply-To: <20100728171327.GA24149@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Borislav Petkov <borislav.petkov@amd.com>, linux-kernel@vger.kernel.org


> I'm agree with you that if allocation fails at boot time, we are dead :)
> But this coding style breaking rules that result from some functions
> _must_ be checked for errors. Maybe we should add BUG_ON() here or
> indicate someway that we have no ideas how to handle error?

What rules exactly? I don't think any of those functions are declared 
with __must_check

Coding style should never get in the way of what is right.

The classic way to explicitely discard a return value is a cast to void, 
but that is generally considered
ugly in the Linux kernel.

One could possibly add a comment about this at least.

-Andi

