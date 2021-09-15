Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74777C433F5
	for <kernel-janitors@archiver.kernel.org>; Wed, 15 Sep 2021 09:15:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CFD06121E
	for <kernel-janitors@archiver.kernel.org>; Wed, 15 Sep 2021 09:15:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbhIOJQj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 15 Sep 2021 05:16:39 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:28364 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237094AbhIOJQj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Sep 2021 05:16:39 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18F7e2TX007088;
        Wed, 15 Sep 2021 09:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Rv7+PpkHA3WaHmzuO+ID75mKveksp7txLedCF45x3LI=;
 b=wLFLn5cScML2mTzIeKoQ3XntaB40OVAo/5+h01+Gyc3K27VjxDrP6wGicCXRuk2vbPs6
 usjDI2t2lrfweoLv4spaMSctQXLuITuCMlp7G5dU7OWmhkwa+6aOC0NDCmrznBGhA+bW
 6/lP5yOywKK8JaZ+5QKVgJgD2ngEA6gN4cIkUpkQ7XzDX0NKyx1gN9OZT5OLq6dn4JfR
 Tu0jpRy2zka+M78kWWzvrMyo8Daz0XvJ0wVwrdgMV26OaSFUQsO4XZQRdUddfLSJPbwA
 Y9qKGmPFdiWI7RiaWPWQ2Rgr2wPrNEb3QYUlymSu30vfyAZffWFYMr+ZbYizoIC4WrTL /w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=Rv7+PpkHA3WaHmzuO+ID75mKveksp7txLedCF45x3LI=;
 b=IDu0BoOpYoZzEU/UKR8kbdrjysExvGTGEsmwjr266tRT+dGkKt4TrUJhVeydVIq3Rz3a
 e1cYPTjIv2oqElF1uE5Qc4rWPQFx/IL7C4h+PSKyjeKzTA+7B3B7FE5t5F7u1EiYw55y
 NwsrEGWipB1Fo6Q7NbTi3H+bBlsFksnvfY9EOGyYwOVQ7A9Mam1MNUt0waQ0sj/WCvaS
 DKkUf3If1wH98H75Qk+TrNmQCT6z8H50lQjm5LBKSOUbMGzN+tbonBA+VJptZ+TA5nr5
 rvbljvz4Ii9QZAL/UpPCjx5+TWnkJ9dL53YGRDNyb2zsRjQgq5fCPPiBdVJC5DQmoj/2 VA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3b2p4f44w2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Sep 2021 09:15:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18F9FD07176978;
        Wed, 15 Sep 2021 09:15:17 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
        by userp3030.oracle.com with ESMTP id 3b0hjwd3y4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Sep 2021 09:15:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFQvQq+yh8sgOQpkqUSiBazK5jKIm3jDtGHPN7wIa7P3rXHo/zy6MSQ+7WSV1Rl0uw9aHP2gSIBo0d1/7E/xS3HeOuvUfPsEF25JslFQNlwnHs44+HbqkY5dvVwtlMdGtqfjMnysAc9h6HsXRMjN6Qa3ubUiS6Cx/VGWZpCsPNHxHgCnrn+IV3Dsvrq90xZAaFEnDxQwNDPH3HpWsjqD5m1oRgFLbNPgha57UX71I8Nc2ZaKTLa1nMhhFa7VJwo2DeDq64CqR10AcCSFS08UHfhLsrhayV3toAvKhoBOffpsOoZadE3mCtliBDEBXZufF671xCL1mnL20aTjxHtHNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Rv7+PpkHA3WaHmzuO+ID75mKveksp7txLedCF45x3LI=;
 b=fItz496k93r4xXpdieDFCDqQgD0gJwWIGxJl4T0+8WFgaDUb+9NHAkC9xYocB110Tvtn4WlWUnTvA90GsWIMOGN27caBmGGuJ7AU18sAJmYhbpA8L9kVS+OVNoIhYu7dTS6vG7lnuDe4kOxR1KG9RDLLzqcxB+ZhWOKs5hYNZYhE4keDXAa6om/vb5J1ZNkC8rb0N77MIg7uMhORxv27nLIS8heUT/gD7WsQSGQxhLUTTvKTtQHxTM8+LOB/YKb9hcPZwbnJgXDw1Zyzf7nbPgA/dX90jXKG9dnvKWw/hiZ+NJHikEkaYAn7VHQ4tg0TmYNqHFVwNUVyR8mOXnhoUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rv7+PpkHA3WaHmzuO+ID75mKveksp7txLedCF45x3LI=;
 b=li+UUAergpGC7waMlNNwmrRaIdwJAZg9Ofx9ekEpGKlC5WjMCUgi/nfH5QWBmg2ik4/EwjUJEDeK9bUmPI9Cy+P+LEfftPl21gtrw23jmR/zKFOEOQckX37G3V138HDG4jkkv0ZD6XViSw0GVfjHLFIkWFT0LfTSr41jNJMualE=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1374.namprd10.prod.outlook.com
 (2603:10b6:300:24::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 09:15:01 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 09:15:01 +0000
Date:   Wed, 15 Sep 2021 12:14:49 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     m.chetan.kumar@linux.intel.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: wwan: iosm: firmware flashing and coredump
 collection
Message-ID: <20210915091449.GA3747@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0019.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::6) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0019.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 09:14:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bae1779-4b77-482d-139b-08d978294bbf
X-MS-TrafficTypeDiagnostic: MWHPR10MB1374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB137420EABB3BF42C964EFAA78EDB9@MWHPR10MB1374.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U9H8hOn5iSXyfVXk8CNlklXwI1z3+HRgEEaBmSX4RN+stS1tQogx18xk/wYJv+e/dtvHL1qURT71ddU2qhhLsKxJ8ey6Bp2e+pJ71SEPOqzcpoDORu0VR99+SHxTDn+VIkxN9H/Om+EsKhEBe+XDH28FOUbCVtOXRA6ESx5jo0uV6k77F81G0LkY9ZmvgF4GLPsWJbgOIjwr7d0i//W/swD7xsWkgjhmeTROWsMIv5pxbk97Sta864CiDq+mV674IlYqtz29tVYzVlDge1QZTuS7skAaO+YYRCdCfwq4RcfyaGgCmGJJ5HR0UrSexwu7QTnCnlBEt/4LrAWynB7DoxCrvGgBo5eelvPVagPF+IPlzbhPO0xtN9URnuK7fGh/6hywoElr5NiwUfYLIpenAQmDGNjz5kdZI8o6FMFr47ooODzn21aLogzJbN+mtCDi/2t57VscQkWhjAT4Awj3nVFbhkB14hMp2qvbDT3FbJ//rBBIZ2tc6X2oV9Q/TSDa2xsXkIlcH3aAsDf2kYiw31bkc0vDk9yEP51UXRo3Mex/EeEa5iTeQxFNlpj4aLxWYm/nAHSMW0l2gBfelmATg7vx79Jn9wX2782IuvRvtRjWy1IBcFPA6SZlT2Siy7VNhE3wq+sUU8uaTxpHFhNGyvkl/FqRzFS3f3BVXwJFzSULQ9xtvrpbv1V2F4IUYNe3kMbWFvqVeoVKTe7Wzan9LA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(136003)(366004)(396003)(376002)(4326008)(55016002)(9686003)(83380400001)(86362001)(33716001)(33656002)(2906002)(956004)(44832011)(6666004)(478600001)(1076003)(316002)(66476007)(66946007)(66556008)(26005)(52116002)(38100700002)(8676002)(186003)(6496006)(38350700002)(8936002)(5660300002)(6916009)(9576002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o8gbLaWQqfXf/bm/0jg9cpUHUpgr+vjmiwS9m5ANN6sh2Pm2MLBWkLOZq8UP?=
 =?us-ascii?Q?ORhR7Oal8fnS5KO1F4gwCTYvCfbbC8XpJJ6YbBQ6zFDOU+Fh5EhL5H8MEAy0?=
 =?us-ascii?Q?Nkd6ofVNr6KM+djI+5KiKs3vmMCOiADRrLf24s4vFlv4E5BwWKpaOOuWe559?=
 =?us-ascii?Q?AdXHZslXRuc34Q8xl0Ddzx8NkCOEjKeIzbHntvB6BE+bHem7l/9//QSXAice?=
 =?us-ascii?Q?Ycba5qnqIObRRzgyePVK5r+cMaMWmeCFH9lD7gSUHkleyY/uDcQ/gjsQVEUW?=
 =?us-ascii?Q?Y9q5HbGIMfP2OYdNYr4KZd/ezr8b+TJwvFkO4JacdqOvepkGyaDmlrib6d7v?=
 =?us-ascii?Q?SLg9tYcFiHfgt9CA4yj7gSZd5wFg86EOosyqcZduZWY1xvoQlRGF5Orue84R?=
 =?us-ascii?Q?jxA2/P/2sZP5PjBwTqCTMzbKs1TDksSlAcQbBVb3Wxx+JPm9a3r+Bl5Wc3YA?=
 =?us-ascii?Q?R4DBr26AAF/y+JU6H/T2KE2Xo3eNlx7zjG3tk5PAlxVZLbjR0ibb0unaqfL5?=
 =?us-ascii?Q?ihCVhZVemyzGv8Dfb/9UWsxuAV61pk6PRFRBGWt4I5jGIhF4c8pp2KwePESp?=
 =?us-ascii?Q?nc/d98oCiR0YU2HAEA6NuRyPBy66G0woIT3lY7kQ6u7IImbMWfeo14Nz9PZx?=
 =?us-ascii?Q?cLClcBJPHyLJL0y6EhdWwJbSDPYMhblB13+0qKwmB8cSaZkciWDnHJ3Wl6Zc?=
 =?us-ascii?Q?mmU5RoQd+AABya6c723A+U2GH1qZ/NJbgqGfXHFvSZJDnIu8MVk2npO25J5/?=
 =?us-ascii?Q?qZjxpanw7m1WYaZaASOGOaZjeKkSyYHAt3yRJlBvdcKoSF35ApHfuR3iNFlq?=
 =?us-ascii?Q?P/StXAFytOgamW2zVfx67gE45wesrn8aiT90HNf67vaI2ql5oYvUYa9JEPQs?=
 =?us-ascii?Q?tKyLBMhw3fB8xF0NujyAE4ghSLdHyiZ5p2cgfvHmW4PyovgEh0fuI6y3NdO+?=
 =?us-ascii?Q?bylmEaUlhTeenAtOLdFNxzYOAJ+srtfjXOir8353YIp81+xm4epMGdRpso6B?=
 =?us-ascii?Q?b//lQTuAoQiqYTo/KRbsSGAfBPDcQLj5+SILuvmm94mCzvCMf5MwgywCF7do?=
 =?us-ascii?Q?UQlJuUbl0CInYz5qbtong+4BOn4LuaU/nn0A2Q1P+8fYg8uj/ETNbgqMoJsu?=
 =?us-ascii?Q?+OrW6Tafuir0bfiYgfhMs5gXz5gARj6SSiR4wh++iUOh7hEKYl9nMJk1T5Yg?=
 =?us-ascii?Q?C+6Bjuy4sxg+GWggtCIZtX2vaRRiCmdvh9l2QxdZny4xwBnrwZqXKbqVtUgJ?=
 =?us-ascii?Q?5T9WqGy3M0pgnHiraXhlNXRNwq+BPr3SLyEweB5vB0QKyiWJBOXt7xPYnjZL?=
 =?us-ascii?Q?I3fG1uAczNht1NreWs3e5Awb?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bae1779-4b77-482d-139b-08d978294bbf
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 09:15:01.2779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYE0Di3qvhKbBX2B39jhToFGnGa+PB2r2/wUSVlPrGbwYlawQn4q3OisJqWxstW4yr/vHhOovAQEy24Tg/47TPrctmlOf2Ueh96GzG0C6Tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1374
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10107 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109150060
X-Proofpoint-GUID: D329m6O9md8iEtdJ4D9rgMByvr2SH7jK
X-Proofpoint-ORIG-GUID: D329m6O9md8iEtdJ4D9rgMByvr2SH7jK
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello M Chetan Kumar,

