Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E40C43334
	for <kernel-janitors@archiver.kernel.org>; Wed, 22 Jun 2022 09:35:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbiFVJfe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 22 Jun 2022 05:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiFVJfb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 22 Jun 2022 05:35:31 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88E7255B2
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Jun 2022 02:35:26 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25M9YWa4020408;
        Wed, 22 Jun 2022 09:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=VvRaryundAGVZARY+lmn3X2P5+EKxGyTEutDJ3JKopI=;
 b=Ux3XizRE1FTF714+oJs9tR/pELl6RZV2R3hvvQfzbPNO1EJauRPnshGDVpMRqZJRh6it
 ltPjitttKrq7X7HK146FRPZehhC2lJPgvDJW8zG7EtySWao6zGLeYJzgF5uSSZAy6mWq
 +MoInDulTEDbLAGwP5cuZ/KIJdk87JZHk109DOWR8hRjmQ4QjaSGozDLnZ8Zh4f7Yakc
 aHcQ0iazJoh4V5DvbjRMEO0efEok+jfBcOjnplu7raEJNu1T/v5vl1VvkGKQd51r8B4y
 9NxM8vkIeSBCgT3wNFMrnDp7pvRev5rOdIwXXulDskHOdMR0EvtyXgPvAzy2CHGjgLzt VA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs6kf7un5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 Jun 2022 09:35:21 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25M9Qdno024712;
        Wed, 22 Jun 2022 09:35:21 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gth8xasw8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 Jun 2022 09:35:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=of/jvQONdplU0Y8yPZhuxPjHbTMhE2vcFT79c8f8TDSwhYkyWDSyoKnPSwDL0Ld9xrfziMI+hVlNoeRbZt6p/X3DrejwBPBCRKBB8vCUBlb/z/tRZRCkttgP84w4w0q2sxl5zRj9ofc/KQuAwL73YosbJTsLPGEMxMFlORfWH1tcOteco31fsGGnHCl3WV9+qGbRG1VyfyakImDHrEd0d9JryAoFot4tl2ZTwsvsu6ywBjgaDUdxe/DiUzBoDk6c9wMuQ4B0d43Drpm0jAu23UyZBQ6O3elV9zJPOBtVGPTNr4oXTCM7IQNm4tjf2K8TBNyhFXzpGrbZfDp96AIZ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvRaryundAGVZARY+lmn3X2P5+EKxGyTEutDJ3JKopI=;
 b=VD62URo9apJ7zx+4NgqMxCT9/qMfMwX+H2QJS3MX9NneejnTT2knPmubuir3dbXVfUWKMEGy5ED+C1Zy7pAdcTST5kNNYVjQ6s2gu2aJCdtUY2dN3tH6DBW4MpRk7d4lBnGR5Po4DgHkOoo/5TG8rMBg3zg4g1pYS6BwQKs+IP7yH9eSwwNwRzYjv2YY4wN9izMlUM6kua20KbfxtzLT/EcDjBF6jd1nWNfMYqJh+pd76hNXiCXIRT7M3hIjI0eSq/ybL/wm2zN6yBaCzAZwebdp2UoGEcKvf6CZLun59jy+0hDbCgbEf+IcTXKSvGDl8LU2GjONqpRixOYH1CRu3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvRaryundAGVZARY+lmn3X2P5+EKxGyTEutDJ3JKopI=;
 b=ft/ACZIqwBPmmHKhwSht/pNpMPVAjqwkLMqKBwq/pcqU80/JRFjlrk/jlM/KvCsraNbD+KZzTP/+tE3cuIRCva7NhPZH3yST5CMdB70/M/kh8VYXLlqMMb5xtwhVkhjmt9f/BT3XO2n4Hmm8D0d1kn5APfw1omIpxrFEYFos7zA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM4PR10MB6159.namprd10.prod.outlook.com
 (2603:10b6:8:ba::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 22 Jun
 2022 09:35:19 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Wed, 22 Jun 2022
 09:35:18 +0000
Date:   Wed, 22 Jun 2022 12:34:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Roger Lu =?utf-8?B?KOmZuOeRnuWCkSk=?= <Roger.Lu@mediatek.com>
Cc:     "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Fan Chen =?utf-8?B?KOmZs+WHoSk=?= <fan.chen@mediatek.com>,
        Allen-yy Lin =?utf-8?B?KOael+Wlleepjik=?= 
        <Allen-yy.Lin@mediatek.com>,
        Jia-wei Chang =?utf-8?B?KOW8teS9s+WBiSk=?= 
        <Jia-wei.Chang@mediatek.com>
Subject: Re: [bug report] soc: mediatek: SVS: add mt8192 SVS GPU driver
Message-ID: <20220622093458.GO1999@kadam>
References: <YrK7BkMp5zbgziBq@kili>
 <HK0PR03MB34269237A97091637A9A9A13F1B29@HK0PR03MB3426.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HK0PR03MB34269237A97091637A9A9A13F1B29@HK0PR03MB3426.apcprd03.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0019.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c45ea30-1375-4474-80b9-08da54328532
X-MS-TrafficTypeDiagnostic: DM4PR10MB6159:EE_
X-Microsoft-Antispam-PRVS: <DM4PR10MB6159D75422BDA03D60D56EC68EB29@DM4PR10MB6159.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8A7GYPkSoE/8hY24m84QemTmod6E9jQMDyReGJA+83SLZgr3HLjXUwUHqWvlbfNTOWjrC99t5L7++Dqbm8PKvlYvIjBfkIGxRWqvgROSoG2hsSQaevC1ArJejqccQNHqT1BdapOoFYGbdo8ZFmAKjTTkZ4AMFL41Y8J9BnqFXekacOzT1bmuz63EPTBJWW4xEP8wDmNHWKpSpEuaTlLuFKT9lWF9EunYI7o82bosSThD02IrBa5yYFU8wFAIDP5t8j/j5SVzRQVz+E4SWIt1aT0QjhtXdjmHkYhAAD8uKUvNSS4bJ6bpfhBwTwHVSXcjwvYvTqkv8XHhtZMl+lkvaVz/D/BPodTP1aWBKpODpub7Ymv48QLhme1I0XDzncyz6xO07CYuNsIgcRtaZJ7bUdYS3zpyO+Ap33+ZEILHVAhGynTQb2iECeLdjyhOg9RkoPbEMFaCp7sii7Z03VcpcnGxmO1UckyUmzD5Pp0qNMQUqgsyxDUDjkwcS/4VUUeT7FfLs/rNeBlzUtdXbbS4p0Ke/+wdzhHtwcZhCjTmzGb5N2azZ5HTxJZyENS0Bfe4MY9YNrP/0QgyoSIK9MQJ7+LOp+GWHFQ6jN9DGaT1RpNiAjyJDQBPQjToOfteQq99UMd3Q7GVThSC9qyl5UPXv0TMivb+iDBmUICto/q4sh5vnlwHUJM2UTAUfNnShct74chEZtmFBnzukyBh6yXmhp8Vd0y/CdX9NGdHfcEw0l60bSZpX0PINjWmTA5X2bwNuyhQ+toNf8TS/Qwesl8qVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(39860400002)(396003)(136003)(376002)(346002)(366004)(6506007)(52116002)(53546011)(6512007)(26005)(33656002)(44832011)(9686003)(8936002)(6666004)(41300700001)(478600001)(6486002)(2906002)(83380400001)(5660300002)(66946007)(38100700002)(33716001)(86362001)(1076003)(186003)(6916009)(54906003)(316002)(38350700002)(66476007)(4326008)(66556008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2F1dndYR0pxanZzU1VDcDJrcmdadlBjcnRMdVhaRVVVcVl1OWZueTF2TWhN?=
 =?utf-8?B?MFBFbUNIb2Jadk1PekIxS3EzK0FyYzcySnpPbWVBUE9TWGxtUVRGaWVKbFpr?=
 =?utf-8?B?V1JMNi9TK3JsSGtKaUplYW1GTnVKNmNlZmNiS1VQY3RQTmh2RWp5Y0ZYcXdn?=
 =?utf-8?B?Q1c5b0tDMjV1YmJxVk5wSWFGbVgxTjNXVWE2Z0l0ZTIrdHJ3SFpTWDg3Y0hU?=
 =?utf-8?B?V2d0dGMyYWp4SmhsSFZzRlB1bnBCUU9kN0pZMi9TY0RPMnZwR2RlWEhoN3J4?=
 =?utf-8?B?TCtaWkYvVWdRTVBkOVplV2Z4cDlMUUNHSHVxRFM5WGxZSW1EUXpkMXJyZkFO?=
 =?utf-8?B?U2pvWEtYblFzL1plMTBtNDBUK3R3OEhnaEtzcnJHeFJkWHp4R2h2cTFkVTZr?=
 =?utf-8?B?TjlEZVRhS0pzbnB4STZKeFdGOVFLTmZ2cWlqU3dFOCsyN2E4OGYralNUeC95?=
 =?utf-8?B?b244QkNvS1pHWVEzZ2hJRENCVTNpSzNDNHBJLzhxaW5jcGFDZE1Lbk5KR0lR?=
 =?utf-8?B?VmloR0hKQ1dGdU9IVGJGNmlVdkdBZG4yZVRSTDdrdDNtaURqR1oxZVpFKzJI?=
 =?utf-8?B?djZ6LzNlOU4yakFhMjlLdStGalkzeStxTFNVN3ZBbllnSnNwZ0ZVTHdQcXdH?=
 =?utf-8?B?VkFpaGF0dWxMT2NWa2FBWloxbVl0eVk1UTNjTTYybGhqSlVqYWJ5b0VzUS9M?=
 =?utf-8?B?RkIyYURhdWJya3BLUjdwa0c0NlVWY1JaMVIwd3k0eUFUenFuMzM1SEZCbkRD?=
 =?utf-8?B?amhMVTRidk5NdDQwd0NIQWJNYTJnaTVtczQ0NGJEMzlWa0JqVFBZcjQ1M0Zk?=
 =?utf-8?B?M3UrNkpDY2l3N3BNZHFPZG1sbVVrRjJQZUxzVTluRHAxaHIzZTJqeFFEWXhF?=
 =?utf-8?B?dS9jU0FOT1JybjMrTTFxdzRlemxXKzRIMCtSUGg0K2F0WGxEb2ZHWjBGbndG?=
 =?utf-8?B?SGZxMVJnWm1RKzdYODI3bDFWTXhCLy9FZURzQkpWYzFneFN2RTlJcjJXNy9J?=
 =?utf-8?B?SExZYUFYSG5iWlk1L0NtNWs0VlJSWHBjVTFkNCsvR2QwNTQ1U1I1SUhGcHFp?=
 =?utf-8?B?WEd1VCtoUTJ1Z1RDQ1VoNTQ2akE3eVJKV3gyY0V4QTludGpUV1FzS2lEQUY4?=
 =?utf-8?B?NmpKdmhDaDVYZDlwSndRNVNHTXJnVG4xRk1hL1N1WnhvSytCNXNUUC9henlV?=
 =?utf-8?B?OE1zbDRaMGRJRmw0UFdkZ1E1b01KR0wyVHlrU3VLWHBRT1B1TFpMYk8wcnNn?=
 =?utf-8?B?b2Z6NnhGazl2UWl5TDVvZyt6Yk95RHh5eDdZV1hNOCs0SVg3bG9zOUU0QkJ3?=
 =?utf-8?B?SndtcWhFWVlZSnFPU3JYOWdIYWpyK0xwSDVDcGFWdXJwOXltdTRDNzlWbXYz?=
 =?utf-8?B?U1lVUCthUi9xWDJQTW1qZHgyNDFuRXpsS3lLWXRJZjArK2tLMUpKQTNCZmwv?=
 =?utf-8?B?Uml3bC8yN2ZEcDVLT0U5eUVSRGFLUytacGFDcnNqd1JnamhpU0xOM0l0cXVz?=
 =?utf-8?B?bFJFSWdTWXVpc1pkRGJOY0QxR1h6YzgwRmhyZTZSdy9MVW0wWGM4bVFlNDVl?=
 =?utf-8?B?Q1hMUDVFN0xHbW5sSGJYVnNSaGRveHJiVEVBZDNhOFVqM0xITWZlTzF3WFZx?=
 =?utf-8?B?TVE4V2dKVnRmTjZrTUlYWUgrdUFiZ1JybHdJVjZqZG1hT1AzdSs3ODBqeEhr?=
 =?utf-8?B?dFg4Rkg3MitLREFGWjUyVERBa05Bc1EvWHJzckpJVXhrVy9UTWFaNTY5bXRC?=
 =?utf-8?B?anB6MU83aTdEOG5nUG1sd29aMnhJNGduU1hiTExwYlR1dlV0bzdzNVRBRmZQ?=
 =?utf-8?B?azAya3pMdys4T0RFalh3blMvZjFHcm5Lb0kwYlhqMzJtMjNPclcwMHpoWmN5?=
 =?utf-8?B?SEw3aXVrTmFwMHR3RmVsQThSWUlOTlF3RXJpeTcweVhGWlVsUjN0b2s4YXZR?=
 =?utf-8?B?VkV0MHNEN2swcUlrRUtDOTJGbllBWWtTdm9pc0R5dkZ4ajB5MVFhVFFBV2g3?=
 =?utf-8?B?OUZUSnFGL1QxVkNtTWV0N2VmSXQrWFV3d2RkcWZ6ZzI2Mm80cUZwRjE0VmM2?=
 =?utf-8?B?QjUxQmkrbzNjTlFFZUE2RnNMY1JYMlpYQStKS0dUS0YzaG1UN2NPb0psbk5D?=
 =?utf-8?B?eWYrbThXQk1aWkR4Z2R6RkE2eExENWhqdE8xVHJRR0x3aTRUS2JXZ2FaR3pP?=
 =?utf-8?B?WE5yRXI1VHp1d2hXSG54RXpTQWdVeXdiTFkyejhhRjhGZDdqMUFFeHNQVm9l?=
 =?utf-8?B?OVUzblBhcnQ5Sm4vQkpHeURjM2pvQjlsNWE2bGVtTUg5TzZKWjZ2UEtXc2Vo?=
 =?utf-8?B?SjU5OHl6QVZwL0pTZmdwd2FaTVVoN3pVby9sUW1ESUtDQkN4YldXVGR2dmRU?=
 =?utf-8?Q?bLPEIGbjt5SGyaDk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c45ea30-1375-4474-80b9-08da54328532
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 09:35:18.7373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRKf3iVs6iZH6leCwPdndgihfNGct6k1pQax9RgGcDBHtXufT34waJcBGQ9jnxH5EyK1F55NQR1/s0JiCiC44wNJF4uKWlbe2LPHnwZ/7Oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6159
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-22_01:2022-06-22,2022-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206220045
X-Proofpoint-ORIG-GUID: _rBZvZ8fIPqeTg6HGAT9cWztO_1Ctf0c
X-Proofpoint-GUID: _rBZvZ8fIPqeTg6HGAT9cWztO_1Ctf0c
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 22, 2022 at 09:18:25AM +0000, Roger Lu (陸瑞傑) wrote:
> Hi Dan,
> 
> Excuse me, I didn't see the warning raised and explain in-line from your email. Please search "Roger (0622)" for the reply. Thanks a lot.
> 
> Sincerely,
> Roger Lu.
> 
> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com> 
> Sent: Wednesday, June 22, 2022 2:48 PM
> To: Roger Lu (陸瑞傑) <Roger.Lu@mediatek.com>
> Cc: linux-mediatek@lists.infradead.org; kernel-janitors@vger.kernel.org
> Subject: [bug report] soc: mediatek: SVS: add mt8192 SVS GPU driver
> 
> Hello Roger Lu,
> 
> The patch 0bbb09b2af9d: "soc: mediatek: SVS: add mt8192 SVS GPU driver" from May 16, 2022, leads to the following (unpublished) Smatch static checker warning:
> 
> 	drivers/soc/mediatek/mtk-svs.c:532 svs_adjust_pm_opp_volts()
> 	warn: loop overwrites return value 'ret'
> 
> drivers/soc/mediatek/mtk-svs.c
>     487 static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
>     488 {
>     489         int ret = -EPERM, tzone_temp = 0;
>                     ^^^^^^^^^^^^^
> What is this -EPERM for?
> Roger (0622): This -EPERM initialization is required. The `ret` value assignment in this function is put into if-statement so it needs the initialization.
> 

There is no if statement which uses this assignment.  I have copy and
pasted the code from linux-next into this email so it should be easy to
check.

regards,
dan carpenter

>     490         u32 i, svsb_volt, opp_volt, temp_voffset = 0, opp_start, opp_stop;
>     491 
>     492         mutex_lock(&svsb->lock);
>     493 
>     494         /*
>     495          * 2-line bank updates its corresponding opp volts.
>     496          * 1-line bank updates all opp volts.
>     497          */
>     498         if (svsb->type == SVSB_HIGH) {
>     499                 opp_start = 0;
>     500                 opp_stop = svsb->turn_pt;
>     501         } else if (svsb->type == SVSB_LOW) {
>     502                 opp_start = svsb->turn_pt;
>     503                 opp_stop = svsb->opp_count;
>     504         } else {
>     505                 opp_start = 0;
>     506                 opp_stop = svsb->opp_count;
>     507         }
>     508 
>     509         /* Get thermal effect */
>     510         if (svsb->phase == SVSB_PHASE_MON) {
>     511                 ret = thermal_zone_get_temp(svsb->tzd, &tzone_temp);
>     512                 if (ret || (svsb->temp > SVSB_TEMP_UPPER_BOUND &&
>     513                             svsb->temp < SVSB_TEMP_LOWER_BOUND)) {
>     514                         dev_err(svsb->dev, "%s: %d (0x%x), run default volts\n",
>     515                                 svsb->tzone_name, ret, svsb->temp);
>     516                         svsb->phase = SVSB_PHASE_ERROR;
> 
> ret is set here but there is no goto unlock_mutex;
> Roger (0622): We don't need goto here. If we cannot get temperature here, SVS bank will apply default voltages to DVFS. So we change SVS bank's phase to `SVSB_PHASE_ERROR` only.
> 
>     517                 }
>     518 
>     519                 if (tzone_temp >= svsb->tzone_htemp)
>     520                         temp_voffset += svsb->tzone_htemp_voffset;
>     521                 else if (tzone_temp <= svsb->tzone_ltemp)
>     522                         temp_voffset += svsb->tzone_ltemp_voffset;
>     523 
>     524                 /* 2-line bank update all opp volts when running mon mode */
>     525                 if (svsb->type == SVSB_HIGH || svsb->type == SVSB_LOW) {
>     526                         opp_start = 0;
>     527                         opp_stop = svsb->opp_count;
>     528                 }
>     529         }
>     530 
>     531         /* vmin <= svsb_volt (opp_volt) <= default opp voltage */
> --> 532         for (i = opp_start; i < opp_stop; i++) {
> 
> I guess the bug is that there was supposed to be an explicit check?
> 
> 	if (opp_start == opp_stop) {
> 		ret = -EPERM;
> 		goto unlock_mutex;
> 	}
> 
> Otherwise, we are possibly returning the ret from the /* Get thermal effect */ block.
> 
>     533                 switch (svsb->phase) {
>     534                 case SVSB_PHASE_ERROR:
>     535                         opp_volt = svsb->opp_dvolt[i];
>     536                         break;
>     537                 case SVSB_PHASE_INIT01:
>     538                         /* do nothing */
>     539                         goto unlock_mutex;
>     540                 case SVSB_PHASE_INIT02:
>     541                         svsb_volt = max(svsb->volt[i], svsb->vmin);
>     542                         opp_volt = svs_bank_volt_to_opp_volt(svsb_volt,
>     543                                                              svsb->volt_step,
>     544                                                              svsb->volt_base);
>     545                         break;
>     546                 case SVSB_PHASE_MON:
>     547                         svsb_volt = max(svsb->volt[i] + temp_voffset, svsb->vmin);
>     548                         opp_volt = svs_bank_volt_to_opp_volt(svsb_volt,
>     549                                                              svsb->volt_step,
>     550                                                              svsb->volt_base);
>     551                         break;
>     552                 default:
>     553                         dev_err(svsb->dev, "unknown phase: %u\n", svsb->phase);
>     554                         ret = -EINVAL;
>     555                         goto unlock_mutex;
>     556                 }
>     557 
>     558                 opp_volt = min(opp_volt, svsb->opp_dvolt[i]);
>     559                 ret = dev_pm_opp_adjust_voltage(svsb->opp_dev,
>     560                                                 svsb->opp_dfreq[i],
>     561                                                 opp_volt, opp_volt,
>     562                                                 svsb->opp_dvolt[i]);
>     563                 if (ret) {
>     564                         dev_err(svsb->dev, "set %uuV fail: %d\n",
>     565                                 opp_volt, ret);
>     566                         goto unlock_mutex;
>     567                 }
>     568         }
>     569 
>     570 unlock_mutex:
>     571         mutex_unlock(&svsb->lock);
>     572 
>     573         return ret;
>     574 }
> 
> regards,
> dan carpenter
