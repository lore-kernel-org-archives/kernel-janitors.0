Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D483CC433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 16 Mar 2022 11:16:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348129AbiCPLRT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 16 Mar 2022 07:17:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236899AbiCPLRS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 16 Mar 2022 07:17:18 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0244E54BD6
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Mar 2022 04:16:04 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22GB34Hl018881;
        Wed, 16 Mar 2022 11:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=JMo4Buvcb8HTLIE4P9UiMH9Tiah/mFk2mN1boiI/L80=;
 b=hsw0CjoLcZKgsycH9p4B9+1iHMR7gEw5RPIg4VR1ocLXa1F601jhlPojBeSAQ02n3GCc
 aoomkK3Y5SvkL4KGXK0XPVEkqUe9fleH0sxzmKBgLaj+FTXjOwBA6hU4B6tbU3tJGOLK
 o+hrxocho0MRwIcdfxqY3itgDOWB4jgipH5vw6mNH3rnKY7yt1YPXWBz+96EEng/umkP
 J/QDKBzIlF/E6fFmmvWD9DEs1HHC7pu5EQ1ETIK/Ac6GSJkivS1TMxyA5OAVia3z/SgO
 IRusSdNYGmEbCIOCysaIlSQHlNtyv67XlFO59gFmctZuNfuE/zNzwzgD1+oneV3yNAt6 Rw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3et60rntmr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 16 Mar 2022 11:16:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22GBG2Nn118853;
        Wed, 16 Mar 2022 11:16:02 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
        by aserp3020.oracle.com with ESMTP id 3et64kkmxy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 16 Mar 2022 11:16:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3vktRj05aQmHvoUs8d1qrNDgWTBVqT5UBjYp5gfmBHGqZJqacc3LaLPwv2lHhndPIN7jQ8wSc27vaYJBtPMMyEFXUXFG7s5Ia430wCtt+2KHE660vg0arr5amSvJjjY0VBDMKi90nXbOM+qyGokx6tQPuo98qI+fZy9BUqbNwQU3O+iipp0zb62P8Oz100sgSlFPFOJjd6I2brJ5KzQ/UavGl6pEVy7zXYF17iV6kqmztjdeW7LJrjfbK0PTTogxdGcdiSnlVS0YPssdbt+PGutSsGCqGc1y5XjkjS3Ll4lGBObF8rInxRNOXJSvNUtCAH1xbc/tWqskeuxY1f89Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMo4Buvcb8HTLIE4P9UiMH9Tiah/mFk2mN1boiI/L80=;
 b=RJRdgRXbX8DQFI6SLtFUdADp/b6Ykkt+eXvmI3wdkHZLoOHYDm7Q2qZvy6PgxZBu1v1vlVDlKfqY7NU1vkPnEvqs5mzoPKxobihmABKTfnj7EGlnzIyLQV42DiToOqXVH3tMDAq6qZQjTZ7PToPAjavCqltFwoOfi+jQzObNHCWM2/1nd3YBv5hKoLRW8cfl00OJfSmSQC+T5A8GKRyOSrz3XnT9t9myluHXl/YrU/KMaS6te2C76XvdMisl/+IwzJEPw2PgCJZvo6IjX96ybAdl/ugtNq4X9aMcgQ4FzpVvnIvfbQ3EkLa/pF0b4yWVp0AZ6Tqb9mMIj6NJ0jn0cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMo4Buvcb8HTLIE4P9UiMH9Tiah/mFk2mN1boiI/L80=;
 b=MzlBO+1FmKsyDWlXOH5yNrCNF0b2Tkz74cVmPj96rTvUpoESUDYCaBte3P3pM1iQC+vKa5U2sVc9sOroRqanO5SGeCVYumwoowjHrJiGyRU+p1lgl0rZ3n3urFDc9ykCidMXXw0WEKr291k1ZqoidV0mZRFWWyLh2B3Z+0pl3VA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB3435.namprd10.prod.outlook.com
 (2603:10b6:5:69::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Wed, 16 Mar
 2022 11:15:57 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 11:15:57 +0000
Date:   Wed, 16 Mar 2022 14:15:46 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     jonathan.lemon@gmail.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] ptp: ocp: Add debugfs entry for timecard
Message-ID: <20220316111546.GA4687@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0197.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::8) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35481606-6664-4afb-320f-08da073e57c6
X-MS-TrafficTypeDiagnostic: DM6PR10MB3435:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB343568543C1A9FEC95DC77848E119@DM6PR10MB3435.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H7qG7wo8+3S13hv8PCMdrk50f+oAIrBuvuU4uw7b+jPig4514hZhBjGpXHM6f+DQ6A4zzSHsq68iK7baBYb4OL/1QTlwbglOeAc/WHtHbsYGfGMyho+354YchzUqDYcDioMEuzoqFqXNxcwuSmqs4u6bXKc062FK2Ed6OAi0Hc6Nb4xo2RNID4tGYek3HkQQwrfDAMCaPYjohvnAIzUowgrPNhKVBw3c/Mp2WwOzWYZUTnB34nfF0zFf9k3XawKDqVWCEFBySapGWlvjRohmjDLGWJC13GwD8UQzlYLBLyCXTjlh7hGto6dBQ07N7krTdyqkb0MT5DISkUmug3haVqXJ1iD4fFNoB1b0Bahg2XnXD1IuY6sXVdyDWMeZZ7rpmbWTBbcECkbEvfrSRiss/8+pV4a6EOXY6+p8x0563SGghRR71J6JXViff8h57pCUOaOXug0GjIoolBsbonq1Vd7D3wd28wPVlR+3JEgUbwohxo82/WvOiExlZ1xCn68chMayHn1boWtj+QxEMLEWG0pXmv4V8dle6GRKOX5Wl5xtjrKy32b6wjuhW+pSUL+t6Q85nBNMQxoZ/yDuP/ESBH/54qabOCyyOBFsMTHpCt5vfPZbklzy7A4/Ivcvb9s5WxMrjbGMfA66SPBAMjgNPg807IkKYbgbPeq8oGzCsxArskHvMF7HScEpjnRtTuQ7j9YCCnOwtAWA+0iUAUJbzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(6666004)(9686003)(6506007)(508600001)(83380400001)(52116002)(6512007)(6486002)(33716001)(38100700002)(38350700002)(316002)(1076003)(44832011)(33656002)(2906002)(6916009)(186003)(5660300002)(26005)(4326008)(8676002)(8936002)(86362001)(66946007)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nynRUul0Lr/tDyI4HMszKVQBgqwNiBQTqie96huLi3V+B0cOiM/WTZ7rgxwI?=
 =?us-ascii?Q?6ohFpytmzlJXwTBJGwlfcpzTt8REWSSBA94IzcOO/7mbaX5jZYMcLL23ymoT?=
 =?us-ascii?Q?5qZic86THCGbTYsCueltdg/2WS53VCTcX8zYJMJb/Pzxtfs883UkovkRbaGQ?=
 =?us-ascii?Q?MlgwYzsYRc59FqqZfvTDRIpcOAgRZdD3+kOD/zMzrA5HhdMsBn6g0l/hgTlE?=
 =?us-ascii?Q?fXz2KozTOrAazEAKUrX1eJGdcV/wZqTiGayBLbduzIadaWKOdqjsl6knSJ4h?=
 =?us-ascii?Q?goEy+7u/QQIOR0JbxzEYNAx/Axn0oDF15ogZ5IO/EhunTaCgRgX8YKvbt7Mb?=
 =?us-ascii?Q?WhbRzjhM9WmWFSG+01ie3858KkTlYb/gv3H+eFJ9ZzHw99mUn/ECenNC6tMj?=
 =?us-ascii?Q?3r0Ujbds5Y4TtLPQDRKoTLZiBWnrjUAz+ia2kfEFxTVEq0Jq0jqsA2eotoBA?=
 =?us-ascii?Q?jpwUgIx2P2NWHfc+4NrfoX2E8Ac5g1NdRx9eXzHnbeERJM9xjAafTIlXHcdF?=
 =?us-ascii?Q?ZsnPmyGNDvpv6PnbqZYqJkfSt2BBUO/XRqP7bFWO2sxUFz1S0HtYyt7uBbJm?=
 =?us-ascii?Q?XcjbAP+QCh3OAvaOt3mCM0stq317sfkD225bVwGiI5n4ALTr3GxKPBjjs5Fg?=
 =?us-ascii?Q?zVB6EmA82JXlEVBvMUfDnWvP/jA21RcruqsEUv3JOzVcxaVB2Y+nTdv+ffug?=
 =?us-ascii?Q?NpZhg8F2QLY9Ax4KmFvtuRogDAVMoxL2EaJJMlSPlHg5ZH3wxocA8iqixoja?=
 =?us-ascii?Q?6v860UIVPNWcgu71cjOkElOC8MPi0EeNtR0MpEmSO7YVHWC250tcUdW8N5LB?=
 =?us-ascii?Q?2L+Gbx9B7Gbm1QBsuoaIdRwXQYn0nZQ4geieZHqUXIVMdoohXDrhBMqlyEIu?=
 =?us-ascii?Q?pFYz63qiCw28NscAQYmIg8r6yismYfCY0LO7IVjPAQRL8I4NAja1Cr0K4nMa?=
 =?us-ascii?Q?N7tmI7YF/AGweXLgQ/ZQGdC0YyXoXFdRWephjv6KN/Wc+0sHTFqDnUAKvVTo?=
 =?us-ascii?Q?sP2v67e5pdHUPkEPRNhzTLaOYhiTmgE73sdnyAc7g79dfr+6LyPUl2DMVzpe?=
 =?us-ascii?Q?JWtKbI6AvbhETrA+UnA6Nlyr2fDD5Kz7XhlgDOybDnDUjc1CRvfRfE3QBwXu?=
 =?us-ascii?Q?1QK2n66uOSbI7SCSK8OjJDpRDldOtCO7fYoD8CyD03tdvCzHJM6I6veYtVbs?=
 =?us-ascii?Q?Y1xXleVSVhIS5oL64FE8BNXqKSy5jhmuQU/zh+X8aV0FMYriTl0P5mNkhZ29?=
 =?us-ascii?Q?McaRQmSuAGdSxTsKgiB2Q9YPr7G3N7FBgKu6OnfGoEU6amMfp8Rq5B4umNuG?=
 =?us-ascii?Q?LSRbNGm+TUTierFJ2bWn2vz+97ZZ3hCsOvJG1QCCav0WEii6jO7Ho4NUx/sl?=
 =?us-ascii?Q?2sMEhEv7mQ58rdvfyJ07iXsbTZR/z4oEwobCzpOG+kE6Y76bMPoBadOIcATu?=
 =?us-ascii?Q?uZMDKgOVzam3IniWT+J25x4CvSVtN5cg36adYusTRXoPP4agngKSUQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35481606-6664-4afb-320f-08da073e57c6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 11:15:57.0351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ch75iwQ4P6I4HbwY3+RwfsxLzci5ctFTszkegFx13BGI87ltfBlWa7SWakPLGxK6KPcPz1rMHzRcPOv8Ndl1WZpFlTTdX7Dwe/7KI1uqqm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3435
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10287 signatures=693139
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203160070
X-Proofpoint-ORIG-GUID: PN1wjvprOlkIFQMNA7M-TpsrW58XSZtu
X-Proofpoint-GUID: PN1wjvprOlkIFQMNA7M-TpsrW58XSZtu
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Jonathan Lemon,

