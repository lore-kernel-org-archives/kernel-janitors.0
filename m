Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F5B482D3
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Jan 2024 12:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706013553; cv=fail; b=uV4dBq3erryd5zLXgnReKBdUx6QnbCNday/TlXO9PjdRcGmAX/YdfAwIrgs4rnqfNeWOVLPOENtvhfBYLrU6fBM/0Wcy7QRr7BRJDKr9QvFOkESUXm9Q0Oa0oBTph122M6ixgnpT8F3KdvcbZVF85AgY5Z/Mp7aRuOAvWH2EenI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706013553; c=relaxed/simple;
	bh=2y3fwlPxEx+h9bKE1mczbavZt2TrbX5iFNb2EgiNdHA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZstqNjAYCVGGxEl4DJ6g30ZyKK6RUenn2JHdxlbbYB8ad5b4fvhDkFBro3q3C6+IVRe+dwheyn126j9qqSeRIANy9GOI/aAa3pwqmHbH6da3mO7T8gQyWDfI8vulrUm8epz6M2z+IsnxsCqpVgF11EB9HzwcVBAKPhfPB3XE19w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VLW9pB4K; arc=fail smtp.client-ip=40.107.93.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VLW9pB4K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1BIJBfdf5Tvm6UW9W8HvVL8EV2CQZDmmPzSol0J9DqxCijkdL+xI3ZMLrhWnOOEUxTVncl7aD1/WfOK/m9jyLSz5AHn68TvoDmVwjPlOo/SNePTLcMdPi4/f5CbRewqLZryaqY7TuheX9p/2o+H6H+ImDXcQqD+A4Qvys4SrSMWUbAYdc+zNV3rcmoEaXERZnUo7Xj4+t45DA7MCxMXAA2J6XeOtYr/tsPDSzk8R9x7FIk56l8LwoPjR2w5G3C+iGF1iQNADN7jv8dLIThm9Zvd55BbMObr3CocdjRmdtbar5zY/Y4XDYfB/8XdZZXluvOFyWWiqUJM37Fwa3OWqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldOpUKiMnT2BmX8qEeKgz7L8/TDMVBzwr6ddAuumiAQ=;
 b=QsCYIsIYY8i08hkMmUDiRAhiIq7HvKHUg1GCdQOKljRx/uO6GOfRUeTFtHLutMSlRelfmW3ClrMMSiYngLzM4pxd9oRCiacHhv9rJchtsk+KatYg1coNw2F1LNQ9fiZeJ6YIJDfFo1UswdD3gtugRmeYtcFJB7B+rLK5EBu96vQuLIcaQqLUTf6N52qu+pc5naRUfyHvnpMTYrhN+cezhz/3ogErM+hOUVQQ+1pVz8XXDevMf22l/hBJALswZt7urnOz0vY3YLPJWjsek8jZPs1WbCsjh0xxFxVTuMPnn5Dzo7ouuRwsi2RmLzDncSlx2DDZ8fU+bsevFBMwJUrmzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldOpUKiMnT2BmX8qEeKgz7L8/TDMVBzwr6ddAuumiAQ=;
 b=VLW9pB4Kw8rLBQLWcbMNOZLRyRTbZCH9NGwopqUiBFuStInevgmf+OEljVBIUGgaBczm/HSNEaI7nqO8Mlh6KC2b0Sd4F3cruE0lpG7DVQbT5Zh7qUmYlyxZTopzee53z17xMYD71V7n3WuqBCMvaunHE2E2nsAIAq7MG6opi1s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MW3PR12MB4426.namprd12.prod.outlook.com (2603:10b6:303:58::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Tue, 23 Jan
 2024 12:39:09 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::9c3a:2d65:6c4b:bd87]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::9c3a:2d65:6c4b:bd87%3]) with mapi id 15.20.7228.022; Tue, 23 Jan 2024
 12:39:09 +0000
