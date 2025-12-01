Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABABC30E839;
	Mon,  1 Dec 2025 12:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593559; cv=fail; b=lQQlnreBwp765NGajxxM6wPL2O6ddMHF3sIUus4aVmLyr4RAHja8p7Q9C2LL1pF3LXtzaQJ499+Q47k0H0/eJC3NcRkOfIMvcwV4EKx1XwAMouVQIa7rCVS4X5mhx4doRuXGzYrXxtsde7e+shrTx+wAZZJ/VgCB1Mfc3q34g4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593559; c=relaxed/simple;
	bh=7rZ2mDBxF52yXXX/gZrp4EfOWJYcgbTR66pWywGx7V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eE0yNAgkK8scfbqDVOsAqF3cqjx1AYbZ/8zQmkNjRWbt/4aX8lBjdmsvlL4zZsvYQmUb/5zUlYB2ufG/aFiCr5GkvpKIccqqetfCdFWSTmIWbn+fBtaSf+Nex5yfgbJdrwn39FPCOB43ZJFEsZsnRf6/jDVXUR9abziilT1PmhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fVvHzBFp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=smP7gPZz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fVvHzBFp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="smP7gPZz"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B19DbS21588558;
	Mon, 1 Dec 2025 12:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=XRijRCv3QV4d+04ucq
	7DihncDzO7H4j828phkdTxkDo=; b=fVvHzBFpd+ygIe3+m22/zIHUhQydFT0bYr
	Jhpp0Ff7JoxnR9ziO9oZjCl0ESGSPFzve1AKFiCnSR7ffe+n2RKSVlf4a1ETPwYD
	aQuZf0pWTuRK8eCTxONCGFw8dGVRtKuwkAG/I67MY6XBF921kdb3wjisKnkXQu4A
	gAp6v2nMubrxFH8Jk2nM5MTJKCcz5GShz5TqaXB3UgLoJxZVK37SGICOPSg2Q/bJ
	bubmEpVl0L5O3LWeRPrSwl+kylhPYTt70X+vDKLphEmW7yFgTOMv9TsPuu6r4/JR
	FYFeDZzUFzv/QKlUkVWhqVjt7r662d2se8IqEAHWzRoISU3QT2cQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4as86y8bdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 01 Dec 2025 12:52:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5B1ChukR035444;
	Mon, 1 Dec 2025 12:52:21 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010044.outbound.protection.outlook.com [52.101.56.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4aqq9hyt8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 01 Dec 2025 12:52:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKUmT0DoIPVSoS1HqNcKXY1j4VxvZh3s4V2GqvchVZ9dRDoENqW6LienrrI66aJpCZWY5sn4jh4rduM6dgpZIoynh6sDg6fpoTTRS6ZciVWRmglfx9wJt06IDtmcMWBtkNOAfTADW40FMbs8qR3XhRSvmBdaMuiQR5FPPRpfaHZ2VIZ9Ae1EYSPLT7WzZHNQYuD5X9EmdyfR38faoNhH/hKKU5BBVEoqmMgjWNkdn2fK//DU1BM0NiXggyJQdHGnQl3l5ZhDR1ZcSOMCE0qGZGEneb8DFz2zR/AMj+cvad4uKWJrdGVBbC4OW8FTy78NzkEDRBA1ln2gV9KrxJB+QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRijRCv3QV4d+04ucq7DihncDzO7H4j828phkdTxkDo=;
 b=I+9Jw3QPST1Zx5//GBJ2t0ZG2Ll1DnS8HyQnDxwFhPkd/tf9IdIy2X4D87mR0QMc1pQ1Tg397bw92x5jTmIohvvoH7jOsPSuJm2LYo8SgqRPwmZA9rLLTv7TPSyQJvwiDMu4wCKpS3hDOFMVPuPlVTZmh8QDSqJ40/f2IUHPlsqhO6i5+I8X+4YbBLH6l2gxqfjfFoZEF0Dgy+PTKkTscDMjUP2dbkgfxRxVNhB1HN10FHbAAxC24uvzbieY9ClRlop2VpW6T/V/pQr467eIR+ruOuY4nAJGr6SmFMs5rUKbUNll0slUgDDHZRN94BXUTaeuMyrVX31eMYZRvmk3uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRijRCv3QV4d+04ucq7DihncDzO7H4j828phkdTxkDo=;
 b=smP7gPZzMQp4KcjvPRRg5qKYkJP43DoIE6OnVmV/VUVFgTFA93JVnTYmD7SKYwR0hWUdltNIp+w7FJniSAaLKGB41b4RW3uzxvpdp2Vi56Favtmdu9IeN/6W+6A32vDYMTvEgreubmxrPTsZR8ErbLXICbfL/mw7koDk6flGqag=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB6355.namprd10.prod.outlook.com (2603:10b6:510:1b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:52:18 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 12:52:18 +0000
Date: Mon, 1 Dec 2025 12:52:16 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Alice Ryhl <aliceryhl@google.com>, Pedro Falcato <pfalcato@suse.de>,
        linux-mm@kvack.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] mm: fix config option typo in header file
Message-ID: <69b45ff1-0d24-4951-96a9-8a550afdacb4@lucifer.local>
References: <20251201122922.352480-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201122922.352480-1-lukas.bulwahn@redhat.com>
X-ClientProxiedBy: LO4P265CA0214.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ba796d-c28d-4dd3-cf1c-08de30d87607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m6gyDyoJfFAcjuIjd4l16IJjsZ6aST7s50g+aESaeQtgnZCNJbsSbvJIt51w?=
 =?us-ascii?Q?mhY4qlye8l9QWH7788vO46EyHkFCGpCsLM6PjFywdJQVi/iYNJbCqSBRtnq8?=
 =?us-ascii?Q?yeZD5gn/9qKhny16TH/CfQ/d/MF9syiY+SQGbvMJKQCz7wYu6BbppmjYEClX?=
 =?us-ascii?Q?5ICt+iHSclSgiXX1Hj2vurDOuySAC1iO4tWbyMm/UGmeCtCJvaA3W1fRf6Y+?=
 =?us-ascii?Q?Wm3yzblh+gURCuvONQ69nMQjFAjdl/3WUGTY9K0Q3VxWRHvGdZl3KhSJFxca?=
 =?us-ascii?Q?gU7kHdGZhakN1z9UYhlasD+Gfc/hbwcH9WFBJiFCEB9L7mKMSvauO2pridlm?=
 =?us-ascii?Q?RLL9kSYmN911XyGzkzsyZ/2Z0SXKm6TkhEh5rvrgWTVPJiFvhOIZ9TXKGDC3?=
 =?us-ascii?Q?TF9fnOj+nOc7F+2dfonsQtw/RMAL+KCs2M9hWeJuTZVRkib2WQgbob2i2zum?=
 =?us-ascii?Q?XBttDzK5v101SPey5y5+ZwZ38kE7tQIb15XFvIbXzjqXeVIgvzi4iyr6xXHJ?=
 =?us-ascii?Q?J0Y93x0a7hRI7TFKva9B5GFSOIL4grjmSkVzIB1aYuomm/4cUKSW0ZWRs7kg?=
 =?us-ascii?Q?MB2JUPJ0jQIAwy3/rP1LYVl+U0XomDRirdpNAxGO2ruMJ82KbBN68yXm+UsO?=
 =?us-ascii?Q?fLg8UkIVgSNXIchzvPYz83vGdskkNl+J9ZNtB5wKprntM1ceR/4aNBdYH704?=
 =?us-ascii?Q?WxzsK1VRQlNYMo2KWZctkhMdPp7pI2NkFkgtWBZSteWTGkzQs0KuEtTkKicL?=
 =?us-ascii?Q?ciHLo9bwRU2o9SO6T0OdGOi4FOsU0ygoCMQ/yXGplrak/KSZlwj5V9skWuxD?=
 =?us-ascii?Q?PURb3g68pkJwOXvFV3U6repDHDDAuseMB+4sARqUaNkSfwKa9Y+WU8E3ZCJw?=
 =?us-ascii?Q?x0pOj6ewiXoVTiIuSJYTxnJLZ6kPG8d9vhpN5dEWMQ+04Zr7KPwRsQwh70WY?=
 =?us-ascii?Q?GO/1SQ7/aEU16eWHQ/i4NL9twF8KCCnWDy1twnDv3aRKTueKD468LIHGSu24?=
 =?us-ascii?Q?O0NSNfLQMB6HuGLw+G6AXuU8TCW2FVvsHQnrjQBZDEvjpx0Kko0oLTc4r6/r?=
 =?us-ascii?Q?ZLHZooeQPuK+Q+8QLWW4vgTKyP/vwcH8yrdTPvOcw7mCVF79wzmlNg33a7OF?=
 =?us-ascii?Q?hTn3Jrai6lMhtHFXroFa63/n2cbIbnFL7PbobLVo9BPm1iKFPq1xGoroAO93?=
 =?us-ascii?Q?DGHF1Ha/X/gzx3GUCb8cGZB4oX1/xfVzmVY97b7QThMnsSEaOb+qvv80iYsU?=
 =?us-ascii?Q?g2pQlNc2V5FDxIXArtQqvrTLKLZVJQ0Z1Bhcr9vepKINBWRJcjcOI+Agq8lx?=
 =?us-ascii?Q?GGMQBQbSbBxBgLoomLPKrxr5rjq278RoKryrE+pybr6CO0MryGH8w1H5Zac3?=
 =?us-ascii?Q?vnkHa4Us2Tiw5fEHC4Qo7qLGzHI09NnBI33NQYTaFj5km9H5UnJgrQvBrXgv?=
 =?us-ascii?Q?Evatf0pT/rvi5gXPZji3DbZRR0FoNGwu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JNdA1OAq0QuP/gUDRk+kVJGqmhY7/xear5h/rCJrO/wNF18bIQGS/TRATBUy?=
 =?us-ascii?Q?Y5W2ZlAHx8rMp9B0PhPnNBHiBuoYHEXR13uzHaka83n/gQFZXgp50a41FQMc?=
 =?us-ascii?Q?LRuJnf5S6uTgfnwWV6KRosfZ8yNFUVGNKM8X9m5m8WUuHcJ/S+tr7DwK/7sg?=
 =?us-ascii?Q?6Wxb+0bTlTtoW7ilbPtDJ8aexShP26QR2YVHGCkKUFsmA6o34CacHln0Ywjv?=
 =?us-ascii?Q?BN5t3jGrtRXk0Lp+gslosm0mUDnogcJT8AWS7ebxw3kHnuRsN2EdraebwOxd?=
 =?us-ascii?Q?//Wn6HryO2tg//mXf94UDaKpkfROltFIzguXl7AX3Is054MaY11n2F9k1p7f?=
 =?us-ascii?Q?f8sGy86M8kVr/0ZpPizu9SpGCy/3B69E9MD0y3gTeOVetrRNJZjmac3EkyB3?=
 =?us-ascii?Q?ngKvvWMF+HHaF39GB+cnKDX7gTZHS8xTzjmAYyBJ4Lq4xGGEK2mPEGyypwYb?=
 =?us-ascii?Q?JqLXSO8FdFEeIjnTdbRNjvr0Z6BVcCE/Wd69s4zj+N4pfJc71IbXenRgyBua?=
 =?us-ascii?Q?3VnxOe3+eeN9EDB6Q8alTAp2UUGvCqsDCaCdWqmBITjVnktuaEWacbaRKsxo?=
 =?us-ascii?Q?ApH2Mw1E0+lzb3sevrqB3Khocr6cfCp6cfasqA8JFxd8r8PsdLmlqFBJG38I?=
 =?us-ascii?Q?F6YsAkDC6DMs/o5wUMtJzMDq016Y3Pxkrf69gmQGk6hk5ecwJDld09ingjWK?=
 =?us-ascii?Q?exFgBHf2jMGGHZ3Kora8MVcPe4osTkZpSqLauXtu6M3cgbA/WsqvBnTqH7dB?=
 =?us-ascii?Q?xFY0Isml4UeoDV2Rg7oy3V39WqU/sJr950+hURM3bU8AmKELo8dcPLGlwi+s?=
 =?us-ascii?Q?D/m0ci3oHcBDseCZa8qqzL65oqe6zTGPluWQn6nCpfmTSqtOWumy23JvyWJ5?=
 =?us-ascii?Q?ftEXfyVemg67cv4jNes0Ej1WDC3VBNBpQMpjI5YvyLzkr1zSnlv/Af2PnzHZ?=
 =?us-ascii?Q?YBy7ztKRm8AHZ2pBbsItRH5UJKfnU9+Z//A42g8XlrjPgp1ZHO2nZux19OxH?=
 =?us-ascii?Q?eAl/3BiOdQlU2NO2Xq4PkRSL6457YO2oYj/ODN9aQfnRC44b+BcO/EVj0nj7?=
 =?us-ascii?Q?oxZ6Pn09quvHf2ZntJI40iaf2ra727GiZbJ9F8AcTXZ4sbCHT7pYY1HGICnh?=
 =?us-ascii?Q?OqhM/EJIkqUdihDPpceMZVHYcSxqWNs4MEnuiJIGiO46w4Dw8PtG0HfnmiRQ?=
 =?us-ascii?Q?I8MRjEk5ROLPQzCkoPyV6F40zCwdc/ZKr7eMAl94GVowGMxZA0hwjYUhMPc3?=
 =?us-ascii?Q?+TeDuCibdaLJoUZaXSBsqU1laXmc4QeuORlSLwbH35VX/PKA31Tqn8Sr64fX?=
 =?us-ascii?Q?RcRrSQFrrwxNrLUMjsSu8zyPq2eLXl7FinULq7rGB2LCMieQzsvcGtVMd0aq?=
 =?us-ascii?Q?2h/RFL5FSDm87m1PwXndAYA9IvTqDW7/4GIni8NrHfgSqrwE4QMf/Cr7F/Sm?=
 =?us-ascii?Q?plvR466LRXu8temsbbaZeUFegtM5dp1yQ6GBo3MgjIdepeIMQYnGSGCA6/I3?=
 =?us-ascii?Q?rKP13pGJp/pjDgqkksS3oZ+N5Me6f0WcQzXy6Gwi6yKj49Lm+DQoluWgn0tu?=
 =?us-ascii?Q?MyA4w/orX/xnrh11W9DpM3IhbbIY5sbvSC+Fu0ZQ1aESklWtPwyqjV0kKF3M?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FfKnUc4uuCHIlgGRD0pKAVqwf9We82Bp3lh0uCtH2s4aH8hnL0vj7TEAWhSIYM74Ls9ha8OyecfkLFnmkQZ4aZuP/9dr0t4iGnnHIKeBwWO0wj02E6J0GDLQsHT52L8vm8Prv/dlD1i0P8jfobcOJKdqEiGoSmmzzbGewRDtayxuORQjORdeRQLw2YZwPhCM5/1kOqV8jLLf8ZeIpMBN4BUcWOuHGrj6dxAUYGPyndQFVqNN8luvBjorKFBn9chp9clJhy8yC9jRtgQkgYS4j5sS0F0+R3tf5PToSgiZtV8icPMyrZKrXyfcBHOA81NA3n1+7/pnsRO+doeXEsB6BSYCbfxwSeChfrkGKW2Yi5Ml2FzoKTbPdAVEaW+5UXveWtxz8LJqTkTDj9mBWYLod3reFchN61xrp0NsINqzlpvEUBIueEx7OvGlSwTeXLCeQMHtqISwjp1wFvm1BlPLdCIXR/M5Da9W8tTLdtPl8RgChqMAyyJnaTcCaN8ow8pIB3k/6PmqPkyZESxPnuMwg7TbZAIZRl/PR+5hte0K5KA557/ojQI3Taz19XgG9aJqrpSrOq6n8BXQ5dUWZjO0dmJeiAkRqeX0hu56qAHcZFU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ba796d-c28d-4dd3-cf1c-08de30d87607
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 12:52:18.5231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUwkDZeeUj/ovTNtoJm5W93lY48f94LDOZ/YnJp25l/gC0pIVYYzHe+q1chIMe9eJUGfoxfeaPFbEaAfwsEwbLZfhXTu2ccEuAzPyAhweiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6355
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512010104
X-Proofpoint-GUID: 9N4lW1jouqSXw-ClM8OT5bo9tGXj_u3K
X-Authority-Analysis: v=2.4 cv=AaW83nXG c=1 sm=1 tr=0 ts=692d8f85 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=KtwpCigOqbiI6tdhoOEA:9 a=CjuIK1q_8ugA:10
 cc=ntf awl=host:13642
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwNSBTYWx0ZWRfX2+c2X8CgSgEw
 A7q2BYBuGQAJKS3bSUfwzJGzbD/iARqhpV67REHOeoTFytGgYyc0BO4AUmhBPNtb10k30JC3vhw
 PHZls5XnqKyyWSCqqzq8Gxmcru5AsH4o+eOTsJleSVkQxG8ywhlNWKR8LK9alwtKCi7wSw+Rc7U
 VVb0Jw/rXV/7Fjv9SZgVuZ1P30yhUaSZBbuf3J+0Cs40c7Wmyu4ocCi/UT7gP61BuyWHFHETUDC
 JbTRU+qfhlUdWIy+5dUt/+YNrN7ckP9YtIrL9zb2FIDHaq9p6Kn60FCrb9LC1XOC3WYcdb+/Iqm
 W1idV2dQ1HEFvGFwOhTESiuH1VBFDY0HyXJbro+zCZ8FndcvyOW4dJliqmwo7E76MseOReyyorh
 I2HQLFb0yClJsyHgnMviaf3dzxt7py7jtFo2RE3z2ZxqKFaKJic=
X-Proofpoint-ORIG-GUID: 9N4lW1jouqSXw-ClM8OT5bo9tGXj_u3K

On Mon, Dec 01, 2025 at 01:29:22PM +0100, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Commit 2b6a3f061f11 ("mm: declare VMA flags by bit") significantly
> refactors the header file include/linux/mm.h. In that step, it introduces
> a typo in an ifdef, referring to a non-existing config option
> STACK_GROWS_UP, whereas the actual config option is called STACK_GROWSUP.
>
> Fix this typo in the mm header file.
>
> Fixes: 2b6a3f061f11 ("mm: declare VMA flags by bit")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Yikes, my mistake! Sorry to parisc people :)

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  include/linux/mm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 96acf31268ac..394126bf637a 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -443,7 +443,7 @@ enum {
>  #define VM_NOHUGEPAGE	INIT_VM_FLAG(NOHUGEPAGE)
>  #define VM_MERGEABLE	INIT_VM_FLAG(MERGEABLE)
>  #define VM_STACK	INIT_VM_FLAG(STACK)
> -#ifdef CONFIG_STACK_GROWS_UP
> +#ifdef CONFIG_STACK_GROWSUP
>  #define VM_STACK_EARLY	INIT_VM_FLAG(STACK_EARLY)
>  #else
>  #define VM_STACK_EARLY	VM_NONE
> --
> 2.51.1
>
