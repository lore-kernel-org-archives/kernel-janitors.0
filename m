Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE73C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 13 May 2022 14:06:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbiEMOGQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 13 May 2022 10:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiEMOGP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 May 2022 10:06:15 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 150F92D1E7
        for <kernel-janitors@vger.kernel.org>; Fri, 13 May 2022 07:06:13 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24DDTwn6024470;
        Fri, 13 May 2022 14:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=gLaUs92tEDQn4j87E2y+tpPS9t/sTZhaRCjQYNokBds=;
 b=tRBJ3TnLTmrbKou4BNUMk7wQeDGD5t1uVil0tAM9g0Rsxrup1X4pQug0T1Xf39kPfkdP
 /rcjoI3gnnWKA0NbayX+X8Ze6qljm3vne3KEv4jNqvQEruEzOLEiC4Gi9o2BjDA264nU
 guKI8YoUBkrUNxd73XiY54o6Zdql1YtiFT37P+M1v3OOxsPVY46n6O09JDNGbeIbp/mM
 CJywchZZa5AJKiZKtpQFEDeksJ1ObHyA5jcblK0sAKrCKyKORLmqquhHynUrpu7FcK8e
 uJs/sPKBDlE8VjxZh3idutmoPqkLewreYbg4Q167y/Eoe0pmG0mQkHxVNFRmBMR+Wp98 eA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwfc0yj4j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 13 May 2022 14:06:09 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24DE5Zir019140;
        Fri, 13 May 2022 14:06:07 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3fwf76307h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 13 May 2022 14:06:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjH+19Q7jsOaVvJQA5eSS56SDVeyFcNlIev0gT8GwIVC4HK6R9ondTPW5326ozG7ViVTI6PV7Y88IrLP1qv2BvFJAg8vc3yjyGrUozP+U8e+XDN6X26ht0Xsc8cnalPD5zBUCuPUXrFLTWJd0DOVd0J+OhUfUxZsBXa1HZfNht7++JLALM5l1i10ImmMRDxVaxJUC9w658B9a3kAK/Uv5s69mGe16HuYCRzWFNtbAnqGdIZltBTkD2O6sZM47s1LMXPXG5E5qNslxfn3Mk11yWNEA7ia7VcYWmy3Khc7DshxrrWP/df6pcLME4rzYGMPGMqkVR+0oWjy7a2gUH7zRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLaUs92tEDQn4j87E2y+tpPS9t/sTZhaRCjQYNokBds=;
 b=l7mLHw5Nefz5cYMzs7YXJNs5iPvgSfhgwnt4cKox8ZImvQbd4+uAfC/ugwnduseeT80qlKGyOL2vVraETGd3Cf3wjUQOe7xe44nenXFMz6nPjO0x2KgHBCpzJgxDv+sUvnk6Nb1scRqsOvEsDXQlPIegU0HzQH2m449n8uJntMjYV9TCSCkP7O1kVOwFuKC3xRTfUKypiGN88YTZIiI9cYRGrPGjLjWZ6J5OIwbrvB9G5uKotKJiZLByKvSBditvtvEyUjvOms8s2wJ+RnLN+hor5hu6QtyORqSNUGLnR2LDdLBmKoSmM1GO6rYMluF+K8eOIPmRLD1oGEMSmbNL2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLaUs92tEDQn4j87E2y+tpPS9t/sTZhaRCjQYNokBds=;
 b=THcrH3yCfJUfZ0c0lH2g5jKjxHqLFNraFCMy6QXS/Ng0W8td9xg550jUA0LXWVxxJXspESZGi3A3mKwdvPSL4ytzGddB4pEsmCYXJ1mKfVTEGJXZ/ysCcszOw2vshXCThIrAcMqDNnNwj7MTjodxxG06WY7qrtcPKvEBDocGBTc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1840.namprd10.prod.outlook.com
 (2603:10b6:300:10b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Fri, 13 May
 2022 14:06:06 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5250.013; Fri, 13 May 2022
 14:06:06 +0000
Date:   Fri, 13 May 2022 17:05:49 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Giovanni Gherdovich <ggherdovich@suse.cz>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] x86, sched: Bail out of frequency invariance if
 turbo frequency is unknown
