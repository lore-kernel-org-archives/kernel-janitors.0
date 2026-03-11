Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010056.outbound.protection.outlook.com [52.101.201.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26F9248873;
	Wed, 11 Mar 2026 06:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773210367; cv=fail; b=sirSpUwF8ghUxFn03uJdBE9qkVLlyjSjQQ6qxTl/Tfkz4BhZJHuKYktC4QkpTEebfkAWABDG/nqRa5iKy5JboJQgv+GU2xx60i2wFvcsBoIf8moRI196z3imNhxLUFgOo2tzEUQjlLhjklO1/MykfeBsPSNwnKHL9B8ZLqH3yuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773210367; c=relaxed/simple;
	bh=1vTPeLxD9eLHDxxdnhYAVy7SuFQcQtvOid4c0ksGmzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KEakYjXZ9GSpbJTDxwyq1cC3b4ISpajUvYxIsH+qvLJq6IpF5O89pyTEFCuak1REz2ARhQg/pbesvl784oWsMg6P9uGOQprLHXFlWNHZqlQVrksG35hfsniYFeMthbj/kyq6iuYAQke8/3Rq5nwY1lQdk7Ug5VL59kJLDnEFm/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CK/vOQZm; arc=fail smtp.client-ip=52.101.201.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CK/vOQZm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pM3wJXcPkUkL6Xawlfg1yn6zVVEwdlzleiWeLhWaESxWFv5iwt6icxkPwd2d0QvSlE1dBhpuv5cb9c+4ODLLJn6EZwn10niLEF4jzwbANYRzUaLMt2fpD2K/w8uKOxm+Ev9kAkUYBWTI0+VX39E4kbb9G1d6a8Ev3NWJwczZydtUC+upV7xpUx12ksa60F1F5f9Sjb/Xv9S8vsIW1cK1KnVZF+2Fq81cCW++sGC7ep0xi+mKDKu5SAmihXfZbuTRaQKKiimquaZA/FIyWxABHNjk6vcrJzw08Nr55dN9On+exm2O0MSjTKKIicAyBGiVILWls+wC8RotqG3JRR6iJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyP9eQZ5c6aBBHRzJU5zOKo80lbhNJXegU//cYmRcYA=;
 b=IMlt3yKMp+Nxp+lKEok/vSRt5bRlsR3tt+t4D++79sOJ1NqXqX9EA+72RlfjwOa35Ewsvj9aa6nbzTvuDDMPe+WPTdSZx2p4G5Hvkv4eXxHio0QibJNmdMlkyV24LGIi7fvMwtd00I7hMXXjzZdBmBzgDG76gSMsgOVsDZkmT+LSSZp6//PjsjWDP85ZWYFjltGB2dNVqhut8HoBc+WFYjBMido/kRKgumuJwWnfyrfoBZfeUbsDgmC2e0tkaL7yXgyj3vCY2ZjnrJK7+hgYO3bPvunoQM3CUNqqgPeoljc7tZLxPy4qGbNSfcbuUKVuHPeaU5+Qh6tUS8lf4l2epQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyP9eQZ5c6aBBHRzJU5zOKo80lbhNJXegU//cYmRcYA=;
 b=CK/vOQZm+JWLab9Bkh9NzmkUIo+Se8AZS10HUBZBv1kyYEl6jgd09y8AjvBK6sWqslDWXzUnYV1X04h2T8gU0SNFVnFTo8PGt+iz6M9k2bO/aqhXT5WEL0zghhs7lYw6gL8/NuXtj1C3WzH9UmgmzfFegl4b2GMGBbA0ocDqgm9h2F+5Be96fP2nHAPeJmz5Or/Ghocw76LC10RhCS5yReSxIw/D9nfuFRNDEoNZRQWq6Zd/Vr2GqLPpGsW28rWUa2AujFzl9uvacTj4T8BsI2SgTDVhlTXK3NXquS/u9AvWXIKsl42CMk3oj8WaSRNKod0Uu0rHqMFR70mR5lUo6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB7871.namprd12.prod.outlook.com (2603:10b6:510:27d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 06:26:00 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 06:26:00 +0000
Date: Wed, 11 Mar 2026 02:25:58 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Lukas Bulwahn <lukas.bulwahn@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>, Matthew Auld <matthew.auld@intel.com>,
	Arun Pravin <arunpravin.paneerselvam@amd.com>,
	Christian Koenig <christian.koenig@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in GPU BUDDY ALLOCATOR
Message-ID: <1773210317.4fdee550f80fd797@nvidia.com>
References: <20260311043314.265627-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311043314.265627-1-lukas.bulwahn@redhat.com>
X-ClientProxiedBy: BL1PR13CA0309.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::14) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e6201f-fc09-467c-84cc-08de7f370ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Pzwko1AxN0cAZaENnZsk4x6P5Jfcfjv+yKOqHYU88QBMmBjp0U4fJhSb67ka1fJqABnFSF7eFfZXok5jCztuXF9iSXAXTs+B06nPih5pW0renTFU3tGyQPPQ5HWK4EQMDbbTrXi1LXABbfUcf1W1Lbg1/Eks5xai1njUt79YDWPE3MyQfMJhu9mlFiP9lPftVMJopLZ7S0j1XiB3QuwCd/XrU0oIqGUsiqZXLL6TIBBBr2box+IjDIaZ4kkQqmE4eqbvtN7wwEV5M0bgVb3JHykr4tWcWUS5aIqxbpA28dMBuwL7mSFsPZMGdWoNw0p4K0xOC5dX3zQcwjka+dskYBhD8jxswglkcrwNSGbUXt4ulq2YYFZoK9XK1NX3piiACfDzOmPVbpw/VaTKvY6JKG92fN0Yc5XGFEjdCzyz2VtZMgvMDDcEFel4R00/s3qN8rXj3SfVLzD70N6qZkAayQG75zLm31Lamql0DqpFYUYr22rlvxeY/0RH47N00X/TxTuNLzCjf8++FYZpncB9KM86gqZ0hlcH6vXmwkqken8e+VriiAFdv1KcwCBn9AXWik5mlIy9sfc9T1j/M2eTWEnWFJG8Ak/65ytsjNGzctmsfiUygHgiupYW/dB2GyQ6MuGMi/OpH6Tfc9qgBMxVmNIjiAMk8yHG3q8V6AuGJMBoHqkzXX7ip9V6hRugmirVfTg0RQlvyMefqTHogacLD3008fvkaedSlIg81GJzYUo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MiiP5o4V9UoPg99jP2r9xuZAUDzy5P7feXoUqsLcI+zbdnjZkESO2gHdYV3X?=
 =?us-ascii?Q?6ENL/YSUm9qefd2HXAlwhTQH/nFdCZmgLy8GHbUklbBRD5NpKBZk/n6VkTqn?=
 =?us-ascii?Q?s9F5y22p5U3bT74dQNbNY84i0zEhmqqSe9DZGjhq9mb6JmJ/W+ds8B4q+x7c?=
 =?us-ascii?Q?AzUmAfukENz9tMS5PKI8MWqKEVWNgqYg+iCLlpaOVTi4TLA9HX5kJYW8sqQx?=
 =?us-ascii?Q?Jc2naS+QAe7bg26SQiypTm8Wi1J5Y4rhNgtCbAV0mjMSqC3VHcfgQDTTpvng?=
 =?us-ascii?Q?F8PNmsvJVwVbgEu2YwZWMxZ8FxH/Ln3+zmIjnbbgBV4/NFgnL0JF1BfS3nm7?=
 =?us-ascii?Q?7AsPz1yTQ/9Zh2NmbuCuu+EYh5NwCwggt6nkiamCoCLMmdBOXDBP3FiD26LD?=
 =?us-ascii?Q?+2VZFx9DefDydNeeiNB3LuE1IpqgXOTQHV6dn/DejQ2Cz7fOziZIXRA5lqIl?=
 =?us-ascii?Q?ngAPkJpa/lrOOCAf0z9JyZ38vWH8plzu3IWRiHT7nIWfdb/RIDbNofzhof+D?=
 =?us-ascii?Q?hRAsCcIZzrcHXX8xFLeX3HJ915rD6+JjTaOLw7l9z+g5N8mTRY8U9roikTxv?=
 =?us-ascii?Q?zdsohBD6c8wdsgm+5Qzd3RXk0zjLDz1+kTEx2+P/gGfS9QQv6w5tKvkgFsuF?=
 =?us-ascii?Q?3V5J/CWZecvOVnMWSPPs7zzB3yBc5OQy72gUeHSx0G8R47vH5Mz58vfOU1Z5?=
 =?us-ascii?Q?6tEDyd9rhXRXs7Qvu3sGFOoA889ErbvCgqOj1IQ6L074EC1KNgUyNzL6Kfjq?=
 =?us-ascii?Q?30NB21+0wjA2A/4nkx1QP5jDSkmEvqSkMa7CRLTIwJ80cx+5RLqrYCFnz55y?=
 =?us-ascii?Q?X4Uan/GBdMDHRPLbLke6ym9aiVAOIVUvePcTfXYumMvrDr4HG2Tsnsxelj0W?=
 =?us-ascii?Q?ApJE9NsHh3ML28wx9dN5e8oWniE09bbio24QtHwgqGAZ+gEBFPeQ6JR6tV77?=
 =?us-ascii?Q?F/RC1LwswyJ60RgpNtn7cppmRbBRgJFubPZw33DQVKPG2cTH0unjHgMuMMlx?=
 =?us-ascii?Q?KL+ZyMD9NzoZepmN39KROQOcFr7Nk1pf4ChJvy3SLI9qG+U46K2a3VANLL53?=
 =?us-ascii?Q?Jjiuo2oX0WpM8434N9lCHefSkQLMlf3HxWmaU0LmSUZSj7omcHTWbOg0xMV0?=
 =?us-ascii?Q?4dlHTMJV9vz9z6IQKIxpEHjI5MB88iDhM7luLCral5S7C0Lhmfxhc/iY9pOJ?=
 =?us-ascii?Q?SvY7wbldQErHxFOGpD4GmjpTvobeRGDJfvI+JZK5A6UIsaQV6euUIcHRh8Yy?=
 =?us-ascii?Q?HWfbPtXHO5XGeC3HF5lLZUYdvEBAyQGv2kb00toLxEc849H+cOc8K2A0HTL1?=
 =?us-ascii?Q?bGvY7hrvDdOLnVEA6oHWnBXY6XRE/6nRrzy/tP95b0+Hl81aHnJahCwWdLDS?=
 =?us-ascii?Q?K/3+CeehnSi9FCfvREXfzqDQE/hP3PGbLdTFUso7lL3ZTHYqeENHliv82N07?=
 =?us-ascii?Q?7IBSnRJrqvvu4pymjNIypguk8hkkfBnW1YmPISUYI1FEC38CT4WjEzpEqrTj?=
 =?us-ascii?Q?Ft5a5zEitY9pD1O7cqAeFrtxUYtrQBVxvnsnhsR9KKBQYFwP/ozNXZ/Yu5UN?=
 =?us-ascii?Q?wiceitLOjgWAr8gej1TkaoGZfTG6d04mIpzfVoAm64AinWrE+sDNuZjfN1M9?=
 =?us-ascii?Q?WGl3jeJUSfitkc/75g358TqPgV81V7SCwfddVik0WbQjj32dSK0jeaExZdxl?=
 =?us-ascii?Q?SGm3L9w9iQ+ELFaWaf9x8W/qdIsEVYt9DMa4AcHmhAJkb8Rm1B2/L17C2CuU?=
 =?us-ascii?Q?RzqJwQv6TQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e6201f-fc09-467c-84cc-08de7f370ff6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 06:26:00.3354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQtP2in75cUcKgkJwvEl3TmUHxDO8PnKrn1fkSIm5ucQGjKMz4HyoIebu+X1l4avNqO899NsLC5rsVgGZyUlPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7871

On Wed, 11 Mar 2026, Lukas Bulwahn wrote:
> The commit 4a9671a03f2b ("gpu: Move DRM buddy allocator one level up (part
> one)") and commit ba110db8e1bc ("gpu: Move DRM buddy allocator one level up
> (part two)") split the majority of the file drivers/gpu/drm/drm_buddy.c
> into drivers/gpu/buddy.c, with some pieces remaining in the original
> location drivers/gpu/drm/drm_buddy.c.
>
> The commits also adjust the file entries in the GPU BUDDY ALLOCATOR
> section, but as part of that, change the file entry to the non-existing
> file drivers/gpu/drm_buddy.c instead of keeping the reference to the
> existing file drivers/gpu/drm/drm_buddy.c.
>
> Make the file entry in GPU BUDDY ALLOCATOR refer to the intended existing
> file. While at it, order the file entries in this section alphabetically.

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

-- 
Joel Fernandes
