From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 06:16:30 +0000
Subject: [bug report] qed: Add RoCE ll2 & GSI support
Message-Id: <20161012061629.GO12841@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Ram Amrani,

This is a semi-automatic email about new static checker warnings.

The patch abd49676c707: "qed: Add RoCE ll2 & GSI support" from Oct 1, 
2016, leads to the following Smatch complaint:

drivers/net/ethernet/qlogic/qed/qed_roce.c:2853 qed_roce_ll2_tx()
	 warn: variable dereferenced before check 'cdev' (see line 2846)

drivers/net/ethernet/qlogic/qed/qed_roce.c
  2845	{
  2846		struct qed_hwfn *hwfn = QED_LEADING_HWFN(cdev);
                                                         ^^^^
  2847		struct qed_roce_ll2_info *roce_ll2 = hwfn->ll2;
                                                     ^^^^^^^^^
  2848		enum qed_ll2_roce_flavor_type qed_roce_flavor;
  2849		u8 flags = 0;
  2850		int rc;
  2851		int i;
  2852	
  2853		if (!cdev || !pkt || !params) {
                     ^^^^

This one also.

  2854			DP_ERR(cdev,
  2855			       "roce ll2 tx: failed tx because one of the following is NULL - drv=%p, pkt=%p, params=%p\n",

regards,
dan carpenter
