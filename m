Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 041DDC433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 13 Jul 2022 11:27:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235465AbiGML1w (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 13 Jul 2022 07:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbiGML1v (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 13 Jul 2022 07:27:51 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 478391020A7
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Jul 2022 04:27:51 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DAFVPJ022710;
        Wed, 13 Jul 2022 11:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=GU8pBGIS6XgT5fvUe/ot4YeNMJo56DIUg/lTmo61EYI=;
 b=dt1sJHAFRckX4eo0pppGmdL9emWFKNiuMPB1YofcybxrENfGq0i9jBzt/sXkWfDkOAmU
 LvI9tBTECyT0JZmO0NTRsu2QbmlItTGh3I/dzvVdmisDUsNqEljnW768Bh9HmvZ5HwYp
 SjSYAL26xogxYSM5hqaDr9JltONjYShg3SqteLBja0UBwsNFeb5986rsxM6Ycdu0aOPN
 AJgi4mTSlePs9EQ1yshBfBPtJU0csBOJS9AWcIuWFm7LSw86cTveQzEKb2H3wieqWnrt
 shzqK1B+R2GkSKMVCG3sf2OQqhKCJZcW/qRmuGJ1KVurZTfmEm9ghW1QoSPGBIGw4IlH NQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71xrhwj3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Jul 2022 11:27:49 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 26DB5gtg012247;
        Wed, 13 Jul 2022 11:27:48 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3h7044v4nv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Jul 2022 11:27:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjrnrqgUTS2SqNKVFewCWksoNDqa3keI9xGZ3FpgRQFqu55XrNQ7ij+WpH9i8OzPjG/Y3PG2Z5jsFskGgT/IwAluHK93uCw1R1y1l0ZD8gq3ymF9Wf9NAv37Iw+5BMzJZuqA3onxXYQ/ZpDlUUwtm1ufVzzANQfZ7nXtqliLv5IpL6tZvmtfPyEp0azzt96bBmb82BH27FOIAA5tUE74wB1nZowAIHiPgoexzOdIaEZc7PdY5yjkrNrdhnJ4M94pHI8GLqQwyNhi8aXoEM+Sh7pykvTfnPrIc7/WUIG9LwrzhpAYHcfvLhhI/MW7f7YtQ2FqFbcbnAbiFw6AyZs3Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GU8pBGIS6XgT5fvUe/ot4YeNMJo56DIUg/lTmo61EYI=;
 b=Os3mI5zYNoJ21WnJTk21rgpIm2QrvtCjufetHE1ZR6GcQCBi78UzQbphaTNQ6VTemOANpApjVRHs4Y8WA70wSVd21Fqa1tK+41wgdeOuuT4OeIcWlKa/PvLjHPAA2w0Vx9kUVnHDrN2haaBuzGcM5IpNGsStuhJuzMJx82BKXtR+CV2cHvcnEWVwZg/vSBLoBP3vkdRteBoTBXyJdq/4Wyq0oHhdBVLW7UdPiEMfclO9Dg5U7YIeGcciAmV23n7oYoanfnKmOPt0vXh3HqoUIeNgECHpy0WNWUeY8oje7jGLxcbriBWa85PqaIkqi5RDVkZnP3ryBJ1s6h/pyRC4dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GU8pBGIS6XgT5fvUe/ot4YeNMJo56DIUg/lTmo61EYI=;
 b=yVNwcTBEUn01uWNN+fXIfxTIgWgdu9jcvIDaMvZVUEDDKDL/6yguwxxIa5RLhdVZSlVxT4fGd8lcr46K79g7ShVOHgiYh2nXnU33NnO3lW5xN1wXF5IlWpYo3N+WquEhHiXqms1ES1ZcvNxe81HRPN/RG2TX5f8ItC6Qu1NHmas=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB3049.namprd10.prod.outlook.com
 (2603:10b6:5:6f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Wed, 13 Jul
 2022 11:27:46 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 11:27:46 +0000
Date:   Wed, 13 Jul 2022 14:27:36 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     rkannoth@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] octeontx2-af: Drop rules for NPC MCAM
Message-ID: <Ys6sKMjAtcMMloTI@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0005.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::15) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ec2c4ac-3594-4c7a-896c-08da64c2b5b3
X-MS-TrafficTypeDiagnostic: DM6PR10MB3049:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TBdWsXZJeuF39nMgDWFB1gUVLbnPVz3mAl5LDCeCqXvfjEL170QpB+RhpvJz8RzePgs/d6CWWVbatFB4LBaqJOMAxNAGy9w8nlxCgQOFfewR1khKB4ZTiHoEy5Df46M+BphZmnvNf6I2zqHEKcA8YMgKsS3qBNSustwnLuSp+bolnEC6Mle/ullx5xUOFtiZgkXVv8UUZWTjoCDZHNcxU0UrDFRqROLU/GMFQayvFmZZm00W7aq8XbyB2A5RV/kzpomydoj3B4fbanICx+H87HMkfaW7q7x4rVH8rhWLj5e4WTCWtlc0cJLCP8Lvm2Uq2Pu2XrdZDFyFCFOTWcjOxhHTIWlsCAh/V08tizS1qvMp9JNh0g/K+soUYDa/ZZC9e2ol/LZI0f6FEAa/RldcBVpgkLGtGF/ZTiHOckV0RP1W+P4pv7010pJ4r6E/mLKAKZrJxZvGKgMA4KuVGRe3ETYf/g6eXdVZkA/gHv2JONIf2UEpWASzBoyapFfhPISWBWI1ZtAJwV7hrza4DEXcDH+wyJyAqMASu3FfWX/x4N3UT3yQrFM8UbspMs7czBGtEfNrJeHlVhVgOwsjNjbbTNYYRuhvMzkmIJPqyjC3MsqxopNHaqdI7ya7rg7HkI8zu0HrrJmbdOlzmfxGWaeD1QO4fUmQ+tYF2r/Bz5P9pMriHbaBo+9gxeesSfiAb8AVA9JlYeDFOu+oiraySQkT+Jh7CnSh4h4Xikv1siuepAkRlGYL0U+j7W5lVPlvbMlwrDSJtE6PaFKf5oCru8xLwlucvDFPbwW2SHdPvmixrMrdQI2LW5g+e+/JTu1mtRsh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(376002)(366004)(136003)(346002)(396003)(39860400002)(26005)(44832011)(6916009)(6506007)(6512007)(41300700001)(86362001)(38100700002)(5660300002)(52116002)(2906002)(8936002)(9686003)(38350700002)(33716001)(66556008)(66946007)(8676002)(66476007)(6486002)(4326008)(316002)(478600001)(6666004)(83380400001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MNAbdWKAl24SX1ksNGtl6dlLm6Ckn6rRiEhRSj3RHC+1UEiMVdAPktno+fej?=
 =?us-ascii?Q?rWLGYwykKHj7yFkCIpycPyVOz/756tJOGwmFJ2WWvIuYXOVwjzIIu03MNJci?=
 =?us-ascii?Q?rebM875IuRyrDng/qYJ2Ksfn0TBHkadobSPw4GuBERIff/vMvVyq15YUk0Xy?=
 =?us-ascii?Q?CbqfAcBMMB8zDhfsjv/e9P72uFts+6rqoYWpzaGFlCSUJsE8P6fA0ZHW14ZT?=
 =?us-ascii?Q?cAJwbwykEIMik1aCOFQtl5yvETP8uNR4JTm6j3dDkQEoiSnCBv4IPxshrx46?=
 =?us-ascii?Q?T5m3PMs0Hx2TvnJUNhQ64mJbhyc/qdr4vqNg0yCHaZ6i6UWqG46nQyJXzbz+?=
 =?us-ascii?Q?C7XcZxyU5ajmFtNPQ4tuRqFdb47btB85ylEH9ENRhqyCeZn4cZxwhxIDoC0d?=
 =?us-ascii?Q?tbfey1HfnNJzjk8rTnd52CPzMm8ZmF6PAvxKjp1BUtf0ssVEeK6ZkpxjBEDG?=
 =?us-ascii?Q?9GAv4EIgYYnbpN0hxIvddO+3gXiqGhyWRXLpSGeBgvuP7lu1mXCK25IClo8l?=
 =?us-ascii?Q?cSbezpwboALWqxYIMm28VjuJ8aET4y/VP7JVGsEMhkng4s/jlF4gx/RMBt3S?=
 =?us-ascii?Q?BZZJO8Zhrcf8qAVBeiPyJzeqjgvQ+EnmQu5mJNYbqHgsTaSvbBX8CmY48qVh?=
 =?us-ascii?Q?FlCsuiDOD1t8dPxpb2iotMdP59naN02Q8/6AeMk2T6O1Honyy1COv8ms1Ler?=
 =?us-ascii?Q?6y45AFLvJ+way6Dmyq6+WOLGvYwzOwDjWjDYbQqFSuJu4gXAUVlGUi5WXfgn?=
 =?us-ascii?Q?LIh3WT1cLCpnxnbaiPO3UqDqRTWfk8cFdXNU8PA6IV3fUdEgllVkdNnNFU25?=
 =?us-ascii?Q?/Os/0yAhZRVkIjd01E+YqKM88FW6MzvxGVggxsKTn8vW7aJcCvyweeKvivmE?=
 =?us-ascii?Q?AvSJcpwPnweq43rfLYMIS7KN7j6paEMyhKt9mfNRjk3X7Q4kvYBmxsiWBmh8?=
 =?us-ascii?Q?3Mx8Q1kcPnBuADOEmQmbyY783oExH+tvvOqOS0zf0V8+cD6XrEEjkHCLNmH/?=
 =?us-ascii?Q?VmfXS52vHce2U3whlGngGR49DvcrxQGzxYf6qbEHSXjX+W0voJTWypON4xmj?=
 =?us-ascii?Q?FW98CgbBhhVEbnJFWpPva+IyO1Sud5vK4iZVtUWZHJrvY+LuJdcTqHqLgbO2?=
 =?us-ascii?Q?KM73IIRZILSdUGL7TKpDU+wRKyWWT0ixZUhtjLXNuKUkLDOCIkwBPSAsGkEz?=
 =?us-ascii?Q?bHC215rF91EAe0WXkF3oa9yT+zKfCuRQzXpwH9xaJKDwE3tueQTaJIB9joy1?=
 =?us-ascii?Q?aa+kHwvhOJ7PCYDVbx+XpHNEHyqobL4MXZDlPuLW+0sggpLM2YVfWtTJ12F/?=
 =?us-ascii?Q?iVVt/qnDK8diMuZ1kc951KZaAz4NCYf3m+HqmlNDkStUXE9c3hBF7jX3AbSl?=
 =?us-ascii?Q?phmLkVBsPkigSiOccxpC33418yQK1O4lKZvcLb6cHNwoQ5DYz+3YfWwXhp4g?=
 =?us-ascii?Q?HssA6l0qk7K1/RIdwjnwN7AGv5hxMFJQCk2W6z/D53bEmj7+GJepQkcVgpCb?=
 =?us-ascii?Q?YZXiFi5bDgjMg5+eLIId7NX58QPIpKCdloMyPEw+2RNBlP5yDzKilJ1krlb2?=
 =?us-ascii?Q?4eFW8KgoMSvnGrGgifk1cPy0sqA6bG2uXBL3qrI+srqXCspkfMNoQWsrf4tV?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec2c4ac-3594-4c7a-896c-08da64c2b5b3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 11:27:46.3565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28ggRbjINi05TCNwfGi9+xhIdwq9WY330kKr758AysegBeISM4hAKg0Pvn3oLj4zaXdWB8KS3NTWWiuHJGMDnRUCE20UOGpQEwMYaYb3kwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3049
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-07-13_02:2022-07-13,2022-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 mlxlogscore=869 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207130046
X-Proofpoint-GUID: 7Fcd9P32iqVbqk2i4ilZlcoo1chTTqMX
X-Proofpoint-ORIG-GUID: 7Fcd9P32iqVbqk2i4ilZlcoo1chTTqMX
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Ratheesh Kannoth,

The patch 3571fe07a090: "octeontx2-af: Drop rules for NPC MCAM" from
Jul 8, 2022, leads to the following Smatch static checker warning:

	drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c:1232 rvu_npc_exact_del_table_entry_by_id()
	error: uninitialized symbol 'drop_mcam_idx'.

drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c
    1199 static int rvu_npc_exact_del_table_entry_by_id(struct rvu *rvu, u32 seq_id)
    1200 {
    1201         struct npc_exact_table_entry *entry = NULL;
    1202         struct npc_exact_table *table;
    1203         bool disable_cam = false;
    1204         u32 drop_mcam_idx;
    1205         int *cnt;
    1206 
    1207         table = rvu->hw->table;
    1208 
    1209         mutex_lock(&table->lock);
    1210 
    1211         /* Lookup for entry which needs to be updated */
    1212         entry = __rvu_npc_exact_find_entry_by_seq_id(rvu, seq_id);
    1213         if (!entry) {
    1214                 dev_dbg(rvu->dev, "%s: failed to find entry for id=0x%x\n", __func__, seq_id);
    1215                 mutex_unlock(&table->lock);
    1216                 return -ENODATA;
    1217         }
    1218 
    1219         cnt = (entry->opc_type == NPC_EXACT_OPC_CAM) ? &table->cam_tbl_entry_cnt :
    1220                                 &table->mem_tbl_entry_cnt;
    1221 
    1222         /* delete from lists */
    1223         list_del_init(&entry->list);
    1224         list_del_init(&entry->glist);
    1225 
    1226         (*cnt)--;
    1227 
    1228         rvu_npc_exact_get_drop_rule_info(rvu, NIX_INTF_TYPE_CGX, entry->cgx_id, entry->lmac_id,
    1229                                          &drop_mcam_idx, NULL, NULL, NULL);

No checks for errors

    1230 
    1231         if (entry->cmd)
--> 1232                 __rvu_npc_exact_cmd_rules_cnt_update(rvu, drop_mcam_idx, -1, &disable_cam);

Uninitialized value leads to out of bounds access

    1233 
    1234         /* No dmac filter rules; disable drop on hit rule */
    1235         if (disable_cam) {
    1236                 rvu_npc_enable_mcam_by_entry_index(rvu, drop_mcam_idx, NIX_INTF_RX, false);
    1237                 dev_dbg(rvu->dev, "%s: Disabling mcam idx %d\n",
    1238                         __func__, drop_mcam_idx);
    1239         }
    1240 
    1241         mutex_unlock(&table->lock);
    1242 
    1243         rvu_npc_exact_dealloc_table_entry(rvu, entry->opc_type, entry->ways, entry->index);
    1244 
    1245         rvu_npc_exact_free_id(rvu, seq_id);
    1246 
    1247         dev_dbg(rvu->dev, "%s: delete entry success for id=0x%x, mca=%pM\n",
    1248                 __func__, seq_id, entry->mac);
    1249         kfree(entry);
    1250 
    1251         return 0;
    1252 }

regards,
dan carpenter
