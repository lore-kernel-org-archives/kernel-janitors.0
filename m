From: Yunsheng Lin <linyunsheng@huawei.com>
Date: Tue, 09 Apr 2019 13:22:29 +0000
Subject: Re: [bug report] net: hns3: only support tc 0 for VF
Message-Id: <0052ff9c-930a-2f7d-23c5-1b2d3fee06f6@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190409113727.GA14023@kadam>
In-Reply-To: <20190409113727.GA14023@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2019/4/9 19:37, Dan Carpenter wrote:
> Hello Yunsheng Lin,
> 
> The patch de67a690cc27: "net: hns3: only support tc 0 for VF" from
> Jan 31, 2019, leads to the following static checker warning:
> 
> 	drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:549 hclge_tm_vport_tc_info_update()
> 	warn: 'hdev->tm_info.pg_info[0]->bw_limit' 100000 can't fit into 65535 'vport->bw_limit'
> 
> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c
>     534 	if (kinfo->req_rss_size != kinfo->rss_size && kinfo->req_rss_size &&
>     535 	    kinfo->req_rss_size <= max_rss_size) {
>     536 		dev_info(&hdev->pdev->dev, "rss changes from %d to %d\n",
>     537 			 kinfo->rss_size, kinfo->req_rss_size);
>     538 		kinfo->rss_size = kinfo->req_rss_size;
>     539 	} else if (kinfo->rss_size > max_rss_size ||
>     540 		   (!kinfo->req_rss_size && kinfo->rss_size < max_rss_size)) {
>     541 		dev_info(&hdev->pdev->dev, "rss changes from %d to %d\n",
>     542 			 kinfo->rss_size, max_rss_size);
>     543 		kinfo->rss_size = max_rss_size;
>     544 	}
>     545 
>     546 	kinfo->num_tqps = kinfo->num_tc * kinfo->rss_size;
>     547 	vport->dwrr = 100;  /* 100 percent as init */
>     548 	vport->alloc_rss_size = kinfo->rss_size;
> --> 549 	vport->bw_limit = hdev->tm_info.pg_info[0].bw_limit;
>                 ^^^^^^^^^^^^^^^
> An unsigned short is not large enough to hold HCLGE_ETHER_MAX_RATE (100000).

Hi,
Thanks for the report, will send a patch fix it.

> 
>     550 
>     551 	for (i = 0; i < HNAE3_MAX_TC; i++) {
>     552 		if (hdev->hw_tc_map & BIT(i) && i < kinfo->num_tc) {
>     553 			kinfo->tc_info[i].enable = true;
>     554 			kinfo->tc_info[i].tqp_offset = i * kinfo->rss_size;
>     555 			kinfo->tc_info[i].tqp_count = kinfo->rss_size;
>     556 			kinfo->tc_info[i].tc = i;
>     557 		} else {
> 
> regards,
> dan carpenter
> 
> 
