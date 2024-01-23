Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2952D50A71
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Jan 2024 15:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706023513; cv=fail; b=BITwznPhTk5NljwXYpWfmKbkCjlE+OodVUzUdZl4XGxyO+xeGbM4TU3bav7XkVCbTuEB5ek6M44puzFXhS5MUe/KUpeHsfyt+cg+y63MrguDVSjKa5WlLhth6+lZAx8ceRfW+AQdJFqcnEsNoRO7ZDMzQ+gDpDplDNnQcsp/2xQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706023513; c=relaxed/simple;
	bh=gxIOmyMuHp7Y9yMns13+TfxPXc3hA/YYRjjKmJxAAVM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NQl92+VlGAlLMDbKSyCTyoWgXiIQkYHFwRWPHOuIWeCxJBPICqVmxjXQ99GYpXhk7D07ebBNKWxy5jND9Pqr5zEPQFrfX9nRZ9N/p9n+eR1nOZ2bxmj519IIaSN1iRDPNLpzaTZbBOL6mTf4KyQHuq73mXq+mDPrB6/Lxn/F0w8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jMh+31A2; arc=fail smtp.client-ip=40.107.220.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jMh+31A2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPHlZhFL4np9clW2BG5KZCoiV9bDTUYrj0bIyj/2dePbpinysCiBmkp5d+2CApnbzoH2MuS4Wmhng2tYm+8j2U2ppEHy6o4bqYTQouCirG0v1JXOT1OuBqyi6C7/38MM+5ZYVDsixiWYhscNVkt+eHKtxtBWnWlQUzJBceTNF9+4v4KcrVUWC9yxAc8jQlAqCIvwJ5NY5IkIMecue68be48ulChXjIa2AB6+R8somPIk9eVtcFyIpN5sIATOUHYgBuZKJr2WZUaL4XpAuWG65LPmRUoWb6vY/+gEWGfihw/5PYIXMVFn2OS22OnPyvylIKNVSEOGhdehJR/6F0Dh1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhyV3FVyfW12sHKQRNiZElaWe2QpH47TCp30hgcBGN0=;
 b=mswkzNSE3TZ3hGF1rcvI9xvCvfqw6bylsydNNGDrfP9jDwnP08EkOxR+f9ljb05tUwF2hpTt6MUNOVwIuTehRUxyO9jw26RdKU4xaMxjnwfDEkGcYnVLJYeLaY/J7e79W9wbcLGPF0GQSGCR8HZ3E8jjg7PU+7vpFcUE5b0WHGRO/+9fcUX7j22poSdqrJUQhaLCsxfUQmeAySaoGe3RtDlNSduayGbe3CRt/tV1Rha0a8DZfA6O9uM2A1drXCcylQACNNoELXzcfVFFQwMF6PUAWgx/4ol9sdO8uCwTXqE7XKKhuKbecdHMo+HOnJxnb4jjEwVyAcqmXl+pv9+FhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhyV3FVyfW12sHKQRNiZElaWe2QpH47TCp30hgcBGN0=;
 b=jMh+31A2I54oFjdHL133om185tByPoCnQjlxyYjaYSEFBnmXiI5DDEct+vz93S7irpnL2M2iJ4wybh3OgsrJbkWdIDbX8TvXlqoMq7fwCHNJkbBmNujOXcQHkElN9XIPb8A6u8zm0qyJ7DpGR4Bmmr8JRfDA6nowUooAEx5uj6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5732.namprd12.prod.outlook.com (2603:10b6:208:387::17)
 by CH0PR12MB5201.namprd12.prod.outlook.com (2603:10b6:610:b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 15:25:06 +0000
Received: from BL1PR12MB5732.namprd12.prod.outlook.com
 ([fe80::200:c1d0:b9aa:e16c]) by BL1PR12MB5732.namprd12.prod.outlook.com
 ([fe80::200:c1d0:b9aa:e16c%4]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 15:25:06 +0000
Message-ID: <f5c5c616-b56c-4e75-9d4e-3d9e85fd8312@amd.com>
Date: Tue, 23 Jan 2024 09:25:05 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] amd-xgbe: Initial AMD 10GbE platform driver
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: kernel-janitors@vger.kernel.org, Raju Rangoju <Raju.Rangoju@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <6ba0dcad-8c35-418f-a892-a8555d57e58a@moroto.mountain>
From: Tom Lendacky <thomas.lendacky@amd.com>
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 vFkWitqCJg==
In-Reply-To: <6ba0dcad-8c35-418f-a892-a8555d57e58a@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0167.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::15) To BL1PR12MB5732.namprd12.prod.outlook.com
 (2603:10b6:208:387::17)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5732:EE_|CH0PR12MB5201:EE_
