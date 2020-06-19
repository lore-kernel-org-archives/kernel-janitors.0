From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Jun 2020 10:09:07 +0000
Subject: [bug report] mlxsw: spectrum: Adjust headroom buffers for 8x ports
Message-Id: <20200619100907.GA246319@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Ido Schimmel,

The patch 60833d54d56c: "mlxsw: spectrum: Adjust headroom buffers for
8x ports" from Jun 16, 2020, leads to the following static checker
warning:

	drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c:785 mlxsw_sp_span_port_buffer_update()
	warn: passing casted pointer '&buffsize' to 'mlxsw_sp_port_headroom_8x_adjust()' 32 vs 16.

drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c
   769  static int
   770  mlxsw_sp_span_port_buffer_update(struct mlxsw_sp_port *mlxsw_sp_port, u16 mtu)
   771  {
   772          struct mlxsw_sp *mlxsw_sp = mlxsw_sp_port->mlxsw_sp;
   773          char sbib_pl[MLXSW_REG_SBIB_LEN];
   774          u32 buffsize;
                ^^^^^^^^^^^^

   775          u32 speed;
   776          int err;
   777  
   778          err = mlxsw_sp_port_speed_get(mlxsw_sp_port, &speed);
   779          if (err)
   780                  return err;
   781          if (speed = SPEED_UNKNOWN)
   782                  speed = 0;
   783  
   784          buffsize = mlxsw_sp_span_buffsize_get(mlxsw_sp, speed, mtu);
   785          mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, (u16 *) &buffsize);
                                                                ^^^^^^^^^^^^^^^^^
This will work if 1) we are on a littel endian system and 2) "buffsize"
is less than USHRT_MAX / 2 but it's super ugly...  :/

   786          mlxsw_reg_sbib_pack(sbib_pl, mlxsw_sp_port->local_port, buffsize);
   787          return mlxsw_reg_write(mlxsw_sp->core, MLXSW_REG(sbib), sbib_pl);
   788  }

regards,
dan carpenter
