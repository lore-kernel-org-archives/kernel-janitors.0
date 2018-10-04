From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 04 Oct 2018 08:59:40 +0000
Subject: e1000: dubious check for 100Mb speed.
Message-Id: <f8597763-8fae-d29a-d20b-903860dadc99@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

Static analysis with CoverityScan has detected an issue in
drivers/net/ethernet/intel/e1000/e1000_hw.c, function
e1000_config_mac_to_phy() as follows:

        case e1000_phy_8201:
                ret_val = e1000_read_phy_reg(hw, PHY_CTRL, &phy_data);
                if (ret_val)
                        return ret_val;

                if (phy_data & RTL_PHY_CTRL_FD)
                        ctrl |= E1000_CTRL_FD;
                else
                        ctrl &= ~E1000_CTRL_FD;

                if (phy_data & RTL_PHY_CTRL_SPD_100)
                        ctrl |= E1000_CTRL_SPD_100;
                else
                        ctrl |= E1000_CTRL_SPD_10;

                e1000_config_collision_dist(hw);
                break;

phy_data is a u16, however, RTL_PHY_CTRL_SPD_100 is 0x200000 and so the
bitwise and of phy_data & RTL_PHY_CTRL_SPD_100 is always zero, so ctrl
can never be set to the 100Mb speed.

Detected by CoverityScan, CID#140032 ("Operand's don't affect result").

Colin
