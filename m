Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E0CBEB64DB
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Jun 2023 11:18:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234871AbjFPLSQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 16 Jun 2023 07:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345335AbjFPLSP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 16 Jun 2023 07:18:15 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8AD62130
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Jun 2023 04:18:12 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f8d5262dc8so5021995e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Jun 2023 04:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686914291; x=1689506291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rzzz9+MQDy1v7mf6h8LKh2I0EdtZCpgt3033bmxFLt4=;
        b=xO9S4qPH++KwL3bqmpqNIouOhxbgRJ6SxHNQK/ye2vn8zyZyyVWE0A8Fp12TPe5UEm
         auhGwcNjhXlWmq7Z/IdqpdZbQkKk8Dml+ZcRR44APMB4R0kI3zvQIXbdbpPDxieV8yy3
         YUN8nNjIG63V6OC1046j6gB2kYhjfS3Yi4uV54gq2eRTC7+ihj6Ja8OPu3PIWiKMjPjH
         G5wW5UmtxjC9eoDQvYkHUMmCLvuG6T8Ls2v1sidokHKLWLLYphoIclz567/lbDY8nQgm
         MC1xP36ucCdyTuIXwAZbqlb6aX3l8SyGtYlvJdvuYY239/r5sjTXPcmnRUVtUw6qLzH9
         u1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686914291; x=1689506291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzzz9+MQDy1v7mf6h8LKh2I0EdtZCpgt3033bmxFLt4=;
        b=bthDUy481WPJjC+pIUrrZiChtTDfYwFe8D0ViA7UbseiWKQfCu/bawE+QCnmb1zpqo
         Wyoxl2uMNrvQq00qjYmkcAP7EO3/A1l6ZJN+5GTxEY3+tLcKh9Adkm5Vec4RzQPTXRtR
         g+9SZ8PHf7xqnkFYUbbhvcf6Yx6NMti4iPNGxPTzGUCaLaomJ27a9Wcn+q2WJM7iRdPc
         dIQ12kenHfKjxzjGhBpuDJ/EfLYws/hC+0VpekEYAyv/NoiGjbCnwPBCJugcx7y8aM6p
         EPFLsNX0y7m86uHYlU0RwZm6NRkF2UnJpgiPAdA8mUOoRfmSWGZ7I6Y1ruJ9L4sPF/Lj
         9xQA==
X-Gm-Message-State: AC+VfDwT83/Z37y4Ho8zaJ4K+TLxxl0VqIvkdlZhAvo4MemR6VCRbAWM
        XaTZUxtff2Xbp5Dzszc9kPfTrg==
X-Google-Smtp-Source: ACHHUZ4dQlbHeAuRZeLC4Y8OzZsImTHLTf2rFlPkoywMcf0wXUYdWyJ5nI7ueJAs67y7U7OWDEJTlg==
X-Received: by 2002:a05:600c:329d:b0:3f6:eae:7417 with SMTP id t29-20020a05600c329d00b003f60eae7417mr6554134wmp.1.1686914291372;
        Fri, 16 Jun 2023 04:18:11 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n16-20020a7bc5d0000000b003f739a8bcc8sm1917075wmk.19.2023.06.16.04.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 04:18:09 -0700 (PDT)
Date:   Fri, 16 Jun 2023 14:18:03 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Neil Armstrong <neil.armstrong@linaro.org>, tools@linux.kernel.org,
        kernel-janitors@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dan Carpenter <error27@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, smatch@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] spi: spi-geni-qcom: correctly handle -EPROBE_DEFER from
 dma_request_chan()
Message-ID: <7466cb8d-85d9-4583-af2c-3616209e97e3@moroto.mountain>
References: <20230615-topic-sm8550-upstream-fix-spi-geni-qcom-probe-v1-1-6da9bf2db4a4@linaro.org>
 <b82b8041-7bc5-433c-98bc-4ac6fcf5ae9d@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b82b8041-7bc5-433c-98bc-4ac6fcf5ae9d@kadam.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 15, 2023 at 06:12:03PM +0300, Dan Carpenter wrote:
> Here is the command to search for all the KTODO items added
> in the last six months.
> 
> lei q https://lore.kernel.org/all/ -o ~/Mail/KTODO --dedupe=mid 'KTODO AND rt:6.month.ago..'
> 

I guess you need the -I option here.  I'm not sure what -I does.  I had
thought it might mean case insensitive search but that's not it.

lei q -I https://lore.kernel.org/all/ -o ~/Mail/KTODO --dedupe=mid 'KTODO AND rt:6.month.ago..'

Then grep ^KTODO ~/Mail/KTODO -R and cat the filename you want.

regards,
dan carpenter