Message-ID: <20220513140549.GF29930@kadam>
References: <YnN3MwU5lPoNXhWU@kili>
 <aed5505a1ae9ec9aab1978ad36c46b1e0acd2aeb.camel@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aed5505a1ae9ec9aab1978ad36c46b1e0acd2aeb.camel@suse.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0058.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::6)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db1b9d11-4611-4000-31a8-08da34e9b8cd
X-MS-TrafficTypeDiagnostic: MWHPR10MB1840:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB18409C2B8BB59D91699620A48ECA9@MWHPR10MB1840.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aNRlWqibH62NjnGY2q7Edr3LSZYGWIhYhsZ85tB+cMMS3u3jhBQnoP5CD+WiRziegbFljdAblhRnnxRHQPAT2RVeb09AEm+X+zhEAUmMeeNj3/G/nfwSj3X/Hbmax1RkBz0IGOofAcyAaGCbEMyClqgrYdiO7ga/uD0Zb3SYGgYJNCVoObVLyyMmf9CYlXtFrPpkGCp7z3z0zyeAovloYMg4RQaBjgRgfhTtMzbKnBBFWJkmdQBcLwccLv06v6zt42UtfObjp4DI+TblwCupy6oJcY5QDo54MXCEuu3NsR4jeRc0yfbhj/eIS3aDZMzQXC4UisMFWfD7Kot2ubTki250vrohRgMXUvZp+gxmZoPrQ7Cq5A5VK9EolRiSwtBv7tU4T3anovQq+WHq5/3dggFALlwjhhYR+trXrUOn49mR8ek4pFokuGEKYeFXK79bm6O0NAhcxRxDp2AFVnxg2CiVixTLOvrRTWvfEJMI7JX+T5f+05UXKZk3S41DMPjg3AZJbm/kNdbVKpoyLAK5S01/EwrRePSa/sZ0E8oiEiTtDOssedk0BBTtKT5Vo1R19j+tnOjouWmIzITN/3wJOcc0mGNwnxFXqajJaw4AzUi+V6Hp4VT6dWFsv4fthX/7h0GeOWeQ/5SbzmkQL/5VlqhWLOT7D5Rind03IFLEHKgn2yhIcWBBRi97gTIbXxgdZ+08GDLOIu+xuWvnEuM15g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(38350700002)(38100700002)(5660300002)(508600001)(86362001)(6486002)(6506007)(8936002)(316002)(66476007)(66556008)(6916009)(66946007)(52116002)(4326008)(8676002)(9686003)(6666004)(33656002)(83380400001)(186003)(33716001)(6512007)(2906002)(44832011)(1076003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tAKH3zpfeS2yylD9x/kEE9RQoOEkSZ1aQroec7wPwm6/7RpGlJ5v3FqdJ9pc?=
 =?us-ascii?Q?SiAMxnnQylbp0jvQ0yQZrcigKk5hcj4a1TABFreh+socB09VkRwWWFje2sOm?=
 =?us-ascii?Q?Zgic6zRBrHeOEgi+5O8/rPp7ijY8p+tz1RyNRW/4cyZKwqR67ikj1fqmp+Ix?=
 =?us-ascii?Q?aIeiLEhmde35ZVadhb//41ByajsBPvYi5OQQMNNKO73nqKxgQv0gb8uNI2vE?=
 =?us-ascii?Q?VVDlVF4Yuz3w+dbvpHvu45kZo/rGqEL2fJzgWvXTbJbA6WuPgc/HA/j9kwaq?=
 =?us-ascii?Q?hNb48o+txVXeeyOZG64khF/1wo+P/ZSVvB1LdlNPT7t0zyr9+qDAmgIQYYTS?=
 =?us-ascii?Q?RiRJKLc3AD37U4vBPPCn/QH1kfiAoxSUu0HmZcJktn1SdWTXQxlIhaoJZoBV?=
 =?us-ascii?Q?WrmKR34wAWWnMWb/5otMCHlVdsUsFmwpOd+x7bpLokpcUfr9seq2xTqBlGFd?=
 =?us-ascii?Q?OOnYxbEQxYaU5VrJlW6SEClccsuY4sIG1Gs5Z+8vOYucXHI+WJiPbMpzCC21?=
 =?us-ascii?Q?6q0DoVTRrLvVc3KOqFPJTNqgSDJWDNebdtm5RLoPzPcbCmvdNM4qILI3jP0r?=
 =?us-ascii?Q?6+1XguhwaVbks1Uk9tITV9aIrYXJEYuCGkXS9GVWCE5F/xMllDkrBUEirefh?=
 =?us-ascii?Q?lF0ao3lAt8JPiBNiFVnMCBkthK73SaS4J/t/T/5vqcDDynD0N/JB7pmBML6Z?=
 =?us-ascii?Q?/lo1tMOFX2rElWCY0SMGxj8s8M+aW4NVjAqDev8T96Z5kXJFqhyaNcw7uKBI?=
 =?us-ascii?Q?ykB+cGHrblLFW9kfhD2i6VSyb2uJBfDCzfzyEVUl/55ejL5d/0Bnq6haHp2/?=
 =?us-ascii?Q?heoR9sIVXb1cNAZCw83SnWt2nSjo0CBkVdZXzI3F5oY9wI1zWRkPL+7Gib5o?=
 =?us-ascii?Q?/mMEwlKxHXOqN8T+dgyhni1eyH1MDb+dp4RDnoB/4u7POpZqcPKTbFrzvRh3?=
 =?us-ascii?Q?rJBqgs8TX1Hm0sg1Y0J2ixon8HxvZf6qVgpuV4El+bUK/uTez33QG4moyVBn?=
 =?us-ascii?Q?6DjEQL0eXdjgYTN8jVldR+lBO6dYVWcBbDe58C1V9+a3f8Q2lLtzpXDACOph?=
 =?us-ascii?Q?WvlIGPfQR245k9zS8zsbilE3wW03FWeQhyVWMvl7Iybqz8jIjzuiKveLg16C?=
 =?us-ascii?Q?VzN9ZXvEm/E0ldjzJ5p7Q3iduqDu70PECvuGibjEp/AIJ6ddQDd7RI+F6uxm?=
 =?us-ascii?Q?Ihu+CLQZ/7HLEe+d1qhZwSTLO+jSS3HQoqkScZ7ZOyuZN2+v2RBE+ChWDOkR?=
 =?us-ascii?Q?Zq5ExWYRYV49TNik0nq+Bfj8Wm1AG1vZexNlXQPfJlRmdHkAtIt0ts5o4hmj?=
 =?us-ascii?Q?atkx8FDDuWijMPKYC1e0GhTr1cqAAbfBbhlDqG3vgF1aMNPucMaeezMAS9x0?=
 =?us-ascii?Q?/Jueg6pw9+kxuc4Fy79oVY1jGEIvsff6AxMpra4MdKvUlIaFUTDyb42PNH2H?=
 =?us-ascii?Q?VAi/u33jsDLel3D5Z80Z3nUK6pxvrQ1gphqML3N4wx4mXeL2CLSBsRlB9gtb?=
 =?us-ascii?Q?gzcEXkoLP7iaC/P1WLAzdgLoztHnvVQ3q+EDxzBAGI2+ifL97C5sDxYf9wUY?=
 =?us-ascii?Q?oUOiUxP7fUNOO9UjwlcI1m8SoBI7EOe7bPEypeNOJ7T6crbDWUyB53cIlj8X?=
 =?us-ascii?Q?h0p+/tfRmWWfQ1uLEXM5yskP5hz5ncF/prkhassPAdQPjoG/xMUkH43qdsY9?=
 =?us-ascii?Q?8iw8jzNNPs0kWn6hujW4hW61PDyov0u/hd1hd9goneJxSJrKuqYCK5F/NBPx?=
 =?us-ascii?Q?cCTmIyAq5VMGN28e29cLm7L+mRxXepM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db1b9d11-4611-4000-31a8-08da34e9b8cd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 14:06:06.0857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gqv3scXYXOY23ijTDMJlziVxhzrfqrVPlsFEYeQz5EpTxsDMeuxL+3ESgZFSbnNYe01NY2tsAhok7pIOchPuXrgZvnR78IA07HHJ25r5E5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1840
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-05-13_04:2022-05-13,2022-05-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205130061
X-Proofpoint-ORIG-GUID: ET_MfANGCR22hj0DLnuNGNlrSchSLswh
X-Proofpoint-GUID: ET_MfANGCR22hj0DLnuNGNlrSchSLswh
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 13, 2022 at 03:17:24PM +0200, Giovanni Gherdovich wrote:
> On Thu, 2022-05-05 at 10:05 +0300, Dan Carpenter wrote:
> > Hello Giovanni Gherdovich,
> > 
> > The patch 51beea8862a3: "x86, sched: Bail out of frequency invariance
> > if turbo frequency is unknown" from May 31, 2020, leads to the
> > following Smatch static checker warning:
> > 
> > 	arch/x86/kernel/cpu/aperfmperf.c:274 intel_set_max_freq_ratio()
> > 	error: uninitialized symbol 'turbo_freq'.
> > 
> > arch/x86/kernel/cpu/aperfmperf.c
> >     242 static bool __init intel_set_max_freq_ratio(void)
> >     243 {
> >     244         u64 base_freq, turbo_freq;
> >     245         u64 turbo_ratio;
> >     246 
> >     247         if (slv_set_max_freq_ratio(&base_freq, &turbo_freq))
> >                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > 
> > Imagine this fails.
> > 
> >     248                 goto out;
> 
> I think this is a false positive of the static checker; I'll send the patch
> to initialize the variables anyway as it looks better.
> 
> When slv_set_max_freq_ratio() fails, it returns false, and we move on to the
> next "if" statement. "goto out" is executed only if slv_set_max_freq_ratio()
> succeeds (returns true), and writes data in its input parameters.
> 
> I give you that the code looks wrong, because apparently when people (and
> static analyzers) read that, they think "if (problem) goto error;" but this
> function is written like "if (it_works) goto the_end;".

I read this wrong.  But looking at it closer, I think the static analyzer is
actually correct (definitely correct-ish for sure).  Smatch is complaining about
knl_set_max_freq_ratio().

   149  static bool __init knl_set_max_freq_ratio(u64 *base_freq, u64 *turbo_freq,
   150                                            int num_delta_fratio)
   151  {
   152          int fratio, delta_fratio, found;
   153          int err, i;
   154          u64 msr;
   155  
   156          err = rdmsrl_safe(MSR_PLATFORM_INFO, base_freq);
   157          if (err)
   158                  return false;
   159  
   160          *base_freq = (*base_freq >> 8) & 0xFF;      /* max P state */
   161  
   162          err = rdmsrl_safe(MSR_TURBO_RATIO_LIMIT, &msr);
   163          if (err)
   164                  return false;
   165  
   166          fratio = (msr >> 8) & 0xFF;
   167          i = 16;
   168          found = 0;
   169          do {
   170                  if (found >= num_delta_fratio) {
   171                          *turbo_freq = fratio;
   172                          return true;
   173                  }
   174  
   175                  delta_fratio = (msr >> (i + 5)) & 0x7;
   176  
   177                  if (delta_fratio) {
   178                          found += 1;
   179                          fratio -= delta_fratio;
   180                  }
   181  
   182                  i += 8;
   183          } while (i < 64);
   184  
   185          return true;

If we reach this "return true" then turbo_freq is not set.  This may not be
reachable in real life.  Should it be return false?

   186  }

regards,
dan carpenter
