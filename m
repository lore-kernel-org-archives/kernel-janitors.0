From: Dan Carpenter <error27@gmail.com>
Date: Sun, 20 Feb 2011 13:09:50 +0000
Subject: Re: [patch -next] x86, microcode, AMD: signedness bug in
Message-Id: <20110220130950.GC1898@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110218091716.GA4384@bicker>
 <20110220130214.GD25700@elte.hu>
In-Reply-To: <20110220130214.GD25700@elte.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: Andreas Herrmann <andreas.herrmann3@amd.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <borislav.petkov@amd.com>, "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>, "open list:AMD MICROCODE UPD..." <amd64-microcode@amd64.org>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, Feb 20, 2011 at 02:02:14PM +0100, Ingo Molnar wrote:
> 
> * Dan Carpenter <error27@gmail.com> wrote:
> 
> > install_equiv_cpu_table() returns type int.  It uses negative error
> > codes so using an unsigned type breaks the error handling.
> 
> How did you notice this btw - did GCC throw a warning?
> 

It's a smatch warning.

arch/x86/kernel/microcode_amd.c +256 generic_load_microcode(12)
	warn: unsigned 'offset' is never less than zero.

regards,
dan carpenter
