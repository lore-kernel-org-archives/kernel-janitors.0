Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20577EB64D8
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Jun 2023 11:15:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232596AbjFTLPl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 20 Jun 2023 07:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231721AbjFTLPj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 20 Jun 2023 07:15:39 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5AFF10E4
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Jun 2023 04:15:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQ8bcoQRDXtKNH6+cP7esSu8O93R9JSMei87dNh/44RtMuD9+dYroFTfmSWv/1XSuPYP/IPW8uf9r9PhkMzAJ16obrQCeO1JM5V7WuQ618a3fuT5awl5o0n98hcZGKUjmd9iIrrFTpO8DGzLU0ajP3mhkxSWLihCqNeNlQ8Y7CsrS0yYInQGOCLn3qYlZXGxo4cdNdtQuizlzQvVukoumh2UkROm3e+dOozKOcpORURSETZ6VU4NqsjfcT8mHR+o2M/9UI1CTcxImJjoNyLCODfxyz5R4S+pX76cRZsv/SJjT4bV8d4WbOzTK/HWaG+tQPhuZdOkHi5FUAkccr7AKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvXI4qZpsfNgTgLBZ1GeO7np3QICIDt0g4hhhOslUDo=;
 b=ej9x4G7zQXSDHnJPoX+cOHcsXq8XBL83Kp0TMsUw4QcnzYhHaXus1z19/++WYZD5iiaxzp4iT0SV2lsyMmeYu+2i27s6tco1/SjAw3Hg2q5RsM94OpKHDRNEBfTyvedGlL3jTzPVjDfy3mAUMCSBknrhoGSLkmZUWAe3gb7snjqBB5TqpbYHojxoRH3cLUZYxmAkmv8L0KOprL2ozG/THTH4poCjqdnFkdPPQSmt0mtmyLpLr7qPlz/IqD8MBV/RsuvjYJzNQ9AeB+mBU3/9lz+9UTB8E2g5uLnPwc6UwunGpy9bxhRMzClBfp0lqi7NRhzskIpXTpnCXc+R8qS8ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvXI4qZpsfNgTgLBZ1GeO7np3QICIDt0g4hhhOslUDo=;
 b=pFU4wfrvsMC05AYhpKZ4OI3/nAyqdNCsk7QrsPTjsZhVTW2z65+VhwgchHzwuHYsCqz2WaiiCa1rKp7uCBxvS9IsQ8+nWOnukLJTcTD4CYkvDjFH6BnBbrJ0GJXS8+vXIERw/xvdt3IYxkgloSFl1CVmabbnyRs7ubuALsLhSvWrntgzH30R/Hm8+Yoxhf9iEFClDhCXdyCFmEm+cbj25BOFyH7xxYha7JXzm8oJURp1xqNSDXzeoEjwn36JJO6Z03q04IyEGC9XzOlW1aRMm59sn5dS/5fzdAllAgE1/WhY2TIM2JU7MG4uG83L92T+jO0gZOixi9j9Id5ijTLcfQ==
