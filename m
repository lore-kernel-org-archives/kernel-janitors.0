From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Sep 2019 09:57:54 +0000
Subject: [bug report] net/mlx5: DR, Add Steering entry (STE) utilities
Message-Id: <20190905095754.GA26074@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Alex Vesker,

The patch 26d688e33f88: "net/mlx5: DR, Add Steering entry (STE)
utilities" from Aug 19, 2019, leads to the following static checker
warning:

	drivers/net/ethernet/mellanox/mlx5/core/steering/dr_ste.c:271 mlx5dr_ste_get_miss_addr()
	warn: potential shift truncation.  '0xff (0-255) << 26'

drivers/net/ethernet/mellanox/mlx5/core/steering/dr_ste.c
   267  u64 mlx5dr_ste_get_miss_addr(u8 *hw_ste)
   268  {
   269          u64 index    270                  (MLX5_GET(ste_rx_steering_mult, hw_ste, miss_address_31_6) |
   271                   MLX5_GET(ste_rx_steering_mult, hw_ste, miss_address_39_32) << 26);
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Smatch thinks this needs to be cast to u64.

   272  
   273          return index << 6;
   274  }

regards,
dan carpenter