Message-ID: <106a6a04-c2b1-47da-9c40-7c1dd7416ccd@amd.com>
Date: Tue, 23 Jan 2024 18:09:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] amd-xgbe: Initial AMD 10GbE platform driver
To: Dan Carpenter <dan.carpenter@linaro.org>, Thomas.Lendacky@amd.com
Cc: kernel-janitors@vger.kernel.org, Raju Rangoju <Raju.Rangoju@amd.com>
References: <6ba0dcad-8c35-418f-a892-a8555d57e58a@moroto.mountain>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <6ba0dcad-8c35-418f-a892-a8555d57e58a@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::11) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MW3PR12MB4426:EE_
X-MS-Office365-Filtering-Correlation-Id: 455dff41-3cad-400a-7d6c-08dc1c104b35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aFIrjRc+Y5+xbctirovZi0huoithMhB8w5ERkkUQ6AoQocSp7ZkMWfnd4xoxNAmPSrPEG0eBjz2agm8tB8xDADGeaUd8C+vB89eIrYa0sFuVxsMIb+/kwY06IiJRMOezeOKG33kd0n7OfOrxHna7bwqOkfgVCY0kjhNnvAvZrF/3pVa4F3DpgilMGgUuckldRKKusaz5aEQM35t6Npm46JylvsSzhUpZy4rjunxvxz4FmGOyIAD3x0tlp7x6tcfsu504fGN3z1mVm+TChDjuu76jZviAEtFd5HcWp1gOHXzBu0f58PHC2fG8iZNJSej4xQ6jTnj2NHSRbAnoTlkPSze5icZl2FrOTYT9RGKMh57jRJGfSPcN8+JDkulqC25lIL9DKbEHcnMgkl/svfjkjNipvbccDR7xF2AdlLSch7gZMPK/pFafGKAW8T/6pcQgPxiPI5OtvJV8ONcpo22Z6XI+4mxOX+hmI8WDHkzZOA9KcsUddsYH43K0vX2TmcAmdU2nVSvD4PlzzrCWNOPPgqNWr28CEAA42Uygvg+XuRmp9INfxW85/r4zhdURu848Rpmz7s5ZNZC9Dm+2CUW9WklH6Oi/jloMmkVBEuk29YnYQ7ik1SDoHY5qldX0nygONCPKHG46SSXjRIbQlssEw5v2TTo0gReC9jDp04VDHmtpAN+me0edp3FxHGyKGgdU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(346002)(136003)(39860400002)(230922051799003)(230173577357003)(230273577357003)(451199024)(1800799012)(186009)(64100799003)(26005)(8676002)(6506007)(53546011)(6666004)(36756003)(41300700001)(6512007)(2616005)(66556008)(6636002)(316002)(66476007)(5660300002)(66946007)(4326008)(8936002)(478600001)(38100700002)(2906002)(6486002)(86362001)(31696002)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T01laDZ5dW5rVkhJVEQ5Y3JjZnlWUHcwQlJ6SkJXc1dXdzJkTEpzQzl4TUFR?=
 =?utf-8?B?MTlnTFc3dGFwWDBuQ1UyWEErQ0o0MEVpdnRjVExHR3dQQUQwY1FMRGJFY0lt?=
 =?utf-8?B?dWZrMkIvNCtzQnZCYnRhUjZsWVNWWHhvUk1LMG1OU2laVmVUMWFTYkFUVEVM?=
 =?utf-8?B?QnlXVnE2RHR5VHBaVWkyaCsxY3pSMlBrYy9rbVNmVkE5cVgxUmNqSFhhZGo1?=
 =?utf-8?B?aEM4VWxHbi9ZaGZIUkI1MlVISVorVWVnNEk3L2owVVZ2eG04eGtkcVpUa1Mw?=
 =?utf-8?B?ZExUb2E5N2JuRWFNNG9McXlXZXRNbkVqcFZQejI4UlVPcys0ZEkwbEsybUdQ?=
 =?utf-8?B?RU9lbEozcHFYcVFldHhUK0FnbUFTUEN2cTEwZlhsQWNhVzVUK0g1clZSVjBV?=
 =?utf-8?B?Qk8rUjhPRU5wbnhHRnhGZGVCSC9ncjRtVktnQVM5WXFkSkJCQ2VVeVFkOWdQ?=
 =?utf-8?B?K3orZkpMNlNSYWpleDNVTy9Tams0bnNSQTBCcXgyOFl4QUkwYVo3K2kzbTht?=
 =?utf-8?B?c2IwcEI2VFJkUkJxcVVMNkZMeDVHbDFBdWg3SUovK1JUeHBuV0Q5bFlvRFVm?=
 =?utf-8?B?eURSUmthVUk1UnJIKzFJZ1k1SDd0UU5NZkdXMFVqM1RYREVQNENaNHZ6Z1Ba?=
 =?utf-8?B?SUx4bXpOZVVHRHRLY2FESCtuRTQvZytwcWNlWkhMblhyOGExcjJBRkwrbmNk?=
 =?utf-8?B?Q1Z5bTJzRFFMcmVOcmRoSW9yZDBjcFd1K1ltb0k5cG9ZS3FXVTVkWkNmSXN3?=
 =?utf-8?B?T0VVTTN5M291ayt0SytQUitZZ0dIN2dCTTY1K1FpNTBpVTd6VTVPQ3hiV25v?=
 =?utf-8?B?VEFUTkdpRkNveFN4YXk2K2ZIVXpxYlVCV1dGYkJycHNNUlNWbUtmVkV5M0ln?=
 =?utf-8?B?d04rZmNwMm4wU2xZWkRsREwzeXRmN1BJTWo0Ym9jNEZ1ZlJjODdJSXp2NEJD?=
 =?utf-8?B?S3BMQkd3NU5LV3gwVXpnYlJjdktJcDNQTTNvMnRkU0Z1UjZNckRWazZNME41?=
 =?utf-8?B?L2tldWg5N3NWbmNXdTFWOGU5SHMzNW9yT2FUZjdjZVJtRTVQSjhBd2x2bkZl?=
 =?utf-8?B?RnZXdEp4SXBYWml5bUVOVWtLR0pJQWo3Zk1hRXVQSkdLTklEKzh2UnFObGdU?=
 =?utf-8?B?Kyt5NFp4ZlVPZXg3WjYwK2FBYnd6dFU0NnVvS1ZvN1E1UDYxd3VuUDlvQ0tM?=
 =?utf-8?B?ZWc1a2VoSDVIblFPYk1SOHQ1ZGtxbFMxZVhmcjlZMWhnMG5jV0RvNXZwb0pD?=
 =?utf-8?B?WVVoVll4Z3pYK3dSMzMvc0FYL0MzMHBzOVpUeEVaWmwzTU9Nd0VlT2ltb0FO?=
 =?utf-8?B?SjdYTXZyRkgyZ3NnckYza3NQK0pYZkhFeXliWm1CR3lZZXBvejdxa0VteThL?=
 =?utf-8?B?cXBLRld0VmNWWk1MQkdrOWZ2RVloZCswbk5hWjFEbTFCSS9ObG1hN3plK1Vs?=
 =?utf-8?B?MnNQcE85NHYxRXhXL3d6b2VMNGg0OE1rSDI1a3BJRmdvWDVwVFAyMWtVVGJx?=
 =?utf-8?B?RHdOMUVqU3p1MkptUjVDTlNLUGxTdFNDdnFJV2dlb2ZhMTBhZmFrWWdpM3B6?=
 =?utf-8?B?TFVaaDNrY2x2WmZUT053TVJzeUI0Q3hLemFGSnVtci9WWW43YjZwYStSUW9W?=
 =?utf-8?B?M1pwQ29RMFhEZ3ptcVpBL2hJemlJaytKeG9Zc1BXWnVHRU1zbXlIM25rdk5t?=
 =?utf-8?B?Q3Z5andydEV0WEcyOU1CMUlJakYrTENtRVA5cGxqeEhMQmxJNkFEV09iTnN4?=
 =?utf-8?B?Yi9rN0hPQ2d1NVdjOXIwSnFWK1R0S1gxMC80T0laM3kzajROY1N3b0JlUXpv?=
 =?utf-8?B?KzBCcnh6WXNWN3p1UmZDa0laYjM3RVQ0YjBpZ2cwR3dTY1I4eGc1U25Wcjlj?=
 =?utf-8?B?bmNCVWRnVElnNlFmbU9GYnF2anFxNGJTVGF1eG1TMXB5UVc0TjcwNDE4YVha?=
 =?utf-8?B?emgwSVNXdTFORjhkVmdoMXhrV3FKWTRYYXNKVy81dTloZFZWelhUN25XUzd6?=
 =?utf-8?B?NEJlaHAvaDI5WVYwV3plaXZlTFVjbEo0aExkZG0xOEZ1RGdPRGlOWERWcUR0?=
 =?utf-8?B?Q3A4YmdOeGRzSWpJVFJwbitGU09YeFVmNk5MV2FnZmZBMEoyUHNVTTNka3hk?=
 =?utf-8?Q?Ew07MEgqVYagc8MX3VRENr9Qf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 455dff41-3cad-400a-7d6c-08dc1c104b35
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 12:39:08.7991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GY22tcJDT5gJ2WDXLrc/42CUNSLl4su3v5WS41q+hrCyDSHcWRkkE2tF9rJYMDtRRqusExjMoE1DffHag0T8AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4426

