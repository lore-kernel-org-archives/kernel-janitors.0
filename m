Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D490C43334
	for <kernel-janitors@archiver.kernel.org>; Tue, 12 Jul 2022 10:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232734AbiGLKxl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 12 Jul 2022 06:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232569AbiGLKx1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 Jul 2022 06:53:27 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D91EAE38E
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Jul 2022 03:53:23 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26C9wV5d001823;
        Tue, 12 Jul 2022 10:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Q5r74HY4yWosKycv7eEQ/J9CEIrhhz+mI0bBpVg6xgM=;
 b=EEt0iSQ8ATklD+rsiBbEjiql7JQ5g1/am/52N8q3nNunIloXI/Mivriw90LqroS8em36
 r/7rCwiX/c3l3DttxteqGHq2hjSIXRHpdgsylAToMcEW2dDfAx9IuXI26emQJ1F3lofd
 9tM7sVVRJqFFwiCcgKsUM5xfoOzh1kNNTmwG0D3FBv86f2Le5n6dIM3OXpFxUPfitGQu
 ugoZU4NVZIVslQPcD3XqJ6P1HXc9fzj05CeFQtytuUVJf8tob8LZwwFaP9eLI7nOAv8j
 5hE0+kb91pTNLS0nupJHuF615iS4iPOhzM1zzdC8C3J7dAmViQkviDKogyjgPg2eRvEA QQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71xred44-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Jul 2022 10:53:21 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 26CAoaDx027397;
        Tue, 12 Jul 2022 10:53:20 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3h7042sxr9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Jul 2022 10:53:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVSjLwWqQWgXjnijmCdiRpo1faidPcEHMq7ui7nxdlZ85VSLQz5GVV62//svqRtO1orRV8a0xExANJU6jvWJdO2FCqHjVFDOUjhXinmjKtR/OlI+C9ATyafO6NZghXoQd1OyY7JRT1W+JlEC5bVnlXlkkoE43QFYFZg4SfEKvbGLo+yhtGcG28PPIl+2dkNtc1HdQRKVCas2PT1ToonkC6k98a2YWlySkXuT/DJt3+VaOp8NnR1rXP2rhdVJjU03eqCbgeKBU4PXWJKf2HYm+qrwWE+1G6WzByQ0ui3cpxZUfrnjObfNBAOkoREpDMskimFws4/8c6OYlyOEIqpvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5r74HY4yWosKycv7eEQ/J9CEIrhhz+mI0bBpVg6xgM=;
 b=dVM6oDaAmsMEgE22mFi53FodiSK7+Lzosp+U1WeySuDz79S4CW/OLcFk96RnGC7NpoqJb+N9K/Yp6oaYxOvP/33gBEw1c/mFybWs8v69FzS43/NBzQubQ9CFfHJJLG7uZDHQPB24Yqx+9RZjUsq9khIAvunXQ7j1JLe5Sly+1Jdu2EmypxMriVOKxXm4+ApM/XBdqnQ04oYiu5fZwwtC/t3S8c1SWSl210QCgGAjYTUa7NU8hV3EZqgHAAmFaq9r6uQtWm4tq1BhxCSDMM2oUdk8Ff0jMjdZxbc1IYqcC4w2/YQ6zTXZHeHQX4RwjQ/FJAyIgt2E0TUURtFhBuuZzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5r74HY4yWosKycv7eEQ/J9CEIrhhz+mI0bBpVg6xgM=;
 b=mB5Oht2hcfZwed23zagoSuA5PksBgv1ezMKivwMAGTXdeJ7ysMuJ6+6d5LSS6DZNOgfX3O3f79tQE1xztvOjSmhL97ZkhErTRuQ8Pg8Zk9peaXWzCoCZA4GaVtyBOD9fBiaZ8Z75HT9y2tn5SPZYLzCI4rdfyy73jdB2HY/Pcko=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW5PR10MB5873.namprd10.prod.outlook.com
 (2603:10b6:303:19b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 10:53:18 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 10:53:18 +0000
Date:   Tue, 12 Jul 2022 13:53:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     hkalra@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] octeontx2-af: support for coalescing KPU profiles
Message-ID: <Ys1SlWMAiUBV6gGC@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0167.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::15) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3a2bd48-c60b-458a-8368-08da63f4bac1
X-MS-TrafficTypeDiagnostic: MW5PR10MB5873:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T+G1J7XmXLCrwCTGLhiefSCMUlZeZq4oLoQdfQY0kN9xmDeYiFdmvOazSArqoowRV5Dj+DThPEKiZ1mMdvu9WTbG/RZkK5HT0QrVd4htycMMFBoBIVdL6H3slFWbYq+D1K9Bg0Ji0R19SDldOg5kB+r9GoSmP++0ep44s3pB36g7XMBkMWEKdXlVQcuVDyl2LflKN9jTK1u82d+SzGTKmxjmwkoT0Q9R9F6btHdGhkS78sbosJaps9sH9qE8RMuWp2r3Napp5g4SJizPvvNxRLqaEL1b+OhmXo7vKSv1/pVEZlLot+hrKfZLXwo/CYXHB4czZkdbqnhix7mWrhN3RoroGPnSwmw69MZt3DlrBukqKjpTwCPw1UecmwRZprl5zzjkF7BQlp9eN7FAkPb8TUlIbJPIjTSxUqSWKX1OHpaGgaDu/VYxAd4jvRlhsbsYXN9+diDJcS3SqzlHWwfx9OmbjSezwGiU9+crTwWug4gDvNBSdfT5wuMzZHNZJXimYeldL/DdBFYLza1E7l701FB+SLTWkaWKKQNWAB8K4TL9dC5JHrK3CPvL+sdMHuwPBzcDh0a0cIb0E9P6jnF5Oe0uiPQA0CelEbmKlFHk54Oc24vsdTJJzpZKRNBKLMO0mvf7JroxKcIASDA+F8n/+zdAfwbPPQ2Mb6T2o6X/0/4qynIDqRfmaoYGbBWjfPdc3dI67hApJPRhh+84EAzDCHkvuhZ5N9bXe9tnliGAXLkjEo4s4BboYdeXhPsEEh8TF7dd486FIg9arQqUvO+sQln80FUJTfAS3lJAcjVSOWZgN2wyRrVCGIHrmChIcsBk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(376002)(136003)(366004)(346002)(396003)(39860400002)(41300700001)(66476007)(66946007)(86362001)(33716001)(6512007)(66556008)(52116002)(4326008)(6506007)(6666004)(478600001)(9686003)(186003)(6916009)(8676002)(26005)(316002)(6486002)(38100700002)(2906002)(5660300002)(38350700002)(83380400001)(8936002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D2QQ6R9NCiLM8R1MC5qA5KZ8GtKQDxLe2bKZSiyaBvk1p3gGFPP0evVbsO1i?=
 =?us-ascii?Q?XGFIMsAZ77gfQPaOLLhbDwLp2ez3dyRLffZx8IOJvN7tgiQy/fylCJRUf/45?=
 =?us-ascii?Q?qK8i4EyZpQbmZwpJpwZCW0Crudf5UJGNzpq0dsJe5ROYKI4j+kOhygz52Vnc?=
 =?us-ascii?Q?usAQo8wM2kWtf6+tV6VGUqBWWSnLQAYsPxF6HwHCKC+QG8tBARUADAphj6Vy?=
 =?us-ascii?Q?7dq480Z5/1Gy4GL8qZq8j4zR8KOcU982v3UGdSzRwitRTx6Ob5E4zenm9gf6?=
 =?us-ascii?Q?FT2HovdIr5fMwa60BqRs7fN9+y5GCGCxFYvs+ujFGv8wMH4azKOy2ESCpS+B?=
 =?us-ascii?Q?r57w82E9afy+NEi5RzQNO+LNWAhKzgSgxOUX6dmC5RmVymMKZhhkP8zz2ENy?=
 =?us-ascii?Q?+7Fm5yhWM77QVy5Xd5dVRjonZoAZmjP4LSuQz9TTYazTAOUtWNerghs4LhLw?=
 =?us-ascii?Q?f9g0hFxP56nnsQ26IQoIyNlX5wMfhZ0zsjqp6wKO8OoZT2/FWnZYvaF/Sg+A?=
 =?us-ascii?Q?Vgi4Dd2jE0/G3jPWSbQoJmki75T0Qr1xO/kBs+0p9/omWsoe0GelBXTfGowY?=
 =?us-ascii?Q?5WrNAQ0jk3aXpTWQpIcDr/5RqMjG/xrzczL+zWeJ7CpKo8Lam7uin75igVNU?=
 =?us-ascii?Q?VA6aLdy8/Hk75lyvrjU/NK5+Wj6OUwbzKqYS2h33hWUK5WuaApOI0J3eI/Ju?=
 =?us-ascii?Q?0Ii2DK2enhGsUmpOt700Kpwa4dxtiN5VnxsmkCTqHhXYaIB+W/Ul4Am60PTM?=
 =?us-ascii?Q?m7nHm+M9MgXYZdeH1JMMyalxjsrYGefGxG0UqSeSk4eUPFRV3LrtFlbKlsMj?=
 =?us-ascii?Q?fKKiwsiOVyUNb0PY5KTRsByUf2ZgF3aJjx/mgFTDovvz1ohO2lGWaCQNSQ2w?=
 =?us-ascii?Q?WTQ9gBAT1NdT5c8wUSuTYaEIzgCTfs5Vr/4YP7rPnYPHxmVBTK/sQOZcMiwR?=
 =?us-ascii?Q?qsvMGtjef12kVoeuBL+E4FxXAY+o5CougFK1ANJ9/8Vj41/34sGkEBFwjed9?=
 =?us-ascii?Q?UGd1BT4nPFq07Xu0qDN5uDId9W022zmhUUrGy1o3VqKFszU62zhf9yRIqXlQ?=
 =?us-ascii?Q?+Kgl3mZf517nwp76FOfA0lteZ5rWZnGIqHZt53gzVGedpsPmfp4bM+TJs0k+?=
 =?us-ascii?Q?NlBAairmjwatmRE0faMvoMsHKDZfWoWDrrmbfh4JG8h5yZFxrVZPpSyCNfWy?=
 =?us-ascii?Q?l3xb6C7cAOegk/wAe1AJIozJfbz+xi0bNrjjNyDVwvU7neH0HMUHE7QqH9cM?=
 =?us-ascii?Q?mvqFSi07BKQbd+OhzGfB4rjibC6qz685mkBuAc+EhfHrWreYPIvbDmaZt/fI?=
 =?us-ascii?Q?jR6qLRjmsIHYV/PcUNRMjWPyMJP5QWqMZloXA7Crl4LwXA+RHIyv4eAt/DWu?=
 =?us-ascii?Q?NwPUPyWlHhdDW/7h8B2T3wZr5hyeimkzmEKqel7m50P6mhqh9R5abKEW+UBp?=
 =?us-ascii?Q?HWx+lyulwfZfn7aF2FCNWxxdhVQAjeWZgRpJA38IBKyAMSIVb8D7VpRzIp9i?=
 =?us-ascii?Q?5qAPONgPpQ+/L/0lo/lOqPil2DWgAD05hB7ilUKjnG730faeBqRRiAKzasTF?=
 =?us-ascii?Q?eLcUORecqUFukOb0gUq2Wq+mYYV8ftvKoL/oHV7owR9ETBO266bTjAKT4TeP?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a2bd48-c60b-458a-8368-08da63f4bac1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 10:53:18.5573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylUM6XtNw1Ag6GovWpEu9zyOT5Uryhu/WuWfYmaSBNLqQX1/0z+98NrrFnEpwq0a4B/tyG2f4oqzbU6HQGb39AGeGw8ubSQ+2Nc2/yz9joY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5873
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-07-12_05:2022-07-12,2022-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 mlxlogscore=929 suspectscore=0 adultscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120041
X-Proofpoint-GUID: ZlzF1lfWQ11NrDxhaUmWoWgbYmiKMHhM
X-Proofpoint-ORIG-GUID: ZlzF1lfWQ11NrDxhaUmWoWgbYmiKMHhM
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Harman Kalra,

This is a semi-automatic email about new static checker warnings.

The patch 11c730bfbf5b: "octeontx2-af: support for coalescing KPU 
profiles" from May 27, 2021, leads to the following Smatch complaint:

    drivers/net/ethernet/marvell/octeontx2/af/rvu_npc.c:1624 npc_load_kpu_profile_fwdb()
    warn: variable dereferenced before check 'rvu->kpu_prfl_addr' (see line 1619)

drivers/net/ethernet/marvell/octeontx2/af/rvu_npc.c
  1608  static int npc_load_kpu_profile_fwdb(struct rvu *rvu, const char *kpu_profile)
  1609  {
  1610          int ret = -EINVAL;
  1611          u64 prfl_sz;
  1612  
  1613          /* Setting up the mapping for NPC profile image */
  1614          ret = npc_fwdb_prfl_img_map(rvu, &rvu->kpu_prfl_addr, &prfl_sz);
  1615          if (ret < 0)
  1616                  goto done;
  1617  
  1618          /* Detect if profile is coalesced or single KPU profile and load */
  1619          ret = npc_fwdb_detect_load_prfl_img(rvu, prfl_sz, kpu_profile);

rvu->kpu_prfl_addr dereferenced inside function call

  1620          if (ret == 0)
  1621                  goto done;
  1622  
  1623          /* Cleaning up if KPU profile image from fwdata is not valid. */
  1624          if (rvu->kpu_prfl_addr) {
                    ^^^^^^^^^^^^^^^^^^
Smatch isn't supposed to warn about places where the NULL check is
*obviously* not required but I think I messed up something.  Anyway,
this NULL check doesn't make sense.

  1625                  iounmap(rvu->kpu_prfl_addr);
  1626                  rvu->kpu_prfl_addr = NULL;
  1627                  rvu->kpu_fwdata_sz = 0;
  1628                  rvu->kpu_fwdata = NULL;
  1629          }
  1630  
  1631  done:
  1632          return ret;
  1633  }

regards,
dan carpenter
