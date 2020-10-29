From: Peter Zijlstra <peterz@infradead.org>
Date: Thu, 29 Oct 2020 12:04:42 +0000
Subject: Re: [PATCH] x86/unwind: remove unneeded initialization
Message-Id: <20201029120442.GP2628@hirez.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201028122102.24202-1-lukas.bulwahn@gmail.com>
 <a28022479f594650a6d98adac3c4a6f0@bfs.de>
In-Reply-To: <a28022479f594650a6d98adac3c4a6f0@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walter Harms <wharms@bfs.de>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>, "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-safety@lists.elisa.tech" <linux-safety@lists.elisa.tech>

On Thu, Oct 29, 2020 at 11:49:50AM +0000, Walter Harms wrote:
> this looks like a reimplementation of bsearch()
> perhaps the maintainer can add a comment why the 
> kernel implementation is not suitable here ?

If you look carefully it doesn't do an exact match, which is what
bsearch() does.

bsearch() also isn't stable in the precense of duplicates.
