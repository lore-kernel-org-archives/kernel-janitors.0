Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75EA4C001B0
	for <kernel-janitors@archiver.kernel.org>; Mon,  3 Jul 2023 18:59:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbjGCS7N (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 3 Jul 2023 14:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbjGCS7M (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Jul 2023 14:59:12 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA5110F0
        for <kernel-janitors@vger.kernel.org>; Mon,  3 Jul 2023 11:59:00 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 363G8Mvn011438;
        Mon, 3 Jul 2023 18:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-03-30;
 bh=3/fLApnNzBX0/dwcoaWnbNjOJYigtUCKajBCKXLV4f8=;
 b=KtQXaDn4g26KuVbsf03vbEcQJyXYqSjb3CdaxMQf5j0ztFpzSnSkFba/SSr4iWBZ6XUY
 tRtgBbMR+e6mvYxXNSN9zzvlywpNirApv5ZNE4ZvZ7T3N5IC3OnqVpxjt0xcVj/LYkUc
 6qWazEgHUfWfkpXrmo3WPdCZw9Yegcuv+OOJ8T7q9Vnwizichk3PVKiKhKiiBLAFGGox
 ICJKW7HBeBjFpj3GvZkChQKQJFjG4Y0jOQGDdis44jHJ+ru6XKQUgcKu3JzdzhJFg2QS
 0ueM/BsWjvD9//vnSfCrutRzaYaKtxTiE7LqNuNZUytR93VM0NH7HedzYApirheb0N7n 4A== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rjcpub6vc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 03 Jul 2023 18:58:49 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 363H54E7040656;
        Mon, 3 Jul 2023 18:58:47 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak9emyg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 03 Jul 2023 18:58:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKeDcHyhA1lHStBZ6qr9e/RjvUviRkEs13a1pHoSbcU/7WDUbLFeldXafiw2OAQxBqg8k2rHjxVeTm0dFeN7QATB5ZNJayjqsutggP1VeZ0RMoe4Ud52/CsZ0paLPpnfveD6Lt3+rYj1xUc2Qd24wWU01bM8cb5EsTgCieo71zSIRzeKy1h2o0K+tzEyVJQC6LIsYnFd+LPXoqtt3HDth56sGuW52dkaq9c+fydO6W9Z8pjp9M0DR/cjpLZsPYZllyrbpTsNal+jGj4V4GCC6PZwFrUfn7gCYphjf9M8yCiVmVLgngmkcsSE6IH9JfoPVw9IhtXQPPHgs21n2I6pHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/fLApnNzBX0/dwcoaWnbNjOJYigtUCKajBCKXLV4f8=;
 b=V167A2ZOMIolzFQTs1EwwJr1vTB6nQ/F/hYhwichLRPw6+2p0S/f1k6MDUaqJ1mFAuxqvjBS5rowM+4sUNY1XB1pgzCng0AMVNkzFrKhAk/CXwggRqJtHD4BC3g9L9Mi5mNDiR1KtOSSJdULChLbznW2A+Ki7/njK+iikfudhO0d2hmCo/l+rkNmwqQpopGsiYs63Q0h+goK4HxoFNxD6woFiayH4keGsrR0kBp0ogrmbqu0k/U7ThhET/qJSyMlLQgmdN3n4ymRJ8eGP+13lcPMddtdWVoTBIaw12Wxx2JML07YunM+0NVCmUmR1adXgUG3fSbIMZaEPayDp87Kng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/fLApnNzBX0/dwcoaWnbNjOJYigtUCKajBCKXLV4f8=;
 b=hPRcR1r/vTN4erPdQzQCObyBs+Qqq6Sg0NRDYT9GdW49kFD7ACA74Gi+xeVA6pLuilPBMEBVWEIYKF/LQnxqlFrK338nVrMTotMX0tFplBVdxnELcOAuVehldrRNWQoTwqs7PpK8ZYJuFhU2R2Tc3fVVbGw5q3J9CxM9qRWIHlI=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by DM3PR10MB7947.namprd10.prod.outlook.com (2603:10b6:0:40::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Mon, 3 Jul
 2023 18:58:45 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::4a17:13b0:2876:97f2]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::4a17:13b0:2876:97f2%7]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 18:58:45 +0000
Date:   Mon, 3 Jul 2023 11:58:43 -0700
From:   Mike Kravetz <mike.kravetz@oracle.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        linux-mm@kvack.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm/hugetlb: fix hugetlbfs_pagecache_present()
Message-ID: <20230703185843.GC4378@monkey>
References: <efa86091-6a2c-4064-8f55-9b44e1313015@moroto.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efa86091-6a2c-4064-8f55-9b44e1313015@moroto.mountain>
X-ClientProxiedBy: MW4PR04CA0317.namprd04.prod.outlook.com
 (2603:10b6:303:82::22) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:EE_|DM3PR10MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: 09437412-6264-4bfb-3bdb-08db7bf78721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0/eK6w2XJBvdOEEvpiNM/0Z4/sF465aHE9Fq5YWuxa/mTMRsH50ANSHzfy7TLqy6UefpSTyx2b+7RSakPnGkYTacc1pZDuGxHUNId00MAggb72nAnr4DMp65cRKxuNP0AQSwXztilAbv8m+pbhqh5wk5shVEBQ0xigIVmC5IsrkYvtEKvjitvmW/LaQVtNMcbMuKSk9Wqn2Dz3xiXgXF3TEW+HyqCAkETihKQKY6dBRzx+FpbMCBNwVPsBZHHe5SzYNGcDDyemyth0kPD7l/Vz6ZRy9ES1fO0H7Y815KVJibeSPflhMZwJpcMUxf/A9GhLzkD9RAquNwQcYPBy8z/Abv/ff/pYKLx1uw7wtorNk06DM8rP2vdPIqdT+guoQ4QXxmafJfzyAPI7KZVST+YywOggIjJwMn3ERtwLyz8p71tSQKWx1EYP15nzWfSh/3lBdkigig2LXRWOnw8jQ0FTVwXQi4W9pSQK/J/x/OzRusn87NZ3/4upaPwjFiuE6m+gW3kuNEzgGQOonGOpT89HNJ06vtl5qo8m/AHJ7dpXB9VpRq0D0u9M/9jkxR6WTZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199021)(478600001)(54906003)(5660300002)(8936002)(8676002)(2906002)(33716001)(86362001)(33656002)(44832011)(38100700002)(66476007)(4326008)(66946007)(66556008)(6916009)(316002)(41300700001)(83380400001)(53546011)(26005)(9686003)(1076003)(6506007)(186003)(6486002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+E/uC2S+KN5YHiQGZP22HbBgm9dn989opLQAasjF5lK4PM7f8qrf/6q1k5ef?=
 =?us-ascii?Q?yH7svdGT1wyLso+d7CAOlC/e0CnWTzRQqz5pxZyGplGz0qOV3edgDLFykEY2?=
 =?us-ascii?Q?wrIjRiCEIovISnS/17yMygO44bqqkCZL7rCiNMn48WRTlCjaXyk+lbciD3Lr?=
 =?us-ascii?Q?O6kRvK9ubcKIxKXNbLCXIZbUl5eXI7kl8kGcXoozTk/aEKjdV8qkW4r2MWzt?=
 =?us-ascii?Q?uqugKX7xwmBmQ7KhQkEVumIF/Slp+qliUql3lDxPTTMF0SzQcibj92tGv9Rm?=
 =?us-ascii?Q?W70JOa939Gc/waZ+AADrIfKyeNgrXe6Vu3LpkC3cBqZNpW6tN6WBg3z90Y0d?=
 =?us-ascii?Q?lzuR824pYuMWJvqP2XdqOrw7ar3eK/3SoUBOMiv5yuaZLGPQM21Rpnm1alVO?=
 =?us-ascii?Q?89Wnc1CBL/Uai7k3C8aY56PJU6qFQbgZ4DfU/8HtRmMR+nECx3l/rp4cln2T?=
 =?us-ascii?Q?u1rnOAZR+7McioXf2YVKxByo38v8sx2ktmOnBzAI9fbxAM/PnG/Gjv3kW6hc?=
 =?us-ascii?Q?8qPPs9TdszmqO6BsOzSk7EDrbNnP2kEMj3lU0CqSsdTIyxDwoKnAni41pcMQ?=
 =?us-ascii?Q?fjAuRt9SXDlqt8gpbscy6V9MLhCWl/wLUSYu8xXnMVALfKHANrsb4cFtj5Lc?=
 =?us-ascii?Q?EmUaYkfFrgxfcbl1C6OkFIgZnPuLRuoBFErlT1RjC+I08BtMNxqMWR4K1HVz?=
 =?us-ascii?Q?oKgeQIdnvkIFL9lc3dtEJgJJUjDH6f5/VF0GDPXJ+EU9S1bEwlINYj7/sXYi?=
 =?us-ascii?Q?ryYPdmOMGfpDS761hBm1H/LGxyaY7FT1DTaRmjpEUP9OaF/m9YZAOlCv0cXx?=
 =?us-ascii?Q?S0wYGDOUYobH1kDGAhXJkU/4ZXYZmnO8SQKbRlBApjJTYHexzcBmOTuGvrMm?=
 =?us-ascii?Q?kIJ9GCCa/mGCyfyvxvDONBB3/yV0fA3ZygHq0aXtTSVD5ioYoYZcmO6M25YA?=
 =?us-ascii?Q?PUGD6hoEiSLaaTtTI/+Pu/jwwIyJPY/fTZBHFKTcvSgZ6JTdp4fYsbsDVL5Q?=
 =?us-ascii?Q?IL2Bv1gMNEG2lA8S4DpZVeSIqOV7iuCeLRo6pbMoTbSAgrYRQ8P8cTySF8tu?=
 =?us-ascii?Q?iNXCw7lJX2Q56SzQb49SO5pea/c36PvIz+va87C0eLVomDWwlUNRmvEKJDye?=
 =?us-ascii?Q?pWmWnCXYStnw7+nn9M3kzTLM2NnIP2l60URdT25tXr6LouJp6EosTpxla87/?=
 =?us-ascii?Q?ELfpRsCOKD8LB0MLWZDbGJ4tTQbAgJ4vhZz52IZUHo1iLhR4Ov3NPgh++CA4?=
 =?us-ascii?Q?FtTD0IeoM+HZKeRROfZMWoDomC1ER5qld+Fj3G4iXkH1SpVhKM8c+ymcXx4k?=
 =?us-ascii?Q?BPGaVYzf2fANvhtzyagxgmdrPlacY/eJC+qbeNGhBVrMs8mQ5tdyHJBrKKEf?=
 =?us-ascii?Q?Ozlawbn0YlLw+gPhXAchEoeC/moyl6yJOG4nhTtOi7wR2IysZxJ3r4U2IqIc?=
 =?us-ascii?Q?OoimXs+ngMwpohczuAe/AHOPexO3SUAwvhQyq7qgLP1KesGvt0PAEshm9tMQ?=
 =?us-ascii?Q?T416HRLWbAsxm0HeJGqSIcJsUCIGXR9neoeTkizbgL23avz4QNJ3GlnrmKke?=
 =?us-ascii?Q?rgrxZytEJos3087dKyIbl7RcQP9B0nf2eTEwvZsp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 3ICw2WIJPD6EjWtut21ziDPWYQrTi9MmLRFypIOGpaXwb5HoicbX0928DlJte8SYilYvN9vaO9SrTXPbhpNdl+lgJZnbwm3A6638ki9VYKiD3v4etHcZru6LAasrShydKRvi0hDEilGprVS7WwMxBPdmtrhwPlSXKj9xLFwGGsU3NlprWDrPZqjL1REBlhfYfVnBujuKWQVbyfYzTaBOxYNqy50KpalEwl5SEDHVH/Iu3mQzxzwNY4Dc5M/UHA0QYklsI2pdZaw0+iQgMPR066R+FpW/ywSpTA5CY4z0wLO8sfauPGLZ8ChkzC1HDhfFpx1gYZbdaq6hFokRyoAeQGGRMKJKmAIyZ/MZD1xQG8LvkQ/elM2yYxSiNynzh7yFgXg4KPJPXqnXkw5h0XJneB8nVrc4omeE2X+s77nYbB77vjZfrQmzJrTY1dx/LpS8pH4Mzxu/Ci0q1gfesdREs8dbRDhcH0vZoWzkJXzk/YiycCHM89mZ8DKzeaMyX3dsiEdDb8+2tgxlI9U2Z9q1qq1ZPebbYypYDWBBKjFwOfudmGfGLeOJk12ykRYBv9Tu4di1k9bzPZMbeBD+lzUJi0QZyrFcnkOs9LxFSaQAHX0O39o6jPGvhiKr646a5PNBx6Vgqf/FIdGWrtN1Kd+qs78/OFrujnoVU3F+Rf6zns+dYnXLxtS87zSFHaE/25b4EbDUu/9AGLiLworTnQg80+vuHkqYYe/WW9EC0duAPgZBR7mhMswgbA06ijU6poziSdbKjhIXxxwMXY581vT68BpKMcIqVo21A3Apf42E3u6BHT7ofXNr4r1jiFGCL2OpXF/GjXyYIEXLq+Hkx6lrGGVaRLrGCmajYZQeA/9pwDNK9zwHFud7BL01pKV9Fxf4fS9aBMGwi367CVlJXKDSbw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09437412-6264-4bfb-3bdb-08db7bf78721
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 18:58:45.8598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZpINCmOJzOcaDAqad654xDJ3LyRdH8YubqWFEN/J9083VOAl0PVhZ/Ata7LNi/k/VK0ZzxLjiadBJRkATJatw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7947
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-03_14,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307030172
X-Proofpoint-ORIG-GUID: Vr1UoYxb_gLgXwxlcECo69oUnBYu7lAj
X-Proofpoint-GUID: Vr1UoYxb_gLgXwxlcECo69oUnBYu7lAj
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 06/23/23 09:26, Dan Carpenter wrote:
> The filemap_get_folio() function doesn't returns NULL, it returns error
> pointers.  So the "return folio != NULL;" statement means
> hugetlbfs_pagecache_present() always returns true.
> 
> Fixes: 267d6792f43b ("hugetlb: revert use of page_cache_next_miss()")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  mm/hugetlb.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index cb9077b96b43..bce28cca73a1 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5731,9 +5731,10 @@ static bool hugetlbfs_pagecache_present(struct hstate *h,
>  	struct folio *folio;
>  
>  	folio = filemap_get_folio(mapping, idx);
> -	if (!IS_ERR(folio))
> -		folio_put(folio);
> -	return folio != NULL;
> +	if (IS_ERR(folio))
> +		return false;
> +	folio_put(folio);
> +	return true;
>  }

Thank you Dan!

I noted the changed behavior of filemap_get_folio in the commit message
and still missed that comparison to NULL. :(

-- 
Mike Kravetz

>  
>  int hugetlb_add_to_page_cache(struct folio *folio, struct address_space *mapping,
> -- 
> 2.39.2
> 
