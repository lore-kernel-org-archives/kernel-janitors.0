From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 03 Oct 2012 01:15:35 +0000
Subject: drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2803:26: sparse: invalid assignment: |=
Message-Id: <20121003011535.GB8750@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Yuval,

FYI, there are new sparse warnings show up in

commit: 96bed4b954fd5ef69e32f3c1d2c7c6bdda181316  bnx2x,cnic: use FW 7.8.2

  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3072:48: sparse: incorrect type in argument 1 (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3072:48:    expected unsigned short [usertype] *fw_hi
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3072:48:    got restricted __le16 *<noident>
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3073:48: sparse: incorrect type in argument 2 (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3073:48:    expected unsigned short [usertype] *fw_mid
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3073:48:    got restricted __le16 *<noident>
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3074:48: sparse: incorrect type in argument 3 (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3074:48:    expected unsigned short [usertype] *fw_lo
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3074:48:    got restricted __le16 *<noident>
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3076:48: sparse: incorrect type in argument 1 (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3076:48:    expected unsigned short [usertype] *fw_hi
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3076:48:    got restricted __le16 *<noident>
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3077:48: sparse: incorrect type in argument 2 (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3077:48:    expected unsigned short [usertype] *fw_mid
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3077:48:    got restricted __le16 *<noident>
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3078:48: sparse: incorrect type in argument 3 (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3078:48:    expected unsigned short [usertype] *fw_lo
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3078:48:    got restricted __le16 *<noident>
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2869:26: sparse: incorrect type in assignment (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2869:26:    expected restricted __le16 [usertype] global_data
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2869:26:    got int
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2888:40: sparse: cast from restricted __sum16
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2888:40: sparse: incorrect type in argument 1 (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2888:40:    expected unsigned short [unsigned] [usertype] val
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2888:40:    got restricted __sum16 [usertype] check
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2888:40: sparse: cast from restricted __sum16
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2888:40: sparse: cast from restricted __sum16
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2888:38: sparse: incorrect type in assignment (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2888:38:    expected restricted __le16 [usertype] tcp_pseudo_csum
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2888:38:    got int
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2646:50: sparse: incorrect type in argument 1 (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2646:50:    expected restricted __wsum [usertype] csum
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2646:50:    got unsigned short [unsigned] [usertype] csum
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2646:25: sparse: cast from restricted __sum16
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2650:50: sparse: incorrect type in argument 1 (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2650:50:    expected restricted __wsum [usertype] csum
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2650:50:    got unsigned short [unsigned] [assigned] [usertype] csum
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2650:25: sparse: cast from restricted __sum16
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2898:38: sparse: incorrect type in assignment (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2898:38:    expected restricted __le16 [usertype] tcp_pseudo_csum
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2898:38:    got unsigned short
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:29: sparse: cast from restricted __be32
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:29: sparse: incorrect type in argument 1 (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:29:    expected unsigned int [unsigned] [usertype] val
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:29:    got restricted __be32 [usertype] seq
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:29: sparse: cast from restricted __be32
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:29: sparse: cast from restricted __be32
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:29: sparse: cast from restricted __be32
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:29: sparse: cast from restricted __be32
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:27: sparse: incorrect type in assignment (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:27:    expected restricted __le32 [usertype] tcp_send_seq
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:27:    got unsigned int
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2791:30: sparse: cast from restricted __be16
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2791:30: sparse: incorrect type in argument 1 (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2791:30:    expected unsigned short [unsigned] [usertype] val
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2791:30:    got restricted __be16 [usertype] id
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2791:30: sparse: cast from restricted __be16
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2791:30: sparse: cast from restricted __be16
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2791:28: sparse: incorrect type in assignment (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2791:28:    expected restricted __le16 [usertype] ip_id
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2791:28:    got int
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2793:25: sparse: cast from restricted __sum16
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2793:25: sparse: incorrect type in argument 1 (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2793:25:    expected unsigned short [unsigned] [usertype] val
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2793:25:    got fouled restricted __sum16
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2793:25: sparse: cast from restricted __sum16
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2793:25: sparse: cast from restricted __sum16
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2792:38: sparse: incorrect type in assignment (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2792:38:    expected restricted __le16 [usertype] tcp_pseudo_csum
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2792:38:    got int
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2799:25: sparse: cast from restricted __sum16
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2799:25: sparse: incorrect type in argument 1 (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2799:25:    expected unsigned short [unsigned] [usertype] val
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2799:25:    got fouled restricted __sum16
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2799:25: sparse: cast from restricted __sum16
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2799:25: sparse: cast from restricted __sum16
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2798:38: sparse: incorrect type in assignment (different base types)
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2798:38:    expected restricted __le16 [usertype] tcp_pseudo_csum
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2798:38:    got int
+ drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2803:26: sparse: invalid assignment: |  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2803:26:    left side has type restricted __le16
  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2803:26:    right side has type int

vim +2803 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c

f2e0899f drivers/net/bnx2x/bnx2x_cmn.c (Dmitry Kravkov 2010-10-06  2802) 
f2e0899f drivers/net/bnx2x/bnx2x_cmn.c (Dmitry Kravkov 2010-10-06 @2803) 	pbd->global_data |= ETH_TX_PARSE_BD_E1X_PSEUDO_CS_WITHOUT_LEN;
f2e0899f drivers/net/bnx2x/bnx2x_cmn.c (Dmitry Kravkov 2010-10-06  2804) }

The code at line 2803 was first introduced by commit:
f2e0899 bnx2x: Add 57712 support

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
