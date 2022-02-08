Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175BFC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Feb 2022 07:20:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347990AbiBHHUU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Feb 2022 02:20:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237283AbiBHHUT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Feb 2022 02:20:19 -0500
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98B6C0401EF
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Feb 2022 23:20:18 -0800 (PST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2183uMgI026751;
        Tue, 8 Feb 2022 07:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=tPtj53ZZMyzh8qgezuRCapDSczJNsAX4wFdBFJHnj0Y=;
 b=U/ck8+/3+vRrdvU/7EMloKZrGLHhHqVwkZ71kTSQFn6zBS7JeWbRfTBQaavv+AxsGEcJ
 kO9zf4yNPVD6Sjn9o4cjzM47FR7oIWCcmHZ2UwltALwm8QOKhkDtmFBXgZqWJkyQqFQq
 4gZP4+h9/NAqoAn1PSM/vqpVy+i5RFcJjEN3n93riTiEu2FahU3c1T7DEQswzslEhKnv
 38O8bXA+rsZ6VSu7XfvG/JFEsUfrtLpuyrOC39YyYXjcJ8A379iM2s9ndr0Ju+pU8kcR
 vrjzZZFatmxvQEDa5q4rLK1J3fcxZvPfd5tTFLSvoUnbZTquy1GMjVnFfAv2u63rgJ8m Fg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3e3h28ge3c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 08 Feb 2022 07:20:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2187BWUm035208;
        Tue, 8 Feb 2022 07:20:16 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
        by aserp3020.oracle.com with ESMTP id 3e1h25kmdh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 08 Feb 2022 07:20:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LL01mNKIjuLouXbfQ48x6SF84L9G0eH5DCJyaojLSg56ZQUj1CFofrMRybhwRuik6zddj9eH9QQnpc76MoPlLrlNtk7vm8zwk7rBixOrbtDmGXz8p+ktsoAG52b7fOES4udlqmQGlKA3qb+8TtkQ9xZpNHX6RJCM0jWdwN4OqIenBofr4CL30FUS1arjCBhcZ6Uz2PAF9bgvX2cCU1cUC3dkS0yHV9aiZbWg6Ulsqb9qqHcfMZNI96X2U57+5MaIqh+vGacrk+0wLT9VNdDCRV2NC+hq5zrV6bU+xf8sDjNh9GDiaLBQ7xKogjVqz/BhMMNBT5UHEsvQUpv/Wq7/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPtj53ZZMyzh8qgezuRCapDSczJNsAX4wFdBFJHnj0Y=;
 b=ScucGkFSJHi+y7Y7JIBQXgcWC/0Pubj/fTzswS2Teag3LEi9lpqB2hEijp3g0rC+KnD4ON3yj+MnsBhJFRzr/we4+QeQDd4h+QyA39UmL6RSq5xEoyWaldCWthtKs10yOQOB/sNp96HMHCbz3r07V/Yy1fo8+ZbeMRxF7i/VRq20Mcapvp2zP88TahoQWQ9affYGLJVO5vCCooUJJ1Z1TFaW/AvmQHVmFt1yIU5TUrDgLXMiJE1pe/84giVIZ4Fs8RMUBrQigp3+0IqXWCPDmnPj5fpKR4KX7Vb+F+dmxLiCGF6ooTjpBmVDaLUD1VNYOX6pfPkd0lfYpCbuD8Z/+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPtj53ZZMyzh8qgezuRCapDSczJNsAX4wFdBFJHnj0Y=;
 b=PAofJ3zBIRud1TDcWICI53DBoKXPGReyoNKHO9h7IrmpN4JvhrTHP/FTyi+H1mfWC78JEpL6VpuhjJHBnryz8odOurPQmLQR0iBtJXF8SGTjiZeUAcXxjrivghTxWF5yDuFWuSGTWj4za9JlJtybAyDrvYM4XvY9ZV1vTCurcmE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CH0PR10MB5017.namprd10.prod.outlook.com
 (2603:10b6:610:c3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.16; Tue, 8 Feb
 2022 07:20:14 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 07:20:14 +0000
Date:   Tue, 8 Feb 2022 10:20:04 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     jedrzej.jagielski@intel.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] i40e: Fix race condition while adding/deleting MAC/VLAN
 filters
Message-ID: <20220208072004.GA19479@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: AM3PR07CA0104.eurprd07.prod.outlook.com
 (2603:10a6:207:7::14) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50d0d114-27c8-42d2-7416-08d9ead3736b
X-MS-TrafficTypeDiagnostic: CH0PR10MB5017:EE_
X-Microsoft-Antispam-PRVS: <CH0PR10MB5017768FD144F02690ECB0FD8E2D9@CH0PR10MB5017.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: twJnXvy5gIG96iqfV3z8O99hJz+Zo1OH63m6VUNzzuRE3vvWBvNn+m9K4mXjbMqljmEbeGw25ZTg30v/NwA2g7gLUi0ohvfOytLD9rXDJ/iRXkwUSc0UvTF1FOqwLt0OZ3nkOwY93457ZUgx7VeCcCMoWfBvdiSPJQvz9Vkv4cMzBEUrRnyLDYzKA9TYXAdt9Lk+APKCSSvxEIg8Knh+IQPhYrLRiji75PhGAI0YKY/GykttN4PkmYNZW3QhNopxVMn5RBYs/D0Z1bL54I81+oXfb2U0Z/k8hYw2fN10xMmA2MElxEDlAjhxidR0p/z8vXIT03iqJT9hYpTEmXM6TP1BRZMgQcs9SphMcwFi1Vsz/UbNX/Vy8l1BlgOqt9eWsRaGH66bXcmepEjkgcESiTQ06FNjDmPRC4yZIdhxtTPnx+HORy781Ye3xg9XslrtuXwxl5/IWYrGOo+CEp6dvbQf1yizDh0ldBB3h/NnyYcZnIdRFMrIWI6T35I1MgLB9jkDePnFSeoiv2Yrb/QEoTEJK/3+6YOhr9DQNrbA65+QEjEEgM+Q/uUrFRRImJKKeWchuQ42XCAlaFbqGOGS6adH5gNd+Bu8UDZtdRn915SQysqAt36hyHx+eZfu8nQsbQI3k61ZZVb6V5SrhkSguQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(6512007)(9686003)(86362001)(316002)(8676002)(33716001)(6916009)(2906002)(4326008)(33656002)(8936002)(52116002)(66556008)(6506007)(66476007)(66946007)(83380400001)(44832011)(6666004)(508600001)(5660300002)(1076003)(186003)(6486002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2tj4oTm6bOR6N+kS9SU39axxIEN5p7t2LygvBPjjoFtsKoYIn2ZqaBQGtRck?=
 =?us-ascii?Q?Pr0RUcKfnCU363JyPhZb3dhwunLFUdsd8pg8AUk9thimndvOQjbeoWDWA08Q?=
 =?us-ascii?Q?nZCbWqUtz7wXwej0iw0Zp6WiaCo+vnSQNNNnGjwZUhWZeoQrRtYxR6gnzS2l?=
 =?us-ascii?Q?i2J9ZU4TghTJdhR96hsutTga51KM665acGXQeo5mSmXx5llTUwLyd37FMND5?=
 =?us-ascii?Q?3YPH1JeAzylCf9n4/RJ2MAtW6KQY/5mhoJU/NQ8B/oyxICkUw/sm1xDZx2MZ?=
 =?us-ascii?Q?8ccYKQAoCr9VDHhYcFqUdfTa7XSx4IbgyhKMoeEsntbp9X/uKFLU2NwhHmWl?=
 =?us-ascii?Q?EFuBMMfAsFT2DuwbCY96BYHw103rlnReHE8ivlUdne+vXiBxbTtq4jiundeG?=
 =?us-ascii?Q?yUb5lgILtlk0yEwKRcWRvsVJLhoe2or//sSM32zHZMB715GMyhGNptA9julO?=
 =?us-ascii?Q?a640+z2BaXHtq8cggesL6mho7b8sjG7qZ5xxmToqciEuvQ5jFZ8WiYmcmBW0?=
 =?us-ascii?Q?1DLwDtntEEnIl60dImtKiL9FN3+D2FjpWTWeYUhZeDiREFPJpTYc3AZ/ifnX?=
 =?us-ascii?Q?kshldYcLNXC0avkhIAu1fAegYC/a5iIaZSFK3WIObdh1pNlQ1J1nQzH6nkjN?=
 =?us-ascii?Q?OhXxG9rlUWM29CPk6s3kwmjEdcDz4UMX6p81YumHAsKzd68x6wv95/OaLvYp?=
 =?us-ascii?Q?+AgJ4tsP2WsPwx+GjOrfuAefi1jWsCBvsJL01DNXpmWqRSJ8ATx+lSlmB1/l?=
 =?us-ascii?Q?SIwPBNGTSK6HLB4sEVlVn1vvqGXJPsbvDg8Dp0Y3NBNa8XrYsmcbro/K2cLR?=
 =?us-ascii?Q?XbIeksxGEWTcb3O/k2id8mNtI9Z2h1W662ibDeXLG4LdsMzkVYNV85u6iAjm?=
 =?us-ascii?Q?T0GtCW/eHQmAUtBc5kSo4tq6BVpJklHmgritP/+es4XR9lnFmnSnuc2t7pN8?=
 =?us-ascii?Q?mgKzqqIJT9LeS5x0doOxuRuh0mRx3jBRXQM8xn+VwxqZQuuffg4/GmGDThws?=
 =?us-ascii?Q?hJw0AzspvfVyaYtKskaePs6iqpTWaUbRurZnn2Wl3daSj5xLtAfUmjhR0rz9?=
 =?us-ascii?Q?lXkq/DMr5utvfmqjbJR2wabuKwzsbwH4PDfMwBvL+hut37qh/acC6A8LD4K6?=
 =?us-ascii?Q?3Z15a7XaeEknusu9hj79Zgmo6pco6mCDjpm7G0wzir0mzDTCUSG0byxKG1M3?=
 =?us-ascii?Q?iuZ2V0H6tIaO5PhqQRNj6p7Npp4/IKT0MOidVxkvYSu7MlWIiY3HcOZxJWAY?=
 =?us-ascii?Q?sJoIekAOvVAq9VAA9OEKFslZd9D8Bs9qjJ8T1S1lC4v0KK3uPuN3YbP7g1YX?=
 =?us-ascii?Q?9gYKkauaaWMMUM9vhpFFgpZ4KfLshD2LH+nYtKqsxQNAo7LgneSkELXRbJvO?=
 =?us-ascii?Q?1Gbyc9bADx7LTAscUvifdyzu21gjEqouuM6XQ10McZeZqdEJemqXTT2j42uO?=
 =?us-ascii?Q?fLwayinPQlztpqMUGP0OXsIzZbZOkaXopAAkB4dAS7nApwHwcuKGi2hr/e2T?=
 =?us-ascii?Q?OShRRARTAD4HUG+KDEvg7ixTjGM0CmsDFV/EU3pUqlyCZ5TT8bD0LxcsyZx/?=
 =?us-ascii?Q?1s48MiLEGfdlB6yWOuaS07cAF9MgcjzAg6kgM9hj7IzZxwnVENTPMypGC7uZ?=
 =?us-ascii?Q?hzh3QbyS8sGregyOf/7kTrXNKAYQ1gAqbfZ4DUPlgZU9EQ7tKOFt9HVVHafZ?=
 =?us-ascii?Q?B531cBLKlOkVb2eMqD9BxojGNSNSk5Z3gDSAj8wEy56czoTR?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d0d114-27c8-42d2-7416-08d9ead3736b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 07:20:14.8025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLSYJKhpxmbBnShk15zBOPpAYUu2dfc0mUFZd7KUKzD8xjzq3m5MmHMedlzPFBu/D7erLCZL4g5+JmNTHSmk8D3fgZ3FJy+Br9mrRuW7qTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5017
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10251 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202080038
X-Proofpoint-ORIG-GUID: yCLEUY_6QhQ70DYF9yWmVjQMVk3-E5qy
X-Proofpoint-GUID: yCLEUY_6QhQ70DYF9yWmVjQMVk3-E5qy
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Jedrzej Jagielski,

The patch 53a9e346e159: "i40e: Fix race condition while
adding/deleting MAC/VLAN filters" from Jan 14, 2022, leads to the
following Smatch static checker warning:

	drivers/net/ethernet/intel/i40e/i40e_main.c:2153 i40e_aqc_del_filters()
	error: uninitialized symbol 'aq_status'.

drivers/net/ethernet/intel/i40e/i40e_main.c
    2140 static
    2141 void i40e_aqc_del_filters(struct i40e_vsi *vsi, const char *vsi_name,
    2142                           struct i40e_aqc_remove_macvlan_element_data *list,
    2143                           int num_del, int *retval)
    2144 {
    2145         struct i40e_hw *hw = &vsi->back->hw;
    2146         enum i40e_admin_queue_err aq_status;
    2147         i40e_status aq_ret;
    2148 
    2149         aq_ret = i40e_aq_remove_macvlan_v2(hw, vsi->seid, list, num_del, NULL,
    2150                                            &aq_status);
    2151 
    2152         /* Explicitly ignore and do not report when firmware returns ENOENT */
--> 2153         if (aq_ret && !(aq_status == I40E_AQ_RC_ENOENT)) {

The error pathes doesn't set aq_status.

    2154                 *retval = -EIO;
    2155                 dev_info(&vsi->back->pdev->dev,
    2156                          "ignoring delete macvlan error on %s, err %s, aq_err %s\n",
    2157                          vsi_name, i40e_stat_str(hw, aq_ret),
    2158                          i40e_aq_str(hw, aq_status));
    2159         }
    2160 }

regards,
dan carpenter
