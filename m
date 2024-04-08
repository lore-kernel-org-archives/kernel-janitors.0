Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2125.outbound.protection.outlook.com [40.107.236.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1422964CD1
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Apr 2024 11:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712574689; cv=fail; b=Pji1a3zlilS8boqLjOcHe+T3hHJ9b10m46yI89Cvhr0Ne7quRkdKniw77cSHMkFb3uYy65gqUk8qKglDVwNYy5kLyHBQ6DJC0HFhPDV1UiUn/l5HOPe3xqM9yBe8nMGTEunb4ry/GjHDoQICzLcbgua+1DTLxW2AdOyjJD+VXjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712574689; c=relaxed/simple;
	bh=hyoojMCKydm74NDS3DEsjhsJ+jV2HmFUh3fQi7aj8QQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eslOoxkRIc9z7QsUcJYwFeLm/JfDreP7fchWzMzXyleuOR2jASn4wad6CgBGFgEfHI6OgfGhR29Na/GVxipncWEJoLY40TsY8ONrmn7wyO5e+t/HaR7MlotvAC4k9YRHSKH74yezNDuoGXEBp9aqYcEUb6tKbjyBg0SscYCre0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ddQ1jeM5; arc=fail smtp.client-ip=40.107.236.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ddQ1jeM5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSG1bDFDjlaJ1OfXLXTL8eugSsrOUmD2bHcq9bRAL+FCD8UolAE1xLh+PsPXyHX7tCMVOLQfmtvMAd1iSoq1bSgqwp+DGmkDw9durvXsdMKDPQVQhaN9378W2S1uSyifZr+WhWmkESWFVjZ+LjJRYPz6XaXSQp0QwDQiKPJPXoWdOPeFGOHBqxeYPNH9R/BGx7tqEJiT71317x/wfhNio29X8lw6w+d+dzqSri73hh8LF61TG6V/blhDGLxwwVtef8sG/teuacEZVgVaYDM9+8OoNRqiv+yhZlfSriR3CpmIQhFJIxyDHaQA2kndn5/WQ/x6If5hfuLFQ/llouEguA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUNQRELdWj0SWliJ0kkUX9wPuvoNx036eWh/J2Mtwlk=;
 b=EJLdo8cnmJR0Pm6TlcMMMVoTEZneQfMg+4mBnJIf2tBHr+MB+q8bALTtfOk1vwWXky4dYyBpYwEiQgGNcEY/jiIhbwqfRpehcHg05KXyXUNhX1pEPLCPyzJCqmc91DXTwvf/t60pt9DEgO1KDKyrkAB7//93qS7xkBlKZLUYLQMbuP4RAeomB+611vcWmajQXhk7W+jbZesnDx109hCSsnbNA4by5gxpUSIZqTA0YQA0QWia8HjVODQjwl6CXKmk5BX3dk/i3DOs+gzTvS4uBhWVnkw/KlNljeF3+UUV/m13NnYjgK1y2ok6g7Sg7K5/mLuLPJdbqoaFG/Cka9vzwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUNQRELdWj0SWliJ0kkUX9wPuvoNx036eWh/J2Mtwlk=;
 b=ddQ1jeM510NEchxxqa5iUTNvD78UjprJgOtZViBLlzIySqO3FE3WBjvtIklT0HJHwfhxi0cp4n8LFFeb/iKufg3nwCgGzn53FOmfI2BI01QI6Dv1pTQwKeU52TmPW8EAlnUnQrjowLiPm4+hSCL5Zql7n9NGj9CUWu1rU2DsY4c=
Received: from DM6PR12MB4465.namprd12.prod.outlook.com (2603:10b6:5:28f::17)
 by MN2PR12MB4455.namprd12.prod.outlook.com (2603:10b6:208:265::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 8 Apr
 2024 11:11:25 +0000
Received: from DM6PR12MB4465.namprd12.prod.outlook.com
 ([fe80::3c85:e24e:2c7:99e0]) by DM6PR12MB4465.namprd12.prod.outlook.com
 ([fe80::3c85:e24e:2c7:99e0%5]) with mapi id 15.20.7409.042; Mon, 8 Apr 2024
 11:11:25 +0000
From: "Buddhabhatti, Jay" <jay.buddhabhatti@amd.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "haribabu.gattem@xilinx.com"
	<haribabu.gattem@xilinx.com>
CC: "Simek, Michal" <michal.simek@amd.com>, "kernel-janitors@vger.kernel.org"
	<kernel-janitors@vger.kernel.org>
Subject: RE: [bug report] soc: xilinx: Fix for call trace due to the usage of
 smp_processor_id()
Thread-Topic: [bug report] soc: xilinx: Fix for call trace due to the usage of
 smp_processor_id()
Thread-Index: AQHah0FnMZcDhJkIMEuVFvbDrYAEf7FeOzXg
Date: Mon, 8 Apr 2024 11:11:25 +0000
Message-ID:
 <DM6PR12MB4465867858A8A224859956F19D002@DM6PR12MB4465.namprd12.prod.outlook.com>
References: <6265a58c-308f-4eb9-b008-ac938cb8b8de@moroto.mountain>
In-Reply-To: <6265a58c-308f-4eb9-b008-ac938cb8b8de@moroto.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB4465:EE_|MN2PR12MB4455:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 KCzrYaoXBLprgI0wNtrCiWdhqDkokIyG+iC3UUFclBi/ng4NGNTPZ0lGZngDE9V6URPkUaF3AUNmIZQrIJqfh3oKTEvoKxgaG8ytsofuc7LmBCyYO9bqksNlMRAOk0rb3/8EIGTJeZ4EqCf6P0hBWMa1DMZndKBup5iC/hD6JF8Bxe5RcpObnF1YUAVXLf/7weYXPRf5LHCEisOLnIYZqbP+VH384uA6x6IeqGXL1qfw9bscaZPRtsyCCmp+jGsKkKEFFxzVzVG4vdZVlhZ2vfmyZ9OXvy/xCMoZWW32kpb3ZZ8Z/JkoVYHOU0+R77nsvtauBms5ZrQb4PWU26cdiqrrK8Xen4x8n7NUmPBIU5xb7hopeteGvQCi58C3v8stDVTKks01Za7E+c0+fxIh1OfwN0HY/4b9X34bULSLm14GeY5txDfHHNEO92YBavuTWWDnZWVIjcQRgbyz4ThEWzYlnfbYGGuSVdXhxd3gsS8kUcV5LeMKbdup/kS8YSgTaCIky17h7iNBJbXp6Eac54kjPc1MeOt3lZ7IYymZcVkLpcnxLgwFXH/gLhXl9h/Os+j3aqP5NqRJGV+AOkwXitjr+OYUS5Fa6r10VMh8r98=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4465.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AN7PO1HL/jRKIa8bz5jYoyvPFSZRziQ5g0cLOVc58rUuQqCGM1kCI45gm1bV?=
 =?us-ascii?Q?jsB4lKLe2VvEk3bRYePUkRbjYVGOAjpJFKrJP0J6jLX0RM68SmMUK79A3hmb?=
 =?us-ascii?Q?VRyoEco9zn0F1y22k03NUMuUguemryK9iKmTGcDHJSQas9Fbm6aeouPscR5l?=
 =?us-ascii?Q?10XE+CRbJivbmqjz1hG82AqsvMPfWBDRW579rBmIPHgbEK5b+Af54tD1soSi?=
 =?us-ascii?Q?HP8+OY8f8gKQEfmKjYG97j6HmON5LnMYo1W/8amgjhVcitFPT4ClE1+Sg5W5?=
 =?us-ascii?Q?IUKmTLFIH/CEXzlDkxNWfrlHU7+U8YmDGY0VAafnSxV1JELGWp33ztqoLsgT?=
 =?us-ascii?Q?mZRdwqjwm/1k4uX3PYkrvTzTqunH4iH5psMYSzy79FjFu6N8Lxm6vvAR7mpY?=
 =?us-ascii?Q?P4LK52+bPOnpOmYBSCDZu3SSvaXiy7FSsxLRQgXCIz3TcJaVtM07fE7dwTp6?=
 =?us-ascii?Q?HzEmIJpYQ+s+peMf+to6+5bXSn7w7XkAcUIw+our3QO1ctuiEVjlfEVryvEY?=
 =?us-ascii?Q?5NG3bAK7pfev4/qzd8robsTIf9EoqHqRDQRcbc8VeHxFzmtZDyMEA1mCfguX?=
 =?us-ascii?Q?WlTwR94ZQJ1sRDxXGGMUfPR26jiDnK5+gAbgbnROxZovKkWVSvj/Q795Ab69?=
 =?us-ascii?Q?xO6GVb3cNYlvn04IMXLEF57hrQwY7VixU+e8hvaXf8v+K4s5JzQClIK7JH5N?=
 =?us-ascii?Q?1eREKUIdDvSDwutV37vz7To9cF1N7Vw6+//n+VY6Ri6MjDWnn2EMySYlJt26?=
 =?us-ascii?Q?5TR1/368rXm3EpNsWKmeGlEhdf3QSwt7Nt+aJCZmkmOAxfgtb1eWR8cRV4CF?=
 =?us-ascii?Q?cZsZqwRy4p1nKEln/riTLtHuKj2D45GJWB6VrZtyQmMLRbzHnVMVVtzq5A71?=
 =?us-ascii?Q?+Iyhncx+yDPE56Xa0yG3G/aHC9JrqS2wHT2bAewa4RbgUMJgM+WDqjqIyurx?=
 =?us-ascii?Q?uIwv4jTvD1lZed3hBYcDVjIsjA1i3KMNAtjrmo9eotyTpXauI88NbvUJjbGu?=
 =?us-ascii?Q?YUiNUBxV+eEuRFtonl1t11QBOEHh1D2llYUgaC+SegARgp+PUg57KlHGmqkv?=
 =?us-ascii?Q?TMiW4X7KSdrLrE+u80SjXCVOnSJgOktKJGbPHa1Ah5fhDd3zhH2NXKGRRv+6?=
 =?us-ascii?Q?jbbUCYv/m5adq6FsNkYlSUy41TAgXVFm67Ev+dp4b1qMrpnbJcOSHYbaksDJ?=
 =?us-ascii?Q?4lG35/yusEoCuzOlbx7O2kuWaMBMAHaA9dTDdFECRnlFYfLOFZ0p5sXkXiMK?=
 =?us-ascii?Q?WdycEV5uYY5PYB7fRjPBmUVyH9MgXPAWG7onufuGn1ZhiJzmpMUcErXHAFeY?=
 =?us-ascii?Q?2yGMbCuRKXBufdC/lJAPET7QDk76o4wGMmNRhEc0Cw10WAwPC7IuWdCZ1YkA?=
 =?us-ascii?Q?v+D11JcDyJN0TVJP2QfTRBciT4+VpJZpv0mvtHPVTSnYmAfJG3L0IR+ALFWk?=
 =?us-ascii?Q?j7rfGKveuG2bw2Rr9mfGSn2WnzsGGfY9PODD4l4nS6Zg/Z4lkeI3my15GzW6?=
 =?us-ascii?Q?OmS5c9kEkkU6l+b8IQybrVZSnUPqdFK4c2ugwYrqGOMFRZxH1WRRA75bdL3d?=
 =?us-ascii?Q?Hl3mH7BWagnwixYeChI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4465.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b2db30-c81a-467f-7530-08dc57bca15c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2024 11:11:25.2161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hPc5goW3QxsYJiGb3a14/BwKFMt/1i7yYU6puPRDxTxuHJl6eEiB3dK/A/gkb7j2GoZl+TiIEU85mOu7HxU3qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4455

Hi Dan,

I have sent a fix for this bug:
https://lore.kernel.org/lkml/20240408110610.15676-1-jay.buddhabhatti@amd.co=
m/T/#m584deb72bef91ebea163223f3adf6f6861b69f2c

Thanks,
Jay

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Friday, April 5, 2024 3:40 PM
> To: haribabu.gattem@xilinx.com
> Cc: Buddhabhatti, Jay <jay.buddhabhatti@amd.com>; Simek, Michal
> <michal.simek@amd.com>; kernel-janitors@vger.kernel.org
> Subject: [bug report] soc: xilinx: Fix for call trace due to the usage of
> smp_processor_id()
>=20
> Hello HariBabu Gattem,
>=20
> Commit daed80ed0758 ("soc: xilinx: Fix for call trace due to the usage of
> smp_processor_id()") from Oct 26, 2023 (linux-next), leads to the followi=
ng
> Smatch static checker warning:
>=20
> 	kernel/irq/manage.c:1588 __setup_irq()
> 	warn: sleeping in atomic context
>=20
> drivers/soc/xilinx/xlnx_event_manager.c
>    608          virq_sgi =3D irq_create_fwspec_mapping(&sgi_fwspec);
>    609
>    610          cpu =3D get_cpu();
>                       ^^^^^^^^^
> get_cpu() disables preemption
>=20
>    611          per_cpu(cpu_number1, cpu) =3D cpu;
>    612          ret =3D request_percpu_irq(virq_sgi, xlnx_event_handler,
> "xlnx_event_mgmt",
>                       ^^^^^^^^^^^^^^^^^^ You can't call request_percpu_ir=
q() with
> preempt disabled.  It does sleeping allocations and it uses mutexes.  The=
 way to
> test this at runtime is to enable DEBUG_ATOMIC_SLEEP.
>=20
>    613                                   &cpu_number1);
>    614          put_cpu();
>    615
>    616          WARN_ON(ret);
>=20
> regards,
> dan carpenter
