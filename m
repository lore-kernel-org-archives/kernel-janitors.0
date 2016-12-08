From: Andy Lutomirski <luto@amacapital.net>
Date: Thu, 08 Dec 2016 22:29:54 +0000
Subject: Re: [patch] x86/ldt: make a size variable unsigned
Message-Id: <CALCETrXaiSe8kYwZC1=16Rx=38F2zJKNDxeuwnAT3-POQw=RbQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161208105602.GA11382@elgon.mountain>
In-Reply-To: <20161208105602.GA11382@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Andy Lutomirski <luto@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Dec 8, 2016 at 2:56 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> My static checker complains that we put an upper bound on the "size"
> variable but not a lower bound.  The checker is not smart enough to know
> the possible ranges of "old_mm->context.ldt->size" from
> init_new_context_ldt() so it thinks maybe it could be negative.
>
> Let's make it unsigned to silence the warning and future proof the code
> a bit.

Acked-by: Andy Lutomirski <luto@kernel.org>
