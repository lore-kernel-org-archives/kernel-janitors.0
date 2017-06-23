From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Jun 2017 10:44:06 +0000
Subject: [bug report] clocksource/drivers: Add timer-of common init routine
Message-Id: <20170623104405.GA29841@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Daniel Lezcano,

The patch dc11bae78529: "clocksource/drivers: Add timer-of common
init routine" from Jun 5, 2017, leads to the following static checker
warning:

	drivers/clocksource/timer-of.c:160 timer_of_init()
	error: uninitialized symbol 'ret'.

drivers/clocksource/timer-of.c
   131  int __init timer_of_init(struct device_node *np, struct timer_of *to)
   132  {
   133          int ret;
   134          int flags = 0;
   135  
   136          if (to->flags & TIMER_OF_BASE) {
   137                  ret = timer_base_init(np, &to->of_base);
   138                  if (ret)
   139                          goto out_fail;
   140                  flags |= TIMER_OF_BASE;
   141          }
   142  
   143          if (to->flags & TIMER_OF_CLOCK) {
   144                  ret = timer_clk_init(np, &to->of_clk);
   145                  if (ret)
   146                          goto out_fail;
   147                  flags |= TIMER_OF_CLOCK;
   148          }
   149  
   150          if (to->flags & TIMER_OF_IRQ) {
   151                  ret = timer_irq_init(np, &to->of_irq);
   152                  if (ret)
   153                          goto out_fail;
   154                  flags |= TIMER_OF_IRQ;
   155          }
   156  
   157          if (!to->clkevt.name)
   158                  to->clkevt.name = np->name;
   159  out:
   160          return ret;
                ^^^^^^^^^^
Presumably one of the TIMER_OF_IRQ flags is always set, but there are no
callers so it's hard to tell.

   161  
   162  out_fail:
   163          if (flags & TIMER_OF_IRQ)
   164                  timer_irq_exit(&to->of_irq);
   165  
   166          if (flags & TIMER_OF_CLOCK)
   167                  timer_clk_exit(&to->of_clk);
   168  



regards,
dan carpenter
