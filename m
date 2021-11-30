Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B67FC433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 30 Nov 2021 10:44:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235794AbhK3Krj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 30 Nov 2021 05:47:39 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:56948 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235656AbhK3Kri (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 Nov 2021 05:47:38 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AU9h2ZI009060;
        Tue, 30 Nov 2021 10:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=rPXssePZzaJUvgoh6zBOu7pAc+URriXe75q5e7uEiCY=;
 b=XbtZEYs1nXJwe2DTN3wAo/MofAn1SNBpVXgnoev1fOy7kpBBEw9e9GvmK6YBUNwZY808
 Xsk+7F79T1Pa+RC4mf6dCQIF0z5gIApMZWAfkW45tgzp8xSu7tUgQKlUt/SjJzJGMDKd
 NjdEP1r13b7KSz29wzU7arabJl3Bb16IDHOAyQsbF11nizEOKqgh9+WQeZUGHLabnLOm
 azaY0CEryBBi62eMYZ4VDEB0yQa2fvRif00ngFk6KMZaDDOQnrd2jDG7qo04muB21LBM
 dWeIpXJd4l/lZIIKfpvI3FUWYI/KMklReiCibQISx0W6UB3O0yHodGfokdZfZVr92znM mA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cmuc9r4q3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 30 Nov 2021 10:44:14 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AUAUKKa141082;
        Tue, 30 Nov 2021 10:44:09 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2044.outbound.protection.outlook.com [104.47.57.44])
        by userp3020.oracle.com with ESMTP id 3cke4pab14-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 30 Nov 2021 10:44:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/6hKSkvCPsJDtLQbHiLNk+eBn6TdaIl3q0vJCdIDvZYdZ3aXNI7yGarfgaWNyudkYOkzrH1SUo9DZ7m32v3Et7p7iez1mwKO7cm8YveabYLwkOOFf1dxrqO+Tdz88eGri3P0rpCX7EhDpDthJno/nN4oRtVWJxcnsawwqQCc7smhVExM0+cGHdzEn0ipxTTPIOrLnX6qM7S8L0knBeBbfXPROSJqaD1x37MvrgcWulbcJQjzO78B/le6tywfCM6rGSTsgiCC5jyQLA80J7aVEjhvfICVw0lQRUTJRb5iSjkDtmfjRJUjcM7aKhMfHh6k69Vzwg/7o6bGiPmW/LgMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPXssePZzaJUvgoh6zBOu7pAc+URriXe75q5e7uEiCY=;
 b=T0aT/leTfvuMSIN8HlDV3PRBH8hmY5nhXXbuh8e3xyEg2+mJA9wYf1cBODkXOf3tTaflEIkfjMQLap89JpzHAUZgVcvseYFoort8Ke7WviN+lxUMg9yAS/L6duAMMcQTGRJu1YFKZkWu36iLTIb2JfD4lieD2gO0V8Got0MUtar/SOXRTSIxRKEUQi1g+4xw8X4Xpq5acPJcq9meHSRM5KngPKvM4jKETcXa13HmFM7DLNKxq7o4bt/nf2h9RhoAqLEClJpkOaMNk8NnAoASfdFJXewWihTqvCSVlNJTqglj0coMMrMrSHG90QzQ8ztnvBNin1LsNzlzYEtYysrHwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPXssePZzaJUvgoh6zBOu7pAc+URriXe75q5e7uEiCY=;
 b=tcdMesvvYL2iQINN3Uec8hFAcwOG5+gCNFlBLGPdIjoIU/KEkon8M1j3Mafdxr0LP1hUcBJ7GBpjAI+umyijo1G2CXRY7ZrAvFTM94f4Sg+qz8kVIxb1AImMkP9bPnV0FlBQdO11Ef/EqJMt8g00oYxBjNcnjRGzdbVKvR2YFhw=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1357.namprd10.prod.outlook.com
 (2603:10b6:300:21::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 10:44:07 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 10:44:07 +0000
Date:   Tue, 30 Nov 2021 13:43:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     rsaladi2@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] octeontx2-pf: Ntuple filters support for VF netdev
Message-ID: <20211130104358.GF5827@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0180.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::7) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0180.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:45::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend Transport; Tue, 30 Nov 2021 10:44:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 739e8e45-7771-4fd9-5184-08d9b3ee55bb
X-MS-TrafficTypeDiagnostic: MWHPR10MB1357:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1357499E35204A732B8E867F8E679@MWHPR10MB1357.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Z17R+NEqaqe+XvxzbAZewLTvaSr8s/HFSdMoaFfw0zVZBpmFtjF1E72WW6FcWJfKfOQg4yuqiX/jtTG8Yd4z+eqAhHidUl5bRpQpO2nGwp8QXRqW2h8I1b2AxK8nHRE7HyGA5a4ht5nSL7X0b88SsUTL+XcPEngWqI9FzVHXf7a8RiYFzcNNuWyrsvbgp9KhhV8yaGx7gEGENVBmwfmNtlJzMK6M4zCWA82AccZDXuD0eV7Ag3nDXixrqidyWgjaf1qe2gPHdtNNBpiLpWzlKJvZ5oHpxbCn0CriqHSiEJs2sdDx/6GhvdwQUpZ7f3mMXmRmQVPSZBYsgrtIFtlQzusQNJb80KzEh/vhGtCmnES/41XcbC/u0UL2uTIAa484xq/8Ia3WuckCu4Cf0qq806FIcGWutA4aiSWuMnOcnYS1c8NcEolDx0GdRnNFAf3t6qq2MfjrH3rJpZUtxtdBBfeE4DtfzFIfpSXOLB1VAKPbJm92a/VTwqoDjfLfffuRBsMWcO1IKHcIg7HNbpYgl9nzIIGHNd+P8/pZ7YFioT3YjqhzRRX7X+3kxNhZ/Dk8ier3qW0sv6J+dS1bKCedL2wcb7NtXn0ctYW/gW4jQ7D+aMTzxDVVP3XKgrSp56Wv4Pb4x+bQt+aorXGK10N37j8Mq6Lvh2w77Eeo800drSF4XlBuSQx1yBqNBqLLbnS0U7Byux0Mj/NqC4pUYRveg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(6496006)(186003)(5660300002)(86362001)(9686003)(6916009)(4326008)(52116002)(55016003)(66556008)(8676002)(33656002)(508600001)(1076003)(66476007)(66946007)(44832011)(8936002)(9576002)(2906002)(33716001)(316002)(956004)(83380400001)(38350700002)(38100700002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ST46MCl87wIyMT8pbkBYJgmXI839EQUR2KyIo8CY6tg3iTk5+q/cVPWq9xdh?=
 =?us-ascii?Q?cbI0M/+AQQdHU0dextes8xA8j2SCqduHESxJiYfRHJ/wXeYHmvHnqdzsmNEi?=
 =?us-ascii?Q?hz5Enxt1RIgYtxSFTZ1OvizA9nSHGy5TSe1PKqfMQxPzV+MRQyqsD+ZGV+ij?=
 =?us-ascii?Q?Y1DGKY+8CvgTKxfgD3O+vg+GlzEsozhLE+ZmlMoBWqG40g1jobHjYil2XDmm?=
 =?us-ascii?Q?4x0yozIyK5wL8q5tKYGBSZEId9ORrI5/+pBUWj/fANctU2gydReogOkTLA2c?=
 =?us-ascii?Q?Ary7yB5wHdhOoo006me3I6tpG2ip3i+BRtvSbbNzpefrJmpUdk2xn2GSJvKi?=
 =?us-ascii?Q?hdIokL0eEQE91kFCXj2/Jm45dSNW9FQtJa8b4vNmFqi/uDL6ITWDFi/EXTU/?=
 =?us-ascii?Q?vClAR0V/5lmcNEIvTLRZB93P3qsQaI27jfvvy4Mn/IfHC56WSrJv4zupvXq8?=
 =?us-ascii?Q?VzdpgF/A7L9DguVoVdhLIu4hkXOkPlkNT8iiuoV5QYFeEEgLd/XkVX+3+DcD?=
 =?us-ascii?Q?pmhsYw6ZXL+/UG9cYtnhe00x2ciGrOeQgJ5MCenPY/+Q5FsBev/tx65MocPn?=
 =?us-ascii?Q?o/01d5IYUVVVTk4MO4OSCThQjZggUOXQElf+GqBAoSYZY3iGdZF3zEY+ONRW?=
 =?us-ascii?Q?p/GhkOhE2u6ryjY3awdrJniuJbwiwkt/MMGQm/83wjZL6chxrbvxu3Uff6g7?=
 =?us-ascii?Q?4Hrp/r8CBQtG2BaEA8ITD5OCrnuCtvhxu0vq0ZHmculfDuQo1AHvWvteJQOb?=
 =?us-ascii?Q?nncRY/5eRKi/iT8bu/S8gSq5SAPhTDVbN6EXcjEoVvM79eCwR+SmsJsxc49O?=
 =?us-ascii?Q?CbmEqW/1ovFJhK5BaDk09fs4zBrR0IhVtHhq6w7iVoF7JdBFkBC0xmTIKtk7?=
 =?us-ascii?Q?HS55c0S0HoiIFu6kT4Scvno1VGT3WeMy7WvaNdRBUfN/Gt7ZTJFAoFktdhQa?=
 =?us-ascii?Q?LCWWSxhON+QkzLeDC3oF5eQfr2kQrcXJ+3DgeRqaJzukArP5FZX1ICL8Eibk?=
 =?us-ascii?Q?gjfqUDKvF0x5RKHEs8CnTf4yqa4rURnyctUUrVp85TCKYP+N4k80Bcrbeah9?=
 =?us-ascii?Q?lzQ2mxd2C+UiQFN3AivPeNOfHErZsFYk6kW7BSYCVZ/zgg9Y+KWL5rJmqB1Q?=
 =?us-ascii?Q?FqcECIpvOLIjV8ttiiKaFIunfdRx2eTNeCingHDAaLEbumCfDVj5aakYbsa8?=
 =?us-ascii?Q?yu/1Yr0AyNOcgCejJL9UYVAj+Yje4Q56wW3PtpT/X52gkbJSoVy4iYqfL29+?=
 =?us-ascii?Q?gTPLIutESnkH2LPAEnecgB2ChjvAEq34MZTvfpTOv1z11LrJnvJo9+/iQnre?=
 =?us-ascii?Q?Vk3KZDviSOCDyWezMChlqZKL6XpebKvfzDJvVg75zOnQq8qcqvxNyCSes9WP?=
 =?us-ascii?Q?/64/6pRPoNn+1N3SFfEIVdQBcv6vu43S5R+Dbsd5d4PXq8uPpl9W6211GjK1?=
 =?us-ascii?Q?TaVkc56+BpyWd6JeNiyQtw3Oo0j3BpPyuct+SeTUdX5KNmtrEcEI5lYqYbZJ?=
 =?us-ascii?Q?rZoRfbQoy7OE+ftDg6ZpXt80Z7nUVDPpofmKgWoqOt71acdgf0thWme0AD5K?=
 =?us-ascii?Q?RoVNBmGnTsVXqiqUvdhftwMsF6Tlhzg7hk/Suaj0puzUfNsJXtILbYEniO5C?=
 =?us-ascii?Q?41kLhIPklxAKnTUTEbMpdK+eAOpRpS73a7oGN14XbTHDeY6QVQOyHnM2QkKa?=
 =?us-ascii?Q?gV+FwZAMbcYtnqQeNjUxdWzMpms=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 739e8e45-7771-4fd9-5184-08d9b3ee55bb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 10:44:07.2762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rONGNMVtTeAqzCP11o4oKg+apX7v40S2JBNFj10MO1wMRVdb6Ip9VLy69/oSLZZzpxA5tCuc7qNWHzSxhaSO2ahwFHP6y+4ZcYYbboFg5JY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1357
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10183 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=432
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111300060
X-Proofpoint-GUID: 4JN-9VgUc3NHCEUsd8vgLlw4NWSRxADn
X-Proofpoint-ORIG-GUID: 4JN-9VgUc3NHCEUsd8vgLlw4NWSRxADn
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Rakesh Babu,

The patch 3cffaed2136c: "octeontx2-pf: Ntuple filters support for VF
netdev" from Aug 17, 2021, leads to the following Smatch static
checker warning:

    drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:1247 rvu_mbox_handler_npc_install_flow()
    error: uninitialized symbol 'nixlf'.

    drivers/net/ethernet/marvell/octeontx2/af/rvu_npc.c:392 npc_get_default_entry_action()
    error: uninitialized symbol 'nixlf'.

drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c
    1154 int rvu_mbox_handler_npc_install_flow(struct rvu *rvu,
    1155                                       struct npc_install_flow_req *req,
    1156                                       struct npc_install_flow_rsp *rsp)
    1157 {
    1158         bool from_vf = !!(req->hdr.pcifunc & RVU_PFVF_FUNC_MASK);
    1159         struct rvu_switch *rswitch = &rvu->rswitch;
    1160         int blkaddr, nixlf, err;
                              ^^^^^
    1161         struct rvu_pfvf *pfvf;
    1162         bool pf_set_vfs_mac = false;
    1163         bool enable = true;
    1164         u16 target;
    1165 
    1166         blkaddr = rvu_get_blkaddr(rvu, BLKTYPE_NPC, 0);
    1167         if (blkaddr < 0) {
    1168                 dev_err(rvu->dev, "%s: NPC block not implemented\n", __func__);
    1169                 return NPC_MCAM_INVALID_REQ;
    1170         }
    1171 
    1172         if (!is_npc_interface_valid(rvu, req->intf))
    1173                 return NPC_FLOW_INTF_INVALID;
    1174 
    1175         if (from_vf && req->default_rule)
    1176                 return NPC_FLOW_VF_PERM_DENIED;
    1177 
    1178         /* Each PF/VF info is maintained in struct rvu_pfvf.
    1179          * rvu_pfvf for the target PF/VF needs to be retrieved
    1180          * hence modify pcifunc accordingly.
    1181          */
    1182 
    1183         /* AF installing for a PF/VF */
    1184         if (!req->hdr.pcifunc)
    1185                 target = req->vf;
    1186         /* PF installing for its VF */
    1187         else if (!from_vf && req->vf) {
    1188                 target = (req->hdr.pcifunc & ~RVU_PFVF_FUNC_MASK) | req->vf;
    1189                 pf_set_vfs_mac = req->default_rule &&
    1190                                 (req->features & BIT_ULL(NPC_DMAC));
    1191         }
    1192         /* msg received from PF/VF */
    1193         else
    1194                 target = req->hdr.pcifunc;
    1195 
    1196         /* ignore chan_mask in case pf func is not AF, revisit later */
    1197         if (!is_pffunc_af(req->hdr.pcifunc))
    1198                 req->chan_mask = 0xFFF;
    1199 
    1200         err = npc_check_unsupported_flows(rvu, req->features, req->intf);
    1201         if (err)
    1202                 return NPC_FLOW_NOT_SUPPORTED;
    1203 
    1204         pfvf = rvu_get_pfvf(rvu, target);
    1205 
    1206         /* PF installing for its VF */
    1207         if (req->hdr.pcifunc && !from_vf && req->vf)
    1208                 set_bit(PF_SET_VF_CFG, &pfvf->flags);
    1209 
    1210         /* update req destination mac addr */
    1211         if ((req->features & BIT_ULL(NPC_DMAC)) && is_npc_intf_rx(req->intf) &&
    1212             is_zero_ether_addr(req->packet.dmac)) {
    1213                 ether_addr_copy(req->packet.dmac, pfvf->mac_addr);
    1214                 eth_broadcast_addr((u8 *)&req->mask.dmac);
    1215         }
    1216 
    1217         /* Proceed if NIXLF is attached or not for TX rules */
    1218         err = nix_get_nixlf(rvu, target, &nixlf, NULL);
    1219         if (err && is_npc_intf_rx(req->intf) && !pf_set_vfs_mac)
    1220                 return NPC_FLOW_NO_NIXLF;

If nix_get_nixlf() fails then "nixlf" is not necessarily initialized and
then if is_npc_intf_rx() is true or pf_set_vfs_mac is false then this
will not return.

    1221 
    1222         /* don't enable rule when nixlf not attached or initialized */
    1223         if (!(is_nixlf_attached(rvu, target) &&
    1224               test_bit(NIXLF_INITIALIZED, &pfvf->flags)))
    1225                 enable = false;
    1226 
    1227         /* Packets reaching NPC in Tx path implies that a
    1228          * NIXLF is properly setup and transmitting.
    1229          * Hence rules can be enabled for Tx.
    1230          */
    1231         if (is_npc_intf_tx(req->intf))
    1232                 enable = true;
    1233 
    1234         /* Do not allow requests from uninitialized VFs */
    1235         if (from_vf && !enable)
    1236                 return NPC_FLOW_VF_NOT_INIT;
    1237 
    1238         /* PF sets VF mac & VF NIXLF is not attached, update the mac addr */
    1239         if (pf_set_vfs_mac && !enable) {
    1240                 ether_addr_copy(pfvf->default_mac, req->packet.dmac);
    1241                 ether_addr_copy(pfvf->mac_addr, req->packet.dmac);
    1242                 set_bit(PF_SET_VF_MAC, &pfvf->flags);
    1243                 return 0;
    1244         }
    1245 
    1246         mutex_lock(&rswitch->switch_lock);
--> 1247         err = npc_install_flow(rvu, blkaddr, target, nixlf, pfvf,
                                                              ^^^^^
Potentially passing an uninitialized value.

    1248                                req, rsp, enable, pf_set_vfs_mac);
    1249         mutex_unlock(&rswitch->switch_lock);
    1250 
    1251         return err;
    1252 }

regards,
dan carpenter
