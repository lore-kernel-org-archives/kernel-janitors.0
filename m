From: Sony Chacko <sony.chacko@qlogic.com>
Date: Sun, 19 Oct 2014 05:26:01 +0000
Subject: RE: qlcnic: 83xx data path routines
Message-Id: <0EA5B226BC5C7B45A71BF612AA8A019E0128A15676@AVMB1.qlogic.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141016134543.GA17358@mwanda>
In-Reply-To: <20141016134543.GA17358@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Thursday, October 16, 2014 6:46 AM
> To: Sony Chacko
> Cc: Dept-GE Linux NIC Dev; kernel-janitors@vger.kernel.org
> Subject: re: qlcnic: 83xx data path routines
>
> Hello Sony Chacko,
>
> The patch 4be41e92f7c6: "qlcnic: 83xx data path routines" from
> Jan 1, 2013, leads to the following static checker warning:
>
>       drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c:2201
> qlcnic_83xx_process_rcv_ring_diag()
>       warn: masking and shifting to zero
>
> drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
>   2186  void qlcnic_83xx_process_rcv_ring_diag(struct
> qlcnic_host_sds_ring *sds_ring)
>   2187  {
>   2188          struct qlcnic_adapter *adapter = sds_ring->adapter;
>   2189          struct status_desc *desc;
>   2190          u64 sts_data[2];
>   2191          int ring, opcode;
>   2192          u32 consumer = sds_ring->consumer;
>   2193
>   2194          desc = &sds_ring->desc_head[consumer];
>   2195          sts_data[0] = le64_to_cpu(desc-
> >status_desc_data[0]);
>   2196          sts_data[1] = le64_to_cpu(desc-
> >status_desc_data[1]);
>   2197          opcode = qlcnic_83xx_opcode(sts_data[1]);
>   2198          if (!opcode)
>   2199                  return;
>   2200
>   2201          ring > QLCNIC_FETCH_RING_ID(qlcnic_83xx_hndl(sts_data[0]));
>
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> ring is always zero.  Probably it should be:
>               ring = QLCNIC_FETCH_RING_ID(sts_data[0]);
>
>   2202          qlcnic_83xx_process_rcv_diag(adapter, ring,
> sts_data);
> regards,
> dan carpenter

Dan ,

Thanks, I will submit the appropriate fix in the next set of patches.

Sony

________________________________

This message and any attached documents contain information from the sending company or its parent company(s), subsidiaries, divisions or branch offices that may be confidential. If you are not the intended recipient, you may not read, copy, distribute, or use this information. If you have received this transmission in error, please notify the sender immediately by reply e-mail and then delete this message.
