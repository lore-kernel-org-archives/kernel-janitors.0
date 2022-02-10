Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3098C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 10 Feb 2022 09:30:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238597AbiBJJaN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 10 Feb 2022 04:30:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235338AbiBJJ3o (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 10 Feb 2022 04:29:44 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1DBF1125
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Feb 2022 01:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644485377; x=1676021377;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=42WPzRfjzpiw9Qy6uiLgkdunh7Og8SSToqs4zDyK+vU=;
  b=l7ek2ZUT7jrLuYScxNP+GmhdDb9lxr4ZAdrVfu9urIIJQYpVWGJGS2m6
   HC9FeuMftXyKTcbgQgGaJLvcMcTB/O9pX2/WLobWeWqgkd93GnpbJJyxl
   c9ssQOmPCkkJUUmOGrIgG4LAw+HoMy8hhyDcD5XXDAnbcPq44Q7BryE6d
   uzu2PLQ2VuZLjxoNKdfyYDBkf/TWYShfnI2fGpkhourl2D1TRiQUJ7DqT
   RoCm93vMTTiKB7xP/zJNvO+alCG/duTapN5ilY030LcnYtyI3V1fVUbNv
   Q7CpQOjN5+RrxHd62t0dRxaE7S/TBck0hFrcqIBvQ26rTv+LSy/uz1j98
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="249659194"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; 
   d="scan'208";a="249659194"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 01:29:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; 
   d="scan'208";a="629627976"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2022 01:29:37 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 10 Feb 2022 01:29:36 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 10 Feb 2022 01:29:36 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 10 Feb 2022 01:29:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BF6CtMLmgprAJKoxV/T5BjuHldeL5oYt6T9mFX6QI7FNOkKjCbRDM8PvjXc06SyphYEB0QcX1k54uwB1k2DYX5GZTxUsPUx+3w0se5iXeBihRMIewTpNfzwKXsfJyVWgYufrKoJnOefiDf1xVSAQDk4/sk3UuQObQs0I1izumS3oxIB+9RYgSHMYaPwScrMxw4TQNvi/qnF88kKuV+HAgf0eg3LV/0uBOlXxM+JqG/s5r9maN02DNq2r9/58RMmesJr0R47YKm4yIu1mRqiqAusZhdBQhDuKyuLsEVu3NIadS3gFZ5PjtW5JJnmE5ALxcC9mWAGpxLrh2UGy1WO+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alzoUgYz/v0IlSxWHcnFApADBBbn1avCM6VsKZDAIT4=;
 b=lzbp4DuBgOXhLykpwtjozbxr8GFZaysEBU+XGJM/R5mm3VIFIG6Wse0kqtTiKU322ZowuclkuwsK/A7kj5Y+fVbOCmg1rNImm7sILjZKawPvCqYfRaW/2FsSolNUORWtZX0Yj/tyYW6n1wBDLxlF5nT973D8wBuYAE8JXgmxaMt0WaTty98sdM2i3wmEqgjrM0+UNy/YXsnIOHvT+7cOORViS+zPhqnkO2hBvalvNJIVvhpF17SOnvsTSEE4PBm6sXpM23XNt0m8IsVjseyEdTGaf9rLMo7z6sSxzFxplblXdfHMXoX/6WRHIoc+8z/I4CjngouFBjcN4ebwRFw/DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6PR11MB2731.namprd11.prod.outlook.com (2603:10b6:5:c3::25) by
 CO1PR11MB4929.namprd11.prod.outlook.com (2603:10b6:303:6d::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11; Thu, 10 Feb 2022 09:29:34 +0000
Received: from DM6PR11MB2731.namprd11.prod.outlook.com
 ([fe80::b4f9:69c4:33a4:aca2]) by DM6PR11MB2731.namprd11.prod.outlook.com
 ([fe80::b4f9:69c4:33a4:aca2%6]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 09:29:34 +0000
From:   "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [bug report] i40e: Fix race condition while adding/deleting
 MAC/VLAN filters
Thread-Topic: [bug report] i40e: Fix race condition while adding/deleting
 MAC/VLAN filters
Thread-Index: AQHYHLxdpZzrmY2O1k2Ha2UFp5bI+qyJe/QAgAMKUeA=
Date:   Thu, 10 Feb 2022 09:29:34 +0000
Message-ID: <DM6PR11MB2731DFAD68B949A31E5B2E29F02F9@DM6PR11MB2731.namprd11.prod.outlook.com>
References: <20220208072004.GA19479@kili> <20220208105750.GT1978@kadam>
In-Reply-To: <20220208105750.GT1978@kadam>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c756032-7cf2-4bd5-aab5-08d9ec77d9bb
x-ms-traffictypediagnostic: CO1PR11MB4929:EE_
x-microsoft-antispam-prvs: <CO1PR11MB4929743A27EBEC3586A8559FF02F9@CO1PR11MB4929.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F0IWmF9BE+B2as0eTY2NodvjtKu4e8G5kjpz1kZGJoKX1OexvGfynevuzrbbC+deYYdvru07rBNyyZwJ6EXQIqxspQ7ih+8tKc/vAnuk7hZOqz9iMiel/8ZkbK+mJxHq+8y5jQWxYEqD1m7jpuEQp6JHfPBK1NXYZSOv095tkiWOp1aON92vHdoZ60AmawZ6Xulkc9c7lIumfW+lxW7P0XP5qXopeOaVuI7VYUl7yyXQDiJgzsc2HK3Crtm0y+9wZHcSo/G5BPnKKT4LpmPumw9dxXNNyyGy5eu6ljDYyKwitDfU3bMjVL3gw33O+coB4Z0Oy+ky69KHVvz92afjGx6U9ba+RHrR6MuOYtkS3uiuwesZK/OmkNE9htje9XZ7S8Y7LRn4AxOkPpRAFMNJtt9yK3o08O3lCJxEMBnBb89eITVFaNN7oacE8VM/9i5QwgvfjTyIGdQVBVy/J0F3YTf3+YOuln6jH9zTIrCqkYR2jHVXqMtVIAfpu/a/JaisA7jaWqXrIcvUtSVo7Slb40+mRA/cIasY3XHl093kORwausSQkiFclNtRC/AhL36a7Nj+L0SEwnQPV0GPR5GqVPB5lQ9RqnPa2l6mVjNvKLGF0wPxqniw1002DDKuQf5WTQUM0lHZdIL5HQV5BI+y95lWSwlQftImQKEe/C9a3TypDC5RYpw6dwQzvatQf5svySrAV1LmVR5Eqp60UdYRaQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2731.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38070700005)(8676002)(33656002)(8936002)(66556008)(26005)(66476007)(66446008)(4326008)(55016003)(71200400001)(38100700002)(76116006)(66946007)(64756008)(2906002)(5660300002)(52536014)(186003)(6506007)(122000001)(83380400001)(6916009)(82960400001)(508600001)(9686003)(7696005)(86362001)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Tks+smO6SPwCB/rW+bZsixDOQfeZfbKNCIaIf4oCHmiuWH/SGJFZsOZwNyBz?=
 =?us-ascii?Q?gz7HLOxO1xScNj1N/7+n/Stj0usrx8IfVcayWV5UpVcnm7GQ5EytARN69Fmj?=
 =?us-ascii?Q?8NGF7cwj8P8ausEhE5zDpmmNOXID/BSdn9kSlTcU7b11Hrzmq+1MC9u9GQaS?=
 =?us-ascii?Q?9vhdaETYQi+oxf9HvO5ad0C65/TJpRZy0wowgER8iM+wwn86Rq/NWGbjukwx?=
 =?us-ascii?Q?fg9OuqMfuuxjXt13htTc8t11uwVkoiQaGDbcXsRIAK0bXiGplbzEcAstxYZj?=
 =?us-ascii?Q?DJSmjUu/6Onjr8pRA/mF8/GgFIknbKIMmKf98I77PrU5Yixm0UVmpt9JnujX?=
 =?us-ascii?Q?InEravmjoKoBvf4JQEFbJ/j5g1S7s2Z0y7ObmzqTpQ9RcirnLk6eLT2/K5A2?=
 =?us-ascii?Q?didHKerZltlrHxf77qRH4StW0dOS8Ohp0fx5OKNRzpFWf5ziw516DuxjYXts?=
 =?us-ascii?Q?pjyvrNhoKGMXDSIiRdI3a0om766163U0zwtaxQ7VXU+xX8qb07r0BPlU10N4?=
 =?us-ascii?Q?PiF/bpB0gRq2jEf4rVDI5qLfpH9oUYJZqRgHjs/Fc3kzAGLO2Pf8cQMkSS8P?=
 =?us-ascii?Q?mn8Dggyn+MLCp0Us+dZAaa9taQFX8m73YxN/x0RVcDrDxoGHVRNlrR9o2SS3?=
 =?us-ascii?Q?dKlyEd15UyTDexQ5QuH0h+Nct8OHnwf4L+iU+7TP1A52ziBSu7a3T4HkT8b3?=
 =?us-ascii?Q?QCLY7nhmzpzBG+/4tgnxh88HzrW7VPo1itR9qYry+hTwPsxnHkklK8Bbkx4I?=
 =?us-ascii?Q?kF7DbAXSw+gQowxElMqrnjDRcjFGBBpODvOQYUaRUrayu84QYdi7zC4IQ7nt?=
 =?us-ascii?Q?jmijNkevBW0MNP2MYKKZZAdhFO5EHC5k0p8RqJMFaHN2xSgvLbuDu9M5wGc1?=
 =?us-ascii?Q?i4l71OUE5ZNnP/FUytFPC8CyhR7MjJvqziwCVN+nS7a1i7T2pRBg/GsrN+zv?=
 =?us-ascii?Q?/Q1qv6l3XKxR5pwkumG8xscp6O5dlVQgjHjT9ooBXG3aTM9Vt46Oe/5r3o1Z?=
 =?us-ascii?Q?c1HlLcOld9pjpiaFT7woYKY/FAZUdBPU9sYYiPLZl4dMSOYvOrfSeF3JbWjB?=
 =?us-ascii?Q?owdKkw+r5bqVwFpyH4eqCUrrqjMr3cCe7tywoUHq48Y2z0vl7xZ6ADD6M1dY?=
 =?us-ascii?Q?EjUWWQ/thbPyBQG186KiQc7hEJMCxJA1nYMOfzV9k7okrvHyD88R5vtgWj+o?=
 =?us-ascii?Q?etfVsGxscNVF5Altb39oLly9aWVt29n6YtWUKSHK/XbFXpmA/FhDF7hphRX1?=
 =?us-ascii?Q?k20dtYXs3fnpcBnwFTEnFZn1rlA2zqaQApzIwzErznUacc16s9JUTISxwxns?=
 =?us-ascii?Q?l7w7LppV4KR7P8xnXXdmdrrtLQOvy5K9h1x55h/Y5Hp5lu1On7xdPrU69+d4?=
 =?us-ascii?Q?3TCYBrZaG4kDwgEQ3qNGC0y8hewfTv83H8j04k2Pvj/5EfrVC6Dl21rG0LWD?=
 =?us-ascii?Q?a8tS0jJN0kKzegdwhnIVpuslHH4EGSbWbhcrHLDNOK48fdOhNTkt+qNW87rg?=
 =?us-ascii?Q?2Tl4Fz0NyhLc/V/9Rze/C9Ft63W+0emDa9dl+N+S1adK6UUaFnJKhIhwBZHd?=
 =?us-ascii?Q?vGrL+4w1lMzYvkl4kB4jowQiGM0X0yQFksbCBfzDoo0dJp+2pQOY2UaTjoMF?=
 =?us-ascii?Q?719JNDYJaMJYk8NlSKKRxoGrOUazeo+HvOKS7E6r3jpdxgCoEktGF99LCB3p?=
 =?us-ascii?Q?f6kSkA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2731.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c756032-7cf2-4bd5-aab5-08d9ec77d9bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 09:29:34.6760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XRByz8AEAGzZLEiA9Q/aJ1wYqoButbjMa0D+ZrgFvsK0Lg4SMfGqAHEpEU+uHGwYeOyaPvmGyjkoIAwZup8CipzuIJpmpzoJbSqFx/UP3yE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4929
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Dan,

>> The patch 53a9e346e159: "i40e: Fix race condition while=20
>> adding/deleting MAC/VLAN filters" from Jan 14, 2022, leads to the=20
>> following Smatch static checker warning:
>>=20
>> 	drivers/net/ethernet/intel/i40e/i40e_main.c:2153 i40e_aqc_del_filters()
>> 	error: uninitialized symbol 'aq_status'.
>>=20
>> drivers/net/ethernet/intel/i40e/i40e_main.c
>>     2140 static
>>     2141 void i40e_aqc_del_filters(struct i40e_vsi *vsi, const char *vsi=
_name,
>>     2142                           struct i40e_aqc_remove_macvlan_elemen=
t_data *list,
>>     2143                           int num_del, int *retval)
>>     2144 {
>>     2145         struct i40e_hw *hw =3D &vsi->back->hw;
>>     2146         enum i40e_admin_queue_err aq_status;
>>     2147         i40e_status aq_ret;
>>     2148=20
>>     2149         aq_ret =3D i40e_aq_remove_macvlan_v2(hw, vsi->seid, lis=
t, num_del, NULL,
>>     2150                                            &aq_status);
>>     2151=20
>>     2152         /* Explicitly ignore and do not report when firmware re=
turns ENOENT */
>> --> 2153         if (aq_ret && !(aq_status =3D=3D I40E_AQ_RC_ENOENT)) {
>>=20
>> The error pathes doesn't set aq_status.
>
>In my head, I wrote "The first error path doesn't set aq_status".

Thanks for that information. It is going to be investigated.

Regards,
Jedrzej
