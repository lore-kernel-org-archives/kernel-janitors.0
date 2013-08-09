From: Joe Perches <joe@perches.com>
Date: Fri, 09 Aug 2013 03:30:38 +0000
Subject: Re: [PATCH]arch:avr32:kernel:time.c: Removed IRQF_DISABLED
Message-Id: <1376019038.2087.50.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376018243-8565-1-git-send-email-kumargauravgupta3@gmail.com>
	 <52045FB3.9060001@gmail.com>
In-Reply-To: <52045FB3.9060001@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Gaurav <kumargauravgupta3@gmail.com>
Cc: hskinnemoen@gmail.com, egtvedt@samfundet.no, tglx@linutronix.de, srivatsa.bhat@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 2013-08-09 at 08:49 +0530, Kumar Gaurav wrote:
> Please ignore the below patch. I'll be resending this with 0 instead of 
> IRQF_TRIGGER_NONE

Hey again Kumar.

This is one of those patches that should just have
IRQF_DISABLED completely elided.

> On Friday 09 August 2013 08:47 AM, Kumar Gaurav wrote:
[]
> > diff --git a/arch/avr32/kernel/time.c b/arch/avr32/kernel/time.c
[]
> > @@ -59,7 +59,7 @@ static irqreturn_t timer_interrupt(int irq, void *dev_id)
[]
> > -	.flags		= IRQF_TIMER | IRQF_DISABLED | IRQF_SHARED,
> > +	.flags		= IRQF_TIMER | IRQF_TRIGGER_NONE | IRQF_SHARED,

	.flags		= IRQF_TIMER | IRQF_SHARED,


