Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DD5C43460
	for <kernel-janitors@archiver.kernel.org>; Thu,  1 Apr 2021 20:03:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 794A96108F
	for <kernel-janitors@archiver.kernel.org>; Thu,  1 Apr 2021 20:03:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235136AbhDAUDG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 1 Apr 2021 16:03:06 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:45358 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234637AbhDAUDF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Apr 2021 16:03:05 -0400
Received: from mail-wr1-f70.google.com ([209.85.221.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lS1Zs-00055X-Kb
        for kernel-janitors@vger.kernel.org; Thu, 01 Apr 2021 17:57:56 +0000
Received: by mail-wr1-f70.google.com with SMTP id a15so3080228wrf.19
        for <kernel-janitors@vger.kernel.org>; Thu, 01 Apr 2021 10:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=reVaJRYcfZ9SQGDKGvJMLjraCPqUETQ/gdCZ6pn2GEA=;
        b=qrYp3z30+MdnN02l9noe+SAvYJQp0052lIPys1huDfXcIYnYb4kv/EeArhNfrUqRP+
         wGuvHKv0esWBtg0zg3qAuZNhYThwfKcUp2os1ckC3oVVod7S2eO/pf0A47rzFiwr4+vJ
         I7ZszSWfg7Sj8z2koAfqAysGwXoGjcTNFoRohp1lQEo/9LoOq9DYmXdaOTRN1ZqFtF/N
         9PrApr/D3IotedEWwJP6ba7P5PCgtly0UUun1LbIRuQm4Twp57oWesVU8gaZly5WNMQN
         tLyy7R0rdDRvlhZwDsQqg8FnmZ4V9DnrUH2pNsf8fYPBHwkq/wKqiR93MbpmYxeaY4Z/
         S4/g==
X-Gm-Message-State: AOAM530Y4CwGmy3dUtg7NKWzqYuE328TikNYp9SXhxYLYnHej0kXpnCc
        HyIAkP72JLeaag8Tgv3ynbLxCLKMn6UBoOi6K3pKBzhQix9IciUPVxOXX9nE2Uwni3NeVysMvh/
        drHrnCe730wqEj0O2TImw2tzTbzL0BgQYnSvQtWkwHmjQ4Q==
X-Received: by 2002:adf:ba87:: with SMTP id p7mr11279726wrg.298.1617299876448;
        Thu, 01 Apr 2021 10:57:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw58DyZ+b1zm76scn0+xZLlYZsGMec7AwPe4uNl8XDWKzxgPyAShzE5AoParw/39EKDt1NO3A==
X-Received: by 2002:adf:ba87:: with SMTP id p7mr11279721wrg.298.1617299876365;
        Thu, 01 Apr 2021 10:57:56 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id l8sm11095443wrx.83.2021.04.01.10.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 10:57:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Qiheng Lin <linqiheng@huawei.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] memory: fsl-corenet-cf: Remove redundant dev_err call in ccf_probe()
Date:   Thu,  1 Apr 2021 19:57:54 +0200
Message-Id: <161729985964.13281.7088965998639622367.b4-ty@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210331093244.3238-1-linqiheng@huawei.com>
References: <20210331093244.3238-1-linqiheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 31 Mar 2021 17:32:44 +0800, Qiheng Lin wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.

Applied, thanks!

[1/1] memory: fsl-corenet-cf: Remove redundant dev_err call in ccf_probe()
      commit: b11a188aef6d19fe3ca505831d9c627ef683476f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
