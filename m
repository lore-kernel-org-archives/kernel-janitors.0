Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29351C433FE
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 Oct 2022 14:12:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiJNOM0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 14 Oct 2022 10:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiJNOMZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 Oct 2022 10:12:25 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDBC81D2F62
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Oct 2022 07:12:24 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EE14DH001307;
        Fri, 14 Oct 2022 14:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=XblJQ5+Fo+bQ+TTfgYkxxOdnuLsEqNvmu4e83XP0QsI=;
 b=dfFDHVSpzDlMl9rc2PSu8C1XiNaIvR7arlRPWR9iNk1pOxVcuy8c974cS96QWJrxkQSw
 oEWNj8h2F2JqBef6pAnew05k0zBicj/IdAQ++YF+ALotvn59uT9JE9j6ckaRIQigWAv/
 YQ2ppTPyMOf/FqMB3JI2wtKT9oJCu+6te0sYs/Tp4PUK/kBKKR36ujOYCfz4+pf+kXcz
 mvhV016Pp4n6oxFjvaCCUC/GVs6G0WmgOS5et3cdLmeAJzWYK5tU+eGaqz9Hm20HaOMU
 kOaIjAqY9gJWjo9XIH+AajuPvMCHwiPSK0Q88fBuKK9f9fXYT48BYewPNN0xqffMcQ3d lQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k795k011t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 Oct 2022 14:12:18 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29ED3xlL003882;
        Fri, 14 Oct 2022 14:12:16 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3k2yndqf1b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 Oct 2022 14:12:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbaE2AOYEdtaDpOJ/HOuOcJW7MDVTnPtNsayFWICr3NSWqVsD0we3lLWHYqdjIbPuzxPFf72I5A4Ci2xlLAE+ROV40RoPdWUdsmvGfjLZ8fdK7TVcZI8cR9jxoCTVEBo0NRiNNOp/clDzLTzQsf9fYvh54wpP+d8GMM+fNcvnXMTouD4Dq8c+4sy0k+Pw3YohGW7+RanDclRvKp0BJjqqO4qpJh/ZBr8RdubQpgNwDOSM5NFiIV43pEjWMo3AMpN85XIa8Hte9MkYDzzrATjEA1CfoE0Wk5olTuD8GWpQWqGoRYhMmkgPUm3jAxOQywBFBbLxGjVoemkso0Yfr6U6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XblJQ5+Fo+bQ+TTfgYkxxOdnuLsEqNvmu4e83XP0QsI=;
 b=VznCeWICdBBRur0KNrR6E2eaWtBdxQ9DW7B2IVqdzhnCpQQGLyn0oMXuMiQ+9aKysa63U/2e2Rimp/Z/PvLAfCHAaZZN+tmlX47dpukz9+a6Lm7qMAw7SuvfN+yycY7AdWn0jjUxYsfmoLhJ2afMTCW6z1L8yj8BNrwVefXij6lLc97A6BgB1Tbi+yaBlGPGQ/Gv+/aSPJRIr94HRj2n1cKODGDCxOBittA5KRRjVrRfg2HFtTyIz1gkbTAe6P6xof9DHsRx98FaeAVVSVcMaiWXUSnVm4SsNm8K15zVVxlDJGJcjVFeT0CqcpJNZpGmBZ1UE/OKVa+X0MQigQhVuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XblJQ5+Fo+bQ+TTfgYkxxOdnuLsEqNvmu4e83XP0QsI=;
 b=dziMd4oeHarwIGdtnBKBwSXvdzA3nYgfL4mDkSSYx3agvbXjnT907CU8bvjL/sWwZp38hYTURBwiaAb+rKAI1fo6c5DG4od0l6Iq/JjwE+AIIXJFc1bAtqBiDhsYdq1+rbaN7QG14R016Qu7GGSzmwYTWRVWBJ+b71YEU1uj5/g=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by IA1PR10MB6195.namprd10.prod.outlook.com
 (2603:10b6:208:3a5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Fri, 14 Oct
 2022 14:12:14 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Fri, 14 Oct 2022
 14:12:14 +0000
Date:   Fri, 14 Oct 2022 17:11:55 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Vladimir Oltean <vladimir.oltean@nxp.com>
Cc:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [bug report] net: dsa: allow masters to join a LAG
Message-ID: <Y0luK5LRrC4pFNMj@kadam>
References: <Y0kusYUT1zskwnXI@kili>
 <20221014103524.xlcu4szxug2xlb62@skbuf>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221014103524.xlcu4szxug2xlb62@skbuf>
X-ClientProxiedBy: JNAP275CA0028.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::13)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|IA1PR10MB6195:EE_
X-MS-Office365-Filtering-Correlation-Id: fc015503-e869-4e1d-7051-08daadee1790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 81hE1poVY3otx6DsRSNwpQvMg8bWugj46+DJ1xlxEswF7Nu/7vL978YwErNSzKXO1YLKq+OGPVlKNs74XYW4iU/Lav6KN6LAnUQpAvTyVtba3p3v2uK6ILIaaNcSRGuTIZmpa9R3L559JCHzvB55h4JfdxH5eG+WWaSdhf/pWJMXylnCDZhMep5N8MRy/5GvD4wN/RI9x3fsBKyKnzHkg2UTlNNyMhdky94sQv2dNwwYFpWCvh6JjwV1FFrvWe0pHsPLVH75ZfW52ddmwVKoAlEE8ba/Pm9PCqfAp7BcRPSFOfHYOpHw0egYIHSSZLAlTCqAh9Q7zrkzT2hDGdoscpFShqdmxwVsQZVzZWvsk8XNZ81wjKCuccVBMsWCvTCM/mppb6KjCuL4oD18J4SEVvrY98sW6eKLLw7Mbug3O07CwN4tlOP6PJzC67GMCICr618Usjs94dOKfJc7VTbr8dc6KSwurqrUOhqz8sP4dRGqBhtNGJdMVtB17WuCBF/bsYuIp17ELUJdF2dXlQGi0kvF7tXa4Bx107QKsbCCgeJWcrCxnGVZRhjjQ3/NquUABjWoMoUOBESHmrEUdIlDm4wYaaWP3oBX7/ojcEmvYipDGnL4BXtsSkHSlwBLekiE2kQa4LexTYzyz4S9wko82SmeecgyxJOYi9Noc+8H9vzxSDYa2ezoBadS0bKzzIDayFszriJ6s8I1h8LulnyqYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199015)(478600001)(33716001)(6916009)(6486002)(83380400001)(86362001)(5660300002)(38100700002)(44832011)(8936002)(66556008)(41300700001)(6506007)(186003)(66946007)(2906002)(316002)(66476007)(26005)(4326008)(6512007)(8676002)(6666004)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dzi/QzXKn65PXGbHwGJL3/TpSiYVGHJwJ+BBEArF46v9NpJnqWpsGjP4LDKe?=
 =?us-ascii?Q?6aLR146mLHjfOSOXV9gZLTGtdA8Gv/At9aUTZYOIcoFq/LlfoYyb0ZsuY56z?=
 =?us-ascii?Q?Cgvf06qZSMwh/tAi9w5QAXzgAXILDm3euqD9GEa9Jgi5SuVPcM2H4C3i0pCE?=
 =?us-ascii?Q?E2E/w+Kvlgp7Ohm00TORP3S8Aiaisa6nrLVEyvAof3ThRXNG3XMMwGIUa0xq?=
 =?us-ascii?Q?Xk7IytdCvcw+fECJiLYEaiW0EIeXy2MxpmjPxUxwYyl2etALAogBgrO2YVBP?=
 =?us-ascii?Q?Cr3yzxryMcY7phtZ/c4VyvTwMeWHxFG1kSuw+UF6apmS0fg8PvsPvi9tWejX?=
 =?us-ascii?Q?Oyw9be3utcs+/IZGSawsuVUi/oAm4mZoel5wAcfI9yaf7irLLFT+dOxzyatJ?=
 =?us-ascii?Q?HOVeAEZdYuSTWsopQg3wMSeNdziMRndCpDfmBpkTTYkw7NOi6n1hF7RBvczN?=
 =?us-ascii?Q?sfZWE4rq7T4y4UzL0wBaTiO2L2gT5z+CrAD7tQSERG2UhaZ3/r3ZiOvjD24v?=
 =?us-ascii?Q?uUpqcy0yeapc256jxSioXhYrtUNWIG15CsvS9KJXwQ0SLHiGlhDTjAmZFnA/?=
 =?us-ascii?Q?v86RhYLWwPdSsmSPZAaWMlZ+0sJK+vAJOGXRD2JUkKs4+y+m7hNDZpy8vKGB?=
 =?us-ascii?Q?bby2FUfTb9Qw40kxgSsnTXBt99AAk4659j0NBCsiM5HgegBhjYp+q/D3vLsV?=
 =?us-ascii?Q?D0udLMRpaTSRclTHJwyrEeWLCFI6liAUDlK1iqVNnpbBhVUQyJsRPjVSnLlP?=
 =?us-ascii?Q?RUzgcV3AFuz4wSDqSu0MfafeM2qHovWs7xAmyv/sSm3W+3RATN2S/suoF04q?=
 =?us-ascii?Q?jLda//VGSWid17yIevHY0B80m0K4jxLZt2uk5kP0F1xWiPLei2nX0e9PKuTF?=
 =?us-ascii?Q?SfzLibuXkNKkxzthV25Ebcl0OZrs5r7his0N5BnaKD3Uts2tBxm0ZqOCuV8a?=
 =?us-ascii?Q?GOA7WEoDfzquoOqfMJcWGlTNuMdGLgoupRrYBdgiPRG3gIDk/iBmKwdXU6dZ?=
 =?us-ascii?Q?BBfud2lTiprDhFzO518YEI4AAylgjW75y0iPqxLV1bPt2lnFLIX8JeZCS2g4?=
 =?us-ascii?Q?qi9J4yoWUxV20PHBMIvjoSJ2shp1qSQJIB7KzhFX50UfgPpRHkH3U5CPBoqo?=
 =?us-ascii?Q?jAx6nV6gm4F6i0g99JjWo/S7GwNAXvfgVoHj5eKNNrAPePivUB4z+MU5blYU?=
 =?us-ascii?Q?RB1FBUsG7n3KsO9gOFPNC9q3SHPxXGPe0kr5tCO9PTBovgHuawqL7wRayYyQ?=
 =?us-ascii?Q?QmHawHV+oSzHGDeXIO9zfIpUifJSNSIj1kMrBlf+nYiUbQax3prPwZXpdYPt?=
 =?us-ascii?Q?2IKmLAYQnxQlsBI4/RAysHMDdAaEsrdj2n8ZRvCbJi/phttM9nz/Pe2tzuTu?=
 =?us-ascii?Q?R5WYICH/tSTomkACkH9Embc/VKXvIeTgS3NkrodpQsvRDFnQHGv+EDNeIvgA?=
 =?us-ascii?Q?AqgWGyAIgxVgRyreoxJmejWjqRfa454SwipX2c285lkbI/xqDibvNzey7mJJ?=
 =?us-ascii?Q?Nx9VTUFGvvbuWKSnK71yWpKCDnXQkPRg1lRfP3B1iNo2rh3+NL1kThgU43um?=
 =?us-ascii?Q?OiIT+ftkbUoG+DmIZWxsMtYoSZaT0D368aC7bloBs0boCKI3lwpD++nnBjdH?=
 =?us-ascii?Q?nw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc015503-e869-4e1d-7051-08daadee1790
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 14:12:14.3634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLlLxFAVpamdJabJst+cFUcdcyGmQWR1GGWltzJawF4W5DTxIo3EuKNBkeKRinifgiOxWhNfX95zDWwGzTpwZHEeQbTKua+AZeixPO/whls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6195
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_08,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140080
X-Proofpoint-GUID: 6TquyTE1y-UJiI6wi2QbPU6LRuXiQURJ
X-Proofpoint-ORIG-GUID: 6TquyTE1y-UJiI6wi2QbPU6LRuXiQURJ
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 14, 2022 at 10:35:24AM +0000, Vladimir Oltean wrote:
> Hello Dan Carpenter,
> 
> On Fri, Oct 14, 2022 at 12:41:05PM +0300, Dan Carpenter wrote:
> > Hello Vladimir Oltean,
> > 
> > The patch acc43b7bf52a: "net: dsa: allow masters to join a LAG" from
> > Sep 11, 2022, leads to the following Smatch static checker warning:
> > 
> > 	net/dsa/slave.c:3165 dsa_slave_netdevice_event()
> > 	error: uninitialized symbol 'err'.
> > 
> > net/dsa/slave.c
> >     3145         case NETDEV_CHANGELOWERSTATE: {
> >     3146                 struct netdev_notifier_changelowerstate_info *info = ptr;
> >     3147                 struct dsa_port *dp;
> >     3148                 int err;
> >     3149 
> >     3150                 if (dsa_slave_dev_check(dev)) {
> >     3151                         dp = dsa_slave_to_port(dev);
> >     3152 
> >     3153                         err = dsa_port_lag_change(dp, info->lower_state_info);
> >     3154                 }
> >     3155 
> >     3156                 /* Mirror LAG port events on DSA masters that are in
> >     3157                  * a LAG towards their respective switch CPU ports
> >     3158                  */
> >     3159                 if (netdev_uses_dsa(dev)) {
> >     3160                         dp = dev->dsa_ptr;
> >     3161 
> >     3162                         err = dsa_port_lag_change(dp, info->lower_state_info);
> >     3163                 }
> > 
> > Can both dsa_slave_dev_check() and netdev_uses_dsa() be false?
> 
> Thanks for the report. Yes, it can happen that the logic falls through
> neither of those conditions. "err" needs to be initialized with 0 in
> that case. Could you please prepare a patch?

Yeah, I'll write a patch.  Thanks!

regards,
dan carpenter
