Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F4AC433ED
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 May 2021 07:27:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1649B613AA
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 May 2021 07:27:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232718AbhENH27 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 14 May 2021 03:28:59 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:2978 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232037AbhENH26 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 May 2021 03:28:58 -0400
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FhKn920MhzmWGn;
        Fri, 14 May 2021 15:25:33 +0800 (CST)
Received: from dggpemm500004.china.huawei.com (7.185.36.219) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 14 May 2021 15:27:45 +0800
Received: from [10.174.177.91] (10.174.177.91) by
 dggpemm500004.china.huawei.com (7.185.36.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 14 May 2021 15:27:45 +0800
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_-next_v2=5d_staging=3a_comedi=3a_Remove_un?=
 =?UTF-8?Q?used_variable_=e2=80=98min=5ffull=5fscale=e2=80=99_and_function_?=
 =?UTF-8?B?J2dldF9taW5fZnVsbF9zY2FsZXMn?=
To:     Borislav Petkov <bp@alien8.de>
CC:     <kristo@kernel.org>, <mchehab@kernel.org>, <tony.luck@intel.com>,
        <linux-edac@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <20210514043539.55212-1-cuibixuan@huawei.com>
 <YJ4gWq3TL0TZtyKS@zn.tnic>
From:   Bixuan Cui <cuibixuan@huawei.com>
Message-ID: <f37484ae-1630-7591-1102-748e43769ec1@huawei.com>
Date:   Fri, 14 May 2021 15:27:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <YJ4gWq3TL0TZtyKS@zn.tnic>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500004.china.huawei.com (7.185.36.219)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 2021/5/14 15:01, Borislav Petkov wrote:
> You shouldn't wonder when you don't get a proper reply with that Cc
> list:
> 
> ./scripts/get_maintainer.pl -f drivers/comedi/drivers/jr3_pci.c
> Ian Abbott <abbotti@mev.co.uk> (odd fixer:COMEDI DRIVERS)
> H Hartley Sweeten <hsweeten@visionengravers.com> (odd fixer:COMEDI DRIVERS)
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> (commit_signer:2/2=100%,authored:1/2=50%)
> "Alexander A. Klimov" <grandmaster@al2klimov.de> (commit_signer:1/2=50%,authored:1/2=50%)
> linux-kernel@vger.kernel.org (open list)

Thank you for your reminder, this is my mistake :-(

Thanks
Bixuan Cui
