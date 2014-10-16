From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Oct 2014 13:45:43 +0000
Subject: re: qlcnic: 83xx data path routines
Message-Id: <20141016134543.GA17358@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Sony Chacko,

The patch 4be41e92f7c6: "qlcnic: 83xx data path routines" from Jan 1,
2013, leads to the following static checker warning:

	drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c:2201 qlcnic_83xx_process_rcv_ring_diag()
	warn: masking and shifting to zero

drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
  2186  void qlcnic_83xx_process_rcv_ring_diag(struct qlcnic_host_sds_ring *sds_ring)
  2187  {
  2188          struct qlcnic_adapter *adapter = sds_ring->adapter;
  2189          struct status_desc *desc;
  2190          u64 sts_data[2];
  2191          int ring, opcode;
  2192          u32 consumer = sds_ring->consumer;
  2193  
  2194          desc = &sds_ring->desc_head[consumer];
  2195          sts_data[0] = le64_to_cpu(desc->status_desc_data[0]);
  2196          sts_data[1] = le64_to_cpu(desc->status_desc_data[1]);
  2197          opcode = qlcnic_83xx_opcode(sts_data[1]);
  2198          if (!opcode)
  2199                  return;
  2200  
  2201          ring = QLCNIC_FETCH_RING_ID(qlcnic_83xx_hndl(sts_data[0]));
                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
ring is always zero.  Probably it should be:
		ring = QLCNIC_FETCH_RING_ID(sts_data[0]);

  2202          qlcnic_83xx_process_rcv_diag(adapter, ring, sts_data);
  2203          desc = &sds_ring->desc_head[consumer];
  2204          desc->status_desc_data[0] = cpu_to_le64(STATUS_OWNER_PHANTOM);
  2205          consumer = get_next_index(consumer, sds_ring->num_desc);
  2206          sds_ring->consumer = consumer;
  2207          writel(consumer, sds_ring->crb_sts_consumer);
  2208  }

regards,
dan carpenter
