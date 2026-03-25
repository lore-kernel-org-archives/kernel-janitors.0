Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305CEBA45;
	Wed, 25 Mar 2026 21:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774472929; cv=fail; b=cUm8pp3xAnMBl1/bx1N0nbgK7gqgN++9xSte024xGAmLIAohzUTqEWQYfHvLBTlIK0mnQO6UjvvdZbZCjpUHxuWL3xmCbSShCOXnbBcj7jmTo1/cKl07D30DDTcCgq5DeZvqDToY5yPnGG2YgjouCTJ41XtX9Dtksd5uZC4wzYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774472929; c=relaxed/simple;
	bh=cr4pY1AOXmBO8QaNJx2VsiJHUXJtfZSdxXlQ/I0Bhwo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DkoBigDW10+wuAr9rlID22iXd58vlpbvka940QderX46L6x/C7AfMztUd4NKsw1ba2pVzTn2sIhPPQ4ygOLAcS+o67YGmhiIsidUoOngKb4a4tyWF23wZ16RLCPh6w2blXQUEOyeP0ekiThSIWxRdf2yp2hecxl24nATTUAu7Qo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Auk5aGlH; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Auk5aGlH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774472927; x=1806008927;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cr4pY1AOXmBO8QaNJx2VsiJHUXJtfZSdxXlQ/I0Bhwo=;
  b=Auk5aGlH9nsXssVZTB+NE4/P7ZDqdYFCekoVEHilLR/RB2tKmIeo+fUq
   dMnc5sJooo+ZukvgZDxFuXxP5vsSOBXLcZv9WNmS8v1f431o+WZYjDXdR
   gArJyAm6wtOAOXNVpis/cDEFAF5b7J8PZr3VtZkvwZH6GKpbT4+UcGbtL
   x+7dVYBFnPHlsOkT/YujCdsDp/s3hlXgOnFEIyfc5Wzb8ZP9u+x+Ldh7V
   WKCBWqBIBfBqCPS6Gh/KwYqoSNcxAuXY6W8bM9yCLUtvtogqXrPA3URZS
   plWYrrmSOVhb6y8WT/RwYK0RVAbxMuIUUbh9i30H84FvdXMVSRPD7X/fj
   A==;
X-CSE-ConnectionGUID: /nq8bP7xTI20UiKwPY6z8g==
X-CSE-MsgGUID: m0P1bRwhTca4QVEd54Iu4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75542166"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75542166"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 14:08:47 -0700
X-CSE-ConnectionGUID: Q2p8hLU/Se2iSCKlD4Ltww==
X-CSE-MsgGUID: ttnNK/tpS6CVS3EbHkvCSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="228867825"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 14:08:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 14:08:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 14:08:45 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 14:08:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NffPEVIScSxOWWweYxHzECqfUynfxfiyTyZk9pOVNM/WDvI8r9BfhKHq+gOBNn4xeb4KkkKYV1UD3nt2CLZtrU0DWq3BX/+MdbkzB3PcVGJSk1yyXs6S+w6tRrBm6+zfi02Z1FGHlckWUNANlnXe6iGzzdy+t0esJTKFZ/ydIh4r0oLFKyx8haMitQfYJh5iNYrDG2VM7Qrmr81etWd6peLNr1N6QbC+cf3tgQbGF9HeDgX68Zg07UvbBAWzG6Ywbksp3n3yj4an/lhHKGrfSdGTMAFplUf15elEn/yBvzaHC9wDn8QUs7LgZm36Lqs/wSZ3VPkryVYtnfwEs1JmjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cr4pY1AOXmBO8QaNJx2VsiJHUXJtfZSdxXlQ/I0Bhwo=;
 b=a18yftPOhGvx80DKgr7b95jLi3eTEvxcbX9kIZnqYjjxItiX3KYeI8bOWwk451WnKe+UerLTJs6/8lUCUvP+qflAwUUDDU8g7eEjwKI6iXUp0SbNYAhxN2mUisJ6YhDsNaNCdjzN+VR9GGxle7A3bPxFRD85g6zd0v3QxvODVVMANUgX6rn04Yjn3ymKXK4cfs3rlzBwSoLrGIjAhvXsvUUnORvaml20TfNGucuqc+a68tKFikVLG+aNwXgWWwYtdOPnZIUwkyHjGTWYkFoJvb77wsq/1WujjlNAkrs80LuUhBhgO6snYIfgqv0+cvbleO8IdCygiWy+QM6xEn6UWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DS0PR11MB7829.namprd11.prod.outlook.com (2603:10b6:8:f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Wed, 25 Mar
 2026 21:08:42 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%7]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 21:08:41 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Colin Ian King <colin.i.king@gmail.com>, Borislav Petkov <bp@alien8.de>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH][next] EDAC/i10nm: Fix spelling mistake "readd" -> "read"
