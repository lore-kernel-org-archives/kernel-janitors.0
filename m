From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Apr 2014 10:48:14 +0000
Subject: re: clk: qcom: Add support for root clock generators (RCGs)
Message-Id: <20140402104814.GA19427@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Stephen Boyd,

The patch bcd61c0f535a: "clk: qcom: Add support for root clock
generators (RCGs)" from Jan 15, 2014, leads to the following static
checker warning:

	drivers/clk/qcom/clk-rcg2.c:79 clk_rcg2_get_parent()
	warn: signedness bug returning '(-22)'

drivers/clk/qcom/clk-rcg2.c
    61  static u8 clk_rcg2_get_parent(struct clk_hw *hw)
    62  {
    63          struct clk_rcg2 *rcg = to_clk_rcg2(hw);
    64          int num_parents = __clk_get_num_parents(hw->clk);
    65          u32 cfg;
    66          int i, ret;
    67  
    68          ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
    69          if (ret)
    70                  return ret;
    71  
    72          cfg &= CFG_SRC_SEL_MASK;
    73          cfg >>= CFG_SRC_SEL_SHIFT;
    74  
    75          for (i = 0; i < num_parents; i++)
    76                  if (cfg = rcg->parent_map[i])
    77                          return i;
    78  
    79          return -EINVAL;
                ^^^^^^^^^^^^^^
    80  }

See also:

        drivers/clk/qcom/clk-rcg.c:57 clk_rcg_get_parent()
        warn: signedness bug returning '(-22)'

	drivers/clk/qcom/clk-rcg.c:86 clk_dyn_rcg_get_parent()
	warn: signedness bug returning '(-22)'

regards,
dan carpenter
