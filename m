Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1AE18FDC8
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Jan 2025 10:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737368454; cv=fail; b=Pf7m8tYRo6sYBUcosZGebh77XXWUgdMBN7qWLCEPyc0TUseILwwfnykIGvDtKxw/t9bYt5N82Bl4WzX6tiRVMdArNnArSDFg2AtTdB2fzZP+owFDsfjWJlJjjaRJwNoSMwe4rKo3LD56ua0f0omE5bqCOwqK3+iZE/crvOhZV60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737368454; c=relaxed/simple;
	bh=UsUurLqHgST9TPi9p0bZRXzfY0Sol1dKsDdEKdSPoOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LH/gKTH7W60V2MdDC+sSlq0pM5ZAl5nCN+C0lqDZ9DJWRwfkvASmFW+YgCpTjTWH4pJZKJMUUttIxoXkXSp95LmC/1reqYKcywKA3oAq2AChmW+1hmVWwjUmznCwTp7k9hfCdgqdhSuCkd/U/l5RoqugdvDgKQ+thypUJj/TShw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ikf+Bxl3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vYbpmJ+k; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ikf+Bxl3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vYbpmJ+k"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K7gFCh007299;
	Mon, 20 Jan 2025 10:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=fLd7VecA9DRJ0jIxHk
	PRD3e8afAVQf1mjfrj1Doj5WQ=; b=ikf+Bxl31bmi14/+hfiDOHTuHwcAAHgtnY
	6PMeZdBVbn9iexJcr3jz8BqLDYHyblma7p54AcVO/6SCVjJu/o3f6xYSBgBe0W0T
	CifyuQzLP0CUXJwrUxldqZS5MZEgjhSS9mwAbTXtwneUJnGJjpF5FpH86L8ENVJD
	mYt8jppr97TWpW/a0x6kbpMM+VOvsYHx6B7FM1O2mJXewOeCkbHiSwAop3tQbVCZ
	KDN0JKkxJcxm7IsoHRhfArHs3Z7LbmTo8lsKNzCdg+u8EAmXajAFD2b+5gBhkX8W
	Dpq3wICyLATCqBFYLzNcQ9+0Llc4iWuGjI6bEcg1Yf499NCOJcMQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4485qkubvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jan 2025 10:20:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50K9eCRZ031187;
	Mon, 20 Jan 2025 10:20:36 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2047.outbound.protection.outlook.com [104.47.58.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4491917096-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jan 2025 10:20:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+is4GvjEssbNXdZu3DwOBfcRfILZfSnZ5b2cbEgkroAPUNe50Ve3t6Y9Z33vq+wD5SIUpMH02SUOQ0WgWDN2Pv3VkmOIJIscAIfWGlijWUXZPew+SwtUj63nzf7I+IzXGcuKUtYS2igpuQyKetVxbFwvM0U4q7Uf5q1H6TcO2UUok14Sa0AsnsZ2j66QwWY7PlWAIlGY0wq86oZQIJAD869mq321IVbtuNw0nFDfL/7PhN7KVxDiogKiFdCgE8j9CoJhIspAAcsSvNojPedV7Pnn4z6zrN81/CFW0zgYqOVJnXHdF0Jx1jH/s77m7J3yQ/VPssOlrvRYj4LjAw91A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLd7VecA9DRJ0jIxHkPRD3e8afAVQf1mjfrj1Doj5WQ=;
 b=S6gFfzr1RwBqeMSWvvFyh592j4bTvwoInwr7XzPXo17Lf+TcBeQzzU6jKA4Iusc6R96aXzHocKkj9AYdxdxK4rvdao1aYhbBVOj/UtndzEiU6fVfUAh3KAig/cE0AnObtKXGKll8voAMdwWGSXF8YoGhWponxbQhWAPaq2UCTIDIgrQXFJdza6qpagBZFd+gvd9t3pZneSpsasjoF79R3AUWEHyxGBUSaGzjikxnuUZl5Mgm3Pc/+vusRsAu9ZOzkPIh67IU3lF32yO5mY5iK+r+dlNOoQhOT89w0GaHtteudToE6JddDAmyv4HWRTWS/fEIPxrQ8pN3YJRJFg6DNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLd7VecA9DRJ0jIxHkPRD3e8afAVQf1mjfrj1Doj5WQ=;
 b=vYbpmJ+kp3nVmSWqTRxw+pXX6wZs6WhSg+MxcpJocstWMAgUe6yD+c0kY18v9uwOEMN4bo0adubU+P3fWIfG2gKPOB9YxfSekaj/GH4kmiENOpSTCmAl+5mhrRNml7nO8RmF9Inij+e2mAK6uTj/iQnOQRzyp5f4fKJgXx7Jrmo=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 10:20:34 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8356.017; Mon, 20 Jan 2025
 10:20:34 +0000
Date: Mon, 20 Jan 2025 10:20:29 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
        Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        kernel-janitors@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
        Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>
Subject: Re: Bug: broken /proc/kcore in 6.13
Message-ID: <949930c4-d5fd-4090-acee-b968eca42c07@lucifer.local>
References: <9344a80d-4e90-4190-b973-e3347caae87f@orange.com>
 <4ec77bfb-16eb-4fa9-b486-8d2db47577e4@stanley.mountain>
 <246d95db-b12a-4230-ab8e-b81067b4d9c6@orange.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <246d95db-b12a-4230-ab8e-b81067b4d9c6@orange.com>
X-ClientProxiedBy: LO6P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::16) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SA2PR10MB4684:EE_
X-MS-Office365-Filtering-Correlation-Id: 9076ce9d-bd85-4571-8883-08dd393c1372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y+92+3RYFkQaEYfrnsoVp5FBOBWmV7zNS7HKJycLlONpQsrBPydM5jNySsUa?=
 =?us-ascii?Q?eKXI+XBQNtjBsXIhNb8u8cztd+RKYJXuSyvHt52+/Dku8TmeCOVaZ37NkAuK?=
 =?us-ascii?Q?rOaYHkvE76HBPUAkTOAPRTZHVjItfzqDkqNEwm5WEP5B3a6hQMC5ZS0QHYrP?=
 =?us-ascii?Q?52xPv2d0/j5fTKx8amkC4EWW+hkYxoY2NYE6NlCvSIX/ZnVNouaJWZuE9TD+?=
 =?us-ascii?Q?nv0UqhvXHvmXy0wr0kdlCrU5A1SSFiI7ZeDjCZ7qnuEVNhyHUECUvRTi10WK?=
 =?us-ascii?Q?ZGHeA90G4t+tmmxwOOD8WhPfW/yd970aa+p62Dm4fcXz04GchDe+Lyr/d34P?=
 =?us-ascii?Q?r6TM6uQnSm3/TD7/EEccsFK4Q0DeTXoMFXvabjs65um9uBH3PTmVnpKn/CIH?=
 =?us-ascii?Q?BDyzpNlFYpfeHzIIdKKgtDetDy4YYRg6wZ3h+5jKfSrLXXOs/a2nMWCajFHL?=
 =?us-ascii?Q?n24vG0nCvD7hBloEFVCYGBPhp89n7Elr5hO7WZyNdricMI7P09lPGjzdUIz9?=
 =?us-ascii?Q?dwgmiO2TgpaO35LlfWIng6kbciCLtJxIbPh5Zt7odE7tFgeNjh2mvsFJ96+r?=
 =?us-ascii?Q?ioXYS0XC4QFjxjh6k884hfzVADBEDYvmw6Vx3gcpXaoB9Rf+pgkAk4Vrwbky?=
 =?us-ascii?Q?c7kHod4YWZ6WwenIQiVvDTchMxCBqoyNN00sFDuifnFioMCry61Hp9zj6hmq?=
 =?us-ascii?Q?xFn8/11Ybi4RVJtC6wAaytc9I2oK3eo0rIoLXB5y9pK8zdOrypJIZZvKYfBt?=
 =?us-ascii?Q?cX/xoZLuynEToZvOT7c+myxyPkuadULThuQO5ruakQzEhbHxe8/BLqR+Bv7y?=
 =?us-ascii?Q?UBHpAMtRV383FWyAFWnJibms4L2i3e3Dq2juhH/9V2nVpsriEHJqskGjyEvH?=
 =?us-ascii?Q?LNghk02HMUHEt/yD+KM05Jclm7CYJYzSYwGRkj554NNTY5NZko2UDrlUpuWs?=
 =?us-ascii?Q?qSn7wQnGYtZcrzkqK7t5SXMRUEkSYKBR+vXQ78mBbcH5wcgpjD2AsMa28MNc?=
 =?us-ascii?Q?69w+o7op5U3d4ANZTYJCuJH2aDz6L3KjgS91kW+HIn7WCffNLPluAgymabZ9?=
 =?us-ascii?Q?KeZv0NX2EtKfD4rWZNhBeuVoG8oqdEIAqGfc37YPe1azHFv5vquyLHhLnBcK?=
 =?us-ascii?Q?CBW0kCgyKST/SWm7w8Cqq8LhmULJOkRmw68UUFelGxl/yUviciYHwIDc1rKV?=
 =?us-ascii?Q?1ZR2jlYycsqu5NDjXF5ay9kQ8s2pJ7olNhr0/Vk5SMWvHKhAHAWNm1QbhGeT?=
 =?us-ascii?Q?wOHBkFF8oFLAQLCf2zAIbRxYMCOqEdB8mZdP+rdg2rG/SQcsOx2rHdRrE1K0?=
 =?us-ascii?Q?YaUfcLAzSHLFmdYLU25s4MLP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4ZRvZ+DJDi9Mvf2xxnbYuweoolNQlSeJyYjEX799fIyvhg31iTRiXXaK8+qt?=
 =?us-ascii?Q?ymE3aHpTXR2lXZ6zvK3cVAa1/J5pOqbwxyKCm/wlFyrcHOt++iSUUh/jDLBP?=
 =?us-ascii?Q?PUCIl6N22xsfMQ5c5mXgFZrq9Mi3SdNjvw5kODK7xRzconXSzkYQzKjQAXzC?=
 =?us-ascii?Q?ffvHlz1eS2Y5348lxiCgXv+Fwmea/1XWF6S4Fvk13H+1+V7R98HMYSr6FMT1?=
 =?us-ascii?Q?PVGgRJtiqxNqFbpTXXVEX6Jn1RCMXAHYcqCKdqXH85mn8eV3DCcKvwSW5T8w?=
 =?us-ascii?Q?AF8FysjgiwLGsNccpaCF+xM7fuFAuEF97lpxH/ElZuVC0t4p6khgCJnFUC5+?=
 =?us-ascii?Q?6fC8inhdbLvWu4pq/YykuXPADh71G6YGyGJcEYff3htAGQK+DvkfcpQvWix+?=
 =?us-ascii?Q?6+3teustJx5Houdy03SBrShMsK6+4JKGo0SHyIgEXM3kajt6/wTvuS4/J60T?=
 =?us-ascii?Q?jFEo2urmMZfHWJ7Ge1XhSo5bixt9ychCNnh5zd6eqItLe6F0bXx4ly8SUSt8?=
 =?us-ascii?Q?Klcm/cV1RUndO1booPdRdHGqIxKhipMgBbmFDFKzp5lUidEww81L1OLZPHw7?=
 =?us-ascii?Q?IKYCjtrI7M6srcJxJW+5yioF8BQFd0utd+Et2u5s+k9VOzGlsch8HR27O0M5?=
 =?us-ascii?Q?BX86pmuGSq1N0fbobudRoapDT0Q7TEwxpCOPEmOwual0CwM6XIEBKH8K6Sju?=
 =?us-ascii?Q?+bMwJgbz75aNDRBnZPRpU8HnvyI+z/c7W4I4V0tfGPicphzexvkF7owF+O7S?=
 =?us-ascii?Q?mEqfVu5I3ZYPsoSxOcBdS/Co8F9OZr25drRDmYvf37QOEIthqx0dDfGkZ7us?=
 =?us-ascii?Q?w96d7IUvWSxVv/m0dNMT6xEFLPtDdSe7zZk3w2bnV8DpKbwtUHJJjQ367M05?=
 =?us-ascii?Q?F3zbNtpaebzQslMIoKEvSkjXO/vPEFfifyp5xN1tM6Q/ONKoGTiK5l7jHRy3?=
 =?us-ascii?Q?MdOcaz0mXKcLSQP2rIaFP8vXdF4c+H6GSiNCbHQzQyi6uJdkPoVW8fVebS36?=
 =?us-ascii?Q?WCvaGzWZOM513nWic9a0uqsmsFj2KFxZEkmmPZt0C00x5c4AppQ36bTlPrm+?=
 =?us-ascii?Q?46NJjfVI44Oba2/QdG29pToJBwZ58uv/l70LWg49kfaAeyEmX6gOJrZA8hXX?=
 =?us-ascii?Q?CibmcmjvW3XtlHtFRj4u0BYCdlkXRPfSjwFr3J/JHCBHZQnbdTWk4/cpra5I?=
 =?us-ascii?Q?oCEYEWusmQQzGccYphDIPal/VhAiaz+6PWluuFITBt+Rw28khBexT91u97ky?=
 =?us-ascii?Q?wq0Ni3WxXeddu9QjzTdK4VxvRZS5Hoj0H8244KzXPKs32UCaxyRFtnLD0eaQ?=
 =?us-ascii?Q?9h+E4ZCNzIq2K0lsfbwyfier+76fg6rkjW9Y7cm6avEJckdtJ1Ve/RjE/6my?=
 =?us-ascii?Q?FD6+N2zGGwkYNCyw0s8p1uLHeGjnhbTtwHrf6dLgfjLbd75p+nxq1FiF1Zsk?=
 =?us-ascii?Q?Gvs7aqD7hkHt+adzi0g3yaabceCicjupOkGGLeQgfXk873r1FsW/JCO6tbxl?=
 =?us-ascii?Q?eOBojghncMbFtdogikV0V6WP2NHV8vgN/5Jgbvuu8Z0AHdqAnLl0c9/+l1Ye?=
 =?us-ascii?Q?AV9z5l47vIiy49X4emlg0YIaM+6G/2YOeeoeNpZN1oFHMyrO3hBG5PFb6t1c?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	i8cmJy0oz5Ca1eos4iZBs/MXw5KVYRqVZejuWs4tzxHEUdLuSLZstdfbg3vgupzY7Mm9krmA/1nYwi7Ed/eYPL0tuXFpNqjBcfn4nb/kvfRmNH8BGyc15Wm81kiKQXhhvNC+DH/WGrXxOslknJJfceY/HZYmWvMbGZVCuqInxGK5Q7l6IpyZvJ3OCDlOeTBFS1MutZT6V9Jk5k644j1iNeritduVb3IY70cSKVHcpfbsWS6QFtX3S0LqTsEDs2kVJK8jqfewicgO4e2kGphTPwAABNh3+/NoLQj6dScJgGQJUDcK35CwKPJ5P00gJYcWirUz1C1Xe7ViH+HCB6LfJIwZUhBHaI/tj4aJ0nLLJaXlLADl60b9zN2dhVRPMlnBdY70CK3FNw5+tWZNtkmtTTa73P9pJ/oSDlaYCqjOlXoz9GmmFiswMhG2VnlVnmlSryD9zVYKa2cFz94iruFRuxTVRMtv60ejmobRGkTbG5J5gtoeVXJyBSDCFyiVQahcb6UP5cER6rDoDCaMSqrmWRmpo3iwpbEy0Ltuy42GG3q9n2UU+3uFuWkJW+MyF4lst9dJaZ1FyzKI7XdlSPrltqNjr+di/n8FKly1WpQURpY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9076ce9d-bd85-4571-8883-08dd393c1372
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:20:34.5943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c574ehpBqkKehxtTmOZPOVcb/RfxED/DKythQvWT9fXhR+3ZKbCdn+npowRelIlBsZcXXHzgloat+2MMjlkRSs5/DM2PUWO2LkebK93RbhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4684
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_02,2025-01-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=790 malwarescore=0
 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501200086