Received: from DS7PR07CA0019.namprd07.prod.outlook.com (2603:10b6:5:3af::7) by
 CH0PR12MB5204.namprd12.prod.outlook.com (2603:10b6:610:bb::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.37; Tue, 20 Jun 2023 11:15:34 +0000
Received: from DM6NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::59) by DS7PR07CA0019.outlook.office365.com
 (2603:10b6:5:3af::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21 via Frontend
 Transport; Tue, 20 Jun 2023 11:15:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT099.mail.protection.outlook.com (10.13.172.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.37 via Frontend Transport; Tue, 20 Jun 2023 11:15:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 20 Jun 2023
 04:15:17 -0700
Received: from [10.80.22.31] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Tue, 20 Jun
 2023 04:15:16 -0700
Message-ID: <2db43607-e9b1-06a8-dcaf-faa7a485aee7@nvidia.com>
Date:   Tue, 20 Jun 2023 14:15:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [bug report] net/mlx5: Move esw multiport devlink param to
 eswitch code
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     <kernel-janitors@vger.kernel.org>
References: <dcf9c2cd-25d1-48b2-bdec-3d57de6da81e@moroto.mountain>
Content-Language: en-US
From:   Shay Drory <shayd@nvidia.com>
In-Reply-To: <dcf9c2cd-25d1-48b2-bdec-3d57de6da81e@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT099:EE_|CH0PR12MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: 46f7372d-42ab-4a2b-8415-08db717faae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jEX2OCP3oHB9ODqoFE65n/cz0WKo6QYR2fgkudzqoAcxbODxFWt2wmKPjwC7Tgy42b5sI7AFPn4Fcd9iWpLJO2G6WyLd67s/2ur7fUuWwV4q2I+41IIed7l/hhmPez0pjIR3ecXzZj354z42F0XhXEcpG/N6pxdSmbIXiOsdiqXlBug7STwLQ66PSmPMLjDWuBKMLRz7Adoz7nF9WUKuvR+r/4cAkFaS+LCTVExiYGFUMIqdKuoqAHtw+T4UI2WjQltZFMm4wQbCVc7wpsTdO2SvWdpRV5J2uPlUNouJEH1vOAc8zMp8RH6loc45z1+bzNwsNWDHGpmC1TOdsr+DzJ5JCIjVGB5UTdv6Pvi1fDiq2N5eh6mWKo5O/rDNmhBwBepzKZFvdTSF3gsnjuuylO7igaAg7IlfhDbJkVayQ8S9cPamHEWoQHm5pbfrYKefk9KgxHgVhK2t/nhZNs78PzpupHgK63p0WQOo+O3VkPcecEi1Rlssnl2xPWkHyoDAPly09xPrkcTpEmSLC8Z7p/6bSdSCpk82HJMqY/a41lNXctyIZjF1kNqqQtxVd76glm5s15oBkre2ojhSde6H/kUmIIN+OqV/lVwAyNb7pBrUQuWkSedMyTeYTtw0yFd7BhH3Xnrbn1P+/G+HpuEDjwt+EscgTVY6ZNxZKwhUJDipuOfEQwG85QC1NQZxRakkHYmldLMWYT4I1XQzK7Qw+8Ug6D0i471hpPBaiV1a/3CH+GUWIkPDCizq8zo9oKCkbmLaIeISl3X4Q/UFuxukgQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199021)(46966006)(40470700004)(36840700001)(31686004)(82310400005)(356005)(53546011)(26005)(16526019)(5660300002)(7636003)(8676002)(8936002)(82740400003)(186003)(478600001)(16576012)(36756003)(316002)(41300700001)(2906002)(70586007)(70206006)(4326008)(6916009)(86362001)(31696002)(40480700001)(2616005)(47076005)(36860700001)(40460700003)(83380400001)(426003)(336012)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 11:15:34.3604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f7372d-42ab-4a2b-8415-08db717faae5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5204
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

I have a candidate fix, under internal review

On 14/06/2023 16:00, Dan Carpenter wrote:
> External email: Use caution opening links or attachments
>
>
> Hello Shay Drory,
>
> The patch 3f90840305e2: "net/mlx5: Move esw multiport devlink param
> to eswitch code" from May 17, 2023, leads to the following Smatch
> static checker warning:
>
>          drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:1848 mlx5_eswitch_cleanup()
>          error: dereferencing freed memory 'esw'
>
> drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
>      1828 void mlx5_eswitch_cleanup(struct mlx5_eswitch *esw)
>      1829 {
>      1830         if (!esw)
>      1831                 return;
>      1832
>      1833         esw_info(esw->dev, "cleanup\n");
>      1834
>      1835         esw->dev->priv.eswitch = NULL;
>      1836         destroy_workqueue(esw->work_queue);
>      1837         WARN_ON(refcount_read(&esw->qos.refcnt));
>      1838         mutex_destroy(&esw->state_lock);
>      1839         WARN_ON(!xa_empty(&esw->offloads.vhca_map));
>      1840         xa_destroy(&esw->offloads.vhca_map);
>      1841         ida_destroy(&esw->offloads.vport_metadata_ida);
>      1842         mlx5e_mod_hdr_tbl_destroy(&esw->offloads.mod_hdr);
>      1843         mutex_destroy(&esw->offloads.encap_tbl_lock);
>      1844         mutex_destroy(&esw->offloads.decap_tbl_lock);
>      1845         esw_offloads_cleanup(esw);
>      1846         mlx5_esw_vports_cleanup(esw);
>      1847         kfree(esw);
>                         ^^^
> Free.
>
> --> 1848         devl_params_unregister(priv_to_devlink(esw->dev), mlx5_eswitch_params,
>                                                          ^^^^^^^^
> Use after free.
>
>      1849                                ARRAY_SIZE(mlx5_eswitch_params));
>      1850 }
>
> regards,
> dan carpenter
