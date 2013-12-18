From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Dec 2013 13:18:34 +0000
Subject: re: mlx4: Structures and init/teardown for VF resource quotas
Message-Id: <20131218131833.GA16427@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Jack Morgenstein,

The patch 5a0d0a6161ae: "mlx4: Structures and init/teardown for VF 
resource quotas" from Nov 3, 2013, leads to the following
static checker warning: "drivers/net/ethernet/mellanox/mlx4/fw.c:261 
mlx4_QUERY_FUNC_CAP_wrapper()
	 error: buffer overflow 
'priv->mfunc.master.res_tracker.res_alloc[0]->quota' 64 <= 127"

drivers/net/ethernet/mellanox/mlx4/fw.c
   246          } else if (vhcr->op_modifier = 0) {
   247                  /* enable rdma and ethernet interfaces, and new quota locations */
   248                  field = (QUERY_FUNC_CAP_FLAG_ETH | QUERY_FUNC_CAP_FLAG_RDMA |
   249                           QUERY_FUNC_CAP_FLAG_QUOTAS);
   250                  MLX4_PUT(outbox->buf, field, QUERY_FUNC_CAP_FLAGS_OFFSET);
   251  
   252                  field = dev->caps.num_ports;
   253                  MLX4_PUT(outbox->buf, field, QUERY_FUNC_CAP_NUM_PORTS_OFFSET);
   254  
   255                  size = dev->caps.function_caps; /* set PF behaviours */
   256                  MLX4_PUT(outbox->buf, size, QUERY_FUNC_CAP_PF_BHVR_OFFSET);
   257  
   258                  field = 0; /* protected FMR support not available as yet */
   259                  MLX4_PUT(outbox->buf, field, QUERY_FUNC_CAP_FMR_OFFSET);
   260  
   261                  size = priv->mfunc.master.res_tracker.res_alloc[RES_QP].quota[slave];
                                                                                      ^^^^^
My concern here is that there are MLX4_MAX_NUM_VF (64) elements in the
.quota[] array and MLX4_MAX_NUM_SLAVES (80) slaves.

   262                  MLX4_PUT(outbox->buf, size, QUERY_FUNC_CAP_QP_QUOTA_OFFSET);
   263                  size = dev->caps.num_qps;
   264                  MLX4_PUT(outbox->buf, size, QUERY_FUNC_CAP_QP_QUOTA_OFFSET_DEP);

regards,
dan carpenter

