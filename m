From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Jan 2021 13:16:31 +0000
Subject: [bug report] net/mlx5: DR, Move STEv0 setters and getters
Message-Id: <X/hbL24ZTflzKF09@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Yevgeny Kliteynik,

The patch 6b93b400aa88: "net/mlx5: DR, Move STEv0 setters and
getters" from Nov 19, 2020, leads to the following static checker
warning:

	drivers/net/ethernet/mellanox/mlx5/core/steering/dr_ste_v0.c:252 dr_ste_v0_get_miss_addr()
	warn: potential shift truncation.  '0xff (0-255) << 26'

drivers/net/ethernet/mellanox/mlx5/core/steering/dr_ste_v0.c
   248  static u64 dr_ste_v0_get_miss_addr(u8 *hw_ste_p)
   249  {
   250          u64 index    251                  (MLX5_GET(ste_rx_steering_mult, hw_ste_p, miss_address_31_6) |
   252                   MLX5_GET(ste_rx_steering_mult, hw_ste_p, miss_address_39_32) << 26);
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is shifting a u32 value in the 0-255 range by << 26 which could
result in shift wrapping.  "index" is a u64 but ORing two u32 values
will result in a u32.

   253  
   254          return index << 6;
   255  }

regards,
dan carpenter