X-Proofpoint-GUID: z55LBvCYukFuikB-5mBZrwhKOHcfyB3x
X-Proofpoint-ORIG-GUID: z55LBvCYukFuikB-5mBZrwhKOHcfyB3x

On Mon, Jan 20, 2025 at 10:12:20AM +0100, Alexandre Ferrieux wrote:
> Hi Dan,
>
> On 20/01/2025 06:27, Dan Carpenter wrote:
> >
> > Thanks Alexandre for the bug report.  It looks like you're CC'ing a
> > bunch of networking people because you're debugging something networking
> > related but the actual bug is in read_kcore_iter() so let's CC Lorenzo
> > instead.
>
> Yes, sorry for cross-posting so widely. Of course this issue had no link with
> networking, but I was in "RC7 panic", fearing a 6.13 final would be cut out in a
> completely un-debuggable state, and the generic LKML is so crowded I guess it's
> easy to miss a needle.
>
> Anyway, Lorenzo did react with record speed !
>

Thanks :)

> https://lore.kernel.org/lkml/3719ee8a-38ef-4aaa-aca4-b6d82df51661@orange.com/T/#ref533860e88ab6ed1cc632411e76178797f1135e
>
> TL;DR: this was a side-effect of unfinished work (not in kcore itself, rather in
> the memory protections around modules AFAIU), that will shortly be reverted. The
> quick fix until then is to disable ARCH_HAS_EXECMEM_ROX in Kconfig.
>

Yup this should have landed in 6.13, it was scheduled for an urgent
fix. Therefore there will be no actual release with this problem.

It's execmem ROX that's the issue, and how it interacts with removing ranges
from the direct mapping with the kcore code not seeming to be aware of this and
breaking.

Appreciate the report and attention guys! :)

Cheers, Lorenzo
