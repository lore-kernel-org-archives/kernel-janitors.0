Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7853CC433F5
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Jan 2022 10:47:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349203AbiASKrh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Jan 2022 05:47:37 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:10518 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346702AbiASKrg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Jan 2022 05:47:36 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JACHMK018337;
        Wed, 19 Jan 2022 10:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=+4S+mEjL0v8Bte0Cf0trhnOf3brRCp8sVpyhyOOHZWw=;
 b=ccmQVgZ/fuGHVAqxrs271Dh7+77ULzsOpF6tbFlxWpQWeAJWHzsnqFBkVwQrIQhQIeG+
 j3BVU1LwjwZ0aCXlW9IjqL9lNyCv8SKRKakFGIhrf+BHg5tb+BQnfN9UVcNafz2xik4R
 7UMNs//JmO7Bk3Pif966obRaaqZi5vP4YlA+61+0rLjJRg+8Dj1IpifkeUw2P0cZiYa1
 aX6nOjObf7jTgTdRhulp0iDJ3Tla9P1PDUx5D5ibPkiakYv4eo53ZomRXvZ3jC9RbS4P
 9y7WpWL2TDzMxZuol8RIZwjZFPZ4uZQ8bpSJXJo8eBVCgcIQDnwtlcdGcfnARvx4vQfi Ag== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dnc51ckah-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 19 Jan 2022 10:47:34 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JAk4Nx104577;
        Wed, 19 Jan 2022 10:47:33 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
        by userp3020.oracle.com with ESMTP id 3dkqqq4qu1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 19 Jan 2022 10:47:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKLAC8M2Oizl9k6RCR+pvmVmWHgozJcvcJQ5Imj70FptRuvA77KxOfbdg5GxwULZ5ZnTmWo1xJepFEzQGw05uOrtrFRMsmB+pl4T+NdjPBk33T2NFU7y6Y2N0R8CEdDeGiuZ51MX7CYcBSvcTaiCOt6NmcD+Uua3r7XsBdA2yzGsHNQstEv+y/iQ74B/6FAzXg/4XxV/0vIqbV24Iv3EXmOsrLnnj912f6BhfUmclz93Gqc8FXGUQWwhw3+1mPl6aG0kx/uoDW2qRujHt2otmiZmo7NsUfqovtoqMRLEQ7R4ujKAVJtzD2LrVcUigIr5FmO4XBFOb6BXy8ZtppaYiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4S+mEjL0v8Bte0Cf0trhnOf3brRCp8sVpyhyOOHZWw=;
 b=ehjaJ4W4Vy6IfiHtcpZ20BdalhekPeGL7sDo81ohnFjrLCfzcm2C03SMws1MijRLYuCnyoBouN7ft45By/BBFeeWz3ybXDnnrX2Bf9hGkB1nK88cZJzjKZ0eGe3thLv+TXWwZca5dkSioT21izoMchnwdVJHfdx/FqMVsj8vmIBiAlyYSsQy6vG0+FM1awCcYa2w7udUCIyO4hjQUgNHo6zifqkVhccC7PcTNd/R2TgL47jAHxWpVJv+/snXKX7MKMG7qrWXF0Q3D+h7NVDmBHbWXOMFqXcELDQMI1wadgBJr9S3rJhyZaIvtFHr2E82MFpcGQk5zkxpw3RR0nzZUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4S+mEjL0v8Bte0Cf0trhnOf3brRCp8sVpyhyOOHZWw=;
 b=bPDl/JCMHSxj7dG+jPOcJIqRu99zaq5GtF+V//An3cInk45ODZ1ihyrAjGI2pqw2sSivc9PDKX9at94U2zA+hVXdESWbX8JuadhCV0ey8FQi31GUqdkBNtIDNS7LplHPQSOXwhr5rA8ydl6Tv7ZmkAJXsQBr7j5i3ZwYbcGYMOg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR10MB2007.namprd10.prod.outlook.com
 (2603:10b6:903:123::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 10:47:31 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 10:47:31 +0000
Date:   Wed, 19 Jan 2022 13:47:20 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     nicolas.ferre@microchip.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: macb: WoL support for GEM type of Ethernet
 controller
Message-ID: <20220119104720.GA3945@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0173.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::8) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1f00824-95c8-4682-6ec8-08d9db39180d
X-MS-TrafficTypeDiagnostic: CY4PR10MB2007:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB2007130971CF1B6243DC03B08E599@CY4PR10MB2007.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QvpH67VwtE1SZ/KzUwiL7Wo69bTo95079TcU5pCDuz6m36jZKUIPj7l/ZkESE6QOfaHCHbzEXIoor8jDchORiQNUrgoiIrp4jcRVOahmJd/5pqp/mlwqOi7umLknCCFn2DWWv0NA6IGZFi/ZPeTiVFTUcOtspBvDROLH1gDgyoO4b5B/dUiOy/CF1Ofm/1FXg31vmxAL3gDRdV2MtvOgtNWcHF2wb9aJ9HZ3g8CNw9lKp2jU2FXgTRMqHvBoSpx354pi3dvjson0qUV8hkWn1UnLtpHSyerWc9RFPcfgBUYqfJvo6vNaBfuERAOLxp+WXQ2GGDPE1AvmBiXsyFZG9euq+kvf3ZTjOLKtohJc6Eo86Sq6fplUBP+ZemlNfFEFNlS93ICA01dU1qUt0/LYc3hDbdafHeS0pueV0XOSLbO7s1qdu6Hd+Ho8Zp6/Aukli6Q5clbDG0sRfwVCiagZwvHq9QxjTM+OkpGVzXTvEe+DqSk+c0S14ffDsXZcqX8711jmWeN0kL09BRNjB/iBfTH7iLaoYgWVvWjfH+7kcTmJDDMtqLDZopcjxfWzhZVBUmK9EQcojnQV1l31lJR6Mz+NUCxSEZKe8JO453p5rFZBngIdeiy4TBqSdeu9OkExlgaIOOdEc9Mjr5cyUdKY+Mbr22IFee3+HszZTs0Ul0BuhH6eqczqchL261AAKxWQpYM6WmYa1x5WcVrx/kZBXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(6486002)(33656002)(316002)(5660300002)(86362001)(6506007)(4326008)(38350700002)(83380400001)(6916009)(33716001)(9686003)(26005)(52116002)(6666004)(508600001)(66946007)(38100700002)(44832011)(8936002)(66476007)(2906002)(8676002)(6512007)(186003)(1076003)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NxzGfSAx9wsWF9Sy72t/QZ0axUQ3oJhpAtAp7rD2kSLN2hrpYQR11BSh8F7e?=
 =?us-ascii?Q?kAUZlCUwoF6V2PQE/gnPaBiqMsJdm24oggu/iiSJotXH5hD649Pm+KsGl+Pu?=
 =?us-ascii?Q?7O4+m8xcWCtUiP1EVm1J2nz3y0Mr/rtQH3e8IUY8y8gIZ7GiF3J+qhJVUlX/?=
 =?us-ascii?Q?WOYwLVVPNBsquEWFpImAovNkevbRiY5mnoLCnxo6JGXFCPktMYs6nz2OKmU3?=
 =?us-ascii?Q?4aoIZtvywscn19ewN3lDBRUZqbbS8toHqroCY4B6LOVPN3UbQ+Z+RjVpYChV?=
 =?us-ascii?Q?XKvRIHfUiyRhPQUi+z+St+3G/b7jX48N77L2AypHMkc2AY7jYXSaMCo+swtX?=
 =?us-ascii?Q?di2K5/jwSt9qWjinu4K/wxs/Ad2nmUOCMRy67z4Oxf9beWV4slkw9q7dfFub?=
 =?us-ascii?Q?2ysYXHBx3ry/loOxDGt8y3+Lg5AlmO5K61DTZidsn7gsDFrtX7lUkykdciNq?=
 =?us-ascii?Q?EjbReblLEugSISQTpZfLrQKmZeG9MQ3zlijxpU12urccjaRhgXPr6UgEY9N9?=
 =?us-ascii?Q?d1WG+UHjaqFaxQNgRkN25kMRi71wb2PYjjrYlaOIu71m8N4OlLB0uofFKV0r?=
 =?us-ascii?Q?FRp7d7mkAVdaNZB304IE1MIOKkBEuZbjE3hXnbU16LPLGcblFoXkeEblkzd8?=
 =?us-ascii?Q?S5Q0EmkgLbflZoZZ8zsLl7jUbaFmbAL0NANDGKBApsscT8Yju6cPYQ/v+s94?=
 =?us-ascii?Q?UsR8e48y+JJNsBH2/kroyKH62NcqvZJMVT1rkfaT4aFp88F9Uuc8MslVgrWA?=
 =?us-ascii?Q?I2C9DrmpudO+/JMYleweGt7I0Ku/qIMGIq4VPWn6AON3zFsKuIByc41DEBxo?=
 =?us-ascii?Q?Y8hU/7sEJrESB1NuvRzMc9WoK4CWfQePXjVfLgoYVb5EhXAxXJ9FDFZOTTXw?=
 =?us-ascii?Q?znKCuLrbHNIdPx1xz/LVlO9ODKitj8RM/PIN6AusxVgLmkYfCGTHDZkKOk1F?=
 =?us-ascii?Q?J6Um5atK5puWzQjXxwuAwPGQgfEysBgE1XeL9FcOFIQM92Yx0plywDXOGbBu?=
 =?us-ascii?Q?4B+1wMv8sZkNcYYjLZGZKQbcLoPqN5ynvSwveeYh3LswUeAJ+1smTsDtoF0q?=
 =?us-ascii?Q?o8RFWKGML1NrsxkVw2nlaCQm+nbn5pKPp2rBcE0J/1eUMZTIjtFoqDJqknOS?=
 =?us-ascii?Q?n2YRiD2b/pQ7EwVRva3xFrguLAj6qlErh5UVOImGe1NDQQkBiDBq2jU1BpG0?=
 =?us-ascii?Q?rJKNivuFUkdAYl+G8OmL0YNukXekLJ2FkevSQpwFUEEoXZ85cPj55YgWapfm?=
 =?us-ascii?Q?SWkJSu0e6uM16hPgeptUmIacVy956PrmJGo9dPX9DzdH6yvUW/XuU58mqlY/?=
 =?us-ascii?Q?wvJXEtixL2T8czjShd1wHfitleO00D26ne5uVZnIb7bHwR2vFMK4GxCCY+z4?=
 =?us-ascii?Q?Lu1XPjKqv1nqkOUHa6Oi6uVARC8/pluL9JHpZKvT7fnN07SlhQfe487d7GXa?=
 =?us-ascii?Q?Gnie09Q1CCvtfjDHqcr/FOTCEflDY9kkIyRLOw4l4DagW7QbI7/edReTTFNv?=
 =?us-ascii?Q?0Gnc4g6G48Z/0cA6gCab7aEOlsCGSi7LWLQ3fiUobT6hrvXblK1fOH0z0uZU?=
 =?us-ascii?Q?QpEhz0cMiJqg5IojdaM5ESWSCASFIUKrbaTuhWMHa6VAoVbaAPuQeBHWf1or?=
 =?us-ascii?Q?CN9adCnh9+3dvh3ejdJtq3tK8/mic40Gwmo/33Zq8atwap9KRqDAw7uJUqai?=
 =?us-ascii?Q?7kgk7gTGu3dnfb7XhSMEPFit9Bc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f00824-95c8-4682-6ec8-08d9db39180d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 10:47:31.4194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fyGITlKkN9mvUhlPCf5szlddto9zH/ZoPjbDS18SRXQJ+XzxMfGDqxS8s0R/ZCoVwdZJTFrIJpJdDbv7WNSKnUqjE3ivjImUtn8ry/6wt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB2007
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10231 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=831 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190059
X-Proofpoint-GUID: yO_6UBkSBnDnoqf0gvNSYQ6n9YAtCCTG
X-Proofpoint-ORIG-GUID: yO_6UBkSBnDnoqf0gvNSYQ6n9YAtCCTG
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Nicolas Ferre,

