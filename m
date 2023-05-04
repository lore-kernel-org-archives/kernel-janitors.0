Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786F7C7EE21
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 May 2023 16:26:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbjEDQ00 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 4 May 2023 12:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbjEDQ0Z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 May 2023 12:26:25 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 490A53A88
        for <kernel-janitors@vger.kernel.org>; Thu,  4 May 2023 09:26:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iz4IJk5Dl5M7jPY4tG0tex6sEi7dshtaT2lLLxe8k0HDfUZX/K03iaxLGtz/kAMT1vpHKXUqRvot/RMpJXm1b3zgV9+zS1mCu7jlgUfDWpj/oX9HOMeOm/ouQKqLll8+2k9KcJrHy+GKmiE3JN/s3mcIJ9Cx9CtIQgsgE9AAP/DakAGSXqfQeqfv7dd8BNW/MqQmxXIZk5xqMwukw+w52Hst74z9xe5XSEPRvoYROiG2jmsA7C3WVdxYtzORBAwmBJx8KK+nzN+a3P+JNGeJCT/umLLuEpR7/fN8Zuydah1qTuwva6EgaOIymaGrEm/kMo1hncu2c7+ZiosUmo2oOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRmrIEYISvpJh7dgNGdrfisRB+KAI/8x57gE7VY7xWY=;
 b=DtiAmPS4nEGNSa3Mwm8vmowEudDZBBr/WqMx10s/ji1lU5uD1d7RqLQwtLmBAZgJU0HHUjl7sfWKZ8S8PwTF5sBPUouu9IakozWW78f5eupY8oDIXBg9GHS5pZXac1mIRFPhp2N1UfgvUKo9KR2RCLYLwdGKZwoy4HTgyk7TZB9yHSoekdGk3tXRxtlUnSHOPX4p/yP6zEPP77RS/nFvq3jwR8y+3jOhJLlQM4fNX0/ivQgdtEEQ1NaUdhlCyQRHt0RgFbZTMijwwwFjiq+zstNvPVGUMzsekyyaF/UFp7i9j8m7/OoY0pzs1REnhzHuvISMpvJgxFaxVdHUetcTdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRmrIEYISvpJh7dgNGdrfisRB+KAI/8x57gE7VY7xWY=;
 b=dyNdsLY+7ZWfU7SZBm9tamRLOXLdfwcXdbEojtNr2hHZrLilJraK7xVY80BQD8svdaKyeAsQCvFZGvD0M95iMOjd3PeY+ByuTBmKj+/QPYzE7VDQrasLhKvx+TTnnS7sjX3vn/5yliym0rkEDxA9AzO5FEzsHeMBJ1wvqc9c4oI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) by
 CY5PR12MB6479.namprd12.prod.outlook.com (2603:10b6:930:34::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.31; Thu, 4 May 2023 16:26:19 +0000
Received: from DS0PR12MB6583.namprd12.prod.outlook.com
 ([fe80::fc3e:a5b4:7568:82bc]) by DS0PR12MB6583.namprd12.prod.outlook.com
 ([fe80::fc3e:a5b4:7568:82bc%5]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 16:26:19 +0000
Message-ID: <451acfbd-97b9-f359-5fe6-9bf243da463a@amd.com>
Date:   Thu, 4 May 2023 09:26:16 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [bug report] pds_core: add devcmd device interfaces
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     kernel-janitors@vger.kernel.org
References: <209a09f6-5ec6-40c7-a5ec-6260d8f54d25@kili.mountain>
From:   Shannon Nelson <shannon.nelson@amd.com>
In-Reply-To: <209a09f6-5ec6-40c7-a5ec-6260d8f54d25@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::26) To DS0PR12MB6583.namprd12.prod.outlook.com
 (2603:10b6:8:d1::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6583:EE_|CY5PR12MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: e8156ec6-b68b-4132-b78f-08db4cbc4a57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3in8AzALhwVtCKZy30BdDtTBdQ9d+yZyFuVYqz6W+hhD2LkCLDTNBbnidaYjy3lz7CJC85tvSlcnsp4Za9uzbd+MHX+JXnSBGPloOZUmn/HascoVTQVan1O5Y5W8SiodVdb/kOFMkpvvan9zLJTFkD9ceTx/EaaMqA4eercwS2l3ALr3klYTQQgmPA/Zuf9NGK8lA1yk2PtZ+03YjAc2td81xPbIPTGLuWm9Up6YyGa0DY7sBQWM/4wnYsoMqbUSn8Vp2RTGMW47p52lhNbGg6jk0RJJbX/7/aIog6T1N0VKubPSywZtmPZZc4kIjxSObq3ySLIr6Z34k3vCrnofa18a3VF3uIlU/mzCx2z+PFVBNXgVNexviuFe5wVQnalb+tFnfrSh6tkS3OhPAIM94jAY6/DvE4ow76J+rIWou7IczKzjISqJnFp10o1JfwWHZOWWR1jED69opa2aFAwz6KyiJv5SVEIXjhEKNnnBkQA5Fw9Mrg5qgNciYhwbgkvS2UZSEdxfwAHbWfpP1fnq3zuVt+VINKmmsmBv/3r8r1K8ojO2Cb2UvkFaxNqlF3wIG0afRbBcjXogAX23luofqNovQCTgqF8BoCocrpZoCrslUXjM6JwTsFR6nH+7juRel8lQ2ctJ1q9AiVQvu1LXqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6583.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199021)(8676002)(8936002)(5660300002)(6486002)(83380400001)(86362001)(38100700002)(26005)(2616005)(31696002)(53546011)(66946007)(6512007)(41300700001)(316002)(66556008)(66476007)(2906002)(6916009)(4326008)(186003)(6506007)(44832011)(6666004)(36756003)(478600001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHNCSnVmVEt4cUYybnRBSnpjUk0xdE5qdVRXcVVwVVMwdUpoTEZtNVM4Y3pz?=
 =?utf-8?B?cFdrbXo4Z0ROeUpRb2Mzd2NJYlJRMHFQYXRrUUMxTWVEeWtZaXB2WHBsMG1n?=
 =?utf-8?B?MWRsNm83THRnTGpCNUkvZTI1TGhXOWY1b1lyeG9KU3NBbWtUMWZ3WVBYWDJ1?=
 =?utf-8?B?UU16SXhYdHJPZHlJK2FDRWZkMXdka05GcVBKZEZnQWdGL0FFQmpsbnFCY3Fu?=
 =?utf-8?B?RWRrY3ZtRXVkcVBNVkpKMDV1VVhDeGNHMXJzQUdXZWRsUVI4aU80OHRlbUlH?=
 =?utf-8?B?Uisyc0xxV3VhRjlxTWQ4QVBYempjd1V4a3kvUHlhR0dTR0o0Wno3Y2VEMk9N?=
 =?utf-8?B?Zlp2bHlOd0JnVFBydHRPUVFoaDJ1NjRZMUkwa3hqQ3dJcm9GUVlpVktLTnM3?=
 =?utf-8?B?Wjk3V0NTTjdrQzFVT3YyZm5iMmdYdmZWd1R4b2Nuajc2c0VJbG94YW1tMU1D?=
 =?utf-8?B?aEZtYVFqVXdnNHp0a1psZDEzVzBEdmhtQU15b0E4U1A5MERsM29SOUh0QTh4?=
 =?utf-8?B?a1g2ZkV1aUQ4SlI5bUlIWDczSE9iRzg0clB5M01VS2h1Z2RwVFVRc2I0NEZx?=
 =?utf-8?B?QzBmZ2xOVi8va1Q2VkIwUnI4c1hCanZwVFlhZUZjUFdNbTVyeHRGM2NMMWRm?=
 =?utf-8?B?R1Voa2Y4ZG84Njl4aXZidytKY3ZRWlYxT211NGQ5ZWdEZW9STWtQWDRQK24x?=
 =?utf-8?B?V3IvZWx2a0poN1BmVG9XQmhId1c0ZDlvM1hpTkoxSjFTZUVKTFRWRHdHc0Qx?=
 =?utf-8?B?UGs0Z2xKV2JKbDA3ZWhYd1QyVGhRSTl2QkMzRnR5T2JSeXpYejRTTG0xSm1m?=
 =?utf-8?B?cWNtMTVqQkwyRFJBaWxmUFlKR1NWeHBHZDhENmNPUEZybG9mdGVCTkJhd0ZK?=
 =?utf-8?B?Y3FUNkVFQnRSdWlpUkhKSVBxNG9pcGpFdjVpa2dyczVqQXo1aUltMXhsdFNN?=
 =?utf-8?B?ZU5XOW5pZVhFUUo1VEhnVFdZSTNNZUcyS3p6dXlPV1pyYTQ3MzI5bFJlaldz?=
 =?utf-8?B?TVkyQ1BZR093ZkRsSjhORFZscS8rc3MrU2xmN3VoRWhKTXVjTW5zaUMzVHJi?=
 =?utf-8?B?SUNrK3N4Q3E3UnpXSXA2cEF5dVh0Uk9oK0o5NTNQRk1ndXRoODYyNUF6eEtr?=
 =?utf-8?B?bVIwcG5LVzdoUTNuUCtkRlJKbUpLZHRvcEFuQjhyMlZtdFNsdkhVbUhGK2xJ?=
 =?utf-8?B?aGEzT3Rad0ZPNG5nSUYwOHdSWkFVOFZLSWI5STR2Tkk2MjNDc1pGQ2RXUWVa?=
 =?utf-8?B?elJCblR5LzZHUWhJYWRNVjdVYmdiN2xuM3pIdk9NUkZkY0xINmhNdU5nTGU2?=
 =?utf-8?B?NWI3WlJsRHhDQ1cxdTJCbkRibGcxWVdJVVRSeTczZVRZZFZ4Y3RCNGdxRGdX?=
 =?utf-8?B?bXE5a3VKNlFMRGpQWjh3QlhTZW9BR1p0UzhmZ1ZmK00wTmdPT3pBNExaQWlB?=
 =?utf-8?B?emh1bnYrVFlyTHNUOXhqMjVYUlFTYmxWYmhzRS9sM2ZtNGNuZlExU2drMCtR?=
 =?utf-8?B?S3YxcWdPQStwOC90NUxZcWVyTTAwQldkSGt2bysxTDFUTi9DbjFxNzd2bkd5?=
 =?utf-8?B?ZHZxVm4yL2xEYzVoc1VHL051TEcyL2NsL3AvZkZBa0tCQ2w1VU9JU29QNDgy?=
 =?utf-8?B?b2hqTFRSZkRVbWpwNitKY2xiU1ZMUWpCcHNNaHMrYjdzVVhzTDgzNmI0V2JT?=
 =?utf-8?B?cjZMd2JzYUhHK1NlWUQzdDR1eEpCK1VrdUVWYmp0RDI1ZVFxbVJZdENrL0dk?=
 =?utf-8?B?TC9ya3pzVUU4SHZ5SXQ0RTZEK1QxTFJUaVR6UG9lNjk0ZFQ4WGF1VDdWRGhH?=
 =?utf-8?B?NmQ0THYvakV4RzYwS2NIT2Z0SmV4QzZRQTNvTE5iMi9zUHBEbnAxeHpsd3hl?=
 =?utf-8?B?eTNqekh0OHBxTk1LTEU5NDNDeTN2QmxrRmJUdGQwdG83RFFYQWtjdjFnYUY5?=
 =?utf-8?B?THRTb3ZOTG9tdFEzQThxR1AzVUNucTQzK3dQRml2WTZ0aGd4VnFJOHJzc2Ey?=
 =?utf-8?B?Y0YzTDg0Wm5FU3htdXM4eWhCa3lkWElQMmdqUERIZVIyeGVGc3BLbStRQ0Zw?=
 =?utf-8?B?TVlnYUwvQ1Urb3lTSWhScm4ybTJpYSsrTytGcjJNWklCWjZtbm9SdFB2bUU1?=
 =?utf-8?Q?Db5oDAFD3K5sT5ydtEg+k6Wo/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8156ec6-b68b-4132-b78f-08db4cbc4a57
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6583.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 16:26:18.9554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihFnJ5Cc3QAbg4WJHVYOZjZjbE4VTeyN+e6u+OWmLEVzuzsv7P6zVKPNuoH4eFI5C+6zfWyketQe5QwqGPM1rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6479
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 5/4/23 3:47 AM, Dan Carpenter wrote:
> 
> Hello Shannon Nelson,
> 
> The patch 523847df1b37: "pds_core: add devcmd device interfaces" from
> Apr 19, 2023, leads to the following Smatch static checker warning:
> 
>          drivers/net/ethernet/amd/pds_core/main.c:290 pdsc_init_pf()
>          error: double unlocked '&pdsc->config_lock' (orig line 253)
> 

Ouch - thanks for catching that.  I'll address it soon.
sln


> drivers/net/ethernet/amd/pds_core/main.c
>      212 static int pdsc_init_pf(struct pdsc *pdsc)
>      213 {
>      214         struct devlink_health_reporter *hr;
>      215         char wq_name[PDSC_WQ_NAME_LEN];
>      216         struct devlink *dl;
>      217         int err;
>      218
>      219         pcie_print_link_status(pdsc->pdev);
>      220
>      221         err = pci_request_regions(pdsc->pdev, PDS_CORE_DRV_NAME);
>      222         if (err) {
>      223                 dev_err(pdsc->dev, "Cannot request PCI regions: %pe\n",
>      224                         ERR_PTR(err));
>      225                 return err;
>      226         }
>      227
>      228         err = pdsc_map_bars(pdsc);
>      229         if (err)
>      230                 goto err_out_release_regions;
>      231
>      232         /* General workqueue and timer, but don't start timer yet */
>      233         snprintf(wq_name, sizeof(wq_name), "%s.%d", PDS_CORE_DRV_NAME, pdsc->uid);
>      234         pdsc->wq = create_singlethread_workqueue(wq_name);
>      235         INIT_WORK(&pdsc->health_work, pdsc_health_thread);
>      236         timer_setup(&pdsc->wdtimer, pdsc_wdtimer_cb, 0);
>      237         pdsc->wdtimer_period = PDSC_WATCHDOG_SECS * HZ;
>      238
>      239         mutex_init(&pdsc->devcmd_lock);
>      240         mutex_init(&pdsc->config_lock);
>      241         spin_lock_init(&pdsc->adminq_lock);
>      242
>      243         mutex_lock(&pdsc->config_lock);
>      244         set_bit(PDSC_S_FW_DEAD, &pdsc->state);
>      245
>      246         err = pdsc_setup(pdsc, PDSC_SETUP_INIT);
>      247         if (err)
>      248                 goto err_out_unmap_bars;
>      249         err = pdsc_start(pdsc);
>      250         if (err)
>      251                 goto err_out_teardown;
>      252
>      253         mutex_unlock(&pdsc->config_lock);
> 
> unlock
> 
>      254
>      255         dl = priv_to_devlink(pdsc);
>      256         devl_lock(dl);
>      257         err = devl_params_register(dl, pdsc_dl_params,
>      258                                    ARRAY_SIZE(pdsc_dl_params));
>      259         if (err) {
>      260                 dev_warn(pdsc->dev, "Failed to register devlink params: %pe\n",
>      261                          ERR_PTR(err));
>      262                 goto err_out_unlock_dl;
> 
> goto
> 
>      263         }
>      264
>      265         hr = devl_health_reporter_create(dl, &pdsc_fw_reporter_ops, 0, pdsc);
>      266         if (IS_ERR(hr)) {
>      267                 dev_warn(pdsc->dev, "Failed to create fw reporter: %pe\n", hr);
>      268                 err = PTR_ERR(hr);
>      269                 goto err_out_unreg_params;
>      270         }
>      271         pdsc->fw_reporter = hr;
>      272
>      273         devl_register(dl);
>      274         devl_unlock(dl);
>      275
>      276         /* Lastly, start the health check timer */
>      277         mod_timer(&pdsc->wdtimer, round_jiffies(jiffies + pdsc->wdtimer_period));
>      278
>      279         return 0;
>      280
>      281 err_out_unreg_params:
>      282         devl_params_unregister(dl, pdsc_dl_params,
>      283                                ARRAY_SIZE(pdsc_dl_params));
>      284 err_out_unlock_dl:
>      285         devl_unlock(dl);
>      286         pdsc_stop(pdsc);
>      287 err_out_teardown:
>      288         pdsc_teardown(pdsc, PDSC_TEARDOWN_REMOVING);
>      289 err_out_unmap_bars:
> --> 290         mutex_unlock(&pdsc->config_lock);
> 
> double unlock.
> 
>      291         del_timer_sync(&pdsc->wdtimer);
>      292         if (pdsc->wq)
>      293                 destroy_workqueue(pdsc->wq);
>      294         mutex_destroy(&pdsc->config_lock);
>      295         mutex_destroy(&pdsc->devcmd_lock);
>      296         pci_free_irq_vectors(pdsc->pdev);
>      297         pdsc_unmap_bars(pdsc);
>      298 err_out_release_regions:
>      299         pci_release_regions(pdsc->pdev);
>      300
>      301         return err;
>      302 }
> 
> regards,
> dan carpenter
