From: Yevgeny Petrilin <yevgenyp@mellanox.com>
Date: Wed, 27 Nov 2013 08:29:48 +0000
Subject: RE: net/mlx4_core: Implement the master-slave communication channel
Message-Id: <953B660C027164448AE903364AC447D2CE0CE795@MTLDAG01.mtl.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131126210339.GA12617@elgon.mountain>
In-Reply-To: <20131126210339.GA12617@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> 
> The patch e8f081aacdbf: "net/mlx4_core: Implement the master-slave
> communication channel" from Dec 13, 2011, leads to the following
> static checker warning:
> "drivers/net/ethernet/mellanox/mlx4/cmd.c:1747 mlx4_master_do_cmd()
> 	 warn: buffer overflow 'priv->mfunc.master.gen_eqe_mutex' 80 <> 127"
> 
> drivers/net/ethernet/mellanox/mlx4/cmd.c
>   1741          switch (cmd) {
>   1742          case MLX4_COMM_CMD_VHCR0:
>   1743                  if (slave_state[slave].last_cmd != MLX4_COMM_CMD_RESET)
>   1744                          goto reset_slave;
>   1745                  slave_state[slave].vhcr_dma = ((u64) param) << 48;
>   1746                  priv->mfunc.master.slave_state[slave].cookie = 0;
>   1747                  mutex_init(&priv->mfunc.master.gen_eqe_mutex[slave]);
>                                                        ^^^^^^^^^^^^^
> There are 80 mutexes in this array.  Smatch thinks "slave" can go up to
> 127 as explained below.
> 

Thanks Dan, good catch.
We'll send a fix for this.

Yevgeny

