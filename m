From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Oct 2018 11:04:31 +0000
Subject: [bug report] net: phy: mscc: migrate to phy_select/restore_page functions
Message-Id: <20181010110431.GA21125@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Quentin Schulz,

The patch 6a0bfbbe20b0: "net: phy: mscc: migrate to
phy_select/restore_page functions" from Oct 8, 2018, leads to the
following static checker warning:

	drivers/net/phy/mscc.c:529 vsc85xx_downshift_get()
	warn: impossible condition '(reg_val < 0) => (0-u16max < 0)'

drivers/net/phy/mscc.c
   523  static int vsc85xx_downshift_get(struct phy_device *phydev, u8 *count)
   524  {
   525          u16 reg_val;
                ^^^^^^^^^^^^
   526  
   527          reg_val = phy_read_paged(phydev, MSCC_PHY_PAGE_EXTENDED,
   528                                   MSCC_PHY_ACTIPHY_CNTL);
   529          if (reg_val < 0)
                    ^^^^^^^^^^^
Impossible

   530                  return reg_val;
   531  
   532          reg_val &= DOWNSHIFT_CNTL_MASK;
   533          if (!(reg_val & DOWNSHIFT_EN))
   534                  *count = DOWNSHIFT_DEV_DISABLE;
   535          else
   536                  *count = ((reg_val & ~DOWNSHIFT_EN) >> DOWNSHIFT_CNTL_POS) + 2;
   537  
   538          return 0;
   539  }


regards,
dan carpenter
