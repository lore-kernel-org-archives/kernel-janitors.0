From: "Amrani, Ram" <Ram.Amrani@cavium.com>
Date: Thu, 13 Oct 2016 06:57:55 +0000
Subject: RE: [bug report] qed: Add RoCE ll2 & GSI support
Message-Id: <SN1PR07MB22075820CB2DA48AB1237980F8DC0@SN1PR07MB2207.namprd07.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012061629.GO12841@mwanda>
In-Reply-To: <20161012061629.GO12841@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

+Yuval

Thank you Dan. We'll take care of this.

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Wednesday, October 12, 2016 9:17 AM
> To: Amrani, Ram <Ram.Amrani@cavium.com>
> Cc: kernel-janitors@vger.kernel.org
> Subject: [bug report] qed: Add RoCE ll2 & GSI support
> 
> Hello Ram Amrani,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch abd49676c707: "qed: Add RoCE ll2 & GSI support" from Oct 1,
> 2016, leads to the following Smatch complaint:
> 
> drivers/net/ethernet/qlogic/qed/qed_roce.c:2853 qed_roce_ll2_tx()
> 	 warn: variable dereferenced before check 'cdev' (see line 2846)
> 
> drivers/net/ethernet/qlogic/qed/qed_roce.c
>   2845	{
>   2846		struct qed_hwfn *hwfn = QED_LEADING_HWFN(cdev);
>                                                          ^^^^
>   2847		struct qed_roce_ll2_info *roce_ll2 = hwfn->ll2;
>                                                      ^^^^^^^^^
>   2848		enum qed_ll2_roce_flavor_type qed_roce_flavor;
>   2849		u8 flags = 0;
>   2850		int rc;
>   2851		int i;
>   2852
>   2853		if (!cdev || !pkt || !params) {
>                      ^^^^
> 
> This one also.
> 
>   2854			DP_ERR(cdev,
>   2855			       "roce ll2 tx: failed tx because one of the following is
> NULL - drv=%p, pkt=%p, params=%p\n",
> 
> regards,
> dan carpenter
