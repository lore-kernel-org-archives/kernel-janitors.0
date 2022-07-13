Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D42C43334
	for <kernel-janitors@archiver.kernel.org>; Wed, 13 Jul 2022 11:32:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235313AbiGMLcs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 13 Jul 2022 07:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbiGMLcr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 13 Jul 2022 07:32:47 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0745E102700
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Jul 2022 04:32:46 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DBAw7Z009070;
        Wed, 13 Jul 2022 11:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=vXJRxcTHOQ7n8NEqS8DvpGTwNNsi8TnqULVH+J6MsGU=;
 b=oiKzsvEzhyg+fNT5/SWZGU2CF1Jrayv5jnZSMn+n6oevUVouLHYqJBY3fvYE2pwuNDn+
 1EzHhr47sNecbnDjwvRgT+qIDczSC3PlFOdZ3AOZ2k9JPJLcibDSOSVDF9c0hkxM5Zrz
 1MqPRZyK3haWqAr5MSgKW1gWv1WpcPZkuwUUkyfO4Mo6QCMJFzG3eR6GL3+8APlG9exs
 vLPYp6EzPBKBMYXP5hEd8DHCbrMCaMTu9bEi+lokb+mPVH79QF/2CNNLhPVqHazEjClb
 KtwC71hqiskFmgNA2fKbjbZrxA8Jt2+2c9kdDI45V2TJ/aWPiwHC+3j5iOq6ly71/O2Q aQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71sgsdm0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Jul 2022 11:32:34 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 26DBVcjB010911;
        Wed, 13 Jul 2022 11:32:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3h7044ky9a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Jul 2022 11:32:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ovoq3MmwJlT9907FoAzuA9lbi2l7Ptn2Gll9J0oauYnEc8ayvwOCDjqT+pcVvamo++gEEUDtEXtqtb/Y2v7a6o/BVbk05O2UwGfuLijkSuWZrNf/OWOo/XIEO+aGVco5wbkMuwiG0ML1wASnQqM0ac1fgi36PTzyeRGd6EFmYUh8c8f4Ab+MEwdB3Qg0vRWQQDLT+7hByu/lHkOkX+X6YkZOB1bJvBbP+ZrKm13feQekfvK9t4dILo+qmTDranVwSvvZBjIBud4suNpZ/LtmUMZVlDG+PzyePu1JzQisum7yQ2K2mq31obPc7BQoJt1pA2PGcqQpa0kx0wAHsAk6Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXJRxcTHOQ7n8NEqS8DvpGTwNNsi8TnqULVH+J6MsGU=;
 b=oT3o6HENEJeSZdCvvzl7f5uQGPTGnb/bN47DvGN6tOG0L26GnbL5HxwA/HR6NdNPwMca6H717PmvcjwZNE5qvsEuRp2uRfZRGPL2scDhzy/HKXV+v8fOexyxKI6inQPB0VzpKNebpiVL/tjk7Xy9nME0/eQ0B4MW45hGVlqwmH7bSOCB93ZoBWZRQoFX4+UEUnkdreJvnjFksDwyI/yeWtFQMM9V7Rf3ClpN5tRomhPj7L5MOD62qjzX0WVBec2ruwOQH/Dzx9FnpVg/CghpizyB1s0DWPEjo5XisHu1+kSrE5lQQllPS1QuhkW7p6BR6x2Ln3SRzdn/bxLli8QmXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXJRxcTHOQ7n8NEqS8DvpGTwNNsi8TnqULVH+J6MsGU=;
 b=FqjSxJkxCp9fyu0PTqO0FutKwGe1LR47urQu5lYKOxcH8d3MfCtKKlbEE9nTs3/XveuO4dVkHMT+kol3oV9hewIrQpDq7QdPAHg09HB10vsg26RP0aTkB/tbEpOqCPdvGzY11exMDu+YH53TixloLbheYBAibW40pQSodVCgDeA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MN2PR10MB4048.namprd10.prod.outlook.com
 (2603:10b6:208:181::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Wed, 13 Jul
 2022 11:32:32 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 11:32:32 +0000
Date:   Wed, 13 Jul 2022 14:32:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     rkannoth@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] octeontx2-af: Drop rules for NPC MCAM
Message-ID: <Ys6tO+/RAH7WEDH7@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0030.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7b2ef62-cd9c-4f27-bac9-08da64c35fe0
X-MS-TrafficTypeDiagnostic: MN2PR10MB4048:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lh6CYNY3XcBqCK2OSb30CAbHFss01LVVaXtojCvhtR6UKaEBnbznOLxcbPZjNFInVJec9iw6D4LHEpFPjiiFbileJHjVvp/DOVs/8QICuFi674V65KPUfMS5Zfd3oWy8Ghh2KJyEmIbENhEqD54L5TuwxJ97Cc/aL7X/CKk7rhY08l0q2OESjCNTbwtlBfsRNTnBDQZ/RSoS7E8JsFtzBq9S+29SBF+tZUj5jqhFLZeKnMszqYqgXfVJvAHKNJWL02zUTlvcc0BhFs99tL0ugsTfXZKWoXS3bi8+2BxbhCFKh50paeSboOMr4yioihwE1uAzVHkOEbtIHre5fSB63Y+cVGfTaqpr8eblxatBMWduqkGcmNU4CFOSJHpaMzlztJBs6QtAcfUoEQ85Z5oVwGO9Ap0syw9utjXfnSQnxBwPoeB35lozHthqzxiEq563495zJVcju9SDlOWOIF471MiSB+xkE28mG6uu+VQqbWMVor+rWHbvN+I9WKtbh0feAQ35R/+FH1eNZsPTfCsnyOmAeZo1N1rUUjbluTtuTsyzE0cimIKXV6ue6LNb3fptzaRPyp9MYY6aurxVho/5sx0XJhgblm6SOKBRlmGJmXjfXSxavn7HxHCdeisYGvluO6hyVf0g1nvze+nOYuvUHHqZp8OuCVC1JUKhY/B4myJBlBw6C/QixFHkC7TJTV04jsrarHZ5l/KHLbZoIjMIDtgp+M+13k1NtQs06Z7tzdHDyLupzUzxdVdxmKeotXWLGaxRngjv0hO6GuGEwAALfm4N3cQOAChSoVTIHUaGivbkSox5N5g3Z604XriQhbFr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(366004)(39860400002)(376002)(136003)(346002)(26005)(478600001)(41300700001)(6506007)(6486002)(6512007)(6666004)(9686003)(8676002)(66946007)(66556008)(52116002)(86362001)(66476007)(316002)(6916009)(83380400001)(4326008)(38350700002)(38100700002)(186003)(33716001)(8936002)(5660300002)(2906002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FV8FJ4NpPoM1EHcILGdRzUBChjrnMwH6BiC3JaNtwpFMfzEKqK+EmZy9JDuk?=
 =?us-ascii?Q?2Hk0vciRFnJ3BAtgnFICdkxlfrrSUl1b+W83cvXKy2x3sc12M/9m5bpHdUVq?=
 =?us-ascii?Q?wLbeSarV9fcddbpz/uG1UlLExyg9GIxtvf+iwycQ5joW688O0vbC7s6JGhOG?=
 =?us-ascii?Q?970QuV2bPsg+cbUCQZN4aPQCwxM6v5ADiJgWxT3wmb+rYRZqnWPKTiKHVYH5?=
 =?us-ascii?Q?2bNKgAbHwdaA3G0lZwsAPd1vAlPelnIZoxcuHi2gLd1GP2TUyAdGIezG4D80?=
 =?us-ascii?Q?9TSWhxOCUazeMxyLL/AgKN1nKWTa1HR0Eb2ZVDjVPCUg24AvF1La10LixU9M?=
 =?us-ascii?Q?SF6CIgAk1bnfAnyn/Yrb0DRglmY+Zdcg+nZcHf4UR1gzhW5SVuG+1Tdo5XMf?=
 =?us-ascii?Q?/tFbU1yE13KBA05HZWDIpc0eeURcNo8/fKdh2qfMk8yfZiponrp6udN5l2+O?=
 =?us-ascii?Q?kN0JO6atl1AEd4UlgBGF2neN52uJ7QD1NIkgVxLGlZ7suWPZqYt4hi+OjnDY?=
 =?us-ascii?Q?0i8ynI9g4QFBlUn3Ko8YlKK1bBxBa6P2pBfUemMIlG+1xu4cK6wUlsRbNP0b?=
 =?us-ascii?Q?27p9PzHCWwCB7IOtSd6qwnCptjgltj6W6MwDS2aKSCjfJNitM0C5q3ElwpLf?=
 =?us-ascii?Q?geccSkrcs7H8/Bciw8tPta7+DKJPicEE0pmE3GHAovzYl1G4Mzdz+cgos/UU?=
 =?us-ascii?Q?6jX0nR2mWQBILTQTbfDGPndHPtZtto1CL2gg/tUD0jK4n/n8DKPZT+PW8rif?=
 =?us-ascii?Q?slbhQiGhL64o10Q0fnMBkHbVgaJqNLlQpHXmcxDxxP6o30EH4MEG8zAWPKE6?=
 =?us-ascii?Q?lE04VRluTgsQzIx4NVpCAYZFUvReb+aQLC2fT8jE1ytBD84NwiyRnnVXGTNv?=
 =?us-ascii?Q?2JtnZsnLkFa1dr1BN99p1zZ8HRXDjxqmusDb0onCN4br7N0E6QUn3c/MJkBt?=
 =?us-ascii?Q?tw9ZCySANUSXkGZlVvqYUDzwWkEkmKsw0YAkJrpV7K9bAIKAyeUbuawpg0ju?=
 =?us-ascii?Q?MGHhVUjiVsE5Pv28vFlTWyAnjVPl/LL8xv0ynyeA/HSLMtJX75vWMOHvr+Nw?=
 =?us-ascii?Q?uhCiqsy+LUf6o+umQdnb7S4Ijg1CVidCUL0OnXgPc2Ac921oUeQorM5317mZ?=
 =?us-ascii?Q?NfxyOmKAWd/x6kJT3I/wgQjG6mZZVcKm0ExThzQ+u9xH4MxF8iG1idl6G3/c?=
 =?us-ascii?Q?BlaKOgC2to8fF5W7FnpRFi0bpED+Urtb3rOxAH1Dc7vvknIQoISZMZWDB/gf?=
 =?us-ascii?Q?onxfkbyquH4sXHXWSWWdg/vI1nnJf41jPBO8p7WB12DF5jApuS7Y9OhaMqtu?=
 =?us-ascii?Q?PROqMbpOdjZt/vuonkSfiW6W9zlTtA5P4/KdLR0TkZW1Rt/feAOPYFC6detd?=
 =?us-ascii?Q?cj/eEiM9ID7+RLB2diGkr/nYctJeMThSAc64r7elRPqPlrHYX8Yw/a2ewBTg?=
 =?us-ascii?Q?b395++ibKDf3nPdX+1e58Ayx92I4V4xKq8E7pbE/B0v2rVC/1rM+pxSu2GHV?=
 =?us-ascii?Q?Sx6XsWeBGiIjSB+zDjucmtUcCA6ZIw3AuDYjw1lbPviIeYH9RrboNI/3pu5r?=
 =?us-ascii?Q?WeL9kLYjMLW9s8z9c86iMuJ80nnesHgUWAhO/mtSvdwV55yhHmT6WPFJWXEO?=
 =?us-ascii?Q?WQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b2ef62-cd9c-4f27-bac9-08da64c35fe0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 11:32:32.0216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZAu1Vs5Khv94yMM/i0JdROA0ZQCscODrm04JJ8pgV+Y9dRAr99RBEwrawYeucTf4PM2+rXJnpzIEelE5jDKRVdQN1W3KycuEaG5A+3WOXEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4048
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-07-13_02:2022-07-13,2022-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207130047
X-Proofpoint-GUID: uqdQsHIxIm1-CMs6OmVVzGaEpAKmWJZv
X-Proofpoint-ORIG-GUID: uqdQsHIxIm1-CMs6OmVVzGaEpAKmWJZv
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Ratheesh Kannoth,

The patch 3571fe07a090: "octeontx2-af: Drop rules for NPC MCAM" from
Jul 8, 2022, leads to the following Smatch static checker warning:

drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c:1964 rvu_npc_exact_init()
error: uninitialized symbol 'err'.

drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c
    1953 
    1954                 dev_dbg(rvu->dev,
    1955                         "%s:Drop rule cgx=%d lmac=%d chan(val=0x%llx, mask=0x%llx\n",
    1956                         __func__, cgx_id, lmac_id, chan_val, chan_mask);
    1957 
    1958                 rc = rvu_npc_exact_save_drop_rule_chan_and_mask(rvu, table->num_drop_rules,
    1959                                                                 chan_val, chan_mask, pcifunc);
    1960                 if (!rc) {
    1961                         dev_err(rvu->dev,
    1962                                 "%s: failed to set drop info for cgx=%d, lmac=%d, chan=%llx\n",
    1963                                 __func__, cgx_id, lmac_id, chan_val);
--> 1964                         return err;


"err" is uninitialized.  This should be return -EINVAL or something.
Let me just send the whole list.  The rest are mostly caused by no
error checking.  It's possibly deliberate.  Hard to tell without knowing
the subsystem more deeply.

drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c:1232 rvu_npc_exact_del_table_entry_by_id() error: uninitialized symbol 'drop_mcam_idx'.
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c:1312 rvu_npc_exact_add_table_entry() error: uninitialized symbol 'drop_mcam_idx'.
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c:1391 rvu_npc_exact_update_table_entry() error: uninitialized symbol 'hash_index'.
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c:1428 rvu_npc_exact_promisc_disable() error: uninitialized symbol 'drop_mcam_idx'.
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c:1473 rvu_npc_exact_promisc_enable() error: uninitialized symbol 'drop_mcam_idx'.
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c:1964 rvu_npc_exact_init() error: uninitialized symbol 'err'.
drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:735 otx2_mbox_alloc_msg_npc_get_secret_key() warn: struct type mismatch 'mbox_msghdr vs npc_get_secret_key_req'
drivers/net/ethernet/marvell/octeontx2/nic/otx2_dmac_flt.c:191 otx2_dmacflt_update() error: 'rsp' dereferencing possible ERR_PTR()
drivers/net/ethernet/marvell/octeontx2/nic/otx2_dmac_flt.c:60 otx2_dmacflt_add_pfmac() error: 'rsp' dereferencing possible ERR_PTR()

    1965                 }
    1966 
    1967                 err = npc_install_mcam_drop_rule(rvu, *drop_mcam_idx,
    1968                                                  &table->counter_idx[*drop_mcam_idx],
    1969                                                  chan_val, chan_mask,
    1970                                                  exact_val, exact_mask,
    1971                                                  bcast_mcast_val, bcast_mcast_mask);
    1972                 if (err) {
    1973                         dev_err(rvu->dev,
    1974                                 "failed to configure drop rule (cgx=%d lmac=%d)\n",
    1975                                 cgx_id, lmac_id);
    1976                         return err;
    1977                 }
    1978 
    1979                 (*drop_mcam_idx)++;
    1980         }
    1981 
    1982         dev_info(rvu->dev, "initialized exact match table successfully\n");
    1983         return 0;
    1984 }

regards,
dan carpenter
