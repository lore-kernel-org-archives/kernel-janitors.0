From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Nov 2017 10:10:24 +0000
Subject: [bug report] mlxsw: spectrum: Support decap-only IP-in-IP tunnels
Message-Id: <20171130101024.qapgjcaeuefxy5da@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Petr Machata,

The patch 0063587d3587: "mlxsw: spectrum: Support decap-only IP-in-IP
tunnels" from Oct 16, 2017, leads to the following static checker
warning:

	drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:1306 mlxsw_sp_netdevice_ipip_ol_reg_event()
	error: uninitialized symbol 'ipipt'.

drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
  1296  static int mlxsw_sp_netdevice_ipip_ol_reg_event(struct mlxsw_sp *mlxsw_sp,
  1297                                                  struct net_device *ol_dev)
  1298  {
  1299          struct mlxsw_sp_ipip_entry *ipip_entry;
  1300          enum mlxsw_sp_l3proto ul_proto;
  1301          enum mlxsw_sp_ipip_type ipipt;
  1302          union mlxsw_sp_l3addr saddr;
  1303          u32 ul_tb_id;
  1304  
  1305          mlxsw_sp_netdev_ipip_type(mlxsw_sp, ol_dev, &ipipt);
                                                             ^^^^^
Not initialized on error path.

  1306          if (mlxsw_sp_netdevice_ipip_can_offload(mlxsw_sp, ol_dev, ipipt)) {
  1307                  ul_tb_id = mlxsw_sp_ipip_dev_ul_tb_id(ol_dev);
  1308                  ul_proto = mlxsw_sp->router->ipip_ops_arr[ipipt]->ul_proto;
  1309                  saddr = mlxsw_sp_ipip_netdev_saddr(ul_proto, ol_dev);
  1310                  if (!mlxsw_sp_ipip_demote_tunnel_by_saddr(mlxsw_sp, ul_proto,
  1311                                                            saddr, ul_tb_id,
  1312                                                            NULL)) {
  1313                          ipip_entry = mlxsw_sp_ipip_entry_create(mlxsw_sp, ipipt,
  1314                                                                  ol_dev);
  1315                          if (IS_ERR(ipip_entry))
  1316                                  return PTR_ERR(ipip_entry);
  1317                  }
  1318          }
  1319  
  1320          return 0;
  1321  }


regards,
dan carpenter
