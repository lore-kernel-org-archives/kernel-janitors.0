From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Apr 2014 10:48:44 +0000
Subject: re: clk: ti: add support for basic mux clock
Message-Id: <20140402104844.GB19427@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Tero Kristo,

The patch 6a369c584fbe: "clk: ti: add support for basic mux clock"
from Sep 13, 2013, leads to the following static checker warning:

	drivers/clk/ti/mux.c:52 ti_clk_mux_get_parent()
	warn: signedness bug returning '(-22)'

drivers/clk/ti/mux.c
    30  static u8 ti_clk_mux_get_parent(struct clk_hw *hw)
    31  {
    32          struct clk_mux *mux = to_clk_mux(hw);
    33          int num_parents = __clk_get_num_parents(hw->clk);
    34          u32 val;
    35  
    36          /*
    37           * FIXME need a mux-specific flag to determine if val is bitwise or
    38           * numeric. e.g. sys_clkin_ck's clksel field is 3 bits wide, but ranges
    39           * from 0x1 to 0x7 (index starts at one)
    40           * OTOH, pmd_trace_clk_mux_ck uses a separate bit for each clock, so
    41           * val = 0x4 really means "bit 2, index starts at bit 0"
    42           */
    43          val = ti_clk_ll_ops->clk_readl(mux->reg) >> mux->shift;
    44          val &= mux->mask;
    45  
    46          if (mux->table) {
    47                  int i;
    48  
    49                  for (i = 0; i < num_parents; i++)
    50                          if (mux->table[i] = val)
    51                                  return i;
    52                  return -EINVAL;
                        ^^^^^^^^^^^^^^
Not a u8.

    53          }
    54  
    55          if (val && (mux->flags & CLK_MUX_INDEX_BIT))
    56                  val = ffs(val) - 1;
    57  
    58          if (val && (mux->flags & CLK_MUX_INDEX_ONE))
    59                  val--;
    60  
    61          if (val >= num_parents)
    62                  return -EINVAL;
                         ^^^^^^^^^^^^^
Same.

    63  
    64          return val;
    65  }

regards,
dan carpenter
