Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932C5C61DA3
	for <kernel-janitors@archiver.kernel.org>; Tue, 21 Feb 2023 14:31:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233396AbjBUObL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 21 Feb 2023 09:31:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjBUObJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Feb 2023 09:31:09 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF8CD2887D
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Feb 2023 06:31:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8YQ57qbNU/X/4AXxdWt/JWddQXzajdzIrUKm5zofYjTE+fHcjvYFEnToNWk9Uxmq7qtCUiidHeVos0lzC/FnM+zatxinXSWH+EDhgG9N5HhEeGrirF0XPA8V1k7TM1DkqljPMR0mXg585UEsuj7U8gp9me4tPZo+yd1LFPESZRI8zfYx4C6Llh+5w2R3uupc1ahoU6rPqvc+PBAtOqPWwx0ydnZlrX6NZGMyrkb7V66ikjyZR8Tp0xsGB+FSIn9XX4ZpitxFsXceqrjVzmHHQr4Q/y2O6P5BNkkzamhC7k3ZitN75n4XvKd1NT86lDvK95wh/HLFTPhv0l0i7AWHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIpVcGxrgxdCTK0mm4cFsb+kctVeRU6QlrZ/aMl2y10=;
 b=Vv6oPitH+If4OcDnu27+x2uFWlbHcoxmfvRTsBntGsJfHR+YQJn98IPjNbIvXntgpT6Mq2mKGUHK970/I1FRWKdGFZzNfDBQKXOxmoxnpK+VbThAHxye5EVDrIQ4E+EtG+wYNi+blQW7yStPR5y+lwGcspOt96Dy2csIcoVU1oON9JuOWbXUMbBX5b+tTWggpCe3zvDKhp/WlGuk+UR8xSQcjvENqB8wkVI8iKqUMQAH+GiNB0VMKCSWk7uf742SvpqQO1mv6fqfrqgoodlJcUhsFa32gYAPTbi8gs26htajVZYX38h0bDf4ueKoQDgThRYsH4webRfdYRCwxJXBNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIpVcGxrgxdCTK0mm4cFsb+kctVeRU6QlrZ/aMl2y10=;
 b=ESulMszhIpFEpIR1redN39xk1XhW+lj38jBLL+W7EPSMJmPZb1WmTk8G/7G9l4+sGJMhU2OJG7qa41uR+hyb1yvqA+8lN/To6y15K5D+qGKUAWWpkPpkZbBegr40/xH9YeU7s1Z2+XvbQghg2BTONr8Z2ppHWoGAeFOy/5dPCJdlyvvxL1ZGAU4xonuQpbM+eQYrf2gCl1kwZAcw9QfShwf3kX5xnqLVzXuD/Cm3GDe/v3IxZb048AGLKxrdwSWb9AWyiHYWZ7LOujErXxmPeXc2s+dTtkrpomDGbY5r+qGHJP7Wo98ymO7axDgE6ccNEAqMT2kK4Difg/9TlskINw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM5PR12MB1307.namprd12.prod.outlook.com (2603:10b6:3:79::21) by
 DM4PR12MB6254.namprd12.prod.outlook.com (2603:10b6:8:a5::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.20; Tue, 21 Feb 2023 14:31:03 +0000
Received: from DM5PR12MB1307.namprd12.prod.outlook.com
 ([fe80::f60c:b201:573d:78a2]) by DM5PR12MB1307.namprd12.prod.outlook.com
 ([fe80::f60c:b201:573d:78a2%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 14:31:03 +0000
Message-ID: <f68d072a-151a-561a-97fe-1e4a9400d41e@nvidia.com>
Date:   Tue, 21 Feb 2023 16:30:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [bug report] net/mlx5e: TC, map tc action cookie to a hw counter
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
References: <Y+5R9kYqVeaAsKUk@kili>
From:   Oz Shlomo <ozsh@nvidia.com>
In-Reply-To: <Y+5R9kYqVeaAsKUk@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0043.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::17) To DM5PR12MB1307.namprd12.prod.outlook.com
 (2603:10b6:3:79::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1307:EE_|DM4PR12MB6254:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b1129cb-6564-4836-73eb-08db14184240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xMQnp9wdSs+ef6qPsJg0XguaGVhSNLRZFcxUyxpc87SYzurLWg1nm7A6v/yd9U1XCoIjGmlmG4FIblRWoT8DX65IHUT7ihoV8cL0D6DCopPMy3hALlgtlAn6vyVM8m/qtShRg2FDp4RvZbPWVKmf2iZHPPT8nUHng7ggeUlHNtkrUJVbz+Aujuo8v3Oh5Vr4DfzUkeT7DJpCPfc/x32Bj3Vaim8NhxSod/ULAppgrXdD5os64WaW4lmCYxwoEOJxEFPxYfMRg0Efl61YznAToNkMs7atQm0qbbwcwbGHltmOgFaOVlPW5XzNM5ed0rp1icbc/zGfxdmX+Tm0rvwJI86wGwjdr602iBce6W7R13U9Vs9kQohtDlWD/VnMonK+ahEN51fHPR/iCTqlThmKdZT+LFRxJJPn27skPQ4UqIFU6oVv7EqA0nFKtTtaNcwG8hmXbKpTAZ987+pm+5E4LbYJuBudXPrahLaWczqTca95iKTGAnQRmpHijVsnZuRq+FCDfzRBXwG+A8J2lN0Ux41C/bkFdtU5w+hFY7pdb0koejoXFLaKlhCMEoNH3J2/YUv71K59zxLKWVxI9AvBYN3DYUpIlnRB+GbRU2k1182aMu+E4QMKUB7aTUpArYukmttDeQRhlFo1Z41a6YLQBzu2HgtsrTuWPkqtyG5CuqebUWjc3G+ZRd9F/ptzsD9uFQG28dcprqyLGqh6oyu9XwV5iWFJV5pM+SQi4S+OvxU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1307.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199018)(36756003)(31686004)(83380400001)(2906002)(38100700002)(86362001)(41300700001)(2616005)(8936002)(5660300002)(4326008)(8676002)(6916009)(316002)(66476007)(66946007)(31696002)(478600001)(66556008)(6486002)(53546011)(6512007)(6506007)(186003)(26005)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3FHYmx5c0JYeHBZbjhxQzVmcUZ4K1JiSEZzenh6OVdNUG0wRXVGNGE1R2Mz?=
 =?utf-8?B?TWEwZHR5Q1F5NTdzRjR4SzhpeEJSYkNPOSt3QysvYThqN05hZ2RQdEkxRks1?=
 =?utf-8?B?eEVmYTFzVFFVanM1YmRpaXhBRXdiMkJuWTF1QXVrUFArdFFYM2lzZXRGYzE2?=
 =?utf-8?B?RTZ0VitKVld5K3NpTXAwL3JzMGdyazhOeGRUdTlIMlJUZ3Vkbm03YWxaN1NO?=
 =?utf-8?B?elp6MElmUEFlNEZJSnBLcG15NnpOdUlBNzk5blQ1bW5pakJCNkVaSVB6NHRJ?=
 =?utf-8?B?N0VzV3cvcVAzMURzd0JSZXdNSHZPUm4xVXVMWWN2VkxaWTdXWDNTekRJVnZN?=
 =?utf-8?B?T0NpbzQxWXJPaFl2RHY1NzNZWU9zM3BJR2dmV0IxMHkwN1pIZTBlV1RvdDd4?=
 =?utf-8?B?TzZLOU1lZDFPMVJFQ1A2TFBkNEt6cUZqSERFdnVDVjdWMXBIMTY1SXRMZmha?=
 =?utf-8?B?YjRSZXFlSkNqSjVOTExBdEEzT3JxMzAvU09laXVMZHl6MDg3UEgyeXJjWTdt?=
 =?utf-8?B?aFp5Z2V6VFcvdE9Lcyt1UGppNlJycDBtVW5OVGUrdEp6b3FVWEFGVDViTlRa?=
 =?utf-8?B?UDF0T1VnRytGdEw4U2NFNDRaejJGQzcyUldhZ25LYWFBakpWUlZzTVFEVzBR?=
 =?utf-8?B?eFhpU0owTG1LeGR2c1ZtdXltVUxKV1lmdW12YVpMa3cxeW5pZXJ4eWpFY1lW?=
 =?utf-8?B?dE1ST2VuaUQweXFoWFY3dUlPZzY2MnVCdEJzenhZa2VRUlduN1hmWDUzVDhq?=
 =?utf-8?B?N3Q5VFNjdkxOVVVsZSt3cThQNC90Mlh4dkszM2ZodWZ6MVZsL0lESlp0TE9M?=
 =?utf-8?B?dWVsSDZyMlVNYk9GcVlDT2FLV3NnWG9TQ245cUZqMTFPb2VZYzUvaktPeEg3?=
 =?utf-8?B?ME5LZVhxNGVaMWFxN3ZqaGorTWgwT1JIbE9sM1IyaGk3aHpKWTFNMUtJRHZX?=
 =?utf-8?B?eXUvTndrOW1xdE55L2M4UHppZ2lmVVJsMWE5Znh4NXhHMHpMTXd2UXV1a3RN?=
 =?utf-8?B?QUJPeGxiM1Z4c09oRU5NWUp3eGRKM01iN1VLeHYwU2M0cndKZ2N3bXBvV2pR?=
 =?utf-8?B?aXBHMFVKa0pyL25IQXkxVDBEemF0YmYrOU83SWsxSStUS0NndE9vM0hvS1VM?=
 =?utf-8?B?bWs3aExnc1VkVmlDZVZJSE5MSjNCazN5UTVVUGdLdWdoY2VZSVAxVmFhYWdN?=
 =?utf-8?B?Z0JNMHFxUDJWQWFUKzBDQ2ZrMXBJUjF0aUF3amZMNzNmNmpxcXhaSmI3OFgr?=
 =?utf-8?B?bitqZlBZZlBMV2lFYlBoOVRXRDZOdmxFYStESzNhTWZLbDgxWnV5TkIzR25O?=
 =?utf-8?B?b1NjamhSbk1ZWkxvTG5zbHprdDJHVlN1dUdHUUhpaXozME0vdzZGcGNqT0Ur?=
 =?utf-8?B?UmYwZkl5TzdWb0ttTzdoaWtsREpld0ltK2VCZEV3RFpOM2VsV1hVVzN1WEhO?=
 =?utf-8?B?YjZtME05OFFiWmtHeE5uUDJhbit6WDBVNE5JR2hBRTU3bnZVZHlkOFprZTdP?=
 =?utf-8?B?VnA2UUFRNjBSR2E5VXd6WXJ2dy9jNktVY3lTYmlhUnAydVYwVzBDeFAvazE1?=
 =?utf-8?B?dDkxYnlOeEd4L3E1Um1odGRPamNxZjNsTFE5MUNFMjdDcnBVSmI3RjNIOFBC?=
 =?utf-8?B?eDMrZGszS2pja0NQNHlBSFJUMnVVS05lSlRWMVdOcWxrRFM3NUp6UWZ3dWkr?=
 =?utf-8?B?dk54NmdaWDJ5U0NLZHpaSmVnYzdWOERBT0hkT2RJejVRUkRPQWJGa0pGNGZE?=
 =?utf-8?B?Nk9NYXJ1Q3hIMlNoSHBpbmVuZnYyM0ZTQy9RK0tyMUx1a2RmeXNWNUxvdzhP?=
 =?utf-8?B?c3FPZ0JSemt2a0puQTdqQWQyZ0xYMnJEMlc2TGNDWkNtSGZ6ZTlOd0hLZHNW?=
 =?utf-8?B?ZzljU2xXd3FLZzdicDFlU2VrWnMrU2FPM2w3RVVSdFlCdG8wSTBRZWg0V1V1?=
 =?utf-8?B?YlpaWjloS1FmZjdRd0RoVm01MXNDb1VaUGNndk9oMEF6b0JZSHd0amtZVE9y?=
 =?utf-8?B?eUxjeUZNd2xPakVPK2pPS3B1Ui8ya0xCa1BpVE9Nd21rMGJIQVVja3VwWVB2?=
 =?utf-8?B?cFVFYmtwdDhvY1lna2hGVzM1RnB5TkhuNDI0Y1UvQ1hCV1lUekl1NDNzbzNw?=
 =?utf-8?Q?93d0VllhrOAEOwEWnSRlCLWzR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1129cb-6564-4836-73eb-08db14184240
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1307.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 14:31:02.9472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1I1KTKkdo6OlOLWJBkny53jmF94NmaYJUNDDG2pE73jgkIqZ5jtyFiSKonczPe0S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6254
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks Dan,

We will send fixes.

On 16/02/2023 17:55, Dan Carpenter wrote:
> Hello Oz Shlomo,
>
> The patch d13674b1d14c: "net/mlx5e: TC, map tc action cookie to a hw
> counter" from Feb 12, 2023, leads to the following Smatch static
> checker warning:
>
> drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:5032 mlx5e_stats_flower() warn: missing error code here? 'mlx5e_tc_get_counter()' failed. 'err' = '0'
> drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:5019 mlx5e_stats_flower() warn: missing error code here? 'mlx5_devcom_get_peer_data()' failed. 'err' = '0'
> drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:5379 mlx5e_tc_nic_init() warn: missing error code 'err'
> drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:5515 mlx5e_tc_esw_init() warn: missing error code 'err'
>
> drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
>      5375         mlx5e_tc_debugfs_init(tc, mlx5e_fs_get_debugfs_root(priv->fs));
>      5376
>      5377         tc->action_stats_handle = mlx5e_tc_act_stats_create();
>      5378         if (IS_ERR(tc->action_stats_handle))
> --> 5379                 goto err_act_stats;
>
> This one is clearly a bug, but I'm not really sure about the first two
> warnings.
>
>      5380
>      5381         return 0;
>      5382
>      5383 err_act_stats:
>      5384         unregister_netdevice_notifier_dev_net(priv->netdev,
>      5385                                               &tc->netdevice_nb,
>      5386                                               &tc->netdevice_nn);
>      5387 err_reg:
>      5388         mlx5_tc_ct_clean(tc->ct);
>      5389         mlx5e_tc_post_act_destroy(tc->post_act);
>      5390         mlx5_chains_destroy(tc->chains);
>      5391 err_miss:
>      5392         mlx5e_tc_nic_destroy_miss_table(priv);
>      5393 err_chains:
>      5394         mapping_destroy(chains_mapping);
>      5395 err_mapping:
>      5396         rhashtable_destroy(&tc->ht);
>      5397         return err;
>      5398 }
>
> regards,
> dan carpenter
