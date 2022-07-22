Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200E0C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 22 Jul 2022 10:07:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235029AbiGVKH3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 22 Jul 2022 06:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiGVKH2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 Jul 2022 06:07:28 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B836670E6C
        for <kernel-janitors@vger.kernel.org>; Fri, 22 Jul 2022 03:07:27 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26M9nWO3024801;
        Fri, 22 Jul 2022 10:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=C1W7oqwpBu5+xskt8sJwQ+tpEcYSmY8RawM1TxlQfk0=;
 b=h71C+w2+9f1tiJgOcShDXUFDTXqzq+fx1vh211dIz9FKBAZpEfEXRxQzEJbFgoOoxtvU
 0WoCFA0Wfqrhip1rPKNKgORUrMJTE3P6rD3yRAhTJQzYz0CQnyGIBIWNzAWH47B1c0EG
 vf6U8E8I+sdCdzQbTrFBQdlQd3bVKLHiYzTmFnJzeTxRtcGTYWyz8sqDC0+TtpLz/q76
 8wILcKSRXB2EdFHF2O+qLlLRw0H0Sm4d4pDVzRoh8N/Gn7tbEvYhJVo32N2EouVMe66l
 4nhNAnQOHXJxzdtfpLEc8Mxwa+EWvIwE+/5YKDlDWl0nPJSx4gmpdh5tvH1uL5Iw+0qX gQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbkx17391-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jul 2022 10:07:27 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 26M93tDZ039183;
        Fri, 22 Jul 2022 10:07:26 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3hc1k7pdp4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jul 2022 10:07:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZ4b1X2ZB9oqUnj1dPU2ae85H6I3mrkZ641gINoZvkWxgLuRltArCVRXyEkRBdS5pkiC4YO4krwD3bGMjZXRBvVJaYREhzoAs+9Fy4BV+1qtXwqT3KNawi2kknLMTCpVHCaGCgaKx1oQaqpm+mOfoMy2rypv3euf0l1nTeXMneZ48q16qjaqEVep5ROo8lLQ/5RuI2IfQD2kiDPByi7k92u3X6/Zu54n0s4Y8/9VJwEtmKaiA9/C2tSt6L0j90xVmAPj05DOr95xGaoDVLZpdYU7uX8a5Zy74RL5K7YuMaOrFX/ABBPbwg7vhaQT3n6shE2cTmDPvL46rFTv329gmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1W7oqwpBu5+xskt8sJwQ+tpEcYSmY8RawM1TxlQfk0=;
 b=dUARDJtPkiwVzXGC0ztAWunsj6s3pLsB1I13Ni7qouFrLR+VXO/SW7ShblrgDkihVZJHLJuqbi+YkyqarGXg6OeMgXJgGovVpTtqfRKjSWiiKbdJh9vmHeA1/UuCYkhDRLCWAclT/NFZJvclnhS931Kx7Z4ha9zq2ZYWB/kXZY203S/WID/LmoRJzR0FQ5PiXox5yUax+rooOya0idt/qWGSLoXf6+Q9OV/0pZyH41e/kzv+gj3E1fWBoEnNn7OPlzwCJl6Z2tAhMJFRJurg+bOlBH46u7OEuDBf6HbkPy3igGCosny2Mlrty9BMnTxPKKhkhpKhZ8JTuIXmcz/Dig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1W7oqwpBu5+xskt8sJwQ+tpEcYSmY8RawM1TxlQfk0=;
 b=C+FiwZJWk0/UvWam+06JePAR9Ee4R1iY4Vbwx2MWANA5qYKfsGwqq2Ir+RwX1TjYFFJpws+KNYH47poNaJ9qu5Bi/2xH2MEjHceI78C5G0hnNYZ1HRehXHws1M84e/V7AamLcvndXYBlqqTk64VOptzqw++DOczwql4q5sI4wvs=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH0PR10MB5595.namprd10.prod.outlook.com
 (2603:10b6:510:f7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 10:07:25 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97%4]) with mapi id 15.20.5458.018; Fri, 22 Jul 2022
 10:07:24 +0000
Date:   Fri, 22 Jul 2022 13:07:02 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     mailhol.vincent@wanadoo.fr
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] can: pch_can: do not report txerr and rxerr during
 bus-off
