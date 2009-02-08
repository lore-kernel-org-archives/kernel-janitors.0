From: Matthew Wilcox <matthew@wil.cx>
Date: Sun, 08 Feb 2009 23:09:10 +0000
Subject: Re: [PATCH] kernel/irq: fix sparse warning: make symbol static
Message-Id: <20090208230910.GH31509@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090208192405.8084.89231.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090208192405.8084.89231.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: Ingo Molnar <mingo@elte.hu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Feb 08, 2009 at 08:24:47PM +0100, Hannes Eder wrote:
> -static inline int do_irq_select_affinity(int irq, struct irq_desc *desc)
> +static inline int do_irq_select_affinity(unsigned int irq, struct irq_desc *desc)

Does this not introduce a checkpatch warning about a line being longer
than 80 columns?  Three acceptable ways to fix this:

static inline
int do_irq_select_affinity(unsigned int irq, struct irq_desc *desc)

static inline int do_irq_select_affinity(unsigned int irq,
							struct irq_desc *desc)

static inline int do_irq_select_affinity(unsigned irq, struct irq_desc *desc)

My favourite is the last one.

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