Thread-Topic: [PATCH][next] EDAC/i10nm: Fix spelling mistake "readd" -> "read"
Thread-Index: AQHcvJc2tp6HVJqCp0mBobxvuFDizLW/vb+A
Date: Wed, 25 Mar 2026 21:08:41 +0000
Message-ID: <SJ1PR11MB6083C0ADC313CB0D82AE4D62FC49A@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260325203556.1228975-1-colin.i.king@gmail.com>
In-Reply-To: <20260325203556.1228975-1-colin.i.king@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|DS0PR11MB7829:EE_
x-ms-office365-filtering-correlation-id: 96868c24-c7e7-4208-dcd5-08de8ab2b0f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: jPrFlfHOfXee5Cin2MgY1cxkEW3PA5sODuoB2uskWziweJuB1/ZnHs7vgStwbowRtdKGEoW1uell6mWw7W4Lsj+Qj+8ukatiCcI6y6zwsxp0kYIhd6z2Bs4vy3Sct4QAoiRLyA719MyT/Tx3Hc8Jpmm3KoG/OdEqwr2yOLvQpP2EM0O4vxs8tlTblXmJ4Sct9wknyDi42HRYTh+NMj4W+s9LXIzntrPoMbeE+VglSj92hR1YQ8OegKr9YBO3fIF19EfDar/lopfICKSeNJopH4R1PQaVxWKBWb6n/ljEzace2L4Y8EC+GW9HxE0GnpQmPnUUKfEMZESO1s8xwaQemGPycMcRg/2NP33qPQe7uwPfWf2EsCz463Ypd6waaBydHb1zwsh/SRlxZlpa/fgLs+AdWyGSkcHdEA3OZtZnxvlLjwPBH7A+0b/7D0cKd959yya4lmRWEZtYr6qGtWJbA3lcFbiQ445LR4NMFB3n/UgLAUYDD9DLY6RKBgyCfkQejZedL/3pnQNMXYZZ/L+/YfA5ougvQhhY71h5Q1DJEPchroCrNKsR58aYpUO0GmXjWLiz/8tv8fA3OSIc/5abFeoV9Qvr1MAXXSTbka7byIBM7d1upalnI6Ah1jcJrLMm8kWG/7uX0vptxUJ6JXdgcU+CYWgFYYFVu5vGSzfnukmYNvdr+QxAR60WQKmMQxuzvYcYVM00SxgGGhsjlxjNufDwcHKmCCv6nykrZP5/gKx1EmabWcC3JndrLEdFRHSVTUTmym7x6I+Li6gEkjx7TR+suwy+4om7aAgs0oNziH8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkEwV21sNDEyV0dXc2NyOWJmbmIyYXh0WVhhd3FmWCs0elZVTDdmWUh6U0Jj?=
 =?utf-8?B?aUdMcWV4cTVWSVFkRkEyejRpRGVOWVAySHFUZ0NJMFlRT0ZJN01TaWhCY08z?=
 =?utf-8?B?d0JYYjZDTm9MSThBSkVIYXVxRkdRSHJ3eWcxSHZoazMyOG9jSStXZW1EQytq?=
 =?utf-8?B?L1J0c1lHUE5VTnlPa2VlZElpVlZHUEVEUXhkblgrT1hMcERFZzVaejJ1VGhm?=
 =?utf-8?B?ZWFWWGt5RjI2cU1hVVhTMFpHbHhGSFNSNFkvV1Q4cEV3LzVtczB1WXB5Sytm?=
 =?utf-8?B?SWw1YkNMOFNyT2UxZTlRTURJRnhrbGY3SnJLcm41WGRJeXp0Y04rNGc4RzRh?=
 =?utf-8?B?R25nNE41akFrMzh5MWN0cDAwYklpeHlVUGVKOHB4MTdsZTBYd2lhQ1dnNUx5?=
 =?utf-8?B?VGRGMFBNV3A3RVdaWE9GU1NhcG9PblU2dS82czVKblorc29qbmZCb1RIVHJs?=
 =?utf-8?B?Q3NTRVd1REVyUEJWVnI4eEVVSExlWm1mREIwVDUyd3FDbW1QdmpYcitjSzZa?=
 =?utf-8?B?UmJ4Z0I2Y1U0MU1Zd1Z0ME1EYzJyeUozbXVEUU1BVTFaN2VoYnpBemlFckEy?=
 =?utf-8?B?N3d1KzBzT3lsOG8xUTN4N0RIckUyczJiT204Rk9QcUlSNnBSOExveVQ3V0JO?=
 =?utf-8?B?RDNaaFQ2Z1hBRVprdjEySzNqSzBkWEExOW5QTXo4dUFVMEwxc3FZTkNuRExx?=
 =?utf-8?B?K1Y4OURhNW1VZHhaeEdYajF2M3pmck5qT3FOemZMbFpxWlM5QVAyK3orSEVV?=
 =?utf-8?B?WVhZNnYvaE80R0s5aTAydDFRNGtFQ1NoNUZJNlhOZXU3MUxKeGQ0Y3hNV3hn?=
 =?utf-8?B?b24zUUovOGU2eEczRkcyVjNvN05ReE53NXJiWG81TzREYUU4K3RUUmpRZzMr?=
 =?utf-8?B?UVdYTk1uakxTOXNQUXd5ZUV1QXdhaGIwTkhLMnpLUkUxUzBkZnp2Vk0wYWZK?=
 =?utf-8?B?UTlmcmRSQjkxcXFCdHhRVllJQ0ozeWxndlJMbkNaQ1pReElSWCtMdkwrTEtF?=
 =?utf-8?B?UDNYNC84d1h1VDR2OXVKQXdWMDQ3MHd5b2dubXdjSWZSVmVrbkJnRXY0QnJM?=
 =?utf-8?B?ZjVObkxVS1I2TjdIYjVRbklZUzh2RWNuUVZGVllGTFRiNEJ6T1RLRGIwOWpY?=
 =?utf-8?B?S1JBVXl6ZVgyZWpFcWlJQzhsL25aZGEzK2pFbUN3Mzcxa1BoVUQ1eENETUw0?=
 =?utf-8?B?cXNtSy9YaUhINFRoVFJGdjE3bW9wazdIK2tlY2k1OE5XY0VzckVCbm1kNUJU?=
 =?utf-8?B?dmN0cUZObW9RR3NuMnZVSVVVaE91TlZjR1JYU2NaR24rZ2NUYWNzZWY2bDhY?=
 =?utf-8?B?MElDaG5Rc1ZjanpHUFhVQ1VIWmJqNUFWejBNbEpXMjZ0dnNOUmRCL3pPc3hJ?=
 =?utf-8?B?WWtzQWN5VWd6bjk2MHdYTm1Ja0JpY0hsWmk5RDhHU3pqNVU2WDRmbVlHeVFr?=
 =?utf-8?B?ZEtqdGlYV2F4NnpkR0cvd1dIZ3hmLzFIdWhnQURoeDhhZzJZT0ZpOEJMSHBY?=
 =?utf-8?B?b25NcmJaNS9FbXViOUtOTEo3VTRobU1rTzlYMDNhTTF1UU13YlZwVlduRnlu?=
 =?utf-8?B?Y1BLK3Z1K24yTGEzbEd1SXRLWDlsZ2VvM0xhVHJYOERHQk44TmtCaU1jcEJC?=
 =?utf-8?B?aFRzYlNULzlkODdoSFcwNnNYQXBqdjhrd3VOOU4vVW9OMlVabVhpd1JPMzNo?=
 =?utf-8?B?WXU5TFJ6WjNJd0tHSWQ3K2M4S25EZjRDN0lUVVFQS1VsaWZVQlFWWlBJd1FM?=
 =?utf-8?B?RlBmdEpmL2dIV3NQQmJQUSthR0pLL041MHBhTE9uNngyVnlZb0twTFRFMzI2?=
 =?utf-8?B?Zm5NWFAwaTcrN1NhYWRlckhyRUgwcnQrUk51cG94WjcvNmFwM01JajhOL1ZQ?=
 =?utf-8?B?cEwvVGdNRjFlbnM2dDlsQ3ZpQlE3aTFIV3AxeDhDSHNobjBNeHY5ZWxWSnF4?=
 =?utf-8?B?RGZmTlMwREkzM2RTODlvd1RDQStiMG1KcGQ3cktHdXR5TlJRcGdOcTVQUUJW?=
 =?utf-8?B?eWJKMGZ6MWVSbzJsL2tKM29VaDlMQTZBcnEzNnBnNEVHeHdGMnFuOW1BTXp5?=
 =?utf-8?B?RWFJTlZIUjFCMW1GYTR4ZGlrTEhhZzdBODI4VWtyMkhJb2hweXN3ckROK0E2?=
 =?utf-8?B?a0VMTmlpSG50S2NsRWtmcUZ3NUZjK2J1aXYrN3VmQnVDdHl5UGg5T1QyNWQ2?=
 =?utf-8?B?cTVYSzRuck9wNFl2VWg3cmNIY1J5UEJnU0Y1SDhrMkw5MGpLZ1J4ZThESS9O?=
 =?utf-8?B?akExRDdsRk01RDRtVGJOeldTRlhIYnQyQ3FQRVZFMUh4VFRGS21ZS0IyQlR4?=
 =?utf-8?Q?FS9MOgFzC0eaptrTBX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ofmv9BJgXJjwwyLmGQB+x7z05JAOwYyX8Npo2B8MBRdtgaaqwPZACL+VS6Y67fVDBEeh39/d5yNFtpYt4TSVMFZJZVdXE4BG4pQs5YPniUgl5guGT2FBW7jLYvfJ/+IiR1dOMG9ABUQYR/ByZHiDyZ9ic0L1lass21HseIO+4CVq/5GuiDS+43seCjCc9619woE5pECzF1Ru6JamBaYU54V8e8ACfaxp1XHC0uRlkWRZ19XHmNwSIJlpSwWmmSNfqF0331RYcsslKY0zyRGvI8BV8Ey1ALQuHYFA//oQ8fpqN5G89Wkoi/RW8Vv6GPGySUUcockBnuq/PZy1C7KP6w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96868c24-c7e7-4208-dcd5-08de8ab2b0f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 21:08:41.0836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HHX2Yd+jgpuMPEDXtXqKDng6OWIhuLJOT3RZ65721mhPQ1z/Fcn5J8uZLaNG6GxF9kUtEJUZRvBIzBlMKPu82Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7829
X-OriginatorOrg: intel.com

PiBUaGVyZSBpcyBhIHNwZWxsaW5nIG1pc3Rha2UgaW4gYSBpMTBubV9wcmludGsgZXJyb3IgbWVz
c2FnZS4gRml4IGl0Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4u
aS5raW5nQGdtYWlsLmNvbT4NCg0KQXBwbGllZC4gVGhhbmtzLg0KDQotVG9ueQ0K
