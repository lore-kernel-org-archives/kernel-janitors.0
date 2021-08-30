Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A05C432BE
	for <kernel-janitors@archiver.kernel.org>; Mon, 30 Aug 2021 11:35:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2D526113D
	for <kernel-janitors@archiver.kernel.org>; Mon, 30 Aug 2021 11:35:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236471AbhH3Lfz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 30 Aug 2021 07:35:55 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:44682 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232579AbhH3Lfx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 30 Aug 2021 07:35:53 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17UBOUbs017480;
        Mon, 30 Aug 2021 11:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : content-transfer-encoding :
 in-reply-to : mime-version; s=corp-2021-07-09;
 bh=b3tkEt0eBjASemnh6yN7s9eqSceB60n49S0ygV/Bc50=;
 b=P70YUbHzB2x07FW4n2dlwAyG9Jq1R25Ab87qpUYdlsoXbzM6xpHHYQYpqTQCIlVnzIYF
 vwTeqAWV2NXxx4v8NUXPNRoJOJpueJ6lMFRwtyboPbYEezZgZT+sC3PsZ+SE10/3QCeO
 1a8gIj4nUkVx3HjnBawG4vdORP7n1h1fTMy5Ed+leLDf8sjEE0MUWw1WTLOT30cntSNb
 bAULfSJqBSXpE7lZ/K3qOuh+yrlGAoXj5eA7PZ2tDHxdFa7x90NQCGsKIpYDpSKPBKvx
 IEuye3PONdH7tlEv4blGDusGssYBT3LiJmG4bXclKZ0PYiGqh9JY5oEkr7mV1rIIvlZV IA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : content-transfer-encoding :
 in-reply-to : mime-version; s=corp-2020-01-29;
 bh=b3tkEt0eBjASemnh6yN7s9eqSceB60n49S0ygV/Bc50=;
 b=SmdQlIdl9IRr3gWX3XMuTsARlPHs1rXMrInzl/HiapTlSpKybLq66gbLyRYPafBkTyiD
 MQI5vZm0BBCZ0ZP/Zcx/jFe7Dv5sZd8GpbYqW6n8D07dkXilN61MqW9P3ZVnsa/zLrbs
 qKYIFTM2GON3TmbXsXgM0QWA2xJzNWRt+jaZq76sm6+Xl7KHvncdgjFrrZn2hwZndlB+
 N1UeWUvBMSkP+AEPW3scNrfs4r4nu0HE0BryqQ9uh/GLc+niXDwG4OEfbOpbHrsLpvit
 LpmXQVKB/Y6HXw2h7ZArSo5/so+9ED+PnfA0RNmg8s+OICfOyD+0A10y5A2UtcNEViOe Kg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3arbxsh9us-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 30 Aug 2021 11:34:58 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17UBUBVB065331;
        Mon, 30 Aug 2021 11:34:57 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
        by userp3030.oracle.com with ESMTP id 3arpf264vm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 30 Aug 2021 11:34:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsEPEkCTsGBbItOSpMYMdWR6/FfXNMA1+uiYeyAS0L+lrTCDyW0lsbNdwTzv0a++zDF/ix76eVEODpTnOZHqtraNsngPQX521gJ9rMhHRy7ZgQ5Lo0eGGVPmdPeeWP17uT5VmMCTifsjP6VjTMijIDpxhv3p3HiQX1yffZhkShzQkfTPrVSxEhCDTH7yTh/rkVhm6ce8r9LsSzmu3HPzGbzFuyRNw702+rWQTip5/2VX5AEUOaWO0hVRuNu/6lTSmVmS0OzYd+gxRO7SDkYDf3mZJNumrIeecI1XKCjHu0cWoA1U0Bz5wmnCwacnfa5pT6+H8jnczWgkIcPn8qGNeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LICQ2dVcfB1S0fwAzLE/daQgueOBaXnUubWHbKpcrJw=;
 b=SipnTDNSBLLxMc/H2B3qmlsjGa68kuU7XroQG+gHqx4ymNANEeLiBtLR2RcdLCcswjrA+zZN40TWj1/VHU7Mn3dgDqNi2i3EopG8SOPBijg38bTZ2uibtIbzVbHk+HrwFyghlmYyPG7IgubGpaA87/ooqkSNh8OXfozREcEmN72Jui1/6tlvU2sfLigH+EK5CCNnzVnsuPkuKWkLCKx+MKc8Y8fuVyOPhZnaZGoyStUiq1OzyX97mGla3PiPrNQUbxu9ibv1Ysklz6bfPOXGMsY+13zYEstftxv6Pegem3u/7rgwqNWbqMhkO/o1tM4nlUsvj6UPNFP94OAh1eSh0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LICQ2dVcfB1S0fwAzLE/daQgueOBaXnUubWHbKpcrJw=;
 b=XtcS7cnKfqPfNBgP6EqfX+fty0iWjoQC8EnmnfQn8it6oo/89tCi1jrgpGgWlIsSWS92lh5Pg2qPgjsYMfiKx3rdzYFLkss7L0jd4/wlkgKSWBILMjQoL3x6FUmvyIA7I37uhndDLUTaUGZ0zN8i7Cn6GNG6mZVwKb9esStvRp4=
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4434.namprd10.prod.outlook.com
 (2603:10b6:303:9a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Mon, 30 Aug
 2021 11:34:52 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 11:34:52 +0000
Date:   Mon, 30 Aug 2021 14:34:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Eric Dumazet <eric.dumazet@gmail.com>,
        kernel-janitors@vger.kernel.org
Cc:     lkp@intel.com, kbuild-all@lists.01.org
Subject: Re: [PATCH net 2/2] ipv4: make exception cache less predictible
Message-ID: <202108301057.8FO7SRFu-lkp@intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210829221615.2057201-3-eric.dumazet@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0007.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::19)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (62.8.83.99) by JNXP275CA0007.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend Transport; Mon, 30 Aug 2021 11:34:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b3db19d-82c7-4d47-676c-08d96baa2ef8
X-MS-TrafficTypeDiagnostic: CO1PR10MB4434:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB443473D826CE1E79944DCF5B8ECB9@CO1PR10MB4434.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1IiIH+PFSA2C6VeXpmWD1M9V7drjrY+AeYGt7bug+JARvYVqgoykk+4EIhBIQ8m1UG7UxVT5JIz+AqYSCkeBK0lIWmU0kejkpMKYkbotjN2x9pW/4t/a2F7rQSBNLGYUAfghMfIBKAgvVZL9nFVFCHf3hAuCMooyY1G1bD6xchGT7HlBe1noNWuIAmcKD6CHqVerQ3vK/ZDM4VaMTQ7zLxaUZV1ETAV7Ql9AR89WrbNK0CBRrYDL7YFn1FiVcmcG1taKp7Pzaibu/vyXTuwD7AV4ykZe4EZTb1ZSsf4R3j/1hbO3voU6BrOBWvrOfOUISTGQPWpvolA87Mr+I5fxBn4km4ZAzzYXUgvVXWVElxSgYMOupIXpfNfKk3D7xbDgvPJriopQGpiZBDx721QNhASYvX2BUm0hebxnlxXC+5/ftYYdQ0rKmGTQMP585ZvvTNhyDFZ/nK8hnoKvYb85gEl13Fs98EI1yk16EaLka4F4ndcV0Rw5X3SbSCBHFzYspWafb6YqTbir1zTdLZu7SXAQYRdsRbG3suGXFwZPPEwfYa1ivC8xBPsKbGqo7ZLlx2frBtJUrz2o+fB1rTf46LFoLFRwNnOVwzQpbpTpSBIOt0FErSoqLea5efL2AnQym2HPGckg7ZV7mfbOtgsZ92eT59FQ1m6RnNOs+V1OCsYj81myrDKxnsYOl8RqXzKzB5z7hA6jIaHBwN9LDTYpmGsteCS9bc5QSM29GAfUTLUfnG5rKCJGNCk5yXyello+fjP7KpXgMj9PProbY8HP/GKNP/W5yg5jbH6AeXyoUWx0WHgu/oN9fH04VHg8LJWbS8ZgFiQHLbq7wo0aLeuoPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(44832011)(6666004)(2906002)(6496006)(36756003)(38350700002)(38100700002)(508600001)(9686003)(5660300002)(83380400001)(4326008)(1076003)(26005)(956004)(6486002)(66574015)(316002)(8676002)(8936002)(66556008)(66946007)(186003)(52116002)(66476007)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uLMdT0xvlAp0h4DjT3lvrlWJL94eXt3FGwZymG/DB0BjHGAS6grb8XvjmB?=
 =?iso-8859-1?Q?pS4M1pH6RAAyS9uW5raoY5SQ9/HO9+B8DaiZWB8HVaKYk+zFr17o9cpAS2?=
 =?iso-8859-1?Q?IRubZnpgzalC9VIedGMhaWaG+OyprUZmCvqBE6ehgOhmVaxeLrxHuJoBAI?=
 =?iso-8859-1?Q?7Jyk9K1XKIM55BDJGKTyzXi51AOBpOfv5xTth/tic6duOmKT4rQH7N23P8?=
 =?iso-8859-1?Q?AYFjgWBtpN3g6vDsIOvbP+XoaQBKSCcGrS9/kwCVteMv55ijEejCFkL8wA?=
 =?iso-8859-1?Q?5i0J33wkOEsJYRz9AWTjN4afIZNON0K2kkkZ8UZorh/Z/BdXzab2KZopQB?=
 =?iso-8859-1?Q?m6vN8JA9JMCT0uQGBMTKWD6EEJFLdeKtbwX3BoibQ7bYVBwSIHrgPCUBwX?=
 =?iso-8859-1?Q?WIfRUQIxHd6hM3stfCgtfug425JS5PNBgQswTcveENZi6dAShlD3fKvuNt?=
 =?iso-8859-1?Q?RWsqka1H+L5eIE8VhLK6020gO8+2RA7wJ5QV67+8YMaj0IvRwuShtiqIFC?=
 =?iso-8859-1?Q?woV+Bz5QeUAWj70D1n2/xPOABiDq/NtemSXcHaLqZ4ufO2vmP0+SAi9+LC?=
 =?iso-8859-1?Q?R6BKaDK7S1ZhvwiFPKLgKQfStb3exxPXxaM8kK4fXNmh60j+hu1qvUknUW?=
 =?iso-8859-1?Q?T69RDulOWK11KAoAnN355UGvnlsIlJxtuBtlQFcMCcWGCfscHpQp+Wvp9i?=
 =?iso-8859-1?Q?3RQNkLqiaExw1W6SxQJDuoQ96m3pX385FWKxP/ljoab3rwCRkmU9ktZTlv?=
 =?iso-8859-1?Q?dyopx28vdenVQPfbkYkZ/2exIApiUguNFCY7RQclkAX6yRXuHxNn3822aE?=
 =?iso-8859-1?Q?0V2Gm4/U8Pg9uNSGgHa5nCb6nZfGBmUYt3IHJT2d28hm7NVCwK2Grx6b6h?=
 =?iso-8859-1?Q?Szn6c0DlF24R6W4aXj9ydnnTg+3B1GVHrmqDOGyth3HhrUOMGMxOvuZIt+?=
 =?iso-8859-1?Q?JFEpfbadAlqfiLx6VgdYOVNGz12Oj4I6wj3cIQuXyAVhLofDAFPIBDS93i?=
 =?iso-8859-1?Q?pNPq7GikJrSFEfQOytDTBYM9nsorcrSBMhyT/1/9wPr2pweafAf3N1Inaw?=
 =?iso-8859-1?Q?1/S7w6EJ1pLdxXFLcIE0UyaI5/VuB7CCxbqnKR+nSGxX+Wk2Q/rtaxN18a?=
 =?iso-8859-1?Q?Z+xDBlqJLor0OhFtwBP67BupKQSDBPdt5auO0OaRqjOj4J7vMDMXMJDK5f?=
 =?iso-8859-1?Q?X64Uk1c5nq78zkfxLybIAhIUk1ixmFp9KZ0prkSqajqtyqNpoCLWy9xQGJ?=
 =?iso-8859-1?Q?afDRDEmHaaZgYBoVbJyUnxupMZ0T7M6oxMNxDGO57/WG3OVQOOMryZ17Bo?=
 =?iso-8859-1?Q?KEQSVT64zqdG9z4JgamTGG6eQHiyLZSYQ+30Ea23lJncEJI0OgyvQtHA9I?=
 =?iso-8859-1?Q?CEcSYro77p?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3db19d-82c7-4d47-676c-08d96baa2ef8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 11:34:52.8250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gq2ILpzkR6KhFEKBNWtgnwtgVNK4yztZsG+1AWAm7vBDXoK1AeqxTsWlu2vFW5raYDr17H0N6F7DWmiIgrGARYAb4rpCOTuTQ+z8GPMso7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4434
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10091 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108300083
X-Proofpoint-GUID: a48v1ZcV0Rv6nmqhjFp9OD-Pu23jZ5Y7
X-Proofpoint-ORIG-GUID: a48v1ZcV0Rv6nmqhjFp9OD-Pu23jZ5Y7
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

