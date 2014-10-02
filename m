From: Jyri Sarha <jsarha@ti.com>
Date: Thu, 02 Oct 2014 07:11:18 +0000
Subject: Re: clk: add gpio gated clock
Message-Id: <542CFA96.8000303@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141001143459.GA31403@mwanda>
In-Reply-To: <20141001143459.GA31403@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/01/2014 05:34 PM, Dan Carpenter wrote:
> Hello Jyri Sarha,
>
> The patch c873d14d30b8: "clk: add gpio gated clock" from Sep 5, 2014,
> leads to the following static checker warning:
>
> 	drivers/clk/clk-gpio-gate.c:123 clk_register_gpio_gate()
> 	warn: passing devm_ allocated variable to kfree. 'clk_gpio'
>
> drivers/clk/clk-gpio-gate.c
>      97          if (dev)
>      98                  clk_gpio = devm_kzalloc(dev, sizeof(struct clk_gpio),
>      99                                          GFP_KERNEL);
>     100          else
>     101                  clk_gpio = kzalloc(sizeof(struct clk_gpio), GFP_KERNEL);
>     102
>     103          if (!clk_gpio) {
>     104                  clk = ERR_PTR(-ENOMEM);
>     105                  goto clk_register_gpio_gate_err;
>     106          }
>     107
>     108          init.name = name;
>     109          init.ops = &clk_gpio_gate_ops;
>     110          init.flags = flags | CLK_IS_BASIC;
>     111          init.parent_names = (parent_name ? &parent_name : NULL);
>     112          init.num_parents = (parent_name ? 1 : 0);
>     113
>     114          clk_gpio->gpiod = gpiod;
>     115          clk_gpio->hw.init = &init;
>     116
>     117          clk = clk_register(dev, &clk_gpio->hw);
>     118
>     119          if (!IS_ERR(clk))
>     120                  return clk;
>     121
>     122          if (!dev)
>     123                  kfree(clk_gpio);
>                          ^^^^^^^^^^^^^^^
> It's complaing about this.  Obviously there is an "if (dev)" on the
> allocation side.  Also Smatch is supposed to be able to follow logic
> like that.  The other thing which may affect this, is that this is dead
> code.  Smatch tends to deliberately print error messages in dead code
> because Smatch is confused by dead code.
>
> Anyway, the point is that this API sucks.  If it ever stops being dead
> code then it's going to be a source of bugs.
>
> Also in the kernel we tend to frown on putting in code before there is
> a user for it.  So lets delete all the "if (dev) " code because that
> pointer is always NULL.
>
> regards,
> dan carpenter
>

In theory someone could call clk_register_gpio_gate() directly with a 
device pointer, but well he can call kfree() then too. I'll mail a patch 
in a minute.

Best regards,
Jyri
