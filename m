Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C87BC43334
	for <kernel-janitors@archiver.kernel.org>; Thu, 21 Jul 2022 12:37:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233663AbiGUMhU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 21 Jul 2022 08:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232314AbiGUMhT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 21 Jul 2022 08:37:19 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C135B7AC
        for <kernel-janitors@vger.kernel.org>; Thu, 21 Jul 2022 05:37:18 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LAGZ2I000857;
        Thu, 21 Jul 2022 12:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=XJxc4Dpig+8t3wxiSFG3oliVwyUcSiVvzhicy6tbct0=;
 b=rHVTxfS2Vp/fkLnIXXU/D/LT1bNZzq4x2nobsUvKeqZ/XPhaX6qAyC8Yza5+/VXZVsDS
 KlJ1iFq7QnN5y+Iqq0hxCCFTOkv4kunsqXWY+gzOql1vMtP0hA27QOt6BpGuuW+B+MRj
 y9rw75R5yJqLy9WyafEfE5f8cigE40O8ykbS9Hh6gvud1U6yUyepE6BBgLrebpkUWEz0
 f9FB0rpb0JIPdCgT+msiknHGWFXPCJXfvFkTmQiUjanGmi7w5XSJPcMNVHIli8xuo4aq
 ZZqgCQzGMEvBZD7aG3tcf/9T+YQaJqbxqlTzjwRkEl8k5HQ/8IaavEsj+eo5+KrRhL6r 0g== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbmxscb77-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Jul 2022 12:37:07 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 26LBSTYu016443;
        Thu, 21 Jul 2022 12:37:06 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3hc1epcvss-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Jul 2022 12:37:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIte4XhlwBp4OdZ2wvETW0oAH9NxhrwFiET+XpMIgzHl5Z2wSDO959Sl9XmBgKc0X3XScv450yYHHm3KKUYpa6cBStJv/4ACXJ6XueA/UHqM844KfV8SQQlpYEeCPUPYs+I/1xR/g6bf6PB+Z92HOjIGRJLd5CtnjJ4ftmtmZh78MAYDWMubPHktR4qFmYOQhB5AXGASaSxf8F2z597xuk/kJaT49joNmPCj5/fHY5Cl+M7HJNjE3D0JBi+WNaWte+N6RLLYEkHDzxSx+fFCzZOcQm1V9V6d7ACHpNdK4oo4GGg50ntz95qFfYd69sgOFfn7sZXgSjg80VBYsV2rww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJxc4Dpig+8t3wxiSFG3oliVwyUcSiVvzhicy6tbct0=;
 b=oU+ERVOU4UZqiSV/nIN1+XDHB0mCJfWIU/ms5EgBCXeqIfk0DFztC43Th4fADQlaO/ndnY+h4XHlDz371sP/PWH9NBTnLEHI0ckIS1aGXM3STxCPOfY2KTUh7T27rGfOzYcmQeTH0VFV92lBeleFezssePtVGW9p78bp1UeSsY6izfmDqVQFf3p81PjS7TdeAts2YtVQ4bLOsMLbB35A/POuk79s1OoHZkSfWrQmX93PFFCSTAGB6Nwj/t0bpF+U3FmcQlSLJs4JHHvLSlcfu4tkHJ2eVpoAA3YS24oz+ZPJWsdYw1nDNa7U/eBd8zCyLHLQ9NDTos2xyUJEoXrIZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJxc4Dpig+8t3wxiSFG3oliVwyUcSiVvzhicy6tbct0=;
 b=S58Wd1xOB3TjiqZv4bmQjVtUxRC6kdrNF9rvxgz6l4odIyda38ieZeoU+MMuVBP95v+53lgYm8LBl06KgAWWaQzINfUsihhJXTvX55XJRHPzMauKdfZ9lzELPJvvRMOOG7XbhsJTb1Kfk7ubHm3N2lptP0rq0+CCm685YD2krHE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN8PR10MB3187.namprd10.prod.outlook.com
 (2603:10b6:408:c6::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 12:37:04 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97%4]) with mapi id 15.20.5458.018; Thu, 21 Jul 2022
 12:37:04 +0000
