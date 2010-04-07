From: Ralf Baechle <ralf@linux-mips.org>
Date: Wed, 07 Apr 2010 17:04:32 +0000
Subject: Re: [PATCH 4/7] arch/mips/kernel: Use set_cpus_allowed_ptr
Message-Id: <20100407170432.GB26242@linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1003262302480.6480@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1003262302480.6480@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: peterz@infradead.org, mingo@elte.hu, tglx@linutronix.de, oleg@redhat.com, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Mar 26, 2010 at 11:03:07PM +0100, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> Use set_cpus_allowed_ptr rather than set_cpus_allowed.

Thanks Julia, queued for 2.6.35.

  Ralf
