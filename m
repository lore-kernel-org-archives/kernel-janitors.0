From: Andi Kleen <ak@linux.intel.com>
Date: Thu, 29 Jul 2010 09:51:00 +0000
Subject: Re: [PATCH 04/10] x86: mce: fix error handling
Message-Id: <4C514F04.80603@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280335185-23265-1-git-send-email-segooon@gmail.com> <4C5063D4.4070108@linux.intel.com> <20100728171327.GA24149@albatros> <4C5066CB.7010009@linux.intel.com> <20100729093511.GB7143@albatros>
In-Reply-To: <20100729093511.GB7143@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Borislav Petkov <borislav.petkov@amd.com>, linux-kernel@vger.kernel.org


> IMO memmory allocation fails are dangerous in kernel mode. As it is
> probably not exploitable because of boot time, it can destroy some
> sensitive data like dirty disk caches those are going to be written on
> disk.

It's true for runtime, but not for normal boot time.

Anyways if it happens on boot time the only thing you can do is panic, 
but someone else
will likely panic anyways for you. Just ignoring it like your patch 
effectively does
(because nothing will ever look at the ENOMEMs for an initcall) is wrong 
though
In this case it's actually better to oops like the original code does.

BTW even with your patch likely later code will crash anyways because it 
doesn't
expect init code to fail.

-Andi