The patch 13bb8429ca98: "net: wwan: iosm: firmware flashing and
coredump collection" from Sep 13, 2021, leads to the following
Smatch static checker warning:

	drivers/net/wwan/iosm/iosm_ipc_devlink.c:145 ipc_devlink_flash_update()
	warn: potential NULL parameter dereference 'params->component'

drivers/net/wwan/iosm/iosm_ipc_devlink.c
    131 static int ipc_devlink_flash_update(struct devlink *devlink,
    132                                     struct devlink_flash_update_params *params,
    133                                     struct netlink_ext_ack *extack)
    134 {
    135         struct iosm_devlink *ipc_devlink = devlink_priv(devlink);
    136         enum iosm_flash_comp_type fls_type;
    137         u32 rc = -EINVAL;
    138         u8 *mdm_rsp;
    139 
    140         mdm_rsp = kzalloc(IOSM_EBL_DW_PACK_SIZE, GFP_KERNEL);
    141         if (!mdm_rsp)
    142                 return -ENOMEM;
    143 
    144         fls_type = ipc_devlink_get_flash_comp_type(params->component,
--> 145                                                    strlen(params->component));

This function is called from devlink_nl_cmd_flash_update() and
params->component can be NULL so the strlen() will Oops.  Also it's
called from devlink_compat_flash_update() where params->component is
definitely NULL.

    146 
    147         switch (fls_type) {
    148         case FLASH_COMP_TYPE_PSI:
    149                 rc = ipc_flash_boot_psi(ipc_devlink, params->fw);
    150                 break;
    151         case FLASH_COMP_TYPE_EBL:
    152                 rc = ipc_flash_boot_ebl(ipc_devlink, params->fw);
    153                 if (!rc)
    154                         rc = ipc_flash_boot_set_capabilities(ipc_devlink,
    155                                                              mdm_rsp);
    156                 if (!rc)
    157                         rc = ipc_flash_read_swid(ipc_devlink, mdm_rsp);
    158                 break;
    159         case FLASH_COMP_TYPE_FLS:
    160                 rc = ipc_flash_send_fls(ipc_devlink, params->fw, mdm_rsp);
    161                 break;
    162         default:
    163                 devlink_flash_update_status_notify(devlink, "Invalid component",
    164                                                    params->component, 0, 0);
    165                 break;
    166         }
    167 
    168         if (!rc)
    169                 devlink_flash_update_status_notify(devlink, "Flashing success",
    170                                                    params->component, 0, 0);
    171         else
    172                 devlink_flash_update_status_notify(devlink, "Flashing failed",
    173                                                    params->component, 0, 0);
    174 
    175         kfree(mdm_rsp);
    176         return rc;
    177 }

regards,
dan carpenter
