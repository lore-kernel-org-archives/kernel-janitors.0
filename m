From: Thomas Gleixner <tglx@linutronix.de>
Date: Fri, 25 Aug 2017 11:08:22 +0000
Subject: Re: [PATCH v2] irqdomain: potential Oops in irq_domain_push_irq()
Message-Id: <alpine.DEB.2.20.1708251306410.1883@nanos>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170825091000.z5taav6xj2yds6ch@mwanda>
In-Reply-To: <20170825091000.z5taav6xj2yds6ch@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, David Daney <david.daney@cavium.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 25 Aug 2017, Dan Carpenter wrote:

> This code generates a Smatch warning:
> 
>     kernel/irq/irqdomain.c:1511 irq_domain_push_irq()
>     warn: variable dereferenced before check 'root_irq_data' (see line 1508)
> 
> irq_get_irq_data() does sometimes return NULL pointers so it does look
> like this code could Oops.  I've moved the check for NULL earlier to
> fix this bug.

From Documentation/process/submitting-patches.rst:

 "Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
  instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
  to do frotz", as if you are giving orders to the codebase to change
  its behaviour."

Is it that hard to read _and_ understand what those instructions mean?

Thanks,

	tglx



