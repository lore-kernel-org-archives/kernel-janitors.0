Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F02C28D13
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 Aug 2022 10:25:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233729AbiHVKZQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 22 Aug 2022 06:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233315AbiHVKZO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 Aug 2022 06:25:14 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C142CCBD
        for <kernel-janitors@vger.kernel.org>; Mon, 22 Aug 2022 03:25:13 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27MAE4fV030682;
        Mon, 22 Aug 2022 10:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=gVibVtY+KolaOaSVP2rKCovJ90OWoCAImNsFfO1CTGo=;
 b=sLAa4HdZWvTWHbNKJlTVVLWDMjIN65Wju0zzHIFtOWH4xSkBdo4OmPdBuH1mnJq7EK2r
 SMSC0eJKlzkH/3QbkoM+g/hB5LTV06qL9DbxsU9YoYns9l5bzLutIVMwRiKnyUtob/nJ
 L+1elguwmj+BoidzvRMES4tfmQWjRY/L9rUr10gaxggMKYAiRICczDEPfx6kaSmp3YZX
 xrzWfXVOHrKBLB54Y7nUAof+UW8bCmH2g9DxV8QdfF3K98tdYukjyyWcYszPn6cN8D87
 sHb2XmHudaroyxePkvk6EM/BuL/i7jpDysSsnbvWL9hk8OTIZ6AuWtey34Ri83c30qq6 dw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j477782um-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Aug 2022 10:25:12 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 27MAO2qH004214;
        Mon, 22 Aug 2022 10:25:11 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3j3mq1kd2n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Aug 2022 10:25:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6mlqRRj57a7diO7AG31i/vrr9zJNoW0ROBNUq5U7/SwOXTzDgeH1t+7r3g7xBPawhBiqaIlzn/iq7ExKfW78N1eULGJABFhuABcaDzuQf6nZujvA/A1GB/pTEui7XuQI8cKcAQwqSNZsjnBFEjzd1Xzo0vx2JnaHWLHMh4XeEtNcgvp2es2DQhD4jdsfK1Zc7FvEXbtCrJD5ZrlcW3HkHnelGJBP9ZIV/5oPj+qyBGtIPlqjLMDRt5LyjMOQa2pebddWMPhNpEQCxHfBflvvPf3V1M7j9UQ06Mv43z+Vi1zftdYYW35XcLgdzaithap+Acs+cj3BbvzDoHIQfiOyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVibVtY+KolaOaSVP2rKCovJ90OWoCAImNsFfO1CTGo=;
 b=ltxuPn7Rmo7daLFB++kK5VPAZzJ3rrLBsM0v+ia2wP61QCmXSEHvGCrzMC3/KbQpcxZ/V/D0ZV/CHo/gePU2Bma7mLpufKD+hl4jJtQu64FNjKXDottf2r3rxcLuTMMd4+0xAX/I5ukql/pSs3XX4uELSZGlaO6p8DmBeLN6C6IYrrTW9PdIbDVnJ0oPAthsvne1SXVTlrUlsdGcIWd+JTrN598gXGRRgeCY/yEPhE93cqZSHqS1Pwb1fTIdBxJ7fZg/ook0+H01Am0kcXQTnEeHGGXOH2adz9u6V8+n5I70wmhfEk1OWHSTVrZqKJaxpZ/DdmaVJRDdALeZrShOXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVibVtY+KolaOaSVP2rKCovJ90OWoCAImNsFfO1CTGo=;
 b=OtEEI7AKZx4Cnn+eDJWButEPH6YflMb06pRuVoK85AaY5Hdc/D5700PAyau6bf4Y7dAQVQSgOnuYpbHp1fceYPpliuKOhqvFyXNQvn9VXV0TOnKTF+4ABIJSEoPj3+uL4SU3G52YN+LtbqffxOJ725wVn3PNyUzP93Fqq2oocUY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY8PR10MB6441.namprd10.prod.outlook.com
 (2603:10b6:930:63::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Mon, 22 Aug
 2022 10:25:09 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 10:25:09 +0000
Date:   Mon, 22 Aug 2022 13:24:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     linus.walleij@linaro.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] regmap: Support accelerated noinc operations
Message-ID: <YwNZezPFKq9N1/1u@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0034.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81abf368-43e5-47cc-9d01-08da84289719
X-MS-TrafficTypeDiagnostic: CY8PR10MB6441:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X13dp1jSFC6kr7bHbguKzgI8DeYrzlFa+v43JXfT6HuTz1wxPo+EAju9zL8ER7kbM/Bn344ot+TGG3oNt2PkN8nz//Jxr5twlBnfw4OCZrOg0dNIlrOqI9TenLFWf+bGt6/NB7KKfkxRPxXWs49qfsbLoNBxDgZiY3iWb7hIMVp4frgaGAQ8HTVSxtSiLBZZA9G10GhcUNgluyaaWg7TfZ93fV4IvpzMBGDfIUSE1SR755kanwlLz9b3iZo8ajt1Ne/e7f0KcmUUOEfBQ5kMg3oRlYuaVetgp1+/bEq3ZZSvjrugquysIGFsvSnl0W3fc36PTRRIUJp5pG6uNBEEq+qzMtfOLkyeGBOpQT5Q1S/Rx4mwax7DQ5JtMEvahhc2sihfkyer2ortLPwKk2lwOqFABeZSSsqe5mIz5DA2AF4OHIymVywtaysrN5pNgfP9Sr6PR1o8ENPExA7SlmCQG+ADiJJvPDejocq6/TeyhE/I2Y2Nu8plMYpxSvUBcreBbZ+XYzEFy5u5nuUiFbRVp2tc8WTiv9CAYfvaUNRpL/TO+0bgjy6W0Sn3te2uqYwLl14ORN3qEzdbh1zYy4oNeWRzHKTKDY3GkNKqAMhbMAE5LvRgscYihKKVSyNKAQzXrzzvvctD8RnSj3TMaviRDvYoJmapFAAKNzJszVu+llczmk8dUibSzNDTxT9ufx/MRPuBq2f1ilxTknDrBrE8srMByITC7XpLvhfm3TaBFZzZMul5edmZ60mf7+LcVorPDUmeHDmB/3yQ4x2W0lO1ZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(376002)(136003)(346002)(396003)(39860400002)(366004)(66476007)(4326008)(66556008)(8676002)(66946007)(6916009)(38350700002)(38100700002)(86362001)(9686003)(83380400001)(186003)(52116002)(6512007)(26005)(6486002)(6666004)(41300700001)(478600001)(6506007)(33716001)(316002)(2906002)(8936002)(44832011)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7W92ZmYTUZok+vBr4kumaIxx+kWhAjksdX0bW13iAcZdVIa8GTEuLwczjdFS?=
 =?us-ascii?Q?Hwm1qBqDwmSNG5fAqlIJBG/5rBgkUvpHqYMC6ooYZBAYJVEX+oTBF9qOING0?=
 =?us-ascii?Q?4QWSW276hNV8uOEEKr1TOvcQMEpGP2hseF7hPgCOkKix61UVeh7wjT6Zhitr?=
 =?us-ascii?Q?/hn3RqMBcbOlbHtG8RlB8lHTMzOPWrYegxY/q5Z4fcirg1VxETNKzNdWyaNd?=
 =?us-ascii?Q?+BcZpRjpgeybnAf+idtGBzsb3CVw6TwgaulG9Jhdd+Dt0B/LVGLn98l2C43s?=
 =?us-ascii?Q?CMvAhaCYqJrTnGz0t8V+hmgmqQyP7jEnGvP/Xv/AkjkJVGbOBu/0NVeR6tLF?=
 =?us-ascii?Q?MLTHs8ThwWxdFchMRUPaU4V4GCdNOYEm6FybC+0U44L1V9d1Xn4yGg8N/ekY?=
 =?us-ascii?Q?XN7y4B9DT6DXWeQgK73Qb847r2G+CyH+RmbJDNLh6WGT6ApTjByzBuBD6VDX?=
 =?us-ascii?Q?qaUJy20n1/pk7FNCBjtqVmpWUAu7EihtOiliaddd4m9BVSunuOIVMwmr1s+/?=
 =?us-ascii?Q?rf6Hsk2SjeB1zgronsG12JGmu28KrmCMLOyJKJSFdo6bn2kEK4Lp2C8VMXOl?=
 =?us-ascii?Q?vdwm2IyfKe+Skj6uESkKpmPTFefk5mQRxbmc9t1n3itcUtUYbkU/DEOxiXbI?=
 =?us-ascii?Q?FAxRg1qTp70xl6dam7funZ8BcUkNs65wk3Wbv7q2jLa/Ext73ngNG0MqYc+B?=
 =?us-ascii?Q?53YAEh7jQPsFasfGtN5J6R4Vl+EZQ+o4JmhVq60VIsyMXTS5eC/NggZkRvwY?=
 =?us-ascii?Q?5rP/7tJtTILe+IvAy0ha+QjwHO1NlSKbbwK9Hz90GiqClGNc1sRhFjoQg5/6?=
 =?us-ascii?Q?fEU1PmDWdrmV3scDABHhFLqEBLLd+m9aEWDlBp4wdxgy+A1CeeDQKYJ2izFd?=
 =?us-ascii?Q?wpBvOERpD0oNHk9YDPBH7yYOMauBWi4oTtvELiocfR/J/5COs7rW9Ek+9qvH?=
 =?us-ascii?Q?vEJgPFkD6WwwKqC6lJaHYz+wdNWtolkCuDN6YEZcgtcpj4L66zqmRgvyQrti?=
 =?us-ascii?Q?M0Dma7z5nJCKIqoElSpbuBPu974WVqntlTSo7Owh2embIsLhuLGI4b5XJgdC?=
 =?us-ascii?Q?srGg/mmXzExi1KiaHK3TSJhR9zZPhX2IXvoXhZi0zP97u5WnYDa7ohrmimvu?=
 =?us-ascii?Q?OzUIcI3IdrIaj9voKzZYPLCGliKdXxHN/C1ZBQrMb1pjdtS9KcmZ9d2Ts7kl?=
 =?us-ascii?Q?F1K+Bk83y73Vqb1ltGi2QeDQ1ZPq2vYsN1QZEwRqPZxB8Z8z6+pJ1gkkyi71?=
 =?us-ascii?Q?7m8u9Rr+L/iKCdf+LaNUChDC1FAy79gkq3AH0nw4j1wHD3I29/obBL0IHHzT?=
 =?us-ascii?Q?EcYCY9ubYbZxxj6yBSsEP6Ms9OwM/705bxWH5DBubOAxTy5XXLPYly3jmLHe?=
 =?us-ascii?Q?aMZyJjSLRvu+NBUBGzDG3BuDqSm0fkCXr50j63YKLZlVtaV4rtMbYbVbxq9D?=
 =?us-ascii?Q?ZGD+pxzSVtWfbLTLXfCbWx9YIqqAdNMX2iSQccuJF/9DODnPmTJPcIsE/2gk?=
 =?us-ascii?Q?19IXfO/bMvHSaPnoPFPrAPU1UegCAq3w6hatdYFZ6mxZMQtlB9OJN8iJwL35?=
 =?us-ascii?Q?GBxxl7vjzDWLiJpr+6X9mp26U/Ph/nrmVxdNvSpBk7i/gExytbMk2aWYiLzB?=
 =?us-ascii?Q?nA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81abf368-43e5-47cc-9d01-08da84289719
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 10:25:09.7442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nC+nOtZW5hsv3X+x90jXfvHRm0PyZZaky7Ee+7AeWo2znAU/shmrDVlz9OybTFmYmAT1BQGAEq3LgWwtTqTjHCp2X4YX58w1MmM9bWrwhFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6441
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_05,2022-08-22_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=739 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208220044
X-Proofpoint-ORIG-GUID: vqZQj-NN7UvN1Z5lmdlitCMCkxAuQrzv
X-Proofpoint-GUID: vqZQj-NN7UvN1Z5lmdlitCMCkxAuQrzv
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Linus Walleij,

