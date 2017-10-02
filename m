From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 02 Oct 2017 10:22:42 +0000
Subject: [bug report] mlxsw: spectrum: Add the multicast routing offloading logic
Message-Id: <20171002102242.wikad4uo3fgs6y5t@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Yotam Gigi,

The patch c011ec1bbfd6: "mlxsw: spectrum: Add the multicast routing
offloading logic" from Sep 27, 2017, leads to the following static
checker warning:

	drivers/net/ethernet/mellanox/mlxsw/spectrum_mr.c:948 mlxsw_sp_mr_route_stats_update()
	error: uninitialized symbol 'packets'.

	drivers/net/ethernet/mellanox/mlxsw/spectrum_mr.c:951 mlxsw_sp_mr_route_stats_update()
	error: uninitialized symbol 'bytes'.

drivers/net/ethernet/mellanox/mlxsw/spectrum_mr.c
   934  static void mlxsw_sp_mr_route_stats_update(struct mlxsw_sp *mlxsw_sp,
   935                                             struct mlxsw_sp_mr_route *mr_route)
   936  {
   937          struct mlxsw_sp_mr *mr = mlxsw_sp->mr;
   938          u64 packets, bytes;
                    ^^^^^^^^^^^^^^
   939  
   940          if (mr_route->route_action = MLXSW_SP_MR_ROUTE_ACTION_TRAP)
   941                  return;
   942  
   943          mr->mr_ops->route_stats(mlxsw_sp, mr_route->route_priv, &packets,
                ^^^^^^^^^^^^^^^^^^^^^^^
The static checker is complaining because they don't get initialized on
the error path.

   944                                  &bytes);
   945  
   946          switch (mr_route->mr_table->proto) {
   947          case MLXSW_SP_L3_PROTO_IPV4:
   948                  if (mr_route->mfc4->mfc_un.res.pkt != packets)
   949                          mr_route->mfc4->mfc_un.res.lastuse = jiffies;
   950                  mr_route->mfc4->mfc_un.res.pkt = packets;
   951                  mr_route->mfc4->mfc_un.res.bytes = bytes;
   952                  break;
   953          case MLXSW_SP_L3_PROTO_IPV6:
   954                  /* fall through */
   955          default:
   956                  WARN_ON_ONCE(1);
   957          }
   958  }

regards,
dan carpenter