X-MS-Office365-Filtering-Correlation-Id: bbad8775-9af8-482d-1e6a-08dc1c277aac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qfs8BQt3i5ljpr9cAtcDH5dVpl2griqbV3DZHjQ6VpO798Ixw0x9atWn1/wDSAUa0SluUhZO3p+bSuCbkmU4J1sYkZdaccpdJWJhPkNWwiUavPxWIfTV3AprBff8z2lBa49E8iNgL9fwz8sqkmUBj4Ieca2CCqO+IzKDlKqdkNxqb0d/2CziAR35eMtedTsjoPm20wPtMaTlVZjAsvthhAxTexjjK7OTS0iBrZIk5xThhuwwRQHKZnO5h5xFUqy9WUOQwHTJKfO+9ENbwtMpoIlTMNZu9+lAEKNKbKfYA4NeTNmv1KfEiaMAAspGPtZ55XCpfGZVFV9nTHdeC8bNWpItwTsopm+IpiNhyOY9SwhbufWRVNYX12xohHyGp1udpgtoA9QTLuJao6++8t47BdTgGZ/4ec6W/4AM/t4WszB/CyJVpeXXyXe2fxTdpPzvabRb9BVm/zansJoZk1LGY/MF+Vps/6RQECG4HSDBZiNDMBOdqk69E9uSlC2Yii4dqJ5wTmm7iUD7oUczAd+LRRJdjGtm4QqDXyuYwOuZdSHiCwPcmyQiVbxCGkWgaHF7T0ZKKWXDyMSleVeFYCbhZ59ea/ZVDroAKyoGnp8MmS+MC7X5u1b7fRiuFLGIMXk2ZyALoFLWz1JbrHC8ZwERuj+HEkFwmwj7JAgsVP9l7TJUgR8ngfpt/ABdaI3l0gyk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5732.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(366004)(396003)(346002)(230273577357003)(230173577357003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(6506007)(2616005)(26005)(38100700002)(6512007)(8936002)(4326008)(5660300002)(8676002)(2906002)(478600001)(6486002)(66556008)(54906003)(66476007)(66946007)(6916009)(316002)(53546011)(41300700001)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qm1idHdEQnFSVHFEM0dNWHNzOTlpcmRJMng3cUNFSG9QRHJodDBXa01WbGlj?=
 =?utf-8?B?c1J2RUJra0sxOVZPK2Nzb08yRlJRbWU0T1FOZEk4QndFMWhTYWlIdmR1ZWZV?=
 =?utf-8?B?ZkRWclBZUlUyN2E5bTl6REUrdDZPZ2xmWWM2Ujd6K0N4UG9qdDQ5bFloSURy?=
 =?utf-8?B?SnV6QWpRTXhUcFdicWpEUzJ1a3BKS2NnL3RyTnhRaXNDVFU1My9qS3ZvV3Jo?=
 =?utf-8?B?TCtVNUEzWGRHZmdBNldTWDdrVTVhS1F5WGRmSENEVUtVVHRyeGFKSWQ5TEN3?=
 =?utf-8?B?Zzh4cURPZGpMRitaYmNLUGFEV2N0bnVZSGZuZktOSUpxRVRMMUZuTjRIMWRN?=
 =?utf-8?B?TkxZTXVXZW4wNTNkZ0U1aHIweFZTT2ZENEFHb3ZrMlJOUHloQlJ5MktKenhG?=
 =?utf-8?B?c1c0RzlxYko5bmFqMVZja0FKMm5uM0ZmVDA0SW8zZk5nMzRCK1d0TTlrQ2Fu?=
 =?utf-8?B?K1o4Vm13TXM1V1BTeDBRbmtyRFgzdk03V1haKzdkdFBZZUlxamh6U2RiMGcz?=
 =?utf-8?B?K3ZVNTBDTUZUdVM1VVRmRGtOMW4xZS80NWxPbUFLSnVtNjRDVy9LQmRuSWdK?=
 =?utf-8?B?QytFZllJVFdrY0JFZW5zVGFldWdkdXRENDRUZDlIb0l0UjBrd2xaalJFTEph?=
 =?utf-8?B?RWFYUkNTdUdMUXN2Ky9uVFVlZWF5Z2pYL0RvYXZKeUM4MnluNU8zMXZpdWJG?=
 =?utf-8?B?RHcyaGJJMkxMaXpHc0lNSEVKODVKQnNKN05RQ3kxSFR0Z1F1d0h2RDdSQjFS?=
 =?utf-8?B?VzhPcnBESFJUTUtocmlNQ3cwa3FVKzF0MTBwUVZYZUJycXJmWksrYUxvU0tT?=
 =?utf-8?B?bE5kTFI2OC92R3FYemJMV2paMnp2dzhYQzNVWlp0OEp6UXVnVW1OM2tKWFdE?=
 =?utf-8?B?SFcxaFlMMkhQc3ZMd1l1K3ZSZkJjL1hDUVpwMmM0aDNKWW9iZ2dhSG1nOGhY?=
 =?utf-8?B?Rm8vMnZySHBJMUZqektsQUdlYzI4ZTJmcU5lai9qTDRENk56QkhwUTNSeUgx?=
 =?utf-8?B?WENHWXUwYmFiZlJDRVVrc2EyZkxzUms2RFJGQnZ5L0sxbjg3eldtODJhV1hC?=
 =?utf-8?B?VFk4YUV3QklMakZBMnlTSGt1VmJqMGpEd1VMMjgrUkJORENEWlRMZ0djelpE?=
 =?utf-8?B?bXluWkc4NENiU1ZMVEgrS1JzZ3FDVUtEK3lzUjB6RW1PY3JUTTFWN2dvS1pk?=
 =?utf-8?B?ZkRnc1M0VWpFcUVxaFp5MzJjSEQ2QUVZTmlBaVlIUFpPZzVqckdWMno3cDly?=
 =?utf-8?B?REwyQ0ZDbWRBbkxhMXVSc01KTVRzMDhrcHN6N2swRStmYVlCS0ZTTk1uZkRD?=
 =?utf-8?B?WHFaMG9kcjhRdThPQ2JsZUJnNTQxMUJGb2NoZVRWbE5BcVlLOStCTUZuYWxa?=
 =?utf-8?B?WWtQc054MDhxSTA4UGVheEVFT1p6Ti94VGczemxsOEVoeGUzcFlmN0FWMGp4?=
 =?utf-8?B?TTdTNE12dWZNTzFtTUxmMWhsc0xKOUlBMlZ3M3FQOUhnMllMd3l2eThvQ2R0?=
 =?utf-8?B?YTJ0bmE4Z0JRTm16cGVRbzNnVi8xUVdCK3REdFJnVDd4RjV5Qm40S0RlbXRK?=
 =?utf-8?B?cGlOb0NUQ1lHdGdqREExYlFPNWJPNENtM1ZZOFNKMWx4UXhrekt1TTVSbHky?=
 =?utf-8?B?a0hHK0tLaUsvMlN4bWRkZlo5TVhJanFTcFdHWUhlQk1WREZBL003OHVZMjhP?=
 =?utf-8?B?Q1NXalkxb0xVTGxZY1hVZUNLZDIrY283RnZzUmc4YUR5MGQvVTZCMkhkRUov?=
 =?utf-8?B?enZIUHdTQmkvZHdFblkvenh6OUdyeHJnOEtoUzl2TzhIUWcweVd0aVNDcTBD?=
 =?utf-8?B?S1FSUjcycVNwMGh4eUx2VFZ6OGRiMnlpa3NEbFV2K2syVlV3L0E0dnpJZ0dh?=
 =?utf-8?B?WHlHTXArdDF0R1ZjaDFQN0N6ZGxGSmtrR29ZT25seUJlZGlUTVhrTFZ1UVIw?=
 =?utf-8?B?bnB4MktRSVZuQUUxNHFoN1huUTY1Qm0zSlVvYmt4Tjh3elVta2JERHVxVkE2?=
 =?utf-8?B?VlpQb25oODJ5VmJYaWg1US9JelZEQWNpS0JBM251VThEUFZhODhERFdLYU9G?=
 =?utf-8?B?TmR5NUwzckwvL0wvV2JzWGN2dEh2b1dLR05uRU5TUUhoQkRRT09US1h6c1RN?=
 =?utf-8?Q?tD3RGp1bwI5ecuVLLDM+3TWWi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbad8775-9af8-482d-1e6a-08dc1c277aac
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5732.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 15:25:06.8743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jR0vMJRrz2hVP7uCBI71wA86T0u/F4TzPPVUn6SoEvIbECmV9W3W1g3petTFy83UowvQUnspv6hiWUDFgQM8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5201

On 1/23/24 03:55, Dan Carpenter wrote:
> Hello Lendacky, Thomas,

Shyam is now the maintainer of this driver and will investigate.

Thanks,
Tom

> 
> The patch c5aa9e3b8156: "amd-xgbe: Initial AMD 10GbE platform driver"
> from Jun 5, 2014 (linux-next), leads to the following Smatch static
> checker warning:
> 
> 	drivers/net/ethernet/amd/xgbe/xgbe-drv.c:1209 xgbe_powerdown()
> 	warn: sleeping in atomic context
> 
> drivers/net/ethernet/amd/xgbe/xgbe-drv.c
>      1181 int xgbe_powerdown(struct net_device *netdev, unsigned int caller)
>      1182 {
>      1183         struct xgbe_prv_data *pdata = netdev_priv(netdev);
>      1184         struct xgbe_hw_if *hw_if = &pdata->hw_if;
>      1185         unsigned long flags;
>      1186
>      1187         DBGPR("-->xgbe_powerdown\n");
>      1188
>      1189         if (!netif_running(netdev) ||
>      1190             (caller == XGMAC_IOCTL_CONTEXT && pdata->power_down)) {
>      1191                 netdev_alert(netdev, "Device is already powered down\n");
>      1192                 DBGPR("<--xgbe_powerdown\n");
>      1193                 return -EINVAL;
>      1194         }
>      1195
>      1196         spin_lock_irqsave(&pdata->lock, flags);
>                   ^^^^^^^^^^^^^^^^^
> Preempt disabled.
> 
>      1197
>      1198         if (caller == XGMAC_DRIVER_CONTEXT)
>      1199                 netif_device_detach(netdev);
>      1200
>      1201         netif_tx_stop_all_queues(netdev);
>      1202
>      1203         xgbe_stop_timers(pdata);
>      1204         flush_workqueue(pdata->dev_workqueue);
>      1205
>      1206         hw_if->powerdown_tx(pdata);
>      1207         hw_if->powerdown_rx(pdata);
>      1208
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
> 
>      1210
>      1211         pdata->power_down = 1;
>      1212
>      1213         spin_unlock_irqrestore(&pdata->lock, flags);
>      1214
>      1215         DBGPR("<--xgbe_powerdown\n");
>      1216
>      1217         return 0;
>      1218 }
> 
> regards,
> dan carpenter