The patch c20cc099b30a: "regmap: Support accelerated noinc
operations" from Aug 16, 2022, leads to the following Smatch static
checker warning:

	drivers/base/regmap/regmap.c:2202 regmap_noinc_readwrite()
	warn: potential pointer math issue ('u16p' is a 16 bit pointer)

drivers/base/regmap/regmap.c
    2132 static int regmap_noinc_readwrite(struct regmap *map, unsigned int reg,
    2133                                   void *val, unsigned int val_len, bool write)
    2134 {
    2135         size_t val_bytes = map->format.val_bytes;
    2136         size_t val_count = val_len / val_bytes;

val_len is bytes.  val_count is elements.

    2137         unsigned int lastval;
    2138         u8 *u8p;
    2139         u16 *u16p;
    2140         u32 *u32p;
    2141 #ifdef CONFIG_64BIT
    2142         u64 *u64p;
    2143 #endif
    2144         int ret;
    2145         int i;
    2146 
    2147         switch (val_bytes) {
    2148         case 1:
    2149                 u8p = val;
    2150                 if (write)
    2151                         lastval = (unsigned int)u8p[val_count - 1];
    2152                 break;
    2153         case 2:
    2154                 u16p = val;
    2155                 if (write)
    2156                         lastval = (unsigned int)u16p[val_count - 1];
    2157                 break;
    2158         case 4:
    2159                 u32p = val;
    2160                 if (write)
    2161                         lastval = (unsigned int)u32p[val_count - 1];
    2162                 break;
    2163 #ifdef CONFIG_64BIT
    2164         case 8:
    2165                 u64p = val;
    2166                 if (write)
    2167                         lastval = (unsigned int)u64p[val_count - 1];
    2168                 break;
    2169 #endif
    2170         default:
    2171                 return -EINVAL;
    2172         }
    2173 
    2174         /*
    2175          * Update the cache with the last value we write, the rest is just
    2176          * gone down in the hardware FIFO. We can't cache FIFOs. This makes
    2177          * sure a single read from the cache will work.
    2178          */
    2179         if (write) {
    2180                 if (!map->cache_bypass && !map->defer_caching) {
    2181                         ret = regcache_write(map, reg, lastval);
    2182                         if (ret != 0)
    2183                                 return ret;
    2184                         if (map->cache_only) {
    2185                                 map->cache_dirty = true;
    2186                                 return 0;
    2187                         }
    2188                 }
    2189                 ret = map->bus->reg_noinc_write(map->bus_context, reg, val, val_count);
    2190         } else {
    2191                 ret = map->bus->reg_noinc_read(map->bus_context, reg, val, val_count);
    2192         }
    2193 
    2194         if (!ret && regmap_should_log(map)) {
    2195                 dev_info(map->dev, "%x %s [", reg, write ? "<=" : "=>");
    2196                 for (i = 0; i < val_len; i++) {
                                         ^^^^^^^
This should be val_count or it will beyond the end of the arrays.

    2197                         switch (val_bytes) {
    2198                         case 1:
    2199                                 pr_cont("%x", u8p[i]);
    2200                                 break;
    2201                         case 2:
--> 2202                                 pr_cont("%x", u16p[i]);
    2203                                 break;
    2204                         case 4:
    2205                                 pr_cont("%x", u32p[i]);
    2206                                 break;
    2207 #ifdef CONFIG_64BIT
    2208                         case 8:
    2209                                 pr_cont("%llx", u64p[i]);
    2210                                 break;
    2211 #endif
    2212                         default:
    2213                                 break;
    2214                         }
    2215                         if (i == (val_len - 1))
                                           ^^^^^^^
val_count as well probably?

    2216                                 pr_cont("]\n");
    2217                         else
    2218                                 pr_cont(",");
    2219                 }
    2220         }
    2221 
    2222         return 0;
    2223 }

regards,
dan carpenter
