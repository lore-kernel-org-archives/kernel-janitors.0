From: Andy Lutomirski <luto@amacapital.net>
Date: Mon, 13 Jun 2016 21:14:39 +0000
Subject: Re: [patch] x86/ldt: silence a static checker warning
Message-Id: <CALCETrV0h+rAFBsjFGeLFGhzVOs3snHGVV=ECKDeXhpC1-mkjA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160613065755.GC5993@mwanda>
In-Reply-To: <20160613065755.GC5993@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Andy Lutomirski <luto@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Jan Beulich <JBeulich@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, Jun 12, 2016 at 11:57 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> It likely doesn't make a difference but my static checker complains
> that we put an upper bound on "size" but not a lower bound.  Let's just
> make it unsigned.

Shouldn't oldsize and newsize in write_ldt as well as the "size"
member in ldt_struct change, too?

--Andy
