Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8D7C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Feb 2022 11:32:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376422AbiBHLcY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Feb 2022 06:32:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356750AbiBHK6P (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Feb 2022 05:58:15 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D02C03FEC0
        for <kernel-janitors@vger.kernel.org>; Tue,  8 Feb 2022 02:58:15 -0800 (PST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2189kwK8011795;
        Tue, 8 Feb 2022 10:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=HK2nkJwnZMcz8I7Svo2APnwwDd/fJOnTy6jC5LRmN88=;
 b=KGEIl8TCrdtbT9JlEEmdU1Qh8rXJ+ilJoph2XtPA3T+bZwO6DYyR/j3St8rv1WYWSD3b
 ElJGgOtqb6xsZHh+c3DT8TbLygHq2RcSccaXE/I691V1zozvRvSAtTHMrE63yP866QHf
 +1Wer5nrVKUS2tSNNzs4x372H4D+EJ3HO5invh0C8WZwPBzopR2j9nqVB9lraxBnzcMF
 Q8BUPkRxNlCv/qe0wnr+Vs+qJP3pKH7hDpncGB2chU9f9/3rZnf1V41mgHKR0+8aB1J+
 8jZdnqaSly9uf5lGy/7FYxLl3NCHvulGVNxm69fMyTwS/0UQ4I1UMiFuXRj6UX1D1PlR uw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3e345sjy5f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 08 Feb 2022 10:58:11 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 218AplcJ114154;
        Tue, 8 Feb 2022 10:58:10 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
        by userp3030.oracle.com with ESMTP id 3e1ebyx15x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 08 Feb 2022 10:58:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDC+T6Q6HI96NKYpHVQNpirPgBK1eGf8XEZyLPp7s+nsdWK5kATD/avBYLn6dTIoNgURTAre5XuqhEESuW9rmxM04T/sfb+NzVTeXUed5OcD6TSbGigaFek+CP2MBEU75hC3n6+Ah1wEpCz15cHcsSI72kRBIMav85OT/nFDec1aMvVTaSl1IYZyYYBr9s0f3eKo6G9Lx41+2IPAEd0kMh5BZXfixEGi3UgjdnHPQHiYN58h/ZbApdBoYRv5C44IV/i4mBrzc8FTmA341w/uqZgHlTeoNtCi7OoD4arVLe6//Cq6QsAcpfuRmQz8TpkFkUsI05DvRJcJTaRDqVB/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HK2nkJwnZMcz8I7Svo2APnwwDd/fJOnTy6jC5LRmN88=;
 b=fCpQ64FYpeAzeEVK0InbQ8OjzqAkcOPSXBHA3b5WqEBaFco8FxEB79rAdTK3mPgeSvCIyAvMNF7pcrFbyi1SYKdynbRVey/xArbjBU8yBwQgzWySa2xkvIO4DINdfkR5leZNZixvA6Q4UMccQrll8ZKIGI9wzZGqTu5TCqC+lf2JyChwrX0mtJP3O1FfopCdZtkGGjYE+QDFV7yncknJtQahZ+2t9OtSr0QbtE7ULZLtI/yW5exdq8WtQ3DHnzzGB/5UVtbP0MZWsA+S/RfEHB7jECxdBrzaKWziVd5Mz5tMKldo05UFJ36Q+0WBCXAExm4JP3+B0d6y+cv0Y8VRPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HK2nkJwnZMcz8I7Svo2APnwwDd/fJOnTy6jC5LRmN88=;
 b=pBfJbIa7e1xhh2bT6AmAWYXRur3FZCWILTKRUWsPkboC6uDkdoh90QHtCgznV8LlNhZnYCW2vcdBiz/RQwDW+5VtW68kclCp3P5whzOqHQFpkkrWrPTdTlg6wOvMn/svS7ko0BZ7Drd8FNfFeeaODU/3hEwdgTT9HnvYiQ+E1zI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BY5PR10MB3970.namprd10.prod.outlook.com
 (2603:10b6:a03:1ff::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 10:58:08 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 10:58:08 +0000
Date:   Tue, 8 Feb 2022 13:57:50 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     jedrzej.jagielski@intel.com
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] i40e: Fix race condition while adding/deleting
 MAC/VLAN filters
Message-ID: <20220208105750.GT1978@kadam>
References: <20220208072004.GA19479@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208072004.GA19479@kili>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0062.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::17)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96b24596-b3a9-4aeb-b8bc-08d9eaf1e3b8
X-MS-TrafficTypeDiagnostic: BY5PR10MB3970:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB39706313C90463B8C2DE71E28E2D9@BY5PR10MB3970.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /YxIjbUq1WxKvechgX8hP7YSzKzpOrPjk8vmmV8ZdCnQRr3xnAuM76Ob6D2TVqao44jbWPGG6ubf6aMjF3Fzuv5Hn9hG32cY0PFyH0xwS3a113kBCweQ0nz7LWVBJXu966U4DlLwTsJzRok9AO0s2qv9T9gCQcDrPacTBy3D8aAc0IJdmls3Nsy9U2vBYHOlOW06kKO+hOluYNYIy5Iz507NQ1LEdjmZVBMuashp579y9WHuptASxMwf3wjE/GgZspxFVfzGaiHgdo2CBuvbSICYD4Xs1WkBe1G5Z1pLPx/je59yVqeYE78PZXDQSqGZhXYvX58Qd39KYTp4Dwfd/Un/6OBLsWufougsR+ppR8dWE2dZ0D9fjXEUhaNAaclBbYMzKAI7ODN0ONH6I11pQ/awNnRLZjjZZz2hGO/lfvFc10kdSjbGCLF8LfwsLtwIJZFqL4jKUPx+0by7GjjNgMNGkH9OY9dn5nGX8quzGYEeHfLMYbAHq1PprXlJvUrrv71DV12RMGZ4OpF8Exmc9VFzQ36I6O1xnuJIKqZmpId+/XgEQWC3xwn7dblopuvpHxe5tPwR1NH4ANiSEXqdu4VHAMUVUXYzZblHI3mqpGB8HslYdv06fB1MgkcdFprkv9Kt9Z+rrQpY4WKhCszZChGtH9KjHaLx0r3fSrEgfGxb09x8RRd+VgA6ek0Apo8dz5qadvUlEddnuk/bY7HdvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(316002)(6916009)(8676002)(33716001)(33656002)(38350700002)(38100700002)(6486002)(6506007)(2906002)(508600001)(26005)(66946007)(83380400001)(1076003)(4326008)(66556008)(8936002)(5660300002)(52116002)(186003)(86362001)(66476007)(6512007)(6666004)(44832011)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oZh92Nz75REe3MZi7R/t/jZeo2ceNdglnNeK21IiPaBUhv4wNd4JaVg7JE2p?=
 =?us-ascii?Q?x5+aCCFMLUXbcED7i/Mqb9+YUwbT1a+hT45OeqXYtjZbp56kvdkHWOdTUqeW?=
 =?us-ascii?Q?l5VXXov/jkJGHBf5HB0EsyMbIr2Y/5jErJbg2PmW6HmAtLCgSU2SW69mII2c?=
 =?us-ascii?Q?pH9Pf94ZRJTycnYGnw+RqM/igc/MyWGOl2Y9ptXf6VWtSq4vTO/C2jRJ6YI7?=
 =?us-ascii?Q?J2f94DoekYG2Wy6ge8Zhfczj/PfGJ2ORxLXLVfGsNvnY7oHrwMzMbM/YaQtG?=
 =?us-ascii?Q?tIC6ohLroS/5xy99aaY5L5feU3yshXkXmn8qLjXn1UDYqwlUUcDFBXeT05mE?=
 =?us-ascii?Q?LB6yLTYF8KjF6NFPuyALnNuDeAi20Tc3/8pLM431uy0a1gR36w01U1JTD3C3?=
 =?us-ascii?Q?s879f6dTDZhgoxy/XptA8uYseMQ7suOdnmCEiU75kW8nnxIfPJSLKx1GKQPx?=
 =?us-ascii?Q?bUA9LOeiUNTMBV6uQOYAudzdsj/5H/9DP9DHka9ip1XqkgZRHTnZUP6ry2OO?=
 =?us-ascii?Q?j+D6FQZNUWziAVl203RzEw2Nalogk6Ry2b2MGtj8c+Brk3aMthO1vVzFoB74?=
 =?us-ascii?Q?EEozSNizz6EUj06Y2uqrfXBnsaq8dK0xum+6m89/sYhDuy78TYix7VjSl84A?=
 =?us-ascii?Q?FmdQZCdBIfIRaC1VgomlrzvhkC90bjLO4LvngL5GsIN+L8x3utPWKuaODWB2?=
 =?us-ascii?Q?kmZI2OceOeDXRyf4qWfOD/p85Tu8S7d0wwUV5OjUmwmrN8DoD/cinHf39SpY?=
 =?us-ascii?Q?rJOdk3OelLQDumWP1il2xQIBmfzCx/NRq7spwhfkJ4kxt4LqxZAynvMkeQMJ?=
 =?us-ascii?Q?QJAo4MgdvETtu2xYHo9NsVM1ybexYFajb905l2XEOcHj9GzSrsHeBKUwsRsj?=
 =?us-ascii?Q?tKQa3Uz6q47d8BwEYaO1kSaMJ1HHK5PVb0wdj2ssnmCvwozX+pMzi45T/+f6?=
 =?us-ascii?Q?3aJtD1ZrsLXXlCTzSQ8dcmN59mWYyDjebggmqUxqJjveOKlxqAHriLx4eL1g?=
 =?us-ascii?Q?R10KJJXKOsYqwxQw73Jc1YI77yC2G02+pRSBhDFIHZIbvi9s/fhNc3HK8Ad1?=
 =?us-ascii?Q?GIjQ0XKgn9BuLJGFrQj5amv9cR5ERxLCMe8ExoXtjBSncxUaThTHVkD/6pCg?=
 =?us-ascii?Q?83kYsLMDWTEE9qMl2nFvOQwctdN24tlZcsq26CUEGDfEN6XeYx6gId/cv/vo?=
 =?us-ascii?Q?remddkMnqtZN12aoGJaBPdGCfqe64h8sJjwwBNPWBhhqU8AC5gzUanhcxIs4?=
 =?us-ascii?Q?XtCd93PKoX3G+tsjsGbrdzzMIDdoxx/LWcvqZMziqRuIQHE1ZG/DqmYdTvaZ?=
 =?us-ascii?Q?4DiTrbUPqDvM+A3MLv8fjM1ptBsOe6ftp6BpO/27E3gtBTQX5aPswxaHgaBM?=
 =?us-ascii?Q?Ff44IsalXvsIgV3cekD8r4kfQf34eKPjeQWq786ojOh8Fi1FXBkNyeoKpxaq?=
 =?us-ascii?Q?ZQOPg/fpzWp1o5bbs1a2e2kRCChAsmHedey4/IXZnQSe7rRWPcwblv/39axn?=
 =?us-ascii?Q?IoLxj2DjDHB0GhflreHfe1t+dI7xF9NttoN1/oMSf4qogZnx7TO4VkM1F3O+?=
 =?us-ascii?Q?gX5dY6P+QoOhkhW6jLmKl//fX1lh3zmgFDqCF97Y/wQLVbSeSseRCKTxguYB?=
 =?us-ascii?Q?fG9U7yUL2VkhpDki8mgMf3xH7TfOzAMsqgSVB1Z7UcOZwFherrGmrXJaV3gC?=
 =?us-ascii?Q?1zJfYA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b24596-b3a9-4aeb-b8bc-08d9eaf1e3b8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 10:58:08.2874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rv74i7CjiJprTQHstb+cDvFZONCaBGot4Da/FDkoGaGivr6N2n4WsABgATI1Utn0GZe3L9EOqLXR5ipMDHFw8mhxS7pOfmDLeGs9WY726kE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3970
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10251 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202080064
X-Proofpoint-GUID: 76y6HcTAbSNbWDuFvoa2syyi0Pw-PLcA
X-Proofpoint-ORIG-GUID: 76y6HcTAbSNbWDuFvoa2syyi0Pw-PLcA
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Feb 08, 2022 at 10:20:04AM +0300, Dan Carpenter wrote:
> Hello Jedrzej Jagielski,
> 
> The patch 53a9e346e159: "i40e: Fix race condition while
> adding/deleting MAC/VLAN filters" from Jan 14, 2022, leads to the
> following Smatch static checker warning:
> 
> 	drivers/net/ethernet/intel/i40e/i40e_main.c:2153 i40e_aqc_del_filters()
> 	error: uninitialized symbol 'aq_status'.
> 
> drivers/net/ethernet/intel/i40e/i40e_main.c
>     2140 static
>     2141 void i40e_aqc_del_filters(struct i40e_vsi *vsi, const char *vsi_name,
>     2142                           struct i40e_aqc_remove_macvlan_element_data *list,
>     2143                           int num_del, int *retval)
>     2144 {
>     2145         struct i40e_hw *hw = &vsi->back->hw;
>     2146         enum i40e_admin_queue_err aq_status;
>     2147         i40e_status aq_ret;
>     2148 
>     2149         aq_ret = i40e_aq_remove_macvlan_v2(hw, vsi->seid, list, num_del, NULL,
>     2150                                            &aq_status);
>     2151 
>     2152         /* Explicitly ignore and do not report when firmware returns ENOENT */
> --> 2153         if (aq_ret && !(aq_status == I40E_AQ_RC_ENOENT)) {
> 
> The error pathes doesn't set aq_status.

In my head, I wrote "The first error path doesn't set aq_status".

regards,
dan carpenter

