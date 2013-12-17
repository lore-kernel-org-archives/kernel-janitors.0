From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Dec 2013 11:57:30 +0000
Subject: re: mlx4_en: Using blue flame support
Message-Id: <20131217115730.GA10787@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Yevgeny Petrilin,

The patch 87a5c3896f9c: "mlx4_en: Using blue flame support" from
Mar 22, 2011, leads to the following static checker warning:

	drivers/net/ethernet/mellanox/mlx4/en_tx.c:839 mlx4_en_xmit()
	warn: potential memory corrupting cast 4 vs 2 bytes

drivers/net/ethernet/mellanox/mlx4/en_tx.c
   771          tx_desc->ctrl.ins_vlan = MLX4_WQE_CTRL_INS_VLAN *
   772                  !!vlan_tx_tag_present(skb);
   773          tx_desc->ctrl.fence_size = (real_size / 16) & 0x3f;

We set ->ctrl.ins_vlan and ->ctrl.fence_size here.

   774          tx_desc->ctrl.srcrb_flags = priv->ctrl_flags;
   775          if (likely(skb->ip_summed = CHECKSUM_PARTIAL)) {
   776                  tx_desc->ctrl.srcrb_flags |= cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM |
   777                                                           MLX4_WQE_CTRL_TCP_UDP_CSUM);
   778                  ring->tx_csum++;
   779          }

[ snip ]

   838          if (ring->bf_enabled && desc_size <= MAX_BF && !bounce && !vlan_tx_tag_present(skb)) {
   839                  *(__be32 *) (&tx_desc->ctrl.vlan_tag) |= cpu_to_be32(ring->doorbell_qpn);

And then sometimes we overwrite them here.  It's not clear if this is
deliberate or accidental.  Maybe add a comment?

   840                  op_own |= htonl((bf_index & 0xffff) << 8);
   841                  /* Ensure new descirptor hits memory
   842                  * before setting ownership of this descriptor to HW */
   843                  wmb();
   844                  tx_desc->ctrl.owner_opcode = op_own;
   845  
   846                  wmb();

regards,
dan carpenter