Hi,

On 1/23/2024 15:25, Dan Carpenter wrote:
> Hello Lendacky, Thomas,
> 
> The patch c5aa9e3b8156: "amd-xgbe: Initial AMD 10GbE platform driver"
> from Jun 5, 2014 (linux-next), leads to the following Smatch static
> checker warning:
> 
> 	drivers/net/ethernet/amd/xgbe/xgbe-drv.c:1209 xgbe_powerdown()
> 	warn: sleeping in atomic context
> 
> drivers/net/ethernet/amd/xgbe/xgbe-drv.c
>     1181 int xgbe_powerdown(struct net_device *netdev, unsigned int caller)
>     1182 {
>     1183         struct xgbe_prv_data *pdata = netdev_priv(netdev);
>     1184         struct xgbe_hw_if *hw_if = &pdata->hw_if;
>     1185         unsigned long flags;
>     1186 
>     1187         DBGPR("-->xgbe_powerdown\n");
>     1188 
>     1189         if (!netif_running(netdev) ||
>     1190             (caller == XGMAC_IOCTL_CONTEXT && pdata->power_down)) {
>     1191                 netdev_alert(netdev, "Device is already powered down\n");
>     1192                 DBGPR("<--xgbe_powerdown\n");
>     1193                 return -EINVAL;
>     1194         }
>     1195 
>     1196         spin_lock_irqsave(&pdata->lock, flags);
>                  ^^^^^^^^^^^^^^^^^
> Preempt disabled.
> 
>     1197 
>     1198         if (caller == XGMAC_DRIVER_CONTEXT)
>     1199                 netif_device_detach(netdev);
>     1200 
>     1201         netif_tx_stop_all_queues(netdev);
>     1202 
>     1203         xgbe_stop_timers(pdata);
>     1204         flush_workqueue(pdata->dev_workqueue);
>     1205 
>     1206         hw_if->powerdown_tx(pdata);
>     1207         hw_if->powerdown_rx(pdata);
>     1208 
> --> 1209         xgbe_napi_disable(pdata, 0);
> 
> This warning is correct, but it only showed up because I messed up my
> devel version of Smatch last night to make it assume that we almost
> always enter into loops at least one time.
> 
> The napi_disable() function cannot be called while holding a spinlock.
> 
> You would need to enable DEBUG_ATOMIC_SLEEP to see these warnings at
> runtime.

Thanks for the bug report Dan. Shall send a patch to address this.

Thanks,
Shyam

> 
>     1210 
>     1211         pdata->power_down = 1;
>     1212 
>     1213         spin_unlock_irqrestore(&pdata->lock, flags);
>     1214 
>     1215         DBGPR("<--xgbe_powerdown\n");
>     1216 
>     1217         return 0;
>     1218 }
> 
> regards,
> dan carpenter