Date:   Thu, 21 Jul 2022 15:36:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     hristo@venev.name
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] be2net: Fix buffer overflow in be_get_module_eeprom
Message-ID: <YtlIZgG/wQtxpKMh@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0114.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a1d079d-4b48-4476-8c26-08da6b15b741
X-MS-TrafficTypeDiagnostic: BN8PR10MB3187:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I8puuW1CGrMAUnEb47lr6Mp0nhFXFsL9qsr6IqDuuPFk7xprSdDwCpqdukgNLzlzm2yihcRmOu7e7kL6sHAZilZd/KuX73kKyts+QUoFuV79GAeWPfAqqpnAsL/CAEmOO7f0A+Idw2LCUFmaErOJIId7Qt8gqKKd+pFl1VVpI8KGZ8q3VPf2DQ27421qOui/gG/E8YN22gw75lKnMmj5n4vIzOieL3HtU60TgaEUGngmREUncCMQM0MX0u6DguNef6+pqsBj/ltC0eMHw7iqbmdhSvEhnIaDcKGa95UwE7c2tmjPxJW5enVxdzKCFw+kVyyk2uI0hBXZjv/n+xYYtuyF3y1wePHbK6GPHNJEQQK4pT3OnbDg7H21zEB//EzCXO0Gn8mIyJXp1DQsr8hhiRUfrxcB3H9k33PZGJSfJ3poggRkuiZ6bXnzgmt96KvanqHvszM9SVji8/wdQFiVHLQqR5fVFAm5SPAzHgUTFI0BC4jkieJk3Msl8ZW6pduuthnvfPaNHs3xKa4x5Bh0+pjZRfU1WbpUzM1QMXj+Y4xZWbQHTx5qtSlNNMN5m4Vsv0/oITJXf6VxE+8oQON+SYe7B3EQVOPpNME6SgGAg1QWb4SEI3ygPTu6zqc+vFx2McvJduYGO7ozH1oaWlKlauI0+dmFYCXododnozs0i5iGMYdRq4bLdoKOfhb0tzHxau7xQQ+TrrQDgGOu01X4VwcJkx+KVQYbZMOGqVUohsQd6KKZDL0NTt2rQE+IXcZA9fBYlUFqrXWEPXbvq0FpXIyCTLmOIR7DES14qeXZHos=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(39860400002)(376002)(136003)(396003)(366004)(6486002)(6506007)(6666004)(2906002)(9686003)(66476007)(66946007)(52116002)(33716001)(38100700002)(8676002)(66556008)(38350700002)(26005)(6512007)(86362001)(4326008)(8936002)(5660300002)(316002)(41300700001)(83380400001)(6916009)(44832011)(478600001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?te/Coc+ZZfkYJO8qz7nvUExjENavtv3K9/pExz64zJZ/lMc69DwWLgGHx7V3?=
 =?us-ascii?Q?ADkTCbhYTmyalJoP4ns0+pm8sxD1uhpe+7aycQwzu2QWsFg6unr1VFtsjrE2?=
 =?us-ascii?Q?vVNTEP8r9GQV0gRrStrg5x1ekp8GRzZ5qs4/WM+QQ0Ep4HnXWDt+aOML5Cah?=
 =?us-ascii?Q?/haRswrbu76RWcQUj2EgZ2d4NXPTAUVqsi1Ounvloqq5uSwy+Zbh/p/cQm7s?=
 =?us-ascii?Q?pyh68PjYR8LAzIBqKQBEPB1B/Rl7P/VXaKlEqq+ukCFTQlC6ezvEWFFDg5WU?=
 =?us-ascii?Q?rXO5cNjLR5dTkYOqGh0ytabouyTVEVCSz06ZM8MI+kIC+QpmzV8qFIsFK9KM?=
 =?us-ascii?Q?YSBpXAtZhPsGu5hr/Epm59m44I1+Z637DvAknFeZbZu8ss/QihD53cR3Ur3E?=
 =?us-ascii?Q?hZiG8q643avHLfpq1mhq8Qow7V1PFlJzTbsu4I8R+whcrXX7jUzsIHqvso62?=
 =?us-ascii?Q?2PvdIiMjUqa4YqyqAf5GQrcmri179uu8rwEyRTZPdr6YXMYyjtSm/NLq1Yah?=
 =?us-ascii?Q?2Cva8RRUxqLp+Pgzikhjz+Xp7We80YqjTl7NEL5hgQyvfhraBRg0uO9d0zUB?=
 =?us-ascii?Q?nlV4Dwm8gBFBWa3jMyRecRaUMsgqaDnfLxow2KHH49sv2Sm5JZ6yDrliMb+6?=
 =?us-ascii?Q?7jb9gK6rLI18ncbIFwda4xCVe2SCS1l7Zjh3Mwihwz4qVaTpIQOo2vnSJVL4?=
 =?us-ascii?Q?1QvBKcy2yV+R9xHoUEiJNQ9LhooaK/AKLDmzuymYwgBDVqnSeFsyff2SE4Yw?=
 =?us-ascii?Q?AfZmrUvsSHaWgnd+wsoONGqUYF8/SDHMSYEeFayBMFZ0U2txzlKoE6O2zNt6?=
 =?us-ascii?Q?w2OU+SKKaYdmpRBz799mTh/2c2W7tNKYWSLf/k48LIyP3A42ivWXhL5MFLT8?=
 =?us-ascii?Q?igoAEH+axUtpO/m8+2q/0zC9uPxGovkPIrzgGV6YCMbfhPC8m//HPGLwnjNR?=
 =?us-ascii?Q?W+vC3KQZyIB6z5tEvnkBs1Z2jid/v3pHVg6FFm+8JLSN0Xtr76Ndbm14bn/O?=
 =?us-ascii?Q?6W8vZl74MIklxEFJwM1LoUAlR73U31nmZ/DYwSpWbd1k33bMJnauXXOCWNBq?=
 =?us-ascii?Q?1v+cMjFmpQLysNwg6Rummr20FZ+qmCZSMWtuh2t3D7ERG8dBEEKprdyhhpu9?=
 =?us-ascii?Q?/y2eT90L/7rqc17Mqz5UaoTPpC2R2CZxxBkD9ZJWaHwt97zYFN28pGu/qgWp?=
 =?us-ascii?Q?xDX8wA1iX62dI9hxdPfMgImnonivGLT1DzFAWSH4kkCvzClGkirPoQxQ3Grd?=
 =?us-ascii?Q?9lqJb5PNsu+eEPorsFekH6RH0A3b1gA1sRPbCp6aex6/aB7xn92YpXsZpbdi?=
 =?us-ascii?Q?3DcNQIg1vtJmbFps/5KZgsPBzezyHLpYAPBAAfezwehu4cf5dQw6gqKHI1L1?=
 =?us-ascii?Q?DKI9vLqSt3YAtJ3c4kysjoVLZ4Hf5C942lq9ZbCltV2nyKwaxAP9lGTVceBQ?=
 =?us-ascii?Q?YHCr8gg3fSDzxpOR/I4v1LMh3ITb6eKiwosGDdQj4jK0HyYzctHtFQX2znXZ?=
 =?us-ascii?Q?k5435GPJ+GKVyJ4gIUeo8pFGgQUn4gcczhFXlDOzuGOQgTTeTeejyYszOAiZ?=
 =?us-ascii?Q?ZlX0Rj04CoMR+drtj3GrpTrfIFhOYLynTJ+Wvt6wGUk7UweIlx3X3FlheSPS?=
 =?us-ascii?Q?4w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1d079d-4b48-4476-8c26-08da6b15b741
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 12:37:04.1545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AeyqpSNsvQfPlVdGzGXa9l2PXXMn+2mJx8fK1ea4o/ta989lSxWhICSEGwmQCYpDAFeDgzwLAAooG2Ghq45XXxq7Y2sFoZBbgn5FcLcb4pI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3187
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_16,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207210050
X-Proofpoint-GUID: TC9iqxbf1ErPkaCmSDOLwKs5OLRgIzrq
X-Proofpoint-ORIG-GUID: TC9iqxbf1ErPkaCmSDOLwKs5OLRgIzrq
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Hristo Venev,

