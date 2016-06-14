From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Jun 2016 10:44:29 +0000
Subject: Re: [patch] x86/ldt: silence a static checker warning
Message-Id: <20160614104429.GA32301@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160613065755.GC5993@mwanda>
 <CALCETrV0h+rAFBsjFGeLFGhzVOs3snHGVV=ECKDeXhpC1-mkjA@mail.gmail.com>
In-Reply-To: <CALCETrV0h+rAFBsjFGeLFGhzVOs3snHGVV=ECKDeXhpC1-mkjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Lutomirski <luto@amacapital.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Andy Lutomirski <luto@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Jan Beulich <JBeulich@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Jun 13, 2016 at 02:14:39PM -0700, Andy Lutomirski wrote:
> On Sun, Jun 12, 2016 at 11:57 PM, Dan Carpenter
> <dan.carpenter@oracle.com> wrote:
> > It likely doesn't make a difference but my static checker complains
> > that we put an upper bound on "size" but not a lower bound.  Let's just
> > make it unsigned.
> 
> Shouldn't oldsize and newsize in write_ldt as well as the "size"
> member in ldt_struct change, too?
> 

Part of the joy of this check is that it complains about every time we
cap the upper bound and not the lower bound so it's very thourough, but
it also requires very minimal changes to silence the false positives.

We know newsize can't be negative.  If we change this one variable
then we know oldsize and ldt_struct size can't be negative either.

The problem really is that I haven't figured out out to deal with
recursion...

	new_ldt = alloc_ldt_struct(old_mm->context.ldt->size);

On the first run through, we don't know the value of ->size here so we
have to assume it can be anything.

regards,
dan carpenter

