From: "Amrani, Ram" <Ram.Amrani@cavium.com>
Date: Thu, 13 Oct 2016 06:58:15 +0000
Subject: RE: qed: Add RoCE ll2 & GSI support
Message-Id: <SN1PR07MB2207BD073D5EC9E1B08484D8F8DC0@SN1PR07MB2207.namprd07.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161011073305.GA19247@mwanda>
In-Reply-To: <20161011073305.GA19247@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

+Yuval

Thank you Dan. We'll take care of this as well.

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Tuesday, October 11, 2016 10:33 AM
> To: Amrani, Ram <Ram.Amrani@cavium.com>
> Cc: kernel-janitors@vger.kernel.org
> Subject: re: qed: Add RoCE ll2 & GSI support
> 
> Hello Ram Amrani,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch abd49676c707: "qed: Add RoCE ll2 & GSI support" from Oct 1, 2016,
> leads to the following Smatch complaint:
> 
> drivers/net/ethernet/qlogic/qed/qed_roce.c:2812 qed_roce_ll2_stop()
> 	 warn: variable dereferenced before check 'cdev' (see line 2808)
> 
> drivers/net/ethernet/qlogic/qed/qed_roce.c
>   2807	{
>   2808		struct qed_hwfn *hwfn = QED_LEADING_HWFN(cdev);
>   2809		struct qed_roce_ll2_info *roce_ll2 = hwfn->ll2;
>                                                      ^^^^^^^^^ Deref.
> 
>   2810		int rc;
>   2811
>   2812		if (!cdev) {
>                     ^^^^^
> Checked too late.
> 
>   2813			DP_ERR(cdev, "qed roce ll2 stop: invalid cdev\n");
>   2814			return -EINVAL;
> 
> regards,
> dan carpenter
