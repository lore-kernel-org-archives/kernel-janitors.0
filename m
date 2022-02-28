Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8AFC433FE
	for <kernel-janitors@archiver.kernel.org>; Mon, 28 Feb 2022 07:43:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233660AbiB1Ho2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 28 Feb 2022 02:44:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbiB1Ho2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Feb 2022 02:44:28 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D978166AFA
        for <kernel-janitors@vger.kernel.org>; Sun, 27 Feb 2022 23:43:49 -0800 (PST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21S6C2mj008247;
        Mon, 28 Feb 2022 07:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=je/DKA2oFxa7SvcTjM/bcuPFdNH8UzfKN6EKgKP1R7Q=;
 b=YnsX6nsKr+fvOYYyj4fOW9AzMEccqafZMdmUkGXetqgwzWKBBJFsQXsPe0KTYuqJ0itz
 YEgfJu+Xi9oBsjH6fehtBv9q0wPOry8dazSEQJo5gQt6FlwIzwfm5omIWodASy4WaShX
 LXBfPsr0UIhL010xxOLbLQP8r+xLxT57cyNZ9gvoAUFa6OiIsLPYhUm3H3NBxYbyeh2O
 6PAZvVp37Wws0UvIKnViXTRytEFbd/TGqSqJfRxddytWgXDjS5Ct3Pp90S8mCxHqFxOK
 78DRGrH6IksGeW1O0td5MOlUn39SmIzlHu/NshBandgbBCU5vMkkSfxnIi3mZ6iXOo9M WQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3efb02kdsy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 28 Feb 2022 07:43:45 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21S7ZK6q195023;
        Mon, 28 Feb 2022 07:43:44 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
        by userp3020.oracle.com with ESMTP id 3efdnjf41u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 28 Feb 2022 07:43:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlPWyTg72b52J5dna9xejuP5wy0x64IWrU3VZ1kNT25OeLWMJyCJDKyiI01D8dkLCmLsps6yFIxB6BZz7XV7gpOxNGkOY4t9bRdq1Bqv/7tfzJHfseekDFj9BbEt9ysUy9osetfbvuzlWQaaOhAHJLnL6NYgL9eLYN1siI84xW6N00sPsBYV4z92Jg6RggndzdgS6i6Atkh+L8+Z/iNTJLASwWP4EWZkZ3FAGumTXOsyQP/DKO5njoSlGsJZhrYWcw6WIlG5DJrFMHZ9+x5hfOhY0t+dvOxdHxb5JOVjJ9UF9B48rFd8HtC2QJKqKrp94TOxHvlhIpLkc5oO0A+pnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=je/DKA2oFxa7SvcTjM/bcuPFdNH8UzfKN6EKgKP1R7Q=;
 b=kg3CEgnbrMZACThP5ic8tlrlxj2WKYFRRlRCk7R0fUFhWGysMest/WXrPBpuBN1pLQ4hGVngiDJ1tN/GsmAm65dHrewN1hoiHnI3xopo7IYFnC5yt/QefBfEZ9NdF/zhIzxneYtVv6EC1T1gcpm08aDQgAi4nG2rx43BMnrqG725BPRhP4+OrHGlqT8fWhpK8ogUa+hw9rTahYhhSuiJq2uVnIJQ45VK77a0nS9mKnsa7x9BGlRWYIpRw2uHN4NhiTV+9g2FvUizobKwvfeXrTD5sG+xTrlpIqaMu/vSdgadB653HIRJBcJ/iyollLlRJkdPV0HWbkyI1OeszcsiBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=je/DKA2oFxa7SvcTjM/bcuPFdNH8UzfKN6EKgKP1R7Q=;
 b=oIHgj3sNmD7pUcXrI/UY4nf86L49XP2bf61RIppehgv/6cL+hc5x+R4MMX87zVzJVPQDnzVYqlFkuubjk8Qz6vU5xU7Z3zloJlBFi7hNbwtOrSXOvX6s1Y93wkDOqULaNPtAFdGiGIfQvLDNQA0E+FZHaarVPXH/lc/TwA5MW2Y=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB5645.namprd10.prod.outlook.com
 (2603:10b6:a03:3e2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 07:43:42 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 07:43:42 +0000
Date:   Mon, 28 Feb 2022 10:43:31 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Won Kang <wkang77@gmail.com>, linux-staging@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: gdm724x: fix use after free in gdm_lte_rx()
Message-ID: <20220228074331.GA13685@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZRAP278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fc4566e-67cc-47ef-f5c4-08d9fa8e0a88
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5645:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB56454107AB77778538A155EF8E019@SJ0PR10MB5645.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /rOEv2QAgpf7soSCvHWqkjKddy9DcDTtlSOKM1cNpT+22XYwQpO5PAPJFpd+jrb+fK7onJMAcmnxhAUCXCe16RUtpC0M6ZgqATKdocybtSNHghn4lxIBVUFTZDlYQVXCR2aYPEReAGFSTVvSnAOn3wnEAy2zlNvV1I2mfEjc0HCxN0/tWigNNXPrdfBRL2KOIl6CV5/eyS/aTKUq3dQXnc7qZwYiwqvbJSsfZWf3h+47G32mkdKhaENNPC1A6FfpMx/DXKgVSHqiydodyh/FoqlRafsAf3smxczCwKOYA76hSOqcuq9iW+AHyXrN8dAYpKKquudse0Utg6xmuPqUmKmC7fZR6WQZ5pmi7JD2ZsnZG8oZcV3AaFGTKq54UtoR72svHPVjlhBDzMc0rmoL5Xx4zvEm9H7NBrqFA/ob5g4XgIK9a1SRkH/wT1d3EuBENIsQa6U19MUrlUCvn3zaffaHwnTGLi1yo7Wyr9QKs2vB3XeZ3Ex20Lvsv5I1oJZI1/wDrbs/ys2lSwxh+tT8vovF+7aD1r026N+DtHqtk1Stfdh0dYPXQGTeCa4m9/FRDXtS14IR0ELPQLAXn5QQgaASHdJSuUEHCuqr96a+1mLcHg+CNqn4D54rM3FnfBj3szrl1RyGTNkUKnG0zexRI6MNRB0+hiTQ+G8p0Hc2cz0C0J9n8+qupQ0XYFju5PW1PE/rQ/VWZ9HuKtW3IbCf9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(83380400001)(4744005)(52116002)(508600001)(6486002)(1076003)(44832011)(316002)(8936002)(6916009)(86362001)(66946007)(26005)(186003)(4326008)(2906002)(9686003)(33656002)(6512007)(6506007)(5660300002)(66556008)(8676002)(66476007)(6666004)(38350700002)(33716001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5VoRCnGVr5F6CrwwoRfrw9+wSA7V367IvzK/bIncI5WxqnXmnxY82+tzwqcM?=
 =?us-ascii?Q?qqTZLawsw/J7DANJXDnBW3vch1JnrAlOiMtcesLalriq3uzUor5+0YVNMYLg?=
 =?us-ascii?Q?PwjDtMLKGFyWkMOn8yEBXZYzY42t7c4WpBZQK0BU7RviIGEZyeeISjW0YmtU?=
 =?us-ascii?Q?pH2Ah7Z8XTQaLEZsyBVGlctqC6zKVmb+9M5Cdz0V26dRBIrfqSHuDTQpAleS?=
 =?us-ascii?Q?h+QMWvbjz7uxMBeor9Uy6FOEGQG+62vWqZv3/c3OG1Wi/6hLPY1LgaPjooij?=
 =?us-ascii?Q?UEObQcCvljTj1AsgWRAX4xKlxcoe9h5LSrV8D4V9LQEtKPEoCxy2CHLKn1xr?=
 =?us-ascii?Q?0sRwEzkw7YfDe8F4GcYIhu33u9xDStnNKqWuH1dVWzVcFWQvmkhni5Y4qubb?=
 =?us-ascii?Q?sQhBGZ3H6/PrsmfsMmzlTlJzNBi3vfjHi9jVizzDY181Y1aYVk8+P0UGgFwg?=
 =?us-ascii?Q?toBRwKmdL6mw0Pl/tQI8Th72qeatEs4jDQXFI471DgZPXI4aEvSv5vHjqFmG?=
 =?us-ascii?Q?DY6vDwA/C1x1mMnO/8xz7nTvLz3FBbK5EK7W12R2aqtqgvEcqWQC2Y+f1odE?=
 =?us-ascii?Q?+tHSj2B6/MsVKt8Z5ti5CNta/NXn+v5fAMEgw+zfDAV/HKn8yKViCxh7Y66C?=
 =?us-ascii?Q?5tZ9vt1GSh1Vkm4IR0iPMsn7LV3SQe1pTpkIUDcjHjMf40hXwOzh2Y+ew2T3?=
 =?us-ascii?Q?FhL8YFyVR1ukmyVouo5MT/OQAbN0VxZsoonm49skGBEwP0xdm7bKYAq6gMLS?=
 =?us-ascii?Q?ZOZLYJS2nA12Ke6cI9l14PN5GR2NN7P/ZIlNj6eCnuypwEiCnwH7iVgFVX2m?=
 =?us-ascii?Q?tNRemuQu3uCKHUlRwWDEsU/x+bEbLiib70eSkKWvgDvLW38hsIAJr0QS5zvL?=
 =?us-ascii?Q?25/zBgRMSea6EEkzbX/8azNZkilaTTFTjGeDPsfKs5zTH5mKj17hR7GCoosU?=
 =?us-ascii?Q?97C8MdnufliUF8q+RVvsBKP8rGnG648GJkpkq+YQ7+Q5kIbQ6pO3xu4rSSqb?=
 =?us-ascii?Q?lhWGGdeQf61w5tkLZVar8tk2+WlxwZ3V6sxFCWWa9y8lxoOCfFGBO7mQuFpj?=
 =?us-ascii?Q?XKUHRJI/E7DXay3jamzMO/WsG/2eidD7TaIgJsAsgWYjWbXhnujHYfVllrm4?=
 =?us-ascii?Q?EC6OttrNQ4/z6V6JsWktPyptfEnfItgAObDj3nEke7ozVOef5R8x1i4KRaSP?=
 =?us-ascii?Q?7/HD3s6o2e3+CdI7VHxmnL8jdpuaBCmcYz5sga9buYUmlpsgK8oH2FxY+FOm?=
 =?us-ascii?Q?+4egJnFXrMgmLEQXGqcLQCQORxcATQumthyX8tvQ8G67FW3/dqm92VGgbt6z?=
 =?us-ascii?Q?6lhtQ2KaJnyAx6GPtzuClAYzpFp2e4Meo/38NncTuMG0HTTFmCubTYzCNQA+?=
 =?us-ascii?Q?qPIugX4ySHZyzfIGSl8FchA1ZgoKayNAMFcUtYb/xcmn3EZOgfUDEVzmpKZw?=
 =?us-ascii?Q?RL2Wq/ZfDbm/jw9GExm1wIzYKKdtxmjWcZ9TtZ+6/gXdcH7V/+DV77hGQaO/?=
 =?us-ascii?Q?mCYbAfMhuQhkorkQ0iFORfzuAs8ZNs/Vqw/j9Vl+dr0QBh+aUWzY7YV4MRLf?=
 =?us-ascii?Q?vmRKI9Ejsq++UzVwb9vXCb54tMyYrOKNmb6C1XYrwYD1dvzI0ud4ErdduHBe?=
 =?us-ascii?Q?FyBiCiv9b8vKu7+tenRzRjClNkzeFRDvxyTR95FhQR2RdbW5r1OxdjRWgRk8?=
 =?us-ascii?Q?l/RI2w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc4566e-67cc-47ef-f5c4-08d9fa8e0a88
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 07:43:42.3370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBrtV8RQD5gUfnJoMF+sIFBRfi6UmVw9SfN5TxIWiaavlT7H8bQcfrn/QXDYFD8JtsURBmGZJzAONF9jvqt/xlBQdeDjn8pUewZL49kqpro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5645
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10271 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=972 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202280043
X-Proofpoint-GUID: biU3pCSN_2Pc6YD9_tRt3-nmcaOG_Ke9
X-Proofpoint-ORIG-GUID: biU3pCSN_2Pc6YD9_tRt3-nmcaOG_Ke9
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The netif_rx_ni() function frees the skb so we can't dereference it to
save the skb->len.

Fixes: 61e121047645 ("staging: gdm7240: adding LTE USB driver")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/gdm724x/gdm_lte.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gdm724x/gdm_lte.c b/drivers/staging/gdm724x/gdm_lte.c
index 493ed4821515..0d8d8fed283d 100644
--- a/drivers/staging/gdm724x/gdm_lte.c
+++ b/drivers/staging/gdm724x/gdm_lte.c
@@ -76,14 +76,15 @@ static void tx_complete(void *arg)
 
 static int gdm_lte_rx(struct sk_buff *skb, struct nic *nic, int nic_type)
 {
-	int ret;
+	int ret, len;
 
+	len = skb->len + ETH_HLEN;
 	ret = netif_rx_ni(skb);
 	if (ret == NET_RX_DROP) {
 		nic->stats.rx_dropped++;
 	} else {
 		nic->stats.rx_packets++;
-		nic->stats.rx_bytes += skb->len + ETH_HLEN;
+		nic->stats.rx_bytes += len;
 	}
 
 	return 0;
-- 
2.20.1

