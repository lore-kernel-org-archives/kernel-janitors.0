Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BDFFA3740
	for <kernel-janitors@archiver.kernel.org>; Thu, 27 Oct 2022 14:00:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234849AbiJ0OAD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 27 Oct 2022 10:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234943AbiJ0OAC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Oct 2022 10:00:02 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43BC3286D2
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Oct 2022 06:59:59 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RDwphk013420;
        Thu, 27 Oct 2022 13:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2022-7-12;
 bh=4NwL9Zd493Vxvmn/Bj4HOHkrdseaAOP2ZwYbFrJ+NJw=;
 b=jdxGQ6bA6VSEH0JwGLrE4zTQQRIfiS6Id02ats7Yk4yfZ5CkKlK0k3N5sqDnbntp1JQS
 IfIcaSvvNjHWVOSuOxkPbUheJaaUgPFB++T+LyesQrwJcR3dSxE7Brtd2cJgyZtQ5fAK
 1ipSd7YsEE3MB/d78KkOXDppyeI3/cgKU1hTRfcoeby1we77sf9A7BQDSZEfU7yWU8sY
 WRDFFVXphA7jMLrOErPp8SAOEUKUgkk/tVWvp+sr/SlPX+3yMrxfA3jSefXH0RvuaifW
 hFPp2+1J7ZBfyWddzkkEdTjM2p1TZXbRLyOig/pHohgjOklyyPjT6mrr7MnNhydHD9KC TQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kfagv27mu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Oct 2022 13:59:42 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29RDEeHi026544;
        Thu, 27 Oct 2022 13:59:41 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3kfagq0kmx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Oct 2022 13:59:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlkUTB0Rbqani0kmYGt+RkWEpB9hz7TDMtvqBixZ4qj8yQzrvp+i9lnoK6bsfw/Zvgirs7dT5JuJTPXcfBoCy79NdpB15d4ubgJCzvoMOsih04QfMQjlbLGyxThkVM1hmm3WgiVLIVgmHGeRX8HQ+ZR/movGMOBZnBTU66N5oVFpRmKMn/wStshjDK5xEa1uV4d0WOnvHzxiyejgAYgwP88OqCl4hZvd4iWQXokNDP3Z2yqBW7+d5nudjDcZ1X8/1BjMKvXnprQhMI8A85ykGgN+5bSMr/sVrcEYTGFjvQUpCTkze1r/OOTCF1nUTnF4gFdtcNOhT2swYuY1XycX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NwL9Zd493Vxvmn/Bj4HOHkrdseaAOP2ZwYbFrJ+NJw=;
 b=YjpbvynOAd3crK6WOJdRnnZ4rQzpPpI0tDKjX/rRaT5B35xKCsFOB2QAFUJ+HqM5AV6lKfzkCn+VATgz4eq3dyzNG+m1yOm8rzYVixsdF9MuvAGo3VxYJWdXMcpwUVTa9prJjK8Ay5RZiC3RrAAgfDnrGKsM+JTq1ufYhRr1AJs5LCNXhoZ2IrSH4TjvCJU35xuUn117QvW42wZNMpiLkNuRDg1wjV1KwVyuDtJmQyn1d/Y6o7Vdwc9GU+PLmVH+Cfzw3vgX6TaBud29xV9K4yotR4VjcbU8k8tlep84YYjbye0YRbmDhVg1C5Lt67tZw8kgEmGEER7qbemMDTWVMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NwL9Zd493Vxvmn/Bj4HOHkrdseaAOP2ZwYbFrJ+NJw=;
 b=w5Ixk4riL9q/tJBYn9GWncx+1DbF1VTdAIW0aL5yrpgnD/5+jMDjLyu3VlLEu5uddZ9LLN967nN39cE5Yzrxn9zP/NkX+jbbSaD04DTriDUt3JDKeyAMyu6q5/sxxKzyAUFj8Uipxy1qwSuagzW+2LnU56Kr7ypG4ndeBdk3v/M=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CH0PR10MB4908.namprd10.prod.outlook.com
 (2603:10b6:610:cb::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Thu, 27 Oct
 2022 13:59:38 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3809:e335:4589:331e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3809:e335:4589:331e%7]) with mapi id 15.20.5769.015; Thu, 27 Oct 2022
 13:59:38 +0000
