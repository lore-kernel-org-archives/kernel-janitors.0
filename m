From: Jack Morgenstein <jackm@mellanox.com>
Date: Wed, 27 Nov 2013 10:02:33 +0000
Subject: RE: net/mlx4_core: Implement the master-slave communication channel
Message-Id: <86FC963EFF71CB46A06F144F8602FEF2CDB0D4B7@MTLDAG01.mtl.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131126210339.GA12617@elgon.mountain>
In-Reply-To: <20131126210339.GA12617@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is correct, sort of. But I agree that the code should be modified to avoid the problem under all conditions.

It is true that the scan is over all the comm-channel-fired bits.  However, if a VF does not send something on the comm channel, the bit will not be set.  That is why we have not seen any problems at all here.
If we want to be strict about it, shorten the scan time, and protect against any FW glitches, we could do the following:

	for (i = 0; i < COMM_CHANNEL_BIT_ARRAY_SIZE; i++) {
		if ((i * 32) >= MLX4_NUM_MFUNC)
			break;
		vec = be32_to_cpu(bit_vec[i]);
		for (j = 0; j < 32; j++) {
			slave = (i * 32) + j;
			if (slave >= MLX4_NUM_MFUNC)
				break;
			if (!(vec & (1 << j)))
				continue;
			++reported;
			comm_cmd = swab32(readl(
					  &mfunc->comm[slave].slave_write));

Or maybe better yet:
	Use " > dev->num_vfs" instead of ">= MLX4_NUM_MFUNC"


This will take care of the potential overrun (which has never happened in practice).

I'll prepare a patch (within the next couple of days -- I'm swamped right now).

-Jack


-----Original Message-----
From: Yevgeny Petrilin 
Sent: Wednesday, November 27, 2013 10:30 AM
To: Dan Carpenter; Or Gerlitz
Cc: kernel-janitors@vger.kernel.org; Jack Morgenstein
Subject: RE: net/mlx4_core: Implement the master-slave communication channel

> 
> The patch e8f081aacdbf: "net/mlx4_core: Implement the master-slave 
> communication channel" from Dec 13, 2011, leads to the following 
> static checker warning:
> "drivers/net/ethernet/mellanox/mlx4/cmd.c:1747 mlx4_master_do_cmd()
> 	 warn: buffer overflow 'priv->mfunc.master.gen_eqe_mutex' 80 <= 127"
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
> There are 80 mutexes in this array.  Smatch thinks "slave" can go up 
> to
> 127 as explained below.
> 

Thanks Dan, good catch.
We'll send a fix for this.

Yevgeny

