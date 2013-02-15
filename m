From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Feb 2013 10:34:28 +0000
Subject: re: atl1c: Atheros L1C Gigabit Ethernet driver
Message-Id: <20130215103428.GA4609@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Jie Yang,

The patch 43250ddd75a3: "atl1c: Atheros L1C Gigabit Ethernet driver"
from Feb 18, 2009, leads to the following Smatch warning:
"drivers/net/ethernet/atheros/atl1c/atl1c_hw.c:472 atl1c_phy_setup_adv()
	 warn: odd binop '0x300 & 0xfffffffffffffcff'"

[ This check as too many false positives so I haven't released it ]

drivers/net/ethernet/atheros/atl1c/atl1c_hw.c
   472          u16 mii_giga_ctrl_data = GIGA_CR_1000T_DEFAULT_CAP &
   473                                  ~GIGA_CR_1000T_SPEED_MASK;

The defines are set up like this:

#define GIGA_CR_1000T_SPEED_MASK        0x0300
#define GIGA_CR_1000T_DEFAULT_CAP       0x0300

So we're just setting mii_giga_ctrl_data to zero.  It seems odd.  Did
you intend to do the bitwise negate of GIGA_CR_1000T_SPEED_MASK?
They're only used one time so I can't tell from the context what was
intented.

regards,
dan carpenter

