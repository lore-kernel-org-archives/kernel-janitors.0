From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 May 2019 10:23:05 +0000
Subject: [bug report] qed: Add llh ppfid interface and 100g support for offload protocols
Message-Id: <20190529102305.GA13975@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Michal Kalderon,

The patch 79284adeb99e: "qed: Add llh ppfid interface and 100g
support for offload protocols" from May 26, 2019, leads to the
following static checker warning:

	drivers/net/ethernet/qlogic/qed/qed_dev.c:1014 qed_llh_add_mac_filter()
	error: uninitialized symbol 'abs_ppfid'.

drivers/net/ethernet/qlogic/qed/qed_dev.c
   976  int qed_llh_add_mac_filter(struct qed_dev *cdev,
   977                             u8 ppfid, u8 mac_addr[ETH_ALEN])
   978  {
   979          struct qed_hwfn *p_hwfn = QED_LEADING_HWFN(cdev);
   980          struct qed_ptt *p_ptt = qed_ptt_acquire(p_hwfn);
   981          union qed_llh_filter filter = {};
   982          u8 filter_idx, abs_ppfid;
                               ^^^^^^^^^

   983          u32 high, low, ref_cnt;
   984          int rc = 0;
   985  
   986          if (!p_ptt)
   987                  return -EAGAIN;
   988  
   989          if (!test_bit(QED_MF_LLH_MAC_CLSS, &cdev->mf_bits))
   990                  goto out;
   991  
   992          memcpy(filter.mac.addr, mac_addr, ETH_ALEN);
   993          rc = qed_llh_shadow_add_filter(cdev, ppfid,
   994                                         QED_LLH_FILTER_TYPE_MAC,
   995                                         &filter, &filter_idx, &ref_cnt);
   996          if (rc)
   997                  goto err;
   998  
   999          /* Configure the LLH only in case of a new the filter */
  1000          if (ref_cnt = 1) {
                    ^^^^^^^^^^^^
Assume != 1

  1001                  rc = qed_llh_abs_ppfid(cdev, ppfid, &abs_ppfid);
  1002                  if (rc)
  1003                          goto err;
  1004  
  1005                  high = mac_addr[1] | (mac_addr[0] << 8);
  1006                  low = mac_addr[5] | (mac_addr[4] << 8) | (mac_addr[3] << 16) |
  1007                        (mac_addr[2] << 24);
  1008                  rc = qed_llh_add_filter(p_hwfn, p_ptt, abs_ppfid, filter_idx,
  1009                                          0, high, low);
  1010                  if (rc)
  1011                          goto err;
  1012          }
  1013  
  1014          DP_VERBOSE(cdev,
  1015                     QED_MSG_SP,
  1016                     "LLH: Added MAC filter [%pM] to ppfid %hhd [abs %hhd] at idx %hhd [ref_cnt %d]\n",
  1017                     mac_addr, ppfid, abs_ppfid, filter_idx, ref_cnt);
                                            ^^^^^^^^^
See also:
drivers/net/ethernet/qlogic/qed/qed_dev.c:1160 qed_llh_add_protocol_filter() error: uninitialized symbol 'abs_ppfid'.
drivers/net/ethernet/qlogic/qed/qed_dev.c:1210 qed_llh_remove_mac_filter() error: uninitialized symbol 'abs_ppfid'.
drivers/net/ethernet/qlogic/qed/qed_dev.c:1268 qed_llh_remove_protocol_filter() error: uninitialized symbol 'abs_ppfid'.

regards,
dan carpenter