Date:   Thu, 27 Oct 2022 16:59:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ChiYuan Huang <u0084500@gmail.com>
Cc:     Lee Jones <lee@kernel.org>, ChiYuan Huang <cy_huang@richtek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        ChiaEn Wu <chiaen_wu@richtek.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH resend] mfd: mt6370: add bounds checking to
 regmap_read/write functions
Message-ID: <Y1qOwO11z0Wvcz6O@kadam>
References: <Y1aCiReTZDbPp/rS@kadam>
 <20221026072444.GA24881@cyhuang-hp-elitebook-840-g3.rt>
 <Y1j058PsWYj0MQrC@kadam>
 <CADiBU39z_h=QLF-cGztz6Wq86+rMahVb7owHNt4RpvFPFYDs3w@mail.gmail.com>
 <CADiBU38JKzq9ngiaZWTse3eMdH_fTcUCdanea7uQAU7NxZrzZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADiBU38JKzq9ngiaZWTse3eMdH_fTcUCdanea7uQAU7NxZrzZg@mail.gmail.com>
X-ClientProxiedBy: JNAP275CA0056.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::8)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|CH0PR10MB4908:EE_
X-MS-Office365-Filtering-Correlation-Id: 12b73f92-c03a-46f8-ce56-08dab8237cd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: as/mxjcBV2b8/flnt2LAsYBv6KMOUNYeJm1iNkcv6P6urSAmG/9RoCfhLOFQbIBN+KKBGZowfka/nR5GHDlVX80Rm2s+ZWWUYvCR6aa5kvkv7AAtClu1z15cd07tLxs8TH7b5xagRracET10r3AMdnxsg9cwTVEyy+ayO1KyDz3nCpJfzOLIeXhYlUliOfb6KOA7yPFThussH15r6CduHPcQ7QXtDWh+ddIv7+Nn9Yq9LVWzq4YnkBck+0WYhNMorYaeYy+T4v4BfMhvaeqdguHinx46jfaGOCFTbUls1XgR2+hhXIcV11qWu/O/t/2d9EO4g9vVA13GQ5bdrhZI0OtVVbgiXL8SWm/+sv4gTOPvYf8X7niwwvYoruOe8r5jZ50nmOuK0UPQB4pmLasINe91XFGa1VuvZ4apVA5zKSXCskiU/Dby8dKt3CjURTY1sUcUnatAXFpCtYB01biKRrZkXQRfhObJZWT+rJwbx3AKt1gQIS3jmYzP2YP48wWs1q1lH0Kh/aBY3SZg4sJfRGhQAFbRMkZd0J8GvZF1IOjUGEWD6Qyq2zbU38UizETQsFEED8EEUI29hF787kotxtAUyQV5keG/NY6J8WLzdm2Bj2jcfl9B72maXJDnkXiNsZv0GX2XfMTYOntgGI2iRKxVnweSIU40OqCE3FeiR6TjKjUuPFH2I3cYki0lBl7f3i+ID4KJqgb54sdoImRT5ljx0ArC7Y5ddtIsMLvObcI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199015)(66946007)(4326008)(8676002)(66476007)(66556008)(54906003)(6916009)(316002)(41300700001)(6486002)(966005)(478600001)(83380400001)(38100700002)(26005)(6512007)(9686003)(6666004)(86362001)(6506007)(186003)(33716001)(44832011)(2906002)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUo4UDlVOFRtdVRtZjZmRDNJeDJ1dE95REJneTNWV3BMTVh0QythZmhXdngw?=
 =?utf-8?B?Qi93QU1XREN6elNzdy9admtTa1hSLzlMVDBFbE1hRnBEdzJFMllrZDhaVGV5?=
 =?utf-8?B?ejNsZ0YxTFdpdUExSGRva0JKa0w2N1dZNE1MSndZZ2JKN3RnT0x2bitVZkdV?=
 =?utf-8?B?V0QwRUZrRVZYaGZQaDJ5R2RNYzVLZ1RqYm4vdEtTc2YwbVc5RlR2S1Nlek5O?=
 =?utf-8?B?d1lrK0tpdjN3MWxHRWRxWXdZV3VkbU96M3NnQXo1ZnFVMlJKYkZoMG0xdGll?=
 =?utf-8?B?NVVIQ1lrVTl6Nk9sa2d3eWNBWTFqT0NSUzE1N05MQ1FUODNnbkZBRGh5NDcr?=
 =?utf-8?B?VHdNMkdudEsybm1Sb1h2OXRqMThhYkJYWjF1QVFWTTZxMWJJb2FFOUJYcmR6?=
 =?utf-8?B?YjBJSGs0M0ZtNm1TY3NGNVl0VHE5T3J0MlZQeXpWaEJobW8xWGpUdDdjSzM2?=
 =?utf-8?B?RXJLaWI2MmFLMExITUxWWnV4NHMvVmpNVTFIKzFhaHFjalVlZnR4dm1NUkJp?=
 =?utf-8?B?UFROazl3TFZmdXEvWXR1OUlpcmlHVmF0cng0VXQyRWNZcVE4U3AyZTc2QlBC?=
 =?utf-8?B?UmpIRXIwdko0MnZ5bG5tWHFiZ1doclJXUkc1T2tZYThwdVlHcDJwdXFQekdh?=
 =?utf-8?B?NHBYZXlHdi9qaUpVWktpWkI1WHRBdmdRRWlDVEw4VzdNQUdWLzF6eGFiZEg5?=
 =?utf-8?B?d1VHYnVKVUk5cndqNmlGRFpWNXg5bnlUNDR6UU1NWWpkRE9VRklsYUg5dkZY?=
 =?utf-8?B?cVczYitMS2RwOXlPU2FrVEhlaFQ4VDZ1ak9HK0dyYkE2T3FBMFdLT3dnMzFR?=
 =?utf-8?B?NFB6Ym14YldUUVhBbXBPZnE1WllCRkRtZ2Nxck9Pek51TmZvU0NoYmZTR1lX?=
 =?utf-8?B?NEVRREQvSXlBV2wyYTE1KzQ3Rkh5ZnJoLzRHT2dpMFdaVFFxVzFUd1BlN1l1?=
 =?utf-8?B?cEw4QVJVUDVveXFzNzdtMXJLNDBYSTlTMi9yODlOTHExa0Zway81akxnSTg3?=
 =?utf-8?B?WFlMbnUzVUR2Vnd6RXFvQ0dSMVZJK1RPci9pQ0x2d2YxUGFJRG5rOXhyZHFm?=
 =?utf-8?B?Q3JMMlp2UkhTeEU5VTZWV2pLTmVpK1BBVW50OXFET2o2L3VGa1VuSGdFWFZC?=
 =?utf-8?B?WUVPZ2JudjlBZi9qU0pzZnkyYllwOWJ5T3pNSU1RcDhTcUU5eHpiRkNxNDZI?=
 =?utf-8?B?SldqVndNRS9oM0RVajgrS25SZkFZMHpsaDBHR3pLV3VuWjhMRmM4djNOSWlO?=
 =?utf-8?B?Q1lzNmhVLzhLb3VnNWZtb1JsY253ZHRvbHRlejVrS0hudFhOMytueGVCQi9K?=
 =?utf-8?B?YTJhUDBSR0NzNlpNU2hyd2JIYUlFMlN3clk4VGVQVldZWUhNTjEwZEFEaHZy?=
 =?utf-8?B?cndMWm80MXBXK1lqMW92bE9iOU5wSkc1NWVuWEVLWkpxS2xqU1IzSm5keUhC?=
 =?utf-8?B?c0tFaWpCMSs4RGkrMVJPL2xFYzgyTk1uTGpmZ2xadFRoem1QaUZIUEFMSGVR?=
 =?utf-8?B?K1RzTi9aTnJXYm5vY3JaTFpSSTRpMDd0ZGYrenlZakZsbjdMbGtFY0FXdzM2?=
 =?utf-8?B?MWlWUHc0WGx2S1RNSVBVS0p5Y21CM3gzdlNWV3JNQXIvc1RPb3ZGNTM3aGw0?=
 =?utf-8?B?WUNyQ1NSekY2SU1yNzhRcGdOVit4TXdvKzVQajVRQ3drVG1heHNndHJ2ZnNy?=
 =?utf-8?B?YUowZVl1M0pGVWV0NmdkYTNJcDhCb0NnVmZpKytNUWpKaE02VzJ0VkVCemJV?=
 =?utf-8?B?T3lXY3VHdDJPNW5UcEwvMW9UWTAvUkJaTHZjOFN5Mk83M2I0OGNPTWQzOUVB?=
 =?utf-8?B?R1RWbDhxOXVWWDFQdkhMTktpc0F5Um05dE1ERE95eDU0NXhSYXpZWExGZVpS?=
 =?utf-8?B?bFdhWGFoMWdjL0JubHBlL3NFajlhMllVb2dnaHo3cVF3Um1mUkttR2xsSWg1?=
 =?utf-8?B?UVp6dmNGS3M2aUZLM1dnMHUwdDlpVDhQUWVzOUdNNVNSSDNCaVdJb3BINkI3?=
 =?utf-8?B?SGFwQng1d3NuZHo3NEdpQmdWVllobk1tSnp2TWtVTkpVZkFBUTZGYzFPd1k3?=
 =?utf-8?B?aDJjbUVmWnJRalJTTi81UW5IM3hhMzhYaTQ5bHc3VjR1NU0xejBRSGhsS3Y2?=
 =?utf-8?B?Q2R0emtSbkZtNTBwNS9IVlNsaDlDeW9FM0k1dnlPN1ZCb2NTekNodW1MbUtB?=
 =?utf-8?B?a0E9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b73f92-c03a-46f8-ce56-08dab8237cd4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 13:59:38.8096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDlViJ/ezGOGPEY61IRNvg/VBzCWuauJabyYdEWbxktlIB67a8Iw5UzXRPAkU4Cp9pfrqTyvzrzXikUJeXYYqZIqqVFcfN5uhcSY+/LMxzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4908
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2210270076
X-Proofpoint-ORIG-GUID: HBMdp5TK3kGHiWhsS-YuEVv7rZWT_a-k
X-Proofpoint-GUID: HBMdp5TK3kGHiWhsS-YuEVv7rZWT_a-k
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 27, 2022 at 09:59:46AM +0800, ChiYuan Huang wrote:
> ChiYuan Huang <u0084500@gmail.com> 於 2022年10月26日 週三 下午5:05寫道：
> >
> > Dan Carpenter <dan.carpenter@oracle.com> 於 2022年10月26日 週三 下午4:51寫道：
> > >
> > > On Wed, Oct 26, 2022 at 03:24:48PM +0800, ChiYuan Huang wrote:
> > > > 2) normal register access with negative length
> > > > Unable to handle kernel paging request at virtual address ffffffc009cefff2
> > > > pc : __memcpy+0x1dc/0x260
> > > > lr : _regmap_raw_write_impl+0x6d4/0x828
> > > > Call trace:
> > > >  __memcpy+0x1dc/0x260
> > > >  _regmap_raw_write+0xb4/0x130a
> > > >  regmap_raw_write+0x74/0xb0
> > > >
> > > >
> > > > After applying the patch, the first case is cleared.
> > > > But for the case 2, the root cause is not the mt6370_regmap_write() size
> > > > check. It's in __memcpy() before mt6370_regmap_write().
> > > >
> > > > I'm wondering 'is it reasonable to give the negative value as the size?'
> > > >
> > >
> > > Thanks for testing!
> > >
> > > I'm not sure I understand exactly which code you're talking about.
> > > Could you just create a diff with the check for negative just so I can
> > > understand where the issue is?  We can re-work it into a proper patch
> > > from there.
> > >
> > Here.
> > https://elixir.bootlin.com/linux/v6.1-rc2/source/drivers/base/regmap/regmap.c#L1860
> >
> > From my experiment, I try to access 0x00 reg for size (-1).
> > Testing code is like as below
> > regmap_raw_write(regmap, 0, &val, -1);
> >
> > That's why I think if the size check is needed, it may put into
> > regmap_raw_write() like as regmap_raw_read().
> >
> It seems c99 already  said size_t is an unsigned integer type.
> My experiment for (-1) size is not reasonable.
> (-1) means it will be converted as the UINT_MAX or ULONG_MAX.
> This will cause any unknown error like as memory violation or stack
> protection,...etc.
> 
> let's check whether the negative size is reasonable or not.
> If this case dost not exist, to keep the boundary check is enough.

I thought you were testing this from user space but it sounds like
you're doing a unit test?

regards,
dan carpenter

