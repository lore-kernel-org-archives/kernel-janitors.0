Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D17AC32789
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 Aug 2022 12:57:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234543AbiHVM5r (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 22 Aug 2022 08:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbiHVM5p (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 Aug 2022 08:57:45 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0844220F7
        for <kernel-janitors@vger.kernel.org>; Mon, 22 Aug 2022 05:57:44 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27MCe8BY031221;
        Mon, 22 Aug 2022 12:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=fOzuz7u8TSGyZUHk4OhhTcp8+Vy5YMVqIROSBa65Usw=;
 b=mVqTjv8dVJq7e13huaVi0IGCcXvWc0c0WWA2gVsPJn+5Rbpe37lC1TSAX8UfZY6WawCj
 QfAAjJOK7L2yrm+MQQFAYzxgrFr0xh01cyvvnVN61pc4X6vzWoXJkuvcTXePpy2fnmDc
 zJ3OLwnd+xOBlhP03gwlUy7MoC4wE0CCjHYnUF+6lRqlis1GtoQlbREKIJCleBVIkrWW
 NGFuklfPITLomP15cHv1rP+lph6FbFfwmp8y1NQ35+EV6OkLVOds6r+5XUxrjLpDl7G2
 MAC0CG+S6/Xtl3mEv8HiuApBrBGY8Cw3Mo/bt0guOQ24/wIrj0tiG4VK1Sj16GFMNDvr Rg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j4a0p81f7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Aug 2022 12:57:20 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 27MAO3Jt037469;
        Mon, 22 Aug 2022 12:57:19 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3j3mm87hx9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Aug 2022 12:57:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9ayM9ENxEozeiAdfnMTbQxPiDvAJcgTnd/0O7UaacCZAStYUO8T2/JGGLRCjQsi9O+9yetYE/B4YsXmHcqg8WqRfhaf1vU77zZ//cfPvXRZpmPQGefxzYxTj0HWFZGP9GfMb5fDocRsz2sdKQ5iRvWsWbplRB5zCyxUBw4+a0BLgF2kOdSU3Hpc0FLSFxP1cEG7Zx7bDmwwSJ9ARLleRmCTn0o1Rj1gjsZDnZvqa17kZHXt1lAlizu+3eTaDplyJ8yag7XoIcKXMwioHcGIxkbrbmDza6+U/GF08+kZ/TvG0kjrU9VJuTCKQoQR6zL9zWjqX5Okv2AUC2ygtq4ftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOzuz7u8TSGyZUHk4OhhTcp8+Vy5YMVqIROSBa65Usw=;
 b=B0VCm1aarGkSVk5ohmcCEmsZ0bzIMK8ucmqJp2nYTkyQkyQ3v9gCOHufG8iX4pHxfTPOprgroQCGteHNHrTjcGsbJobEL/dULgxFSPKgEp9gwLVt3WDF+sFvVq9clXTa7UPt1ae03JxCGURF72LIJhamSwM7fSx6W5JUfa7h2qO2ymzB98ruCGRTxfdygzz+2VRHKPADvpgnCjm/AyFxloK3ehL1NC/rH9nwW+RlzFPXzihuFFj+KW07ptuqzwjx1CDFdkx+MP8bo/gnYldnBBw+q4mbxvt7Riybwi8LYtE5qrt+CoAq1jE3soUY9JUgkb+e603uJq/dJz2LhF7qsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOzuz7u8TSGyZUHk4OhhTcp8+Vy5YMVqIROSBa65Usw=;
 b=wXeO7TN8z6zw6oJ2LGfmBX+jmi7n/WLK1U1hid//Id91/ee4nyxe31u4g7Bb4pZLgpMP+k5hQy9W3chUPEs1Jf8HIk/YPeWsMwW+FjOZfg1CmuPjGxIaJibxt2hnZMDD+g+bzCmcC7Bo1r+tSZGmMVFjWgyHZ2kgJupGHbog8Uo=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB2827.namprd10.prod.outlook.com
 (2603:10b6:5:6e::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Mon, 22 Aug
 2022 12:57:17 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 12:57:17 +0000
Date:   Mon, 22 Aug 2022 15:57:05 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Lee Jones <lee@kernel.org>, ChiYuan Huang <cy_huang@richtek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        ChiaEn Wu <chiaen_wu@richtek.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] mfd: mt6370: add bounds checking to regmap_read/write
 functions
Message-ID: <20220822125705.GD2695@kadam>
References: <Yv8ezribLQbq5ggv@kili>
 <CAHp75VcotcJzqc4iSwNTKcvF3vAYz6VUuMrsj7LF6mi6Xu8D=Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcotcJzqc4iSwNTKcvF3vAYz6VUuMrsj7LF6mi6Xu8D=Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR2P264CA0082.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94011ce0-7124-4893-35d2-08da843dd77d
X-MS-TrafficTypeDiagnostic: DM6PR10MB2827:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bDnoSs3JoGluds3OWRo0kABTAwqEDn3coveKXym4R67p5147bhn991y8AfU6L+L/YNrWi3XFBniO+4kVEcQJbN7OeM6qG8gsp5SDNnKahhpWjRNTEwltQ10BY7n8H352+UJK78ECZWlEZ2/x/BqEYvK4TU6Sa2ukIRK5+oV3+Cid/a7j8FRNYzD0SMbxmf7r0bvD0zVTNMmn8sl0bDBvld59aBXaKXgSp4ru+BPZ16OaFgfRMbJ5vtbxEq5QGQSVGAtJjLPOqoW/+D5WXkgS+ghCqZd7x/sRXWnNwzLBiBK9Vzpjfq7h0bepXv2msjhc2ZH6+enbAa1/MdYyMgLfvsGf99CB01vWOjOk/D5Q67vP5i6L4uztKXwpPezaPMNmAk9fDAJZNrROHVg1a85AvklT4eEtW5N3qH7Q9A/4Erdjm+5gXNZQUOCjr3GXSwaZd5VAOE+zBMygp/S38kWGfCXSQhqq1bMB7l+uKW9bdOcI6Y0aLSqfDYr1IaTt/v3WkUB0ySlLRH4hIGUbJwEZZ2tE1JKIFYbnm/VZ3+GMg0X5jClYPrrdAWTmwGF2Y1KdHcCmk/eFmtFhYc+EvjYDvEiGkKrVq8p+n3Oi4HHBgIvArHlS/pHV3IU5vksZ5mrn2mNOCx77FR7L9k8/RmowwueywtC/i9dW6acMv5cGN3F2h+VyrYHofXI3Sq2Y2y5IAtr43lVjTi3lT3MQNC4b26z/4w0z7eH4RfDtXwVn+BE/tcvDYEiABlnuzBqO8J/ZMAmTKVejZueu3xVxGpX0mQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(39860400002)(346002)(376002)(396003)(366004)(136003)(6512007)(86362001)(1076003)(6506007)(41300700001)(6666004)(9686003)(6916009)(316002)(54906003)(38350700002)(2906002)(33716001)(38100700002)(26005)(8936002)(44832011)(4326008)(66946007)(186003)(5660300002)(8676002)(66556008)(33656002)(83380400001)(66476007)(6486002)(53546011)(52116002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OlO+9XAoy53+YozFYE2/n6R9LdxQSwzbF5VRx1wmyQEmAjH3YeYm/gPuzao7?=
 =?us-ascii?Q?X1+pZ1cuERbWvo9XF1BStpHml0UYYaHbEiLz8XniZ6wcamK5ZTswkIHOXTlS?=
 =?us-ascii?Q?3bdRQV7lGssgpzHq2z9v7jju2qKBQnXeKdrgyoNCYkZKEO/8BXGUWYhPaVqb?=
 =?us-ascii?Q?ByRO69lpR14B4sB1sXcIpBzufHQ7Ezb6HAc6AhM9PYWluelVBFgAmffR1ZuS?=
 =?us-ascii?Q?uogsU1Ef4gd8zYBLEGtjKq2CAoV7ZNPX6PIbtJkdgQUjTZYxDrHwwjaQ3sTn?=
 =?us-ascii?Q?tL4LUIBFPfdzJmL7u88xLezhQugUlf14lLESMuna0Jk1XbyXeGU72VOr9pEP?=
 =?us-ascii?Q?bEI231EUn3dbVkqJD93350cUIrPSTcEUb2UuUoPj8DDHdgDue/XbqY/pa7WZ?=
 =?us-ascii?Q?AvzCH1/H5FAM10w5GUJnQp/eFWGdjVil9vLkjgKFw/Oc1ykH+eM5ZsDqO+KT?=
 =?us-ascii?Q?PFnVvpF1ymCY7Ogh092PzfxkHrAbcOgq4VgN9Nxf8D5+3marIkwrw0T1xcb3?=
 =?us-ascii?Q?3pYZfL/4lCgoDC+us3AtJcDgjCr8wICwhKx0SkttxiSy9pK9RgDxxFJcW0wZ?=
 =?us-ascii?Q?78Xxv08OufZbeDJlH+ixNpLDwfNajJe63kNy2CvhJdz4Gfc0G9WbcPvMYRDE?=
 =?us-ascii?Q?jwAlIdNbkSDQ/wLCGyagM12kYznswijyqcCyUBxikCqjSBrFplSBN2nydMCg?=
 =?us-ascii?Q?dkuHgno25aS8FyL8rbMy3Qd/VJhDZSU+Wo1BQ7mwS/r/N2CAOubLNNVNJGEN?=
 =?us-ascii?Q?iaI3qSloahuZIN7NllDnzAm2yCEFi+8GuHh2DFy3n7WHkGuMULLEkbAW8tFB?=
 =?us-ascii?Q?1zcaQ9wwjKyQjdcODn4g7e4+WA8mbM0ieBkEVt9G3b/4PyCziY2nDKvb15rJ?=
 =?us-ascii?Q?lA8lZry8J6NdK09rPzgXa2kafIp/Un1YtQiw3ynA/cU6HDvzEKYl47B6fTik?=
 =?us-ascii?Q?hO6vyyM23C664jo9gIIxLG6mY/TmoSHy+EkArhqBxJbZBMpRFM5SpjmO2F49?=
 =?us-ascii?Q?aiALfxRX/tNP/rOC7QsZBRTrjH9WtZfuqFbAyJc4691TJGAUgsxACMnTEtSX?=
 =?us-ascii?Q?lrnTWkXMifPq18orvnFLOc+JlWzZknmbGvmTWW/+ujSTzeWZqEHOd23SiXDo?=
 =?us-ascii?Q?VDjzg71UFNsrEckqUtFib/d1mshZB5hMQKbUWLYBmkoJHmHPcWMVUOu3tMg0?=
 =?us-ascii?Q?FkYvkub8IHH9GE9Kgmcd07DIB5jSoUczruHU8bVtIQFHP1lWcy3319WqOS7W?=
 =?us-ascii?Q?I7D3gnfWrmtyrs3G33cBsdaRh07fB7/s/4uTLhhjSKPTZxPekHQ9dExaaGOI?=
 =?us-ascii?Q?GwZtnr4C/U8Luj77hnhhsPybM56OE9ZtT5TRpGEft4D+ZqwZ79gXIAHGjqZ8?=
 =?us-ascii?Q?vr0dH6TAKlpLVXSV20FzZ6lQ1WEYHFlD2U67DVaIdkaZ+C0oeB4tKNTulOy6?=
 =?us-ascii?Q?jQELHQMixwi1xOk+hdgX2cpgZnFFOwWl1TiYZvkbr3qNT4dRyol974B//n2L?=
 =?us-ascii?Q?veCA2Vjag2eqEJidV1gaV1GDuqSzKWP6sGI3X8LrvBHJx9DacvoMvDMaccTj?=
 =?us-ascii?Q?ecdJak5Rg54XIAkC+p+DczqNjJ5NDZrXkfF5k3JYQtjUPngfaX4ibJqgTBKE?=
 =?us-ascii?Q?nQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94011ce0-7124-4893-35d2-08da843dd77d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 12:57:17.4056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: beOui39q5zHx/PwfHwEvzMLxy2I2mgWgnQ2UGgEezrLB0TF00lsmFpa+fbGznHen/9Ejtgq6SCI+6nqwgxtLxIio5vEjILUXUKKn3OifSRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2827
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_08,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208220054
X-Proofpoint-GUID: ZwbK8Oz9OPPnu5b6xxZm91JGik3wg2r5
X-Proofpoint-ORIG-GUID: ZwbK8Oz9OPPnu5b6xxZm91JGik3wg2r5
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Aug 19, 2022 at 09:27:13AM +0300, Andy Shevchenko wrote:
> On Fri, Aug 19, 2022 at 8:25 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > It looks like there are a potential out of bounds accesses in the
> > read/write() functions.  Also can "len" be negative?  Let's check for
> > that too.
> 
> ...
> 
> > Fixes: ab9905c5e38e ("mfd: mt6370: Add MediaTek MT6370 support")
> 
> > From static analysis.  This code is obviously harmless however it may
> > not be required.  The regmap range checking is slightly complicated and
> > I haven't remembered where all it's done.
> 
> Exactement! I do not think this Fixes anything, I believe you are
> adding a dead code. So, can you do deeper analysis?

I spent a long time looking at this code before I sent it and I've
spent a long time looking at it today.

Smatch said that these values come from the user, but now it seems
less clear to me and I have rebuilt the DB so I don't have the same
information I was looking at earlier.

So I can't see if these come from the user but neither can I find any
bounds checking.

regards,
dan carpenter
