From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Nov 2019 06:22:32 +0000
Subject: [bug report] misc: rtsx: Add support for RTS5261
Message-Id: <20191118064150.ambybsbmnx4treko@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Rui Feng,

The patch c0e5f4e73a71: "misc: rtsx: Add support for RTS5261" from
Oct 21, 2019, leads to the following static checker warning:

	drivers/misc/cardreader/rts5261.c:667 rts5261_pci_switch_clock()
	warn: impossible condition '(n > 396) => (0-255 > 396)'

drivers/misc/cardreader/rts5261.c
   657          pcr_dbg(pcr, "Internal SSC clock: %dMHz (cur_clock = %d)\n",
   658                  clk, pcr->cur_clock);
   659  
   660          if (clk = pcr->cur_clock)
   661                  return 0;
   662  
   663          if (pcr->ops->conv_clk_and_div_n)
   664                  n = (u8)pcr->ops->conv_clk_and_div_n(clk, CLK_TO_DIV_N);
   665          else
   666                  n = (u8)(clk - 4);
                        ^^^^^^^^^^^^^^^^^

   667          if ((clk <= 4) || (n > 396))
                                   ^^^^^^^
A u8 can only go up to 255.

   668                  return -EINVAL;
   669  
   670          mcu_cnt = (u8)(125/clk + 3);
   671          if (mcu_cnt > 15)
   672                  mcu_cnt = 15;
   673  

regards,
dan carpenter