[ I trimmed the CC list because this is probably a false positive and
  netdev hates static checker warnings.  - dan ]

Hi Eric,

url:    https://github.com/0day-ci/linux/commits/Eric-Dumazet/inet-make-exception-handling-less-predictible/20210830-061726
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 57f780f1c43362b86fd23d20bd940e2468237716
config: x86_64-randconfig-m001-20210829 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/ipv4/route.c:606 fnhe_remove_oldest() error: potentially dereferencing uninitialized 'oldest_p'.

vim +/oldest_p +606 net/ipv4/route.c

adf305d00ec06cb Eric Dumazet    2021-08-29  589  static void fnhe_remove_oldest(struct fnhe_hash_bucket *hash)
4895c771c7f006b David S. Miller 2012-07-17  590  {
adf305d00ec06cb Eric Dumazet    2021-08-29  591  	struct fib_nh_exception __rcu **fnhe_p, **oldest_p;
adf305d00ec06cb Eric Dumazet    2021-08-29  592  	struct fib_nh_exception *fnhe, *oldest = NULL;
4895c771c7f006b David S. Miller 2012-07-17  593  
adf305d00ec06cb Eric Dumazet    2021-08-29  594  	for (fnhe_p = &hash->chain; ; fnhe_p = &fnhe->fnhe_next) {
adf305d00ec06cb Eric Dumazet    2021-08-29  595  		fnhe = rcu_dereference_protected(*fnhe_p,
adf305d00ec06cb Eric Dumazet    2021-08-29  596  						 lockdep_is_held(&fnhe_lock));
adf305d00ec06cb Eric Dumazet    2021-08-29  597  		if (!fnhe)
adf305d00ec06cb Eric Dumazet    2021-08-29  598  			break;

Smatch is complaining that this could break on the first iteration
through the loop...

adf305d00ec06cb Eric Dumazet    2021-08-29  599  		if (!oldest ||
adf305d00ec06cb Eric Dumazet    2021-08-29  600  		    time_before(fnhe->fnhe_stamp, oldest->fnhe_stamp)) {
4895c771c7f006b David S. Miller 2012-07-17  601  			oldest = fnhe;
adf305d00ec06cb Eric Dumazet    2021-08-29  602  			oldest_p = fnhe_p;
adf305d00ec06cb Eric Dumazet    2021-08-29  603  		}
4895c771c7f006b David S. Miller 2012-07-17  604  	}
2ffae99d1fac272 Timo Teräs      2013-06-27  605  	fnhe_flush_routes(oldest);
adf305d00ec06cb Eric Dumazet    2021-08-29 @606  	*oldest_p = oldest->fnhe_next;
adf305d00ec06cb Eric Dumazet    2021-08-29  607  	kfree_rcu(oldest, rcu);
4895c771c7f006b David S. Miller 2012-07-17  608  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