The patch d7241f679a59: "be2net: Fix buffer overflow in
be_get_module_eeprom" from Jul 16, 2022, leads to the following
Smatch static checker warning:

	drivers/net/ethernet/emulex/benet/be_ethtool.c:1392 be_get_module_eeprom()
	error: uninitialized symbol 'status'.

drivers/net/ethernet/emulex/benet/be_ethtool.c
    1360 static int be_get_module_eeprom(struct net_device *netdev,
    1361                                 struct ethtool_eeprom *eeprom, u8 *data)
    1362 {
    1363         struct be_adapter *adapter = netdev_priv(netdev);
    1364         int status;
    1365         u32 begin, end;
    1366 
    1367         if (!check_privilege(adapter, MAX_PRIVILEGES))
    1368                 return -EOPNOTSUPP;
    1369 
    1370         begin = eeprom->offset;
    1371         end = eeprom->offset + eeprom->len;
    1372 
    1373         if (begin < PAGE_DATA_LEN) {
    1374                 status = be_cmd_read_port_transceiver_data(adapter, TR_PAGE_A0, begin,
    1375                                                            min_t(u32, end, PAGE_DATA_LEN) - begin,
    1376                                                            data);
    1377                 if (status)
    1378                         goto err;
    1379 
    1380                 data += PAGE_DATA_LEN - begin;
    1381                 begin = PAGE_DATA_LEN;
    1382         }
    1383 
    1384         if (end > PAGE_DATA_LEN) {
    1385                 status = be_cmd_read_port_transceiver_data(adapter, TR_PAGE_A2,
    1386                                                            begin - PAGE_DATA_LEN,
    1387                                                            end - begin, data);
    1388                 if (status)
    1389                         goto err;
    1390         }

status is not initalized if both conditions are false.

    1391 err:
--> 1392         return be_cmd_status(status);
    1393 }

regards,
dan carpenter
