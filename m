Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73551C6FD1F
	for <kernel-janitors@archiver.kernel.org>; Sat, 25 Mar 2023 19:41:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbjCYTlj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 25 Mar 2023 15:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231771AbjCYTli (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 25 Mar 2023 15:41:38 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2BAE273F
        for <kernel-janitors@vger.kernel.org>; Sat, 25 Mar 2023 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679773296; x=1711309296;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Qvzx9yEvw8QPG2pBRgmred6jG9S2nRGZcFd7DttFvvI=;
  b=fpgkTmJonwFBmMGDmtOS6shh55MGG8ecTza9qrVlVVQRrwkzhE7gewr7
   ej/GFXtr6BQjrUN0/lXSSihqFQeK8hWeTJCTOjclI0YN0Np2D9VNRytld
   1fWOhdvMk8hAW3bxC1LBwL2zy5ld4q62kcuXIb7DCLqB0+okEwH+htiXl
   tNK/JDggq7PFcyzPfW1hz3H3oYxIell8GDqABRIJJgaKUFK0yK3nmF6p1
   Qp1rNqy6PIW84zq0wLJrJCgU+xRgLw4rScuvi2JT85gtVXtrQQsujipNf
   mOEdmqXybrhUVJzUv4Y4C97VmFdOhe+EcpMnG8lffE9dL0dLvzbN4msHD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="402606134"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="402606134"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 12:41:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="807038810"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="807038810"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga004.jf.intel.com with ESMTP; 25 Mar 2023 12:41:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sat, 25 Mar 2023 12:41:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sat, 25 Mar 2023 12:41:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sat, 25 Mar 2023 12:41:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sat, 25 Mar 2023 12:41:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7kd85f/yhBqUpRLVdtHQrKClAIEfmwBORM04j5PRDPV6a+8Q99x/yGBUxVPYvA8nfCDtZnasOVgK7pDYBI+ichdqzke+8N/SdGdmemEPepu61f77nz56tm1qZK7mb4ZSzaNGMNQKBF4OGXsgLDuzRSu2A/SJq1f8Y0hgd+iTL9JXvS8H/BL97A7206i8amtDzxwEQaX+vx2D16/9KDr1GGKrSOObAnK9fZnb/yuHZAtr/RK5RLskiFsf5FeU8N468x82JrV9VpknfO+tm1ZwvNXbRmSTiZ69VTvQUOnid0P1B/RAhhp2RhPJKO0nOCwBtVqaBKRQSIwMcbBdpf+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qvzx9yEvw8QPG2pBRgmred6jG9S2nRGZcFd7DttFvvI=;
 b=gBzya//WVweD9BrOFvERoTYwReAlb77bIpfsJC9aGMBrhCjgh+gyn4kl++aW3nz1EGcO9htHEp6dxKbXKOz3zu+3Sb6ri0MCceE9NUXLXBjmwwOYykcsdr9UO5JXedGfFZmbNg6CA3TcsUzWYKTQVK9t1X07NdwZqyd6XEyHUh0JaK2fiQfypJaDO+8eZYyhh0T2htYW60gV/Bl2ykP9JZVITyR+VhPENoEOEk1c88hJwrsW5RS0XQS+qT1E6Aze7S7p4bHeVJsWraACm2SXN3o+NX/X5VEm6FKl+6vxk2lgSWkaTUQbciwyhsovDvDKCpOKcsooSEPBwgXgsLk1Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB1392.namprd11.prod.outlook.com (2603:10b6:300:24::14)
 by SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Sat, 25 Mar
 2023 19:41:33 +0000
Received: from MWHPR11MB1392.namprd11.prod.outlook.com
 ([fe80::d41f:9f07:ed56:a536]) by MWHPR11MB1392.namprd11.prod.outlook.com
 ([fe80::d41f:9f07:ed56:a536%3]) with mapi id 15.20.6178.041; Sat, 25 Mar 2023
 19:41:33 +0000
From:   "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To:     "error27@gmail.com" <error27@gmail.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [bug report] x86: Add PTRACE interface for shadow stack
Thread-Topic: [bug report] x86: Add PTRACE interface for shadow stack
Thread-Index: AQHZXworjN9Be7zQX0i+3pSWSg1POa8L5YSA
Date:   Sat, 25 Mar 2023 19:41:32 +0000
Message-ID: <fbce2426b89d3829fb6cf5c893e786afb6d5cdfb.camel@intel.com>
References: <90af27cc-6c9d-4fb9-be3b-fc4ef378766d@kili.mountain>
In-Reply-To: <90af27cc-6c9d-4fb9-be3b-fc4ef378766d@kili.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB1392:EE_|SJ1PR11MB6201:EE_
x-ms-office365-filtering-correlation-id: 815ffac9-ef4d-459d-5057-08db2d68efdb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UZcf8m3wlkKjtEaelTudGVhqkUpquCdUokLAAG8Gw1A9iXA0Ix/sViCsv58WKTzW9SmmARgZ37zsjfQ/k5KUJWEO0j2IHV/O4Ct1MZYueYxFlvUp5EPFBpGum9xsrCzvzUXgzhXwvqddzkRZ1Mo+cWxuhWxzsdt/mBJdWQQxaIY8SCNwfN9B+O6DmXKoj4pmMhSiRAa6yHAXpSk6AnFE9WL6/rS8rAjRg1g3rNl6zJpTSvAsehaWkX7c9owBMqm8+qkrRE4v73fyx2MxoEjpSMwKLlW6ijLNlWrfwiBIEa5dJFYuyA/Xli+/ZkvOMz/eUYQFfV3OlMT0Z4JNXzSs2NXvjaozSlBqbuBAxMYvg6n8Ty6udv/IUSq2v5Vm5x4kwiIR6IMTP2GoCHTgfpgvmY9mw4GHJT/1K+vAtaCaER9cEvpkqlpjU4VkVgcj/rvtpeoUYdDZO388Vu+xMFNcQAPX8J2ZGkDLyjXx3Talp/pVeFN5vMoI/dN4pbh4P2S4OXUzt3pasU3bSUPtTgyz6R/1x/JKcrjQNfHFXWf5wKXP0smRZ+Sp8X3yFUOPs6vX1sMNFPRV11UBu/gBIYx+BUQMsIElEZSYpyGvVJ5MkI9dQW4k6gjeZHhIyyhQRTby
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(136003)(39860400002)(366004)(376002)(451199021)(38070700005)(86362001)(36756003)(2906002)(478600001)(966005)(71200400001)(6486002)(26005)(83380400001)(2616005)(4326008)(91956017)(76116006)(316002)(6916009)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(186003)(82960400001)(122000001)(6512007)(6506007)(4744005)(38100700002)(5660300002)(8936002)(41300700001)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnNVeWlvUlZvSG9vR25LdkFqdFc0Y1JKMVJHUCsvMENhRGpuZkpYNm5mSG55?=
 =?utf-8?B?SDh2dXZBaEhLQ1EvQmRjOXFWdHdLbWRLSXRTaTI4U3c0Z2djUFNyVWRWdXNQ?=
 =?utf-8?B?dFpkUDFVc3k4SnpvaVIvY29wQUpIdzFpQzZEZDJXVHBnamZEbmd4RXRNNlBv?=
 =?utf-8?B?QmNJTWR0NTNrbmlsc083UU5kTGk0c1FYTUU5WmFtdXNDL1ZOYWRIUExiZit2?=
 =?utf-8?B?N1EyclNvSGRwWG16eDZXQTRSeXo3N0dEdFNaSExkTFBPcXJmV3RYWjNFYTVn?=
 =?utf-8?B?QWlsRXNZeFpvcTU4cFMwbVc4bU9MNFgwZ0p0dE82VmcyZDVJaElKS25sd0Qv?=
 =?utf-8?B?TnJNcHFqYmV0RTZ5ZTNrL29hSFlaMnJiZHp5RmVkMmJzN3pMTFRiZThydDBD?=
 =?utf-8?B?TU5RQkRJM1ppTE1uMzJJakVRQmEzMEs1NEZobWpTNWpxWnJ4bDY4Q1hhQzZF?=
 =?utf-8?B?VXRSaEFOekdQL2pWamllYU5TeWh1OW9Vc0tXNzFmSW1PSWVLbW9KbFpnY2RV?=
 =?utf-8?B?MFNJVEVlcGFVRkxYVExuSXdnS2VmTzZoeDcvWkpOZU4xZmNZMnVMcWZjMnRw?=
 =?utf-8?B?Tm9XdmxYODZCZEdVYTFFN3h5RElld05seTBJZGpLT0NIdUZkbmRJa1g3d0pi?=
 =?utf-8?B?ZGtEUVpoRTRDV0xkV1RDSmJoZWhaejRuMFhpKy9UaUVLUlpBVUNDbHErWGpr?=
 =?utf-8?B?eE9IaXVZUEJ1Zm1pc1ozSm5uSllVWksrMDBQNVpMT3R0emNhV295WnVtc0x4?=
 =?utf-8?B?WTArVW1Scm5naVZpWlVoN3BuQUN5YWszb2tTd1lVVFI2YzNTVVJOcDZuNVEv?=
 =?utf-8?B?aTdlRys0UmtRYVZxeEhoOWVDb2tUaHAyUXFhYkJvc0l4Q2U3bzVQb21Weld1?=
 =?utf-8?B?bUtBOU9rMlNkQUpJaTZFcFNuVCt6Q1N3NSt1dUxJZzlPMk5kdFlZdnUxNnRa?=
 =?utf-8?B?eWtqbVlRdExIcGdsTGhra1d6am04UXVkYUpNejhIanBaMzIxcUU5TWUwZG5Z?=
 =?utf-8?B?Qk1lMWcyNkNnZkNRLy84MWszUys3NThYVXZmemlMVEF2cTcxRUY4ZldpMGpN?=
 =?utf-8?B?UkxxbEZXNUJZaVB2eVNuNXRFNjJTbjZxbE8yeHpza2V2SHRrSUNPMkp2Zzg4?=
 =?utf-8?B?b0drTVNRaDBPN2p6RCtmbHpQMGQ2OWpxVW5IbktyS2Q2THN0UVV4SmhUWVg0?=
 =?utf-8?B?ejV2L3FOSS9aZlh5YTNtL3hTeDlmRkppRXZxbE5HUUkyaVhqdHNmRzd3OWpK?=
 =?utf-8?B?eHhHSDdWcCt2K3Zhc3VTUExwTmlVUmZwSlJZcmNSc1RGRURpblYzZmtaV0o5?=
 =?utf-8?B?SEFsSXJPRk9hc2FrKzBNUjNhU2MxLzgrVitTdExITmZOa0NDbVdvNnpxV3o5?=
 =?utf-8?B?UjZaRkI4S09KaHJQTldjSGJxOFFFR1dPWnF0Y2xMMXRkR1ErckZKWFZ5Qjg4?=
 =?utf-8?B?bXNGNnBKeHRRY0tuSzRxK00yKzJyc25tV0lIT0xnb0h0Q0RKRFJoTzFuOUdB?=
 =?utf-8?B?OEpHSGlWbDFwK3Z2RFNIaVhwVDRINzgyd2Q1NEM4M29YeVBDSkxIaWdxbkU2?=
 =?utf-8?B?YnFlNEluTTRScG5xSTFncnR5c1I1RWhxbm1OYncyLzY0MExSanBjOUE0UHdw?=
 =?utf-8?B?TGx3N2ZDMUZsQzkzMzlmd0hEcVNzWmxHREJRSlZBZFRwZU5ReEpyNHhXeE9a?=
 =?utf-8?B?Mnk1dHNwV3pJTjZXRHlTWE92SENlL0IwOEthVkdBMXlJU3V0QllidHg4Umly?=
 =?utf-8?B?Z20zWVQvZDhxUnpIa1ZmdnRhVHduUU1ZQVFCeXg4M0s3QjVRRWxHdUg3ejNF?=
 =?utf-8?B?SkVwQkFYMmFoWjVTOVhNR0Fvc0lRVm1hejVJZDlHS0xlQVpkdlh5OStPbGRR?=
 =?utf-8?B?RkZ4UnNCQkdSYVNTNFB1R0hFejRqWUIzek1FclgxanpPdVZXWnA4cEQ3NTZH?=
 =?utf-8?B?eEtnQ3VpR1pVTGo3YTlwUjNMMmVvRTgxMmhaY1o3LzYwUThqQnBDd1ErTUJS?=
 =?utf-8?B?YnZsMThqYU4rSXRtbGs3N05KZG5WaC9OU2NoK2xNWmZ2bm5ldFVFazVFTitC?=
 =?utf-8?B?cXliRHZBdVRnc1RUSlFyNjNZYllFN3E5QkxjR3A2N05BZkNYaGErWWRkZWdV?=
 =?utf-8?B?RWJtMXdYR2RsazhvSHZKNWcwaEFMTE9nUE0zejFBT0N4U3JxSnpHcDBIMUVz?=
 =?utf-8?Q?4FdOazTXEDTEq4vbGTi968I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F601B5F5BA7B94AAFCC109069EAF4C5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 815ffac9-ef4d-459d-5057-08db2d68efdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2023 19:41:32.6408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DA0QkbGzwd7awDcuhOh9NV+wn2/MZK4syNgEYjVUkFbcm3IgeI+zUKv0f0lMpmBvtpHbqeIKGWZ8sqe3LqoGT0YTCJnMeUT60Vud+NBBKX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6201
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

T24gU2F0LCAyMDIzLTAzLTI1IGF0IDE0OjA4ICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBIZWxsbyBSaWNrIEVkZ2Vjb21iZSwNCj4gDQo+IFRoZSBwYXRjaCBkODRlNmVlMTIyZTU6ICJ4
ODY6IEFkZCBQVFJBQ0UgaW50ZXJmYWNlIGZvciBzaGFkb3cgc3RhY2siDQo+IGZyb20gTWFyIDE4
LCAyMDIzLCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIFNtYXRjaCBzdGF0aWMgY2hlY2tlcg0KPiB3
YXJuaW5nOg0KPiANCj4gICAgICAgICBhcmNoL3g4Ni9rZXJuZWwvZnB1L3JlZ3NldC5jOjIzNCBz
c3Bfc2V0KCkNCj4gICAgICAgICBlcnJvcjogdW5pbml0aWFsaXplZCBzeW1ib2wgJ3VzZXJfc3Nw
Jy4NCg0KVGhhbmtzIGZvciB0aGUgcmVwb3J0ISBJIHBvc3RlZCBhIGZpeCBoZXJlOg0KDQpodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMwMzI1MTkzMzQ5LjMxODkzLTEtcmljay5wLmVk
Z2Vjb21iZUBpbnRlbC5jb20vDQo=
