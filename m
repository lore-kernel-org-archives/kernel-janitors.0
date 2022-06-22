Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD329C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 22 Jun 2022 06:48:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349499AbiFVGsA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 22 Jun 2022 02:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349994AbiFVGr6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 22 Jun 2022 02:47:58 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA89E60C6
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Jun 2022 23:47:57 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25M6MnT1004401;
        Wed, 22 Jun 2022 06:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=qAnZeifJB1tfWk8inHLUTOUmAujkXZ9aNoOnoucGw1M=;
 b=UdRnM8r/10J14/KzAfa+7iE3ycStcpR2ZORwdG4YZb1Z7R4t8RhDJccxorqDAIg1WW6k
 jJwiMaqz3pjGTn5P3heMJmpDleJLof9VdI+cXmz66kaXmdGbj4S4jRXHqjlCOlit5Z4s
 PINEPYpmJMQN9Ffa9Sc1us/urscgph13/D9g7xj/KWTtOLbOEdxQwZWTSgbgVx/p2ysV
 RYPGc3wGv3g2ARL3aYBkzaka1TvLBJmym6QUhPuITLEq91eNOebHXh6pDCvhGTX9Wfm5
 NJJOGFjYUayppgw+CT+GJvc4dQn3BqDoCeLYYYLL0IOPpaX7TDOJemyQ+e5ZorMc4hJu wQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs54cqhxh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 Jun 2022 06:47:47 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25M6Ve4g038318;
        Wed, 22 Jun 2022 06:47:46 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gtg5v5pes-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 Jun 2022 06:47:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auYOwM5KSQ5QZIRX/c4zE7AR2V80J5ymEEFMEATaOzS+Uj5dGfxBomeQ4fcTEbrUUnRJ9XDtJbAsoffsySww9DlJCntyzAbtGpWhsqRklqhpbzIWviZ/e1b5UZfgyW5LYh5it6z5sZEl220vdYNNnCZ1qxCy6O6/dUG1H9kaGKnNuGK+vBTRTEw/FWDJRMKTU3qqtnH4a7JLVLsaG3XlLn5TPaUBi06hK8nmeikB9HYlxJxVF7uIn2VyYf7U1b7Rk0YjhoTgB+3NfQ3319uzX0Gmi/xQC5CR9zFIXKfM80VIzMGeiAQHjFgCf6ZwXpda3IpYwXBQ9yZTapcgCmdz2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAnZeifJB1tfWk8inHLUTOUmAujkXZ9aNoOnoucGw1M=;
 b=d8O+zUyPtM03fpdC1s/IUxRVMj1+KyG0iio3izbgoxdpfdLh6EdKeivI40e9F9kSBuEdxp6pvaHeAmsaaojJJ+fACpff3k5AhUUWT3tt8LAeD6l+qclkc7UJplJ9Sd26l4mX9b1EtPDZfFXIrpj48HPYPLIupV5ZKpfyAAvA5B5TcJOcr8+XxP0q/jEehrtvXNhhRsBOAoe0L21/JLg4yb7FWbbZ8l3HHSCmvYvPeV40nbIoASIrFyfU9qvG5eLPXCaF5dP4HLdo6ziiuxPPR3VkWu+hBsDYkkYmO5TMn0+SAzsfUUSQLuWd2+tOQUW00BZeFPeee2Fq1eZDYpx48Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAnZeifJB1tfWk8inHLUTOUmAujkXZ9aNoOnoucGw1M=;
 b=TFrucjYaD/fZMlRCNEZ3GBHov+UHAjwhLX8I+m/VL7/sCWzdz/eE0NgtriqUi9fplAbzJHeQ4MLt/lH2Rv9zEWvK4cAPPHBPg56DP8vsdTS7igSxOjLPBEnsFoccU8O78xBuCQnKgy0bNx84+BA63DGIureTmdQxDDL5F95HwKc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BY5PR10MB3986.namprd10.prod.outlook.com
 (2603:10b6:a03:1fb::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Wed, 22 Jun
 2022 06:47:44 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Wed, 22 Jun 2022
 06:47:43 +0000
Date:   Wed, 22 Jun 2022 09:47:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     roger.lu@mediatek.com
Cc:     linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [bug report] soc: mediatek: SVS: add mt8192 SVS GPU driver
Message-ID: <YrK7BkMp5zbgziBq@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0077.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::10) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 902af848-01e2-4510-a457-08da541b1ba8
X-MS-TrafficTypeDiagnostic: BY5PR10MB3986:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB3986C83DA2246E103A6A30528EB29@BY5PR10MB3986.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6OheyPL9+xWQhYD1eY4s4brXif9RcIQAe6r4sVAsQG5MYVArN+O/kUGKWsF6mo+sZn12hXnec2Er8a+m4vKLf4ae+SCaBWJY21mCLcYf0OZdcxvi+3HR+yqgNLlwNEyOWriGDA2TXfDni9hihCshH4bgHvN7QzZ0zXLMb/Keh0a1WCkQywmGdsp1QkfrmTXGjF2f5IuVaxgBem4HFxb3V8TbBMIX2hOoE/OgQzZT16ooC85qNO1n6etl7Nh/2T4MeuhrxtZkDtUw7V5RZOHyTzUr4/bp+RtNdSkI4foax/F3O5sqWbpOYTjdZleu+RUKR09Qqx0A6oDh6YdQwn39aQlG9f73AYViXxh/bviwaqaOm63zO9kHDe9kub+PxaEIaB0FfT38GWjltx9F0dvRlxJbEN1IRcHBXdTo3u3Wcmve8bwpFeLXNDCoMnRmKB0keKRRcBgv2zkuNMb7P/T7wtr0t8n+5C2ShURyU3A+jfoopvYO5h+8+sSFUhY13os70u4OekKF83Edk4S0mmtvlwpd0qoULD3Cr4qHBrrG/GWfh2jBUzwof4GTImpiLszxulLDMCHe8bDS7FONgB3CcJPPHe4k5dDiVyMJuPKW74yVEm6cj8OEkQtmiLNlrY98xwokvPF15u1KakbkBNy3QoQ3KizrQZTMiZftoSCXEpfRerWVcujGvhR4ReI3ucwRK3/trbqaGyOknIGkkPxPjoJWQ2IxS7V870GgSF8o0C2GbnGJ18ibZ9kkLOx5nJMzJdhx02kQr5GmEMbIm82F6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(346002)(39860400002)(136003)(366004)(376002)(6666004)(26005)(6512007)(52116002)(38100700002)(9686003)(186003)(38350700002)(86362001)(41300700001)(66556008)(6916009)(66946007)(6506007)(316002)(4326008)(83380400001)(6486002)(478600001)(33716001)(5660300002)(2906002)(44832011)(8676002)(66476007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xcobfARbxQw8bMzWzs6G4NMRNbyiO4BDuL+MdLvuIoH+DVWnTlMABFY22C7D?=
 =?us-ascii?Q?uvUU/stxfWlG1lNEPQ4jsde6qtcqNrkGwrClQAk6yoxg4D0VSot4f3SHpuqz?=
 =?us-ascii?Q?n2fyPHjKcLwhNtmc3GWpm6pLvxn322lbDz3lAN0qahfKqKj56BMF+Cjf+R5U?=
 =?us-ascii?Q?kPVE/LgAn7qBssLTjVJ9Pzt/rDlhv2o5PNOGNuw47U6DDZcPhaYz/0eO0HKk?=
 =?us-ascii?Q?5+9Afrvpw078cIxJYA1wgs5Pp1oJrgDq3mHmjAm5OiNFJM7OPEiuE5cWmS4y?=
 =?us-ascii?Q?Ry4XFqjvRW7BQ3elzCiS6S+WIYQuZBodMO0xHR1C3dGlTxLKXjAq4BKt0fUR?=
 =?us-ascii?Q?/N/2vPd4v7VavdHenrO/pP4zGHB1/fQ2xcqeg0Zxjtohz8h8MfAf5HB05jY5?=
 =?us-ascii?Q?O3D6QjfboSaoE4sDHyiZHPQiWjI5FwX5x0F7JHBmgU1IK/F1Hecb5gMhxZEK?=
 =?us-ascii?Q?jCANoZuFK/DHvu6iaq3mKx1XbhXFt1ORcY3tyD/7aaTyJv9YhUajOIr89CK/?=
 =?us-ascii?Q?ZAWVNi4RwWwRbiHegNEA0onQe5HBpsS3yGR6OMbCXFPqo3hYjo7xH9oYnK9D?=
 =?us-ascii?Q?0J6uHEdoYCL77VS29dh8MpvKXqL1y0L1U65w1x2Kyuj6EaO1RdUotOu7vex8?=
 =?us-ascii?Q?aEeBhHkFci4sCb2qctA1KYYlNyyFVO/0buqmmQsvAtaaOkERrPa+bBTstvX9?=
 =?us-ascii?Q?vJMaZOgAF81aMYcprGTcNdx05e4DCPO2aPdd+/cKz/0UqHmlSkG8y6uIvI6I?=
 =?us-ascii?Q?ZP1NTORelOiWuQ4uFRn9+dcIaJJ8hGuAIynvni7l/lCuJCxnWboS5/BfswBf?=
 =?us-ascii?Q?WVUXiGV6EJWMo2cBJZ0R8A7nlq6T6Q87aHyhxerxj5jJEs5JGYntiSBM5CNp?=
 =?us-ascii?Q?nUBdMKyEZEQBrWMSGchTFhjVn4BIXtmfYfRS1u19HIy58yRLf4X+Swuf+owQ?=
 =?us-ascii?Q?zN7xRZvxP1weC/P016G8TlTQKeDehW+HVOAAxaSXTbilvJBhNACqi34XLWsv?=
 =?us-ascii?Q?TaaM0uIE8wCmXo37CCpmTMIyJ2jAwqInnviEV8myiSCVSTtv1HMtfnaCXmGp?=
 =?us-ascii?Q?/GzVs21R2cpG5k73LQ49tmHmmTfNysE5anNfqSfXP7wHN2WFTKBw4ANQWxcK?=
 =?us-ascii?Q?4lDWeapi1nAehgj0pq15pnp+4bxPVprLnc1TKjaY99I3FR3RgCT2uoviRI2Z?=
 =?us-ascii?Q?n3LP4K5vTEQQFv7sQlQAevw4fQ3U/7TvH5v1FrZtwtZf6KYKHOP6RH8A3VUg?=
 =?us-ascii?Q?zdBE8ioMGRMPiLhYT6cMjDGwewt7NSMMxGnys9eZsOw1qIZfdenu9a/nzsFG?=
 =?us-ascii?Q?NF8RYy3grGvSvT5xazNFqc6vHkilET52ZwEPsB5GddWLWYH83BQCKwrkhKaO?=
 =?us-ascii?Q?GHHSL8lefWgHmz5s58dGkmxABevNiNfliiAt+oXd0Rcz2Y3Yzdun7kmn3yKR?=
 =?us-ascii?Q?ihvRB07uSVxoJOTjXW+ThQ+KDIYn/WnJBn9lEdDoke7Dty6bqfr7RHbnmfKw?=
 =?us-ascii?Q?3WJrIC3FA/OTNOEgGFPQFkXxiU57D/4ML6SSCfMKV0VEEgyMOKE1HkGFjQJa?=
 =?us-ascii?Q?58Lh9e2sE2GTLIuhxAY7Kfy41Ds5TLTHXoTTR2nh9cFYzafwOzbOpd+KzHoj?=
 =?us-ascii?Q?NFkdaU1r9bFT8+/gpFBmf7xZ360rnKwcjr7ciY9OX9qbjzIJTXKneW6R22cv?=
 =?us-ascii?Q?sJrWw3AbcIvQHh6vQhin8vk5vOVVGbnkXUeRoWjXWDYMIPhV/Zao5fbrG6Mb?=
 =?us-ascii?Q?tpSaNCt7PQC0jxyb+lPC6GAN+RX4Nxw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 902af848-01e2-4510-a457-08da541b1ba8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 06:47:43.7326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NnviVXoF5rjJywRaLHzOjtsRQ+4F0bMxTHpRGq+bVqS+npm+OgLeV9QkbFn1a1dZNDNY+gZ2oqxWmZvOC+iPuHBEittU4WsOzO6TmM3L628=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3986
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-21_11:2022-06-21,2022-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=763 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206220033
X-Proofpoint-GUID: Q4F6gfjicT177aAs-wuImTUMZom677UN
X-Proofpoint-ORIG-GUID: Q4F6gfjicT177aAs-wuImTUMZom677UN
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Roger Lu,

The patch 0bbb09b2af9d: "soc: mediatek: SVS: add mt8192 SVS GPU
driver" from May 16, 2022, leads to the following (unpublished) Smatch
static checker warning:

	drivers/soc/mediatek/mtk-svs.c:532 svs_adjust_pm_opp_volts()
	warn: loop overwrites return value 'ret'

drivers/soc/mediatek/mtk-svs.c
    487 static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
    488 {
    489         int ret = -EPERM, tzone_temp = 0;
                    ^^^^^^^^^^^^^
What is this -EPERM for?

    490         u32 i, svsb_volt, opp_volt, temp_voffset = 0, opp_start, opp_stop;
    491 
    492         mutex_lock(&svsb->lock);
    493 
    494         /*
    495          * 2-line bank updates its corresponding opp volts.
    496          * 1-line bank updates all opp volts.
    497          */
    498         if (svsb->type == SVSB_HIGH) {
    499                 opp_start = 0;
    500                 opp_stop = svsb->turn_pt;
    501         } else if (svsb->type == SVSB_LOW) {
    502                 opp_start = svsb->turn_pt;
    503                 opp_stop = svsb->opp_count;
    504         } else {
    505                 opp_start = 0;
    506                 opp_stop = svsb->opp_count;
    507         }
    508 
    509         /* Get thermal effect */
    510         if (svsb->phase == SVSB_PHASE_MON) {
    511                 ret = thermal_zone_get_temp(svsb->tzd, &tzone_temp);
    512                 if (ret || (svsb->temp > SVSB_TEMP_UPPER_BOUND &&
    513                             svsb->temp < SVSB_TEMP_LOWER_BOUND)) {
    514                         dev_err(svsb->dev, "%s: %d (0x%x), run default volts\n",
    515                                 svsb->tzone_name, ret, svsb->temp);
    516                         svsb->phase = SVSB_PHASE_ERROR;

ret is set here but there is no goto unlock_mutex;

    517                 }
    518 
    519                 if (tzone_temp >= svsb->tzone_htemp)
    520                         temp_voffset += svsb->tzone_htemp_voffset;
    521                 else if (tzone_temp <= svsb->tzone_ltemp)
    522                         temp_voffset += svsb->tzone_ltemp_voffset;
    523 
    524                 /* 2-line bank update all opp volts when running mon mode */
    525                 if (svsb->type == SVSB_HIGH || svsb->type == SVSB_LOW) {
    526                         opp_start = 0;
    527                         opp_stop = svsb->opp_count;
    528                 }
    529         }
    530 
    531         /* vmin <= svsb_volt (opp_volt) <= default opp voltage */
--> 532         for (i = opp_start; i < opp_stop; i++) {

I guess the bug is that there was supposed to be an explicit check?

	if (opp_start == opp_stop) {
		ret = -EPERM;
		goto unlock_mutex;
	}

Otherwise, we are possibly returning the ret from the /* Get thermal
effect */ block.

    533                 switch (svsb->phase) {
    534                 case SVSB_PHASE_ERROR:
    535                         opp_volt = svsb->opp_dvolt[i];
    536                         break;
    537                 case SVSB_PHASE_INIT01:
    538                         /* do nothing */
    539                         goto unlock_mutex;
    540                 case SVSB_PHASE_INIT02:
    541                         svsb_volt = max(svsb->volt[i], svsb->vmin);
    542                         opp_volt = svs_bank_volt_to_opp_volt(svsb_volt,
    543                                                              svsb->volt_step,
    544                                                              svsb->volt_base);
    545                         break;
    546                 case SVSB_PHASE_MON:
    547                         svsb_volt = max(svsb->volt[i] + temp_voffset, svsb->vmin);
    548                         opp_volt = svs_bank_volt_to_opp_volt(svsb_volt,
    549                                                              svsb->volt_step,
    550                                                              svsb->volt_base);
    551                         break;
    552                 default:
    553                         dev_err(svsb->dev, "unknown phase: %u\n", svsb->phase);
    554                         ret = -EINVAL;
    555                         goto unlock_mutex;
    556                 }
    557 
    558                 opp_volt = min(opp_volt, svsb->opp_dvolt[i]);
    559                 ret = dev_pm_opp_adjust_voltage(svsb->opp_dev,
    560                                                 svsb->opp_dfreq[i],
    561                                                 opp_volt, opp_volt,
    562                                                 svsb->opp_dvolt[i]);
    563                 if (ret) {
    564                         dev_err(svsb->dev, "set %uuV fail: %d\n",
    565                                 opp_volt, ret);
    566                         goto unlock_mutex;
    567                 }
    568         }
    569 
    570 unlock_mutex:
    571         mutex_unlock(&svsb->lock);
    572 
    573         return ret;
    574 }

regards,
dan carpenter
