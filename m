From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Nov 2013 21:03:39 +0000
Subject: re: net/mlx4_core: Implement the master-slave communication channel
Message-Id: <20131126210339.GA12617@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Yevgeny Petrilin,

The patch e8f081aacdbf: "net/mlx4_core: Implement the master-slave 
communication channel" from Dec 13, 2011, leads to the following
static checker warning: 
"drivers/net/ethernet/mellanox/mlx4/cmd.c:1747 mlx4_master_do_cmd()
	 warn: buffer overflow 'priv->mfunc.master.gen_eqe_mutex' 80 <= 127"

drivers/net/ethernet/mellanox/mlx4/cmd.c
  1741          switch (cmd) {
  1742          case MLX4_COMM_CMD_VHCR0:
  1743                  if (slave_state[slave].last_cmd != MLX4_COMM_CMD_RESET)
  1744                          goto reset_slave;
  1745                  slave_state[slave].vhcr_dma = ((u64) param) << 48;
  1746                  priv->mfunc.master.slave_state[slave].cookie = 0;
  1747                  mutex_init(&priv->mfunc.master.gen_eqe_mutex[slave]);
                                                       ^^^^^^^^^^^^^
There are 80 mutexes in this array.  Smatch thinks "slave" can go up to
127 as explained below.

  1748                  break;
  1749          case MLX4_COMM_CMD_VHCR1:
  1750                  if (slave_state[slave].last_cmd != MLX4_COMM_CMD_VHCR0)
  1751                          goto reset_slave;
  1752                  slave_state[slave].vhcr_dma |= ((u64) param) << 32;
  1753                  break;

[ snip ]

  1841          bit_vec = master->comm_arm_bit_vector;
  1842          for (i = 0; i < COMM_CHANNEL_BIT_ARRAY_SIZE; i++) {

i is between 0 and 3.

  1843                  vec = be32_to_cpu(bit_vec[i]);
  1844                  for (j = 0; j < 32; j++) {
  1845                          if (!(vec & (1 << j)))
  1846                                  continue;
  1847                          ++reported;
  1848                          slave = (i * 32) + j;

slave can be 3 * 32 + 31 = 127.

  1849                          comm_cmd = swab32(readl(
  1850                                            &mfunc->comm[slave].slave_write));
  1851                          slt = swab32(readl(&mfunc->comm[slave].slave_read))
  1852                                       >> 31;

regards,
dan carpenter