Message-ID: <Ytp2xv0jxwv7DBGU@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0105.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb2410c6-0e5e-41e7-c2e7-08da6bc9f910
X-MS-TrafficTypeDiagnostic: PH0PR10MB5595:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XRRDCHhxiRNvLXOhixHLdthPGMivbSFv7BJFFOjj32i44iqX+BjMGNFLRT2MrSU+f72vw9IHjThiDJUAqDKTm+OnuO7+DJcTgJ2i3jmsk6NbZqm9shDa1QiAq6g0lHHfar0SEwZJd1pS5/FIyTmoBY5ulTdyER06fnP7bzgKfctYslFIOugbrOBtv7ahSLFVNyCaP1db6aiUxvZjviYXm/9Eh8YgiNzGgT0OrZWLn3g2Jsbgw1UwEDsOwdLsuciR6glNtjKPJ4WLfpiFGLcaFB5wZWMlubxhBkqsKcu1uTsEfGyc/85sHGXozmwC6V9SY4X1ocFUqpIp8viS1+1LOByLa9DcLpBEYIMegxOnP0+TCoG82Wc7WidEFs6di3m163B6g60yd/e/4k2HWZADTv8imzYNPJpAf/7onzU/WQ/nQpAZY7LKUo7vInLzFS2+nqfwloPV67j2AL/rMSV8pc5o1FZ2DNtJmXhrOR3E2bxDjTHiW6xJ/dl8Eu2SBDEbGHyOUnnRDSBTG1ZSzRuaDpmwZZ4KBSUEYqVJ6TDfFJ/8EU6DNq56mRrdjEvJchxV3qOoUIbFXHigNbUmqzhTIaWd1q2fcSkgb4RXIWbFk6sdJaogAFjA7euh370JrZVQd7tpxDbxgVHKgA/7Q3uz4nSAmtD3U98oiSByDM3u5YO6JlUIaJahTpmFEuTUOE5TCtuo8NS4zokYGypwWtgYPkPHRZ31nDuYigQ+ud+C50SIiGC2psISXaMJJOIqKEJDFpdiIfaR9avQ5uBAbutShVOoOg5MYBUzA310pAqf4Cs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(39860400002)(346002)(376002)(366004)(136003)(396003)(44832011)(8936002)(5660300002)(66476007)(66946007)(66556008)(8676002)(4326008)(33716001)(2906002)(83380400001)(86362001)(38100700002)(38350700002)(6916009)(316002)(26005)(6512007)(9686003)(186003)(478600001)(6486002)(6506007)(52116002)(41300700001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0p/mtWIfAhEH3FHtWzBAkbsy7I0G0IbLwjIIn68HFYGprmP1oBpwt9hsSKcd?=
 =?us-ascii?Q?/naf/WCIcwIdx0i4zi4v+n0KFAUXR0gQ/FHW/1r3lca9jjxmf2/l5OaTXs1z?=
 =?us-ascii?Q?oXP6rDPWHLwKBgNxjOgvX8tR3cKgJctphIfGq24SpxKMQacbP0Qz29IMvHM6?=
 =?us-ascii?Q?iqyjkUFMV7h11kT951VrSprFdAY4yirVzPonpGPnRlRC0W2UaXuFpxV5c402?=
 =?us-ascii?Q?qiCnOFBz22NdO/5qT5FNa75oxp+MXkCSmxAYpn1Vgx8BQi9873v0JlArT/Q8?=
 =?us-ascii?Q?8Tu5dQl+9/d9LeqWNKZX30Zntrs6rJYPqgURvCIcjaC/t7S6Z9dVGB3Gaq3u?=
 =?us-ascii?Q?N1dtkwd2iXcw6WvcL9z2My6GL0lnQ0g8a0xEf71xPseQUMbLkYr8cf+RrWoS?=
 =?us-ascii?Q?hRd4SHDPWbNwPxVwm2S4UfaTANDOdeHwzxvye5m0zSAkQw3IpoyO6Y8l7L4f?=
 =?us-ascii?Q?cGzNJcHz/qNOWjW5W1Se+AWWzUiWhs8jWNqKkVk5NHtHIWqVvi7yFOX5sMt0?=
 =?us-ascii?Q?7XowmSyIL7THeESE3AD82DRXIPCN1PpKPJuwndyraEM0dOxGHGUVpF4+PWez?=
 =?us-ascii?Q?anRT0lkcrhRLz++lxsVFJtw58C7XbktjA8UebYDrt2sQVplpjuAUfpx/sa+c?=
 =?us-ascii?Q?J60ZWFcR1O1DXegM/Y5g/7uR6xvz6R3opYPXseMNPlEFTmHjRF2d45ij9T8s?=
 =?us-ascii?Q?UxW+aoRCxUeCX9TPEw/kQynyFNzBBY9s1wsK2XbNLLtdzmNWTbnmZhD6Fswo?=
 =?us-ascii?Q?qHA2FWkVFDN7AIoXgSmEZDR4LCfKAswIBMkccHgHN+igx1pH08clBRddHOqr?=
 =?us-ascii?Q?8vvgKhYbTazToJB2bD9AMRYXIGq2rj80XAStsmm1Dm6Is+fqjA5te+MWlLOG?=
 =?us-ascii?Q?iG0h4xGViEUijw5rEK8I/1++wQBn3w5vEEonKg90Wlz54EBfMqX5dk1N/AQI?=
 =?us-ascii?Q?SVokARfPry9XLlD2pOqki3IgNNwYAUecN5czIegYiRutDju/Z7XJdFeb72Oi?=
 =?us-ascii?Q?p53oJO/8a3U0Z7cMbCrNBMzrYBoxomNIIS0kKuUeDfPdcbDo6YV+Mh0/Fx3v?=
 =?us-ascii?Q?bVSvpisstYs17ReYukYDk8WGtNm8S+8D+i0Ugpz9fETohO00hp3/7qD7VY38?=
 =?us-ascii?Q?T2B0lNezsOdzKR/SrUTyn/SUY/KcWJ/aNJsXIo+2J598sHegIhaWo5W/MCEP?=
 =?us-ascii?Q?324ocMsxz7PJhuJcdsvcOBdg/AxQyGYeoQ4UuFwYQdthI28JitJ9SlJSElbX?=
 =?us-ascii?Q?UGaM9WkXoNUHiufVs/p7gTG9GpvNBEpHE+QS9SCfviKU/MgIhOVPnRSGOEp4?=
 =?us-ascii?Q?pqFeplSkKWUVHfsFTfT+yQNoSPLRqHJrNzJdeys9ix9tsVQAzQN8v3vKuzEF?=
 =?us-ascii?Q?zQNeacGhBj8n9Q7rNiFFeiD+KLH7vsxBOCFUY1N28R1J0NSg+mTNQEXJWb0S?=
 =?us-ascii?Q?Oev9SifMTockpR3dlim5nbFHCnLDPt3VEWqa0MhTkVJutv+JxS53IlCCvpjk?=
 =?us-ascii?Q?NxUOq9xEECU4xn+Aq2PwuBb55odRbRledACiS2dgbFtmWEOXZew9kvKCbcgC?=
 =?us-ascii?Q?8MT6mzcfjbskSfhs1ePXjgDLR7DXz0yme2hsjJOBboiS0k4jjbqKzLH7SWR9?=
 =?us-ascii?Q?KA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2410c6-0e5e-41e7-c2e7-08da6bc9f910
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 10:07:24.7413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roS5DNQ6YCe4AMUjEAffXUswZdTKTWE5XGoQv6KF8yyuorKuRg1cJu3cct2aZaXiyHzX+AnBJNR8Fcylr6nEodZIZJGnZIKLb5Zqwt8nsOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5595
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-22_02,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 mlxlogscore=901 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207220042
X-Proofpoint-GUID: V1ce2BnKm-InVqKNp80RfYvZhvfyVshn
X-Proofpoint-ORIG-GUID: V1ce2BnKm-InVqKNp80RfYvZhvfyVshn
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Vincent Mailhol,

The patch 3a5c7e4611dd: "can: pch_can: do not report txerr and rxerr
during bus-off" from Jul 19, 2022, leads to the following Smatch
static checker warning:

	drivers/net/can/pch_can.c:501 pch_can_error()
	error: uninitialized symbol 'errc'.

drivers/net/can/pch_can.c
    479 static void pch_can_error(struct net_device *ndev, u32 status)
    480 {
    481         struct sk_buff *skb;
    482         struct pch_can_priv *priv = netdev_priv(ndev);
    483         struct can_frame *cf;
    484         u32 errc, lec;
    485         struct net_device_stats *stats = &(priv->ndev->stats);
    486         enum can_state state = priv->can.state;
    487 
    488         skb = alloc_can_err_skb(ndev, &cf);
    489         if (!skb)
    490                 return;
    491 
    492         if (status & PCH_BUS_OFF) {
    493                 pch_can_set_tx_all(priv, 0);
    494                 pch_can_set_rx_all(priv, 0);
    495                 state = CAN_STATE_BUS_OFF;
    496                 cf->can_id |= CAN_ERR_BUSOFF;
    497                 priv->can.can_stats.bus_off++;
    498                 can_bus_off(ndev);
    499         } else {
    500                 cf->can_id |= CAN_ERR_CNT;
--> 501                 cf->data[6] = errc & PCH_TEC;

Not initialized at this point.

    502                 cf->data[7] = (errc & PCH_REC) >> 8;
    503         }
    504 
    505         errc = ioread32(&priv->regs->errc);
    506         /* Warning interrupt. */
    507         if (status & PCH_EWARN) {
    508                 state = CAN_STATE_ERROR_WARNING;
    509                 priv->can.can_stats.error_warning++;
    510                 cf->can_id |= CAN_ERR_CRTL;
    511                 if (((errc & PCH_REC) >> 8) > 96)
    512                         cf->data[1] |= CAN_ERR_CRTL_RX_WARNING;
    513                 if ((errc & PCH_TEC) > 96)
    514                         cf->data[1] |= CAN_ERR_CRTL_TX_WARNING;
    515                 netdev_dbg(ndev,
    516                         "%s -> Error Counter is more than 96.\n", __func__);
    517         }
    518         /* Error passive interrupt. */
    519         if (status & PCH_EPASSIV) {
    520                 priv->can.can_stats.error_passive++;
    521                 state = CAN_STATE_ERROR_PASSIVE;
    522                 cf->can_id |= CAN_ERR_CRTL;
    523                 if (errc & PCH_RP)
    524                         cf->data[1] |= CAN_ERR_CRTL_RX_PASSIVE;
    525                 if ((errc & PCH_TEC) > 127)
    526                         cf->data[1] |= CAN_ERR_CRTL_TX_PASSIVE;
    527                 netdev_dbg(ndev,
    528                         "%s -> CAN controller is ERROR PASSIVE .\n", __func__);
    529         }
    530 
    531         lec = status & PCH_LEC_ALL;
    532         switch (lec) {
    533         case PCH_STUF_ERR:
    534                 cf->data[2] |= CAN_ERR_PROT_STUFF;
    535                 priv->can.can_stats.bus_error++;
    536                 stats->rx_errors++;
    537                 break;
    538         case PCH_FORM_ERR:
    539                 cf->data[2] |= CAN_ERR_PROT_FORM;
    540                 priv->can.can_stats.bus_error++;
    541                 stats->rx_errors++;
    542                 break;
    543         case PCH_ACK_ERR:
    544                 cf->can_id |= CAN_ERR_ACK;
    545                 priv->can.can_stats.bus_error++;
    546                 stats->rx_errors++;
    547                 break;
    548         case PCH_BIT1_ERR:
    549         case PCH_BIT0_ERR:
    550                 cf->data[2] |= CAN_ERR_PROT_BIT;
    551                 priv->can.can_stats.bus_error++;
    552                 stats->rx_errors++;
    553                 break;
    554         case PCH_CRC_ERR:
    555                 cf->data[3] = CAN_ERR_PROT_LOC_CRC_SEQ;
    556                 priv->can.can_stats.bus_error++;
    557                 stats->rx_errors++;
    558                 break;
    559         case PCH_LEC_ALL: /* Written by CPU. No error status */
    560                 break;
    561         }
    562 
    563         priv->can.state = state;
    564         netif_receive_skb(skb);
    565 }

regards,
dan carpenter
