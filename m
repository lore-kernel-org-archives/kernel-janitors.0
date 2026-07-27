Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010037.outbound.protection.outlook.com [52.101.69.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E7231D39A;
	Mon, 27 Jul 2026 12:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785154106; cv=fail; b=qM6NqEY23g9GPMT0WS7ZI3twFhAqx4ANKpjXmw1NTTIFN0bl0cnGc5HJseisb8bTCRbPxNC6i+JbhrDQYW65Sw2YMd8vHdkaX8QiFwIc5uIgv/Nw0K+l+G+HWXI4lcFfXMK0xte5ZEgWl6a4MROfg9BZnuHKZnCiSi7gpXtdLlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785154106; c=relaxed/simple;
	bh=v2p225vVgRTAtuEvlPoLh8TKGhvMSyDPiQ+AIcmsYqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dEIl71R/trw37brHaSA8rCrnsheAERTE/JjqqKw8l67iWgKniLCIi9ge2ybZHgmm0kGb/b3R25hbBhskPWO4JF04iEmEUJ8SrsSLnRwLv2yIOepN4fjWe8tW4Cluf4+bDWOw8Y0ta+mkaglSys6m89VgqGhSsUEUAvBukCk11fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TRyjrpLM; arc=fail smtp.client-ip=52.101.69.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TRyjrpLM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cd2dFPU7pyRkGA0JsfKqPGxWFEX6dOs8Nrdpp0HjwfbrUXXIxOymLkBh5c6rlPksEJLeBvDSplkPikLC1/qRRhQRkRdXHlAE5mD89xMuWa1MtnCzEOPZcLIvTafDxW+Shr4Q7HvJrjSX9chxWBzeTShJ5WO9u4do32YQ/xy9m3JxvJ/ezTPMoSUOCqNsWOWs34lhqXSWtAumPpXRsm+gWFKugPUUJSa9TRPyyqa7oNk28cBl0nMSTmc1lpfFExW+JMcZrmI61Q3g0Y02aiumIA88+QkT7fgZ2nB+F1G3c5SRhQKQSTbz1bKzzRTIPIO1VgaIi+3F4u5EbYYh77SBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lb0teh3xE/5kZ1beqNNXIxZU6GywGaUGIQF9+ol4SuU=;
 b=F8ioVMLI6Gi6jVFVcfDjxGQF/GL7OIQUmVR3wU9M/fgEaiGxpf8a4TRkB9LsWWTi67xlDzOfdVYZK44MikCuobZf8OUAaliUPpcJgs7hOOCbnYfTN62TO//glSFhBlul7QLQME7myjkXAH2EMVHn4lTC5du35gAIavtR7DW8yxVx/KP9OATqHt8/zl8dhZRSblX6EIkE2gr/35WDKdKicYBpuvcyaf/fKayMRwpX6PIxAWMIsOQRkzxiDjT2wzJcuYTNn8UPfvge6y2/n1205m0ykuPzo+V1QgSGr5hpTcd8dV6Aki7rEq0mZeNhiYUldsIBJLFrxRB9pcsjM9PVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lb0teh3xE/5kZ1beqNNXIxZU6GywGaUGIQF9+ol4SuU=;
 b=TRyjrpLMlH+4/Z2FOBKsRZnxh/g7xz+Hf7USXCPQ2U4Dvm/fjqhk/vOb3hyn6Pf8jiWLhdNaCTbp8zdKLCdZEGymTWC1zPlaLU/uRLjUriEMMhpy6kPpBNmypN8U+ahTPdguA7oDoubcd8CjUisTJpP6/yxokO7Qia2FaZirF3HKi5oNbDClk+UcRqcb+CKAYyPGn7WqzZcQ7Iep+mobiBzXP16O1hG3r7lmwhFycXw05+KN3laJI1ckcn6leyt4dZvRzkdDxdeRF3FoxH7ZvE+0nm9pFr+UqWFMnZ0pYatA6vgPB1GTxUT+4UHgc1YCA7A8YppVxngk9bwhPbwT4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by DU0PR04MB9563.eurprd04.prod.outlook.com
 (2603:10a6:10:314::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 12:08:21 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 12:08:20 +0000
Date: Mon, 27 Jul 2026 15:08:17 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	Christophe Leroy <chleroy@kernel.org>, Roy Pledge <Roy.Pledge@nxp.com>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 1/2] soc: fsl: dpio: Use scope-based resource
 management in dpaa2_io_store_create()
Message-ID: <y2h44um2grcbecnpkck44cvudugha6df2itq2uy5y46whxjouh@yy2kebig3ia5>
References: <690827f2-e746-4378-bb7c-9948cd69dc15@web.de>
 <d95d2f4c-f3cf-44eb-b61b-79ba7891674d@kernel.org>
 <d2e5df25-c8b7-4ee6-8ebf-1725542baabd@web.de>
 <6607bb4e-a747-4791-b93f-f82f26e4a334@web.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6607bb4e-a747-4791-b93f-f82f26e4a334@web.de>
X-ClientProxiedBy: AM8P251CA0028.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::33) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|DU0PR04MB9563:EE_
X-MS-Office365-Filtering-Correlation-Id: faa2968f-8139-4538-ebf3-08deebd7c01f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	f2h/YIvCNoFxvoL6YeOENhWNtLS5J49efOyoVCxm7cgy89Xb+sWIXWQcLKFL31TsP618EAXCfmnr2wziDpjreSpXjneivgYjRd1oydoL70aL5xSH98HtAcqVvlsNtsc8IWjrZhqK3oeABpd1gT/Z97Hlg9U54Wk0mbtQa67MjsoAC/xd+QjrHYtrFEaxAv90yagyFj/x4aSBTMeg5FONmfMbRUsJ8O3Vm0B6dF6hqWPWcQeVhvSC2AnnqW1R1Aus0EuLZsDpP1/JRJTvVZaSLlqsZjrU0KTnAi9i4Ph55tnLs/wCvNlXXGpsrg9cr91YiFBx/fsBrdMYqo+Mr/fTYkOszoYppf9TORZJAZo4NztMDqPLUez3Ot0LW2uymRSZ71OePuxCqr9W/o+yRoXDxec/3rhz0oYreUlQxrWagZJXpXEnqwFg+GeatDq82+Ydv1EIWlAHcaMhoW6ltglNe5fUuAsC/VmaW9m6OkmpsSQ4Mg4wY7V73VOmsuPCBKJI0L0FaDe3bXh1dzZy7EP1GsJIPzb1Y2s5WcwO0ckEpDf5iSUUEFnBr+tKiOeG+ks/L401cx5vFr+BfE2rGSViB+gbWVi9JbbZpcDMRkjWZh3IO0awDjRGpkbM0ilXrSbf/oM5i0xcJYHLKM9C1jGMm1SPsQxWfjn9xpCq/uxX72Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUJnT0o5emM4VXdRbjJ5R2M3Sm5KaUEyRXhoYmtjcTgwMHFnaFN2Mkg1aGpm?=
 =?utf-8?B?Qm1XbjF0MHRSUjh3SEo5alZleFNza01saWR0aUJ6azg1bCttMDN5TzJkU2Nm?=
 =?utf-8?B?amVYckdwbnZqWE1TWGE2WDhzLzNTeG80a3owazc2STArRHJIQi9YT1M1VHYy?=
 =?utf-8?B?ZlduSE9Za3lyUXFCcFhrYmlyd0RmUUNYaEFPWVdlOXoyem9LckJ1aTIrdmE4?=
 =?utf-8?B?RVNVUE5yY21lN1lsMnFMUzdoeVNQalRzN0lYYk4vU3g5YzFJa3pXYlkrRjZh?=
 =?utf-8?B?em13TmxWcGsyN29IMEpOd2xvS0Q4QmJvWmlidWw4bFE2QmhXMi8wekN0VWM2?=
 =?utf-8?B?SExRelRGYmdOZjc1bGs1Y0lmRTlVUkVHRlF6UjN1OWRHekh4UTMxY05EcTV5?=
 =?utf-8?B?ek5JLzA3QkxKMjJiM1hIYTZUN3JnZlVENnNGcDFGZXVZeFRPRVVDU2liYTRo?=
 =?utf-8?B?ZlpzM1pRR24vUmVVVjVoVEJITTN0R1p4aC9uN1k4RGRaZGUyVzFmcURUbkpx?=
 =?utf-8?B?d2gyUlk1dXdMcWdEOGZ6SEFVNUcxREczK3BaRy9YNmRaa24xVk0wamszT2pV?=
 =?utf-8?B?NkthSEZ3N25aRDdzd04vTzhTZVRoY2pSL3Jxb1c3aFJ4OWRuZ3FFYmxiTk5w?=
 =?utf-8?B?dWkwUmdnMGNycytGd0Q2anFIYWh4QTFpdzA1Y2dVN1RFY1p3dVMvSEtPY055?=
 =?utf-8?B?RjY5WHVWeFlmSTBuaFV2TitRRXc4SzFXRzVBOUc2WVVTS3pudTB2eVJMdG9I?=
 =?utf-8?B?Q2Y5ZEVUTWlONXJTNXV2amlSeEtTZkc5Mjd4bmNaVlI5TjlCYjhRZThvRnc2?=
 =?utf-8?B?c3k4Q3kxbXErMi9aTmhxdE8yR0swdmVHODN5QWw1eFg2OEZLbmozZzBRdDJC?=
 =?utf-8?B?MXh4OEhETVNKbXkwUGd1WXFNdlBReDdDQVR5Z1pwMWF6UGZXbHlKdU5oWUor?=
 =?utf-8?B?UzlPdEwrREQ0eDVIVEp5Z2V0SGxNemsrL1F0dkxVaDVsSFVRZ2p6ZjdCclV5?=
 =?utf-8?B?V0h5YU15a3VUVU85ZnM1UUhVUFhsYkFHN2d6MW1YQkEzZlUyTkI0WmRFY3pr?=
 =?utf-8?B?ZTl6Q3gzSkVkc1J6aStEUmJoNTFMVmZDa2QvS2g4SVJwak53KzNtU1lXcEow?=
 =?utf-8?B?ZFJMV09qT0xJaTdaNThCaS9CazBOVllxYkl1cXZjMkFKMEZDSFlSUHVrd0JV?=
 =?utf-8?B?TlMvYWoyY1Vvbk1qWjI4KzBWRDV3bUlITHZDd1ppTmZENEcxd2VCWGJITlky?=
 =?utf-8?B?YnNWZVhlMHMxYWFaNWFIQUhUdnNKeXVaeVQvNzZuMkQ2ZnFRclFNOG5vRjk4?=
 =?utf-8?B?TEloVkNxN1ZnRkh5N0laSUdVeTRlZ0U4b2JRdnNHVVF0Lzd5eUVYNVBOUk9X?=
 =?utf-8?B?bnIvYUNCZWtLYytmcXd5Z1dhMU5IYXkzVVZvMkQydGRsdXk5SUY2cXBwREw1?=
 =?utf-8?B?UFF3RUtSQ09sZzA4UitXUFBLcEhhUXFqSElCSUdCS3h0ZStFVFI1Q1pqTVY3?=
 =?utf-8?B?VWZtb1p5QU9abXVkOGNjemlmTEZZa283V3JJSUExWWQ3TkRzQlhMMC8wVjd2?=
 =?utf-8?B?R0R5S1Vna1dDWERTK2YrdndvOUgzajY1ZHJUaFBDdzRFSE5RZWtaUG9sbHJO?=
 =?utf-8?B?MThQeDAycjN5cWZ5dlV2aGZLZStKemMxakVnd3VyaVpKSlRpeXRlaHNQNjlN?=
 =?utf-8?B?V1B1azZJSU9pWlNkNEF5Yjk3VjRrclNqMG5ibjQ5UzBBdk5XOWVyeGppRzEr?=
 =?utf-8?B?V1FINkRYZ0p1M2RobHJlUDNpeHpSYzA1TmVxNGlOdHBSRVcwV0QxR1FmSFgy?=
 =?utf-8?B?ZTVOcjR2SlJMNnJoWDE4c25vNDEvZnErM3JtL2FNNFo3NHdzdmRQSVVVQ0Rx?=
 =?utf-8?B?M0liZDJKL2VUbkNmeWdaaTQ2RE9RSDhyeGxZYXNKRW1xbWJMb2J4REJwY3Ew?=
 =?utf-8?B?ZTNWd2xqYTlKYUkyNXJ5ZzgzdURwSlM4UG1ROENhWGNUdWwwaGZtWDRLZUJa?=
 =?utf-8?B?Nmd5bjQ1cG4vYS9JM2FYcWlETVI4VDI5Zk00UTNIaUhZM3NqY2pPdHAvNEM5?=
 =?utf-8?B?Y1BEdUJlblZBOUZVQXN6VlRqQlJ4Sm5uZFVYQ0IyZlVQOUIxd1pvSUloVmVx?=
 =?utf-8?B?TFNTcHVqbTJLT1FqbHFjaWpSNzMvQUZvTXlTL2wveU51a0E0N0pwZ2pQOTd2?=
 =?utf-8?B?bXBjck5vVHB1V2Zsa3RlUk1zcFA5Vnhkb3lMbHU5VjZLaSt5OFArc3o0bUEx?=
 =?utf-8?B?ZTN0b3FQenhueS9SbkFXNFRFVW55TEdRSnlhTmdkeXJ2MmZYMWp6YzVEN0wz?=
 =?utf-8?B?bkh3bkZCM2FETGdUeGU1Snd3UnEzdkUvdkZ5MzJWWVdBZ0pEbGg4Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa2968f-8139-4538-ebf3-08deebd7c01f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 12:08:20.8516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0Jo9jLc7aHwrFf1Tdn0wlHAjRpaIIpMHnJjQ20nDv0aF2xS09433nBquErIm3+nARV/Vx6zn7oVO0gJvIbLww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9563

On Mon, Jul 06, 2026 at 12:38:08PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 6 Jul 2026 10:34:43 +0200
> 
> Scope-based resource management became supported for some
> programming interfaces by contributions of Peter Zijlstra on 2023-05-26.
> See also the commit 54da6a0924311c7cf5015533991e44fb8eb12773 ("locking:
> Introduce __cleanup() based infrastructure").
> 
> * Thus use the attribute “__free(kfree)”.
> 
> * Reduce the scope for the local variable “ret”.

Please don't. Let all the variables be defined at the start of each
function.

> 
> * Omit two kfree() calls accordingly.
> 
> * Omit the local variable “size” (for another memory allocation).

Please remove this change, not related to the intention of the patch.

Ioana
