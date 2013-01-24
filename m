From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Jan 2013 19:15:32 +0000
Subject: re: clk: basic clock hardware types
Message-Id: <20130124191532.GA8596@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Mike Turquette,

The patch 9d9f78ed9af0: "clk: basic clock hardware types" from Mar 
15, 2012, leads to the following warning:
drivers/clk/clk-mux.c:54 clk_mux_get_parent()
	 warn: signedness bug returning '(-22)'

drivers/clk/clk-mux.c
    32  static u8 clk_mux_get_parent(struct clk_hw *hw)
    33  {
    34          struct clk_mux *mux = to_clk_mux(hw);
    35          u32 val;
    36  
    37          /*
    38           * FIXME need a mux-specific flag to determine if val is bitwise or numeric
    39           * e.g. sys_clkin_ck's clksel field is 3 bits wide, but ranges from 0x1
    40           * to 0x7 (index starts at one)
    41           * OTOH, pmd_trace_clk_mux_ck uses a separate bit for each clock, so
    42           * val = 0x4 really means "bit 2, index starts at bit 0"
    43           */
    44          val = readl(mux->reg) >> mux->shift;
    45          val &= (1 << mux->width) - 1;
    46  
    47          if (val && (mux->flags & CLK_MUX_INDEX_BIT))
    48                  val = ffs(val) - 1;
    49  
    50          if (val && (mux->flags & CLK_MUX_INDEX_ONE))
    51                  val--;
    52  
    53          if (val >= __clk_get_num_parents(hw->clk))
    54                  return -EINVAL;
                        ^^^^^^^^^^^^^^^
The return type is u8 so -EINVAL gets truncated to 234.  None of the
caller check for error so it could result in memory corruption.

    55  
    56          return val;
    57  }

regards,
dan carpenter

