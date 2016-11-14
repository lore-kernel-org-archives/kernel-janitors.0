From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 Nov 2016 12:43:34 +0000
Subject: [bug report] qed: Add support for memory registeration verbs
Message-Id: <20161114124334.GA5661@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Ram Amrani,

The patch ee8eaea30b13: "qed: Add support for memory registeration
verbs" from Oct 1, 2016, leads to the following static checker
warning:

	drivers/net/ethernet/qlogic/qed/qed_roce.c:2354 qed_rdma_register_tid()
	error: uninitialized symbol 'fw_return_code'.

drivers/net/ethernet/qlogic/qed/qed_roce.c
  2343          /* DIF */
  2344          if (params->dif_enabled) {
  2345                  SET_FIELD(p_ramrod->flags2,
  2346                            RDMA_REGISTER_TID_RAMROD_DATA_DIF_ON_HOST_FLG, 1);
  2347                  DMA_REGPAIR_LE(p_ramrod->dif_error_addr,
  2348                                 params->dif_error_addr);
  2349                  DMA_REGPAIR_LE(p_ramrod->dif_runt_addr, params->dif_runt_addr);
  2350          }
  2351  
  2352          rc = qed_spq_post(p_hwfn, p_ent, &fw_return_code);
  2353  
  2354          if (fw_return_code != RDMA_RETURN_OK) {

This basically works even when rc is a negative error code and
fw_return_code is uninitialized but hella nasty.

  2355                  DP_NOTICE(p_hwfn, "fw_return_code = %d\n", fw_return_code);
  2356                  return -EINVAL;
  2357          }
  2358  
  2359          DP_VERBOSE(p_hwfn, QED_MSG_RDMA, "Register TID, rc = %d\n", rc);
  2360          return rc;
  2361  }

regards,
dan carpenter
