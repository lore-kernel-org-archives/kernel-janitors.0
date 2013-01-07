From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 07 Jan 2013 09:00:36 +0000
Subject: [PATCH 0/2] reposition free_irq to avoid access to invalid data
Message-Id: <1357552816-6046-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

The data referenced by an interrupt handler should not be freed before the
interrupt is ended.

The semantic match that finds this problem is as follows
(http://coccinelle.lip6.fr/).  The basic idea behind this semantic match is
to find cases where the order of the call to free_irq is different than its
order in some error-handling code.  This semantic match, however, has a
high rate of false positives, because most of the time the order doesn't
seem to matter.

// <smpl>
@fn exists@
expression list es;
expression a,b;
identifier f;
@@

if (...) {
  ... when any
  free_irq(a,b);
  ... when any
  f(es);
  ... when any
  return ...;
}

@@
expression list fn.es;
expression fn.a,fn.b;
identifier fn.f;
@@

*f(es);
... when any
*free_irq(a,b);
// </smpl>

