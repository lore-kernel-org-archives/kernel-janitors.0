Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012047.outbound.protection.outlook.com [52.101.66.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE38B233927;
	Mon, 27 Jul 2026 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156421; cv=fail; b=Fv2FHHIc9D1/kt0ylTuztPPsm4gEg5DyQagL237bhN9KcGZUymv7Oi3oeHrujKRA1Se7JEXz2Lb4DZGSe+N1XB9tlLCLFAZ/CbYZ+q5z5LuoEn71QX3pfvGr7YJE0ljMiD/GW/wDUFcJATsoXled0Q+GdaXj5lQEmP5nmN5azX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156421; c=relaxed/simple;
	bh=hBeIgfhZubPBya2tmdtSfF2jKs+3EJICLE1GMVOJZoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GGkL0qqCNCICSlBjyQ1xl+CGi4txgmplIV2kMIyoR4R3ldil93nxWRm9sppKq+w5oYtHpXyMhEqjDM0OXsa6KAGODnU/yq6S5TCrLJRDzVd2Onuu02obcD3rkW1OLHVRQ0boBIosgaQqmVKDe81bsfgUYJDmwcffjhJ7GToXlfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Da1kLjqb; arc=fail smtp.client-ip=52.101.66.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Da1kLjqb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GND9TIAgX++5QzOmSddJqqdHyG2vY7M/lWKfjksmDCD5XOEJ6JqiUgN7KO107eZS0t4SRqKjmCf7EkliHuxVc8eKE+rRNON1DcHEJnnzRi7OLqicTvaPS7WkgIBPkxtBLoKuBW0VJcVgXKGNPsQC5ojcx6XXiptF3c89Q9y3GLD+c3RoiPSWrXrjX/4EUgu/CONhtI836Xvxz76Za9xf+qt8FNOuuL1xOhWGcIZE4mtwstfmUYvFlKLoul13mq37YvPzTiSHZNXdoX8WsOuAr5XLyXt1MJ9dey26BI2VP/ffbh4AfOMICCUhyrhLunQZtcfQPpJEfsRLiFTNnkj0Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAW2r/hGOsxXglD6qS2v+wXkJOTcXtuzJmdBEeLZEgI=;
 b=OzKqTNuENnvB8VF0R+K5Sx+v4KCJ6ABtRqIEMCx80/m9nxl+duovtTFoj9XqHfML446yVUYkzEx+R1fY/lcLkfpofLT0GGqPMRMboOFRpxMT1apolYwrX3ZnprfVDUotNPlQ0wrHaAGd3bJd+3hn2tO+T9MDOtg1XsJsIfcQUBuGwOT96W2uDK2k9LQp1mizmWUuFtjasYhPvORE4v90sRV9ihfaOdIQDEMFoleYvEJnUEJWgjqhroJiZIWRV7JI1ibjfqJN9PcU6cEK2uqD+cyWbry8rwSA6axqVSO1puYxnsuzLWgdPQ1/ci8/sLsCYGjoKx1Xt+zAw5IElx6Ozw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAW2r/hGOsxXglD6qS2v+wXkJOTcXtuzJmdBEeLZEgI=;
 b=Da1kLjqb5AGcWoZ5qIGXDZrXkbSu8N2Qn31lO8usEPKaQf/3IjzichYi+49ftxnaFccaZRf/ivzKlwMgtMUPxaFghMTEdWECHI8vMLQDEd5H2ttZb7So7a3xmKCHg4J+fJraU0z+e5Kt1Tu3tPGCXzupHIFveRtHJ5FAr+nYCiy7SY3lEjM3QXMDitsdknFiI/t3Yd/ix3cAeYODZqOOo/qK6exJpTF1NobmfhfSlhlo7yBRLrEKOtZhexx/40lA3P/QSHG3G7r0m4T6O4onlly9Z9f1JIMNnRod9YH0FO4Hd/8aT8b21r/n5NGJyYWUPubySsKnKHsB3uvCV2WSkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by AM9PR04MB8397.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 12:46:56 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 12:46:55 +0000
Date: Mon, 27 Jul 2026 15:46:51 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	Christophe Leroy <chleroy@kernel.org>, Roy Pledge <Roy.Pledge@nxp.com>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Subject: Re: [v2 1/2] soc: fsl: dpio: Use scope-based resource management in
 dpaa2_io_store_create()
Message-ID: <55dkpjlibtfurmrrzxzznq6e3dhxvo76rsrjnokkaquwktl74r@omft73n4kp52>
References: <690827f2-e746-4378-bb7c-9948cd69dc15@web.de>
 <d95d2f4c-f3cf-44eb-b61b-79ba7891674d@kernel.org>
 <d2e5df25-c8b7-4ee6-8ebf-1725542baabd@web.de>
 <6607bb4e-a747-4791-b93f-f82f26e4a334@web.de>
 <y2h44um2grcbecnpkck44cvudugha6df2itq2uy5y46whxjouh@yy2kebig3ia5>
 <802ea627-4bae-4267-b1fa-7da2499f2ab6@web.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <802ea627-4bae-4267-b1fa-7da2499f2ab6@web.de>
X-ClientProxiedBy: AS4P190CA0056.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::27) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|AM9PR04MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: 7721a666-d332-4a80-454a-08deebdd23d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|6133799003|18002099003|22082099003|4143699003|56012099006|11063799006|10067099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	Pen5MqlR4H/casp+54oo5RVoIdbMvakb3sXJcU69WWIrdQdJMjmy7YWRgX+you2r4Vwb4fnioaQpTzCw6caRpl2dPP3NAIUT50oCGw0vt9Db4NYqzZDn8Ah2kcq+wmdVaNBX5kBgjsNRN990fTh1EWHM09ocMaDnRCMizVCPzaPmjjMNyLih7kyEHwb1tpPE/uNcn1WdiINxgFHHG5BHZt9J9payNxGUQgbVZukizH/5YMFJA6OSJOeH/iRgyC/9qo1caD98ZuQYwBNAVY/G69BT7aSacpiyqaPg1uwmvOfO/zeSXGPgCpmIMK56A6vBXtzn+AICyU6ZogZeBr2Mqj9Kh2DwYaXgX1ob6yL8IKg6SQN2gWYyN7ZaZzboIfUgWItDGx1DJACK0AvCVrJ0Yg52/5B+q45MXY4WKHmlYZgQW1bIMUpoVNarNK+j7kyWg4j+SC/kJa0QIr3mOl00gxbVc+aSrRE6rh4uY/D6/umIGd7tAGHeTQK+vFp7itToGOTbb5DzXBp89l22WsDe3c3RtGZUpDs6e9DLGswvTnwV9fY4jELTBSqJCD+bxM3Bymvg/s434sUJVxwnaY4iCk9yG74F8G23FGDO3H6YN/bJX3vk15pNUjMj8JIJS0YG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(10067099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVdIcFFSbDNNK1dIbHkyM0g5Q0lLa3JwOXllK1pwU2krZ1VWTURjQ21Tdm1R?=
 =?utf-8?B?TGY5azJmRXZRdGNGWDN5TmZSM0d1ejBDMFB6Z1J3Y1VZdzM5QWdOVzl2R3d4?=
 =?utf-8?B?VWtGbzVINS83VmRlNGV5RU9HUUFUOG1zRlc5aUQwYXNWQzY5NnNwdGtVcmFy?=
 =?utf-8?B?TzBVekY5Q0xWaTNxUHJJc0kyTkRDNG84SndRSjQ3YWFoaE53cWhvYk5IclFJ?=
 =?utf-8?B?WU9QVnBNbkZPTlFNY0JocnN1Vkd1aXBWUzMrbVFIVm1xbWhrL0wzemRESzBi?=
 =?utf-8?B?WjJJc1RxUkkyOGMrc083N1RJMTdvbzI0U0FYR2ovYkJFQTVIdGZFVDNpUWFO?=
 =?utf-8?B?ZUt2ZlhtQnRaOXNyVVBxazZCV0V2M21tYWxLYkF4czlyK0o5amJXSWVxU1JB?=
 =?utf-8?B?aCt2QlQ2YjNWMjlBTDQvSFM0T3IvbEFTRm9pY2N0aXNRUWdlYmdvZ3BRb25t?=
 =?utf-8?B?ZHJmdVFPakF6L0VUTG9NTEptYzhhWXRJaTNhR29mcFVPOExwZ3JBcWhUcnZh?=
 =?utf-8?B?M09DSG0zWmVDZkNLMUJEWVZ5TlFhcTRvVVYzcWZEbmFQWXNGMjVXc2F5MFk1?=
 =?utf-8?B?aWt4ZEQvK0JUeW5MVDdPYm81cDBiWHZqVXM1YmJJdm5BUExETVJIcmVNL1Jq?=
 =?utf-8?B?QU5UN01SOFh2WXo5OU9jM2ZQMWlLdlQvei9kelc3QzBETkMxVHpoaWlMNUZO?=
 =?utf-8?B?QlgycnJxeFJ3Y29GSEhRc2JsS1JEbmp3R05YUjd1TkFlOHVaWE40ZHNHQ2Vt?=
 =?utf-8?B?MmQ1ZC9BeSt2R0EzbDdERUxuQ0cwaFVJVWZsWnB1UFk5ZnJjakI0VUtWRUx4?=
 =?utf-8?B?TmVNYzY0UHkvT21UNEdvWHdZNDRHL0d4M0swaWJzNzhPUlNEWnFwVDVjSFVM?=
 =?utf-8?B?cVo2RW5XcmpueFY3UG1PWCtrY0J1eHkxeGVlQ2JLNmNPS2ovMEFrRnY5c200?=
 =?utf-8?B?TzNxbDdnQkFKNFRPd2RyeTVVL0MvQXk0L1VMY3p5L3E3QkhNcmdyR2tHaDdy?=
 =?utf-8?B?VlNrTWpTa1lXS2lIemRXR2I0a0k1UGhEVXl3WTFXMmdFLzAyWmxJWFFpT3BI?=
 =?utf-8?B?cis1L0EwMHQ0eFpQQnc1cW1hZUJiZXhnY0h2Zmd3cHIya0pEVTFKc1NXdHdh?=
 =?utf-8?B?WHNONlY1M0RwOS9jNGsyVElFOWtWOHp6NmFGWDU2T3NXMmxUN0xnY1JhdWJR?=
 =?utf-8?B?ck41TDZCL2QrLzJjaUV2ci9MRWJKcFN4bkNXSHBqdXUyRnF3eWcrTXU4eXor?=
 =?utf-8?B?cmxNWEFrTlgzZWdCbkp3VjZTNFR0TzBRM3pVVk5Ha3lvdTlOTWw5eENkd05K?=
 =?utf-8?B?TXZGTmFEYzVYVC9NMHQ4VXQvM29mcUhHUk1WbVJUUktEemtEWXltWUZQdWRU?=
 =?utf-8?B?QTVFcms4OXk3TWhFSW0wNmN4K1A0QUtnczJYWEhMT1dCWFU0cU9YNUFNcVp0?=
 =?utf-8?B?RkgyTlBqdkRnejljd0MxL1hRZ2Raeml1TUxxcmlveDVKYjc0TFM1R0NDMDlJ?=
 =?utf-8?B?MFdIY01CT2hNRVRZUmVRNkhnWXBPVFllQ3YrbGFLOFdhQ1RIWDJ1c25SOHNY?=
 =?utf-8?B?SzZTOTlvNzNUeDBPQ0ZTaUszUWd0ODdUdUswRy9UN2J0WndMTkpMUFArSVdj?=
 =?utf-8?B?b29rSHF5bm50SjUxWVdVWVJJWktJUUlyVHU3WVRFMWZ5WU1BMDdjZjAxL052?=
 =?utf-8?B?N0xPeHNObm5uZFBFRXBaOHpldXY1dWpFUVh3WUc3T0pOTitMelpUeHZYeWl1?=
 =?utf-8?B?UEdtNWZZL1pGbGVab1F4NjBJSStBc29ETDRFTzRLdXJUNGRhSHlhbnNYenFh?=
 =?utf-8?B?Uno3K1djOFVuSVBzdXY5c1o3WWhWUnc5aWF5M2t1S1UrWjdKOWdxNExlL2ZM?=
 =?utf-8?B?RUVhWUFRYU81U2szK1BpMTR3MHJIMU5NZWpycUtpNDlGVGgrTXBpL1RPMUto?=
 =?utf-8?B?VXJTQXJaZ1ZDcnhTbE9IM2dqbzdROUNGNzhqYmo4TVFlOTRJbFBLL25GSjRq?=
 =?utf-8?B?OGxTMGRYenRIY3htelI1MzF6dFpkS0tRUThKYWVXYTI3RFhuRmczV1ZlNCs3?=
 =?utf-8?B?TGlhQS9yaks3RDFYNnJQMjdzN1JmRlVtOWlCV0lkNSt2Sjg5Y0JOYnVZNjNr?=
 =?utf-8?B?SHQ1QW9KdXNGRHU1NkdpODdJMm9ka2lFdWhMTVhrSlZiS0ZobzdzcHFjNWt4?=
 =?utf-8?B?UjdESXUxM25xUXdTWkZ3UnFBbXRHRHVGdWsvYjROak43QUtHQzVYWTNWWWMx?=
 =?utf-8?B?bkVmN09kQXpYV2RPcHJyM3NGanJYK00xdGkvKzZPcGdLYzJDV2Y4Zys5VmVU?=
 =?utf-8?B?VUdESTV2YmV2N0t6NmNGWlRrL3AxTlpKVlZqcHhWb1laT3c0YVhwQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7721a666-d332-4a80-454a-08deebdd23d3
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 12:46:55.5829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJ5Xea1VSPnxoe0owv/BTfH93dUjV3ZWjaetCQfVAtW5Thh9FB84LKiWwAM5+jAVMauFgW9KF68QAtpuHmVUOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8397

On Mon, Jul 27, 2026 at 02:24:55PM +0200, Markus Elfring wrote:
> >> Scope-based resource management became supported for some
> >> programming interfaces by contributions of Peter Zijlstra on 2023-05-26.
> >> See also the commit 54da6a0924311c7cf5015533991e44fb8eb12773 ("locking:
> >> Introduce __cleanup() based infrastructure").
> >>
> >> * Thus use the attribute “__free(kfree)”.
> >>
> >> * Reduce the scope for the local variable “ret”.
> > 
> > Please don't. Let all the variables be defined at the start of each function.
> 
> Do we stumble on another coding style preferences conflict here?

Yes, especially when moving the variable definition is unnecessary.

> https://elixir.bootlin.com/linux/v7.2-rc4/source/include/linux/cleanup.h#L142-L146

The context for the recommendation linked by you is (also from
cleanup.h):

	 * "When multiple variables in the same scope have cleanup attributes,
	 * at exit from the scope their associated cleanup functions are run in
	 * reverse order of definition (last defined, first cleanup)."
	 *
	 * When the unwind order matters it requires that variables be defined
	 * mid-function scope rather than at the top of the file.  Take the
	 * following example and notice the bug highlighted by "!!"::

Which is not the case of these simple functions which only need a kfree.

> 
> 
> >> * Omit two kfree() calls accordingly.
> >>
> >> * Omit the local variable “size” (for another memory allocation).
> > 
> > Please remove this change, not related to the intention of the patch.
> What does hinder to perform the required size determination as a direct parameter
> for a kzalloc() call?

Nothing, but it's a different change. On top of this, it's just churning
the code without an added benefit.

Ioana