The patch 558e35ccfe95: "net: macb: WoL support for GEM type of
Ethernet controller" from Jul 20, 2020, leads to the following Smatch
static checker warning:

	./include/linux/interrupt.h:215 devm_request_irq()
	warn: sleeping in atomic context

The call tree is:

macb_suspend() <- disables preempt
macb_resume() <- disables preempt
-> devm_request_irq()

drivers/net/ethernet/cadence/macb_main.c
  4922        static int __maybe_unused macb_resume(struct device *dev)
  4923        {
  4924                struct net_device *netdev = dev_get_drvdata(dev);
  4925                struct macb *bp = netdev_priv(netdev);
  4926                struct macb_queue *queue;
  4927                unsigned long flags;
  4928                unsigned int q;
  4929                int err;
  4930
  4931                if (!netif_running(netdev))
  4932                        return 0;
  4933
  4934                if (!device_may_wakeup(dev))
  4935                        pm_runtime_force_resume(dev);
  4936
  4937                if (bp->wol & MACB_WOL_ENABLED) {
  4938                        spin_lock_irqsave(&bp->lock, flags);

Holding a spinlock

  4939                        /* Disable WoL */
  4940                        if (macb_is_gem(bp)) {
  4941                                queue_writel(bp->queues, IDR, GEM_BIT(WOL));
  4942                                gem_writel(bp, WOL, 0);
  4943                        } else {
  4944                                queue_writel(bp->queues, IDR, MACB_BIT(WOL));
  4945                                macb_writel(bp, WOL, 0);
  4946                        }
  4947                        /* Clear ISR on queue 0 */
  4948                        queue_readl(bp->queues, ISR);
  4949                        if (bp->caps & MACB_CAPS_ISR_CLEAR_ON_WRITE)
  4950                                queue_writel(bp->queues, ISR, -1);
  4951                        /* Replace interrupt handler on queue 0 */
  4952                        devm_free_irq(dev, bp->queues[0].irq, bp->queues);
  4953                        err = devm_request_irq(dev, bp->queues[0].irq, macb_interrupt,

devm_request_irq() has a GFP_KERNEL allocation in it.  The suspend and
resume function have this same bug.

  4954                                               IRQF_SHARED, netdev->name, bp->queues);
  4955                        if (err) {
  4956                                dev_err(dev,
  4957                                        "Unable to request IRQ %d (error %d)\n",
  4958                                        bp->queues[0].irq, err);
  4959                                spin_unlock_irqrestore(&bp->lock, flags);
  4960                                return err;
  4961                        }
  4962                        spin_unlock_irqrestore(&bp->lock, flags);
  4963
  4964                        disable_irq_wake(bp->queues[0].irq);
  4965

regards,
dan carpenter