The patch f67bf662d2cf: "ptp: ocp: Add debugfs entry for timecard"
from Sep 14, 2021, leads to the following Smatch static checker
warning:

	drivers/ptp/ptp_ocp.c:3102 ptp_ocp_summary_show()
	warn: right shifting more than type allows 16 vs 16

drivers/ptp/ptp_ocp.c
    2969 static int
    2970 ptp_ocp_summary_show(struct seq_file *s, void *data)
    2971 {
    2972         struct device *dev = s->private;
    2973         struct ptp_system_timestamp sts;
    2974         u16 sma_val[4][2], ctrl, val;
                                    ^^^^
This "ctrl" variable should probably be a u32.

    2975         struct ts_reg __iomem *ts_reg;
    2976         struct timespec64 ts;
    2977         struct ptp_ocp *bp;
    2978         char *src, *buf;
    2979         bool on, map;
    2980         int i;
    2981 
    2982         buf = (char *)__get_free_page(GFP_KERNEL);
    2983         if (!buf)
    2984                 return -ENOMEM;
    2985 

[ snip ]

    3087 
    3088         if (bp->fw_cap & OCP_CAP_SIGNAL)
    3089                 for (i = 0; i < 4; i++)
    3090                         _signal_summary_show(s, bp, i);
    3091 
    3092         if (bp->fw_cap & OCP_CAP_FREQ)
    3093                 for (i = 0; i < 4; i++)
    3094                         _frequency_summary_show(s, i, bp->freq_in[i]);
    3095 
    3096         if (bp->irig_out) {
    3097                 ctrl = ioread32(&bp->irig_out->ctrl);

reads a u32

    3098                 on = ctrl & IRIG_M_CTRL_ENABLE;
    3099                 val = ioread32(&bp->irig_out->status);
    3100                 gpio_output_map(buf, bp, sma_val, 4);
    3101                 seq_printf(s, "%7s: %s, error: %d, mode %d, out: %s\n", "IRIG",
--> 3102                            on ? " ON" : "OFF", val, (ctrl >> 16), buf);
                                                              ^^^^^^^^^^
shifts to zero

    3103         }
    3104 
    3105         if (bp->irig_in) {
    3106                 on = ioread32(&bp->irig_in->ctrl) & IRIG_S_CTRL_ENABLE;
    3107                 val = ioread32(&bp->irig_in->status);
    3108                 gpio_input_map(buf, bp, sma_val, 4, NULL);
    3109                 seq_printf(s, "%7s: %s, error: %d, src: %s\n", "IRIG in",
    3110                            on ? " ON" : "OFF", val, buf);
    3111         }
    3112 

regards,
dan carpenter
