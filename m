Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D46BC433EF
	for <kernel-janitors@archiver.kernel.org>; Sat,  9 Oct 2021 08:25:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 163BB60E05
	for <kernel-janitors@archiver.kernel.org>; Sat,  9 Oct 2021 08:25:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbhJII1q (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 9 Oct 2021 04:27:46 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:9732 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229578AbhJII1p (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 9 Oct 2021 04:27:45 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19948og3013861;
        Sat, 9 Oct 2021 08:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=FQrSp4yNsylF0GplBTZSOu1Jr/BptLLKREU64ValFDo=;
 b=dG+mPWXSrT977jIfzNpNSplCBF7zrdkhTj4XzvZIMmLfDPRpgjVCSm5ptnMc+Xgl77fQ
 uhqtiBTju4jxJxLX4lVEmEjxAsALEDCxstgzgrPmDVMPH0qlZ433yMdIKQGl5yCSuqJj
 PQPypDFQyPqQY83XJLACpKWN4RpIsFMxDYN/FOweeCpE+N9WlzoUXw9yZ0gbF4s/XiIJ
 R5KU1pZ/hamEHkqalW+gE6g9PnWWQ7YwYvrTuby0ybX4Jyigup7Kc4E3nu85HzGdVMkm
 u+F4NE7PxmfUVzOBVuO6jrOZqn5zY8G+z62RuXULEf3ALfe5Thyh8XwblR3xC3FfxfQ8 +Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bk1v38p57-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 09 Oct 2021 08:25:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1998Os59063222;
        Sat, 9 Oct 2021 08:25:41 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
        by userp3020.oracle.com with ESMTP id 3bk2dkgf4s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 09 Oct 2021 08:25:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMxCXsNKkuylHhu9LaLAm1kXqRUHtCYYzJdADfbNiZzJ+Czjs3VMokNnUE8x3imTeq+amEnnwSfvJIdK2C43OwFy7F7JWeON3kIxNH1imskEquPgSRhd3JpZjq6v37rabYOG4pIffoMGLB45uSx9ejaI2ShLFe6aSm5IFlnGcza5CXQOw0BejUZ9glkgSTEUnxNUIvWCtutmypoTIOZOyIJcTSPLXWj2oOr9yiFuWpSNIjt5eclHZxdfLZZTs9+kpFJf8NKypI8oyeYblnOKPYs2Fe2/TSDJGK6vyHdutwOm7Ijo0EuL9+Nu3e9q+E7An9g5mQw86efcENl+JDaV6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQrSp4yNsylF0GplBTZSOu1Jr/BptLLKREU64ValFDo=;
 b=K8/UjrHj0aLBHWX+qYgcEyExNcKPCXuq1eVO6dDw9M+vhG3Xi/csKfXZ6BJKGP7U9TMKkw8eavpQW1Pw200mpQu5Q2n0R9c1lJ76r/BDIdDItuJMH4NTddQOqBIodNwYJJ6+1sLNgTFwRaEZJ0HkaC/8QjvuwFPaIw8y2Nt4ICniZQ69DxUGejyKb5jfE4GIOabg6wSIQbpchX20Jrfoy6vl3VRMcBaTLn1zUkl0S1BsHKUm/La2ZfrXuQlqjp2CahIBBWhhKNw1/nQZUOU1SXKi7X2ZoqshfYmy00SRyFI4e313v3prz3oMlI48hbse8dFGe+Nu/+ZagqtfKz891A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQrSp4yNsylF0GplBTZSOu1Jr/BptLLKREU64ValFDo=;
 b=z3JKME1fifknvR431JVrpA+O0ZP4vBk78zb3iCADLS1Uko/z8Sld1SbaupqqkYjNCeGEucUZ+I4g76mx91rgQYqcMvp8TM3DhhRdO/f4QUki0koJt36LmHx6iDZVwIwo8a5nM+ihl035p3e+72cL3pDFiH/u2cu4n1/+mk51pKQ=
Authentication-Results: fb.com; dkim=none (message not signed)
 header.d=none;fb.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2254.namprd10.prod.outlook.com
 (2603:10b6:301:2d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Sat, 9 Oct
 2021 08:25:39 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4587.024; Sat, 9 Oct 2021
 08:25:38 +0000
Date:   Sat, 9 Oct 2021 11:25:19 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Nick Terrell <terrelln@fb.com>
Cc:     stanjo74 <stanjo@usa.net>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [bug report] lib: zstd: Upgrade to latest upstream zstd version
 1.4.10
Message-ID: <20211009082519.GG2048@kadam>
References: <20211008063704.GA5370@kili>
 <3809A417-00D7-496C-9D4C-2C2D324094E2@fb.com>
 <40E866F7-6ADC-4A19-97D3-A6F21A5F9621@fb.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40E866F7-6ADC-4A19-97D3-A6F21A5F9621@fb.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0027.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::17)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNAP275CA0027.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17 via Frontend Transport; Sat, 9 Oct 2021 08:25:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfbedda8-ddb0-4fe4-cf0b-08d98afe5fb3
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2254:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB22540977F20468FC833FF5F08EB39@MWHPR1001MB2254.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LbMwUD0h4YQPyQuxU5FCAzELZhIfT3u4ZcCHPfIcR5XYodCTlbv5EqEPNhme3drxflL4LASgjDfHYAzjfksUNqIGfmOpFmvOF0n12vGvK3ybrykbZdHkZhkJnN+4IAqCYznLij37OjpMc1b3xJZZBX8nOgrg248fcNowPCMOc/t8uN6RG3I0YtGxHrYQe9kkWTaw/+Ni/URrMkHrBu1+c1uS/J5pTF9dmROm0ksrzy2Ao29/MqFGGFRHpRbP+JFi1+T3PhROP8jnTOcbR706R6TVfX/el9Q65RB7WkkWoXUcMLU2yOAX/Sn+Rw/CT4Riz+bGXC6mm68u/yba+PJbeHr1x8hqp2D2IgLLTIPWWZmC/eFdASELCJ9M1j5WS0ZjD/+ES4XvALOdomXiItigNdjKsy/RW0jsGcBlHnUgSANHGpAQ2/mmxeHKRCibu1m/BY/SgCJrOjBq7rRRVoO5LZmaDWBCrOxP0VIKiic6WDG4MuT7xVXO7zWwVKz7LADZvjCLrU7syW5V4HkZiNQI+gCcdZ5dy7RHV62YNmzQs2EPzyTQZ0ETlrFsYE/xBbzTGoIP90/mGAiqxyCr8LZ6z44a+6eh1Gsf3Ecn2g21ojnZywartBNQJE/51a7O7ZNqkRe9XPRW9IqnJoKt+eZ7eUs+OEktSmUDiu60Xl8go1i3EzGs1fVolgShbMdJhwp3syeBQfwVIFxok3oOwoIhaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(55016002)(186003)(508600001)(4326008)(33656002)(33716001)(2906002)(52116002)(9686003)(1076003)(54906003)(86362001)(6666004)(6496006)(38350700002)(66556008)(66476007)(8936002)(8676002)(316002)(9576002)(558084003)(66946007)(44832011)(6916009)(38100700002)(5660300002)(26005)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmZ6YVBZWVduS1A0MEM2U0FKKzBRWmVZUmZzOTFob0pGUkJuNnpOTkl0WWhw?=
 =?utf-8?B?T1lLYzhCcE96Y1pCdnh3bmtjTVdlNFJ0aFk5MzR6M203ZkdPMk5UVDNrSzRu?=
 =?utf-8?B?VXJrdUJuWU9WWGtIbzN1ZmlTeDhpNzBSeWFFbkxrTFExRXRhNFplVVUwb1ly?=
 =?utf-8?B?RnJOZEg0ZEdac2tRTmx6TTVNTTljd1FkLzZxQXhKbmFEeWNDRlVNaXBOZENZ?=
 =?utf-8?B?c2RUVi9SUjVZR3NYTVpoVVdzRnNBOG0yeUNERmtRTmgzR201L2tqOVUwWEIr?=
 =?utf-8?B?czlDcUc2MEUwbmQ3TkN3Zk1Zby9zOElMRFFnYk02U1FiZzNPdFVDclE2byt1?=
 =?utf-8?B?MTkxbGZUdGRiNnk5QkFjNGY2NjZwMk96VWNlWWxISkpLVUpsZ1ZUNUJ3QU5o?=
 =?utf-8?B?UDk4YUdBZk5wSWY3Rm5Ld3UzRXNGT21Pdnl6ZlZvNS9KWjZZZEtzd2F4Ynlt?=
 =?utf-8?B?SkZvMVFLdmdBSHZzNjhBWWFlUXhBQmRxOEZLQUxJa1l2YS85VjZXV3BUaEJD?=
 =?utf-8?B?T1d5b1Z1em9rSzRCNVlneW9EY1Bya3pYT0E3SWduRzdpR2lYQXJxRVBOa09k?=
 =?utf-8?B?Sk1DNFFCalo1SmtrS0g3SEhHYThUUnQ5djJKSEY2dHVMa0Q0STA2OTNXY1Bq?=
 =?utf-8?B?K29UZjBYbHV1RDhKeTNOcEIydkcxTkxPZW9IUFdGYVJJdkZlWnBXelFYWnBt?=
 =?utf-8?B?emxlNGF1ckxKQ1ROZFpwcEpmWDh0NHE3ZFFRN20rVk9iL1Jlb2lCbEhLT1hh?=
 =?utf-8?B?SDNXWkhaUm9YdUdvSCt1OGp1Mkc4N0FLcHp0MkR4My83N0lwRHZlSFRJc3NV?=
 =?utf-8?B?cmxnNFhIZjhVV09OdXBGZDRHaVZ0cE51dUJWL1JobEt5aXg1VGYvRXZYYkRR?=
 =?utf-8?B?bGlYSVVydGhvUEFXOUU4ekcwZk9DdXRpOU5qVVpqMmhPRG0zYlB0cjh1NHJs?=
 =?utf-8?B?OHFEVlo5VG1ZaU9Mb1VVN292ZGR2dUdWdjZ5UCtCWk5UdUdnZTFRdVNOTkY0?=
 =?utf-8?B?ZzJneFFpbmQvN2F2RWo4MnRkdVAzZ3BmWDRCc2ZvVkkxNWs1UFVvNVlJYUJo?=
 =?utf-8?B?c0wxajdyUDgxbkVaSlFKQmxIeTlVTVlsMGRvYm1aNWkvU0ZhYm9peDAydmxw?=
 =?utf-8?B?WmNHVnZlWWVndTd1OENEMTZYazhlTGVKS1BKczUycGFQTzdmRWR2dFpkTmY4?=
 =?utf-8?B?WUVTN2k3L0R0REdrS3VITCsyNkc1b3lrc1lzeTRLelk5ZjFkbTl5TG9hczMy?=
 =?utf-8?B?a0NmaXlpL0MvM3B6NnBvdk41RjFCVGFYUE9tNEhZVDlRbjJ1VHN3YUFXVHRK?=
 =?utf-8?B?cmtzVGNRUG1RcTc1QnNiTEEwdkR6N3hBNTFNV0RjOGVyVVI4SnNaZlZuTlk5?=
 =?utf-8?B?ZzhvM2RmMkVSVVVCWGlRclFZYUhUcjY1cGNmc1dFS3o5N1loZG5Ya21lZlNr?=
 =?utf-8?B?WXZSRE45MWxYL05sd1BhTklod3JkcHdHSy9kNDFscTBqNUdjWmh1Q21YbGJr?=
 =?utf-8?B?bDZqeWF4YUhZWVUxN3ErT1ViUEcxWTBEK2NsQWVkT09LZWJwUG4yRWhQUm90?=
 =?utf-8?B?M3dXN083U1B2UHpwY1BDU0tZcTRhTnlXbUFyRGE3eHFLZ3c4TXRTeDQ4VzBu?=
 =?utf-8?B?Zy9yajlFdnRmTXpnK2FzNExnU2laTGMrVm93RjJ5NjRNd3BlWHpyS1lKbHE2?=
 =?utf-8?B?VDBaSnNvN0hYUHV5R3M2SUdvdkJ1dFl2OWtPTHhSUnAwWXo0aFgyYlBpWC9Q?=
 =?utf-8?Q?GSo178tiGQ1gH27daSp0IySmrEz2C/iHFilc63X?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbedda8-ddb0-4fe4-cf0b-08d98afe5fb3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2021 08:25:38.6148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5KitfdodH+3Nm5WcSzJAiphk5neMdGJQ2gE75GJ5vnVqpCW0qDs8OvTbNnFkd4hOJy8Ea5riBHxT+uu190hTl3JAMULSUYxUYN8gYYa9v0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2254
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10131 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=725 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110090059
X-Proofpoint-GUID: QmD109FWoE6-uVwimiSJNjf-o-opQtrZ
X-Proofpoint-ORIG-GUID: QmD109FWoE6-uVwimiSJNjf-o-opQtrZ
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 08, 2021 at 06:28:17PM +0000, Nick Terrell wrote:
> 
> I’m not sure if you pre-filtered the Smatch results for true bugs, but I’m super impressed that all of these are true bugs!

Heh.  I absolutely filtered the results.

regards,
dan carpenter

