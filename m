From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 22 Jul 2008 19:53:30 +0000
Subject: Re: [PATCH retry] arch/ia64/kvm/kvm-ia64.c: Add local_irq_restore in error handling code
Message-Id: <20080722195329.GG7337@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0807222137350.2670@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0807222137350.2670@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: avi@qumranet.com, kvm@vger.kernel.org, xiantao.zhang@intel.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jul 22, 2008 at 09:38:18PM +0200, Julia Lawall wrote:
> There is a call to local_irq_restore in the normal exit case, so it would
> seem that there should be one on an error return as well.

Patch looks good to me:

Reviewed-by: Matthew Wilcox <willy@linux.intel.com>

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
