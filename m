Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76DEC433F5
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Nov 2021 11:17:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84811610D1
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Nov 2021 11:17:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236701AbhKQLUV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 17 Nov 2021 06:20:21 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:61392 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233710AbhKQLUU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 17 Nov 2021 06:20:20 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AHAGxka031125;
        Wed, 17 Nov 2021 11:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Sys/4kf8o4/HzSC0VIBGv43X9DXMMcpl9wfV2HaRsB8=;
 b=PzYSB0YOmiXzdJXbYjxD7zhtGcjjOzheugSHc15XNaPNblENA5oM8zZ0O+RLhnh6YxlN
 V7KHsWD0ZqF/4R8NYhzZWsn3P4pRtInoOdzRElyEDxIDDRTPASkT9za1oN26GvRV5svT
 /08PWdc2yb4LHMxL35qg3g8YZv4/sXz1+0xqYAnuyaNn9dm/T7o7qTr68grM3zQgyYkV
 GuRd5/F/UR+XwIGfd0dNiKtv26SX3M0X7BDXHiqbCBZrTx6+8Tg2iFNvpn6bn6Lm/Zv+
 MDYjdWZpb+j+LI0wIqOEW3eS7R1RFgJc4I+ClB5TNjviSdu1vSgbTDY+al+kHAE+2Ju9 rA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cbhmnyxqn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Nov 2021 11:17:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AHBGSKb028964;
        Wed, 17 Nov 2021 11:17:15 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
        by aserp3030.oracle.com with ESMTP id 3ccccpye6m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Nov 2021 11:17:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ND0g0ZaE5JJE3z/BKaWFzz8uCZ/zQSKZ6FXj24MR3bwsr/SfF4m+zb35wBD8GB37V/9tA/pnfnvwQPR5yH+Y79CVyAWdhaGnAukhNOpP1U5r08saKmk7aPy9DC+JnRNpvDkhfwEE6SPdRoxmxa2wvvB9TJ9Cy3EYWt1See3ymb/2UG5j5/LxEMTjxeVIH9CwxDTcmera0Ejg2qWcSTS3/SB2fTZFqwlJsZlcwVOBYnYh6Xxf80IT2/rIsfOgAOyQvA0fjhItJ5p6CFblewmUXBwuamQi/dGJwXX4WPJ02uYRqGMrHpuuZ6Kf8+zXRSbHwSo53Lk4IvYFEeAygxUQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sys/4kf8o4/HzSC0VIBGv43X9DXMMcpl9wfV2HaRsB8=;
 b=a5/2K8nWJrenj3g466RqeoeyNDn3OOkOVb8xcoY9YLQcZAeU0HW0aEjMdd4BQTXOxuAQzSk06zkGYjMNZTZJNm91l8TIqZWPP9oBg2gTe4sAjPPXOD/Zk44clo6wOKuBQbibL1tOt4c88y66NhrWSW/if9ayZUw5zRwibJwH0IbyVc7xzBtk6lcaUXliVmm/6S6r1V0JweMzwvihsi6tyaDQl8HIuc5NvtQC49r4F+x12MbPrGdVC5g2dK6Cb2vGEX3rjzE/Gwj/pCRlFkUxXvOY11KvnJxSQUxPTejxn3PlxrwhofgtVFl6P9xDpJuI5e8xPDPsmEZfYSIG9E+meA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sys/4kf8o4/HzSC0VIBGv43X9DXMMcpl9wfV2HaRsB8=;
 b=AN+iNf973O1pqH4ITHJ3ouUx72hoNq9Pepvp+Gjr21Q+WQuPexPATPKXY7HK7a7ForrGrfxF7OmeaJTUcsHv/zcJAA192Q4bt7fTZ4PEvUhKt2RBPoQpnpwXLQ9dSzRhXh3wzbPa2WCaQzd/kbm5vK56OLVsLtWRWGKO65HowQI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5678.namprd10.prod.outlook.com
 (2603:10b6:303:18c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Wed, 17 Nov
 2021 11:17:13 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Wed, 17 Nov 2021
 11:17:12 +0000
Date:   Wed, 17 Nov 2021 14:17:01 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     luca@lucaceresoli.net
Cc:     Lee Jones <lee.jones@linaro.org>, kernel-janitors@vger.kernel.org
Subject: [bug report] mfd: lp87565: Handle optional reset pin
Message-ID: <20211117111701.GA23355@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0194.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0194.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:44::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Wed, 17 Nov 2021 11:17:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c922f801-4a16-4413-0a09-08d9a9bbcdc7
X-MS-TrafficTypeDiagnostic: MW4PR10MB5678:
X-Microsoft-Antispam-PRVS: <MW4PR10MB5678982A19030A74F4F0B9878E9A9@MW4PR10MB5678.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ygcBssTm/Gg37SWpCWDmRolI5OMh3wsBAyLyp8PVAlQw4Arax5/mHSAGxjds82yXPEF0byqM4uRDZmqhvPSWWJ9zAcHy1mUYu5nmbrWnxSDXDtuzc279MzBFv/2LHmVsECZfTu/8e2S+BLGhwhRIhEXjT8NFQWD8v2rz2c9WVbJRmQycHhgGF0kxLMsYz7a42WtCTwElmGfINwvwZh1fMUxBBUAasWQXAbF2VNCiHSucIgRxjF16Prr8YQ5NSdG6e+lFKmoceIyhQZhfsxqjk5Bo4ALYW6XmrUsYwV4SG9Ch2lLUTekAeMP6v8E3cuNQkG8y0hF3o2eBPBQz3gZ2EoXqcc6MEYJfX06FvmQmjMtb5u632fJJgu/z9yoYhZzZTT/JLjb5J4y18luSTOfAZo9rU9sCUlH5qdkivPmkh+eU3gZJagi2X5hBXZcAt1o/7hq0fWF6/NmDiYItSgmiFAEAYGVpC4U+CMyrWqTduKyuUT+jmhsKwSuMg0nRPl/ELv872ujZcVSQmIRd6ARwqCflLX9J6Qd8dQc78ozOXBUCulbstL1gaFWlZ3Q0/4plhYUWkyqkpxbc8MV8QDsnivaU8mg3qm3toWlpXXMSa8L+kMuMtAiwxYbbizoh3fBXnSY/ZXgDNKBOneNeppJPd22qtjgnyilwCz/zoqvxYOKm3PO23kTu+p3X6X3ZbON54nnxKn60qaJTCl0uBW07eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(55016002)(86362001)(1076003)(33656002)(26005)(52116002)(66476007)(6496006)(9576002)(8676002)(2906002)(8936002)(5660300002)(66946007)(508600001)(6916009)(316002)(66556008)(44832011)(956004)(4326008)(38350700002)(38100700002)(9686003)(33716001)(83380400001)(6666004)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ChfxhR1FMOJS5FxM7xamhcRoPKwuaCUXH9xxOEWhYeAoL7/LELmeNTO+HBQo?=
 =?us-ascii?Q?Jw9fSKxOn7mW1Hdafmlvy91oWAII4ldgmjt8kdvWDbu3qBiYXCTTfs+KD32m?=
 =?us-ascii?Q?FfFE0dMa74cZ85rQtzO36Qhg0lZs89vuw4R4af32eaEUislM2orftWCKJ/m+?=
 =?us-ascii?Q?2GrPbV7BP6U+O/e5tbmTk5HuaCiFWuFKZ/VB7+vGoQXKBhRsIvGswfmQ95Kv?=
 =?us-ascii?Q?I4zrZiy2tGwQrg/n6kshwS5y61v5mxgOYQLqtNPoZQykdScmdzlB1JXevUZj?=
 =?us-ascii?Q?PyCI6BbykGq1X7Gcg6KWCg/NaLOSbExmlaaxw1bUmejitEBZrOVkfdguwwqN?=
 =?us-ascii?Q?NLFmeFy+JqTfYjuBMSqSQkhksYMnhXmTNWDebtPcJQA5/oHM0nQR/xKPMnbb?=
 =?us-ascii?Q?msKjXYb5j8hPcUFeHW2w6rZeveHlInRllQoe1yh6cTPMA3aJ5gOLhVblqr9h?=
 =?us-ascii?Q?vL45RP9ZyMsik5i1H+1Jy2ETqbk9vX9vGxwGg7vlEz2TYk8BKKa4eJcMg0E4?=
 =?us-ascii?Q?ABpmVmzXJLnwvoifHB7l/WogJbRN8+uqaqfEzvH5hIJ10RGU4GLWfUP3JG4w?=
 =?us-ascii?Q?oLDQA4ITzLd6uIlvTVjA17nx6PehVE+3O7Cj8nyY/XBmC7Bik9ak81aJebhn?=
 =?us-ascii?Q?y3eFh8Gt1DtN4v63oSzPnIRqwg6jgHPz7AhbVsEV9C1a0ZuwzMEP01f03ePm?=
 =?us-ascii?Q?DFDfwNDjsEFgsCAR31Qps6IjErkhahZOuwNL1g2/S8FvPNrpXlrZgrN2ot84?=
 =?us-ascii?Q?yyFdOF4widjOFIyLqHC1TEGpWtWzO1vYHFGpt55tZcXe1qvCeDcYtq/k/7aH?=
 =?us-ascii?Q?FASiXHKJuBe6ybJZKkBzvaIpH/rVb5rQN6LYxLkQcf1dcBpd4IyXT4MMIBix?=
 =?us-ascii?Q?enndmsD+oRguQA7dTryrCa63PeCf5F/S53+tYIbknqheGceXqpeqq+yakEDa?=
 =?us-ascii?Q?rBSVvgDBotCX1tnuzVSs3jDyJYeCI6qttqPp8nq/WZRMBet5x5Zp5Z6ensGs?=
 =?us-ascii?Q?VBwa5z4K9amq7lnp3p1Vn5oIsNLvVhY1GPYP5RjO1rcIkJeN8L7TjXMq488C?=
 =?us-ascii?Q?L4C8e2FRhjcpzI/cJkvufQyRob7cUJT96MrkyTaZ29uvLFAytILPVfBCyGsP?=
 =?us-ascii?Q?Z7vcqOqcRddyPUWQNQy6FjiyMkZJaJFnFLdBLjrZdIbdEP+s8iWaeG4tjQW7?=
 =?us-ascii?Q?DiImgktEJh4KIip++7tpL+zwpo7KEpl5a7K8//hPkkXCXDwBn2zKzxVwll+a?=
 =?us-ascii?Q?fOLxkKjQ9LOL/YCL9CXZWgksJ6kAgMYI9yUIlmEknGoVMsoky9Ojm9Sd2s/j?=
 =?us-ascii?Q?0lyYkzRwegrW+qOc2AtD60uAgql+Th0+CBUyWK4xLce73HNC57iOPHz95m50?=
 =?us-ascii?Q?YFz+6X4TRiVwkBQbu0SnD03QLWLEzky4iDBYZGo32kfeVQfHQExrIbASlEKB?=
 =?us-ascii?Q?5cBklkmZjO4tFb2xefznKhmoNfGCSpFM/enwU9Wr724iFIdBQBAwZICrcRXc?=
 =?us-ascii?Q?QeA6hLMWH3ekkPfFbGlaI1qpIPo7YOvZ+76rfl636BxM3P2pgTyfPRoYFC9O?=
 =?us-ascii?Q?LxYe6PjEC2BP/y7gpzfD3zAju3OeQcd4/sgHl4iiCeDQGLjnnwNyTAK/s/2I?=
 =?us-ascii?Q?U9YpX+yDpYqMF/IT2ID/ED21mY/oEpdPwKhErbbUhRQM66oAFcK6sfIQedax?=
 =?us-ascii?Q?3txO0B7PG2F1/a1/gtC1ptI0ykw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c922f801-4a16-4413-0a09-08d9a9bbcdc7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 11:17:12.7716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ag7DrN6nELajHWgWD62ZlTDsFNonGncXEPqwSHN5iDuWp0LK5UNirLzTi2oyn/23CwdIwAVpq/mqQ7LAuvQF8wScaJ7C24FDK6XQOca8Bts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5678
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10170 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=784 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111170058
X-Proofpoint-ORIG-GUID: Rf6Thsyq1TYoEdR2mBKQkux1-piWhX2u
X-Proofpoint-GUID: Rf6Thsyq1TYoEdR2mBKQkux1-piWhX2u
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Luca Ceresoli,

The patch 50e4d7a2a667: "mfd: lp87565: Handle optional reset pin"
from Feb 26, 2021, leads to the following Smatch static checker
warning:

	drivers/mfd/lp87565.c:76 lp87565_probe()
	warn: 'lp87565->reset_gpio' could be an error pointer

drivers/mfd/lp87565.c
    46 static int lp87565_probe(struct i2c_client *client,
    47                          const struct i2c_device_id *ids)
    48 {
    49         struct lp87565 *lp87565;
    50         const struct of_device_id *of_id;
    51         int ret;
    52         unsigned int otpid;
    53 
    54         lp87565 = devm_kzalloc(&client->dev, sizeof(*lp87565), GFP_KERNEL);
    55         if (!lp87565)
    56                 return -ENOMEM;
    57 
    58         lp87565->dev = &client->dev;
    59 
    60         lp87565->regmap = devm_regmap_init_i2c(client, &lp87565_regmap_config);
    61         if (IS_ERR(lp87565->regmap)) {
    62                 ret = PTR_ERR(lp87565->regmap);
    63                 dev_err(lp87565->dev,
    64                         "Failed to initialize register map: %d\n", ret);
    65                 return ret;
    66         }
    67 
    68         lp87565->reset_gpio = devm_gpiod_get_optional(lp87565->dev, "reset",
    69                                                       GPIOD_OUT_LOW);
    70         if (IS_ERR(lp87565->reset_gpio)) {
    71                 ret = PTR_ERR(lp87565->reset_gpio);
    72                 if (ret == -EPROBE_DEFER)
    73                         return ret;

Only "ret = -EPROBE_DEFER" is handled.  Other error pointer will lead to
a crash.

    74         }
    75 
--> 76         if (lp87565->reset_gpio) {
    77                 gpiod_set_value_cansleep(lp87565->reset_gpio, 1);
    78                 /* The minimum assertion time is undocumented, just guess */
    79                 usleep_range(2000, 4000);
    80 
    81                 gpiod_set_value_cansleep(lp87565->reset_gpio, 0);
    82                 /* Min 1.2 ms before first I2C transaction */
    83                 usleep_range(1500, 3000);
    84         }
    85 
    86         ret = regmap_read(lp87565->regmap, LP87565_REG_OTP_REV, &otpid);
    87         if (ret) {
    88                 dev_err(lp87565->dev, "Failed to read OTP ID\n");
    89                 return ret;
    90         }
    91 
    92         lp87565->rev = otpid & LP87565_OTP_REV_OTP_ID;
    93 
    94         of_id = of_match_device(of_lp87565_match_table, &client->dev);
    95         if (of_id)
    96                 lp87565->dev_type = (enum lp87565_device_type)of_id->data;
    97 
    98         i2c_set_clientdata(client, lp87565);
    99 
    100         return devm_mfd_add_devices(lp87565->dev, PLATFORM_DEVID_AUTO,
    101                                     lp87565_cells, ARRAY_SIZE(lp87565_cells),
    102                                     NULL, 0, NULL);
    103 }

regards,
dan carpenter
