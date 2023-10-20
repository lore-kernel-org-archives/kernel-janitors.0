Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0107BCDB474
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Oct 2023 06:56:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376379AbjJTG4Z (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Oct 2023 02:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376356AbjJTG4X (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Oct 2023 02:56:23 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E80DD4C
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Oct 2023 23:56:21 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4083f61322fso3676185e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Oct 2023 23:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697784979; x=1698389779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I9LEiI73HKl/yMmpsQOiFinCN5KnlO7an5SddP9Ej00=;
        b=h/zZ9RXbaO6rAMYh0u9MNKdaz1N2GUNDrj0mfc9tH9JPEDqCCTixPhr71XprBswFpU
         zw1UDvRG1gxZjStRUOUJ22FxlnDBF1cdw0aY6vLGihvZVTbAXxRSl4I6J4Q7S4noXN2s
         ivtewT2w6+s4XOX1A43g8i1gjRwINtvhtRpvXg55ON5YvbqBfMIc8gvJqxhwopN/F18z
         a8gkfuK5yM1Zr4H0dH1Q/30ICWdmJtInyuaRboQxhuC5DfU7SndpLWEaC16Ks3+B3Rvt
         iCIrUzRBvNw9pLmh9lnHbt/wwPBaiKDI4g/r97X0LhRv15n4Xn+n5KkzPno1g83eh5gQ
         WLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697784979; x=1698389779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9LEiI73HKl/yMmpsQOiFinCN5KnlO7an5SddP9Ej00=;
        b=DSRWqSHjATyp7XwVGVPphqxSWICSKjRMkKFPYBsOfViNnBMuTLlq4mKJMcJovQ5bE6
         CxzSXLscU7+Pt+rF079l3HsKbYkYDO1XGyExbPue+LCNW5f9inZiuP16ncwOLazIbngQ
         LXh3NAshKzY0OvMEojeap6prOrxeBcG2Zj8Bi7nu+a+0p4uIQIcisQ9j9a/5K5z/1H1Z
         LoNyPr+gRW9hPfeK7weqE+I9edUhE2h1RjJ42Usm6057DN9DF9aP/ZHHs/UajQYoThC6
         7uG0huJIdWrqd0nRryOM59aSO4tJtR/HIJRKYexpmFvfweB3LQBKxA7OiaJCDWoo8U21
         1FEw==
X-Gm-Message-State: AOJu0Yz01d75zdt1CKGPpnx0Jd6wUlYGV4EikhiDvJ6XOtqcZHHejMEw
        2Tp85nYXQlsaYBv+HbCOTjY+OA==
X-Google-Smtp-Source: AGHT+IEvEEtQGpyk+q26WaO58peFpV+y2bXO492uWGPLm75ilrOY/3/PfE6IuqfhDBM16huGVo92EA==
X-Received: by 2002:a05:600c:4f12:b0:408:3696:3d51 with SMTP id l18-20020a05600c4f1200b0040836963d51mr833558wmq.4.1697784979490;
        Thu, 19 Oct 2023 23:56:19 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ay10-20020a05600c1e0a00b00405442edc69sm3580447wmb.14.2023.10.19.23.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 23:56:19 -0700 (PDT)
Date:   Fri, 20 Oct 2023 09:56:16 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, intel-wired-lan@lists.osuosl.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] i40e: add an error code check in i40e_vsi_setup
Message-ID: <be0b618a-4732-467f-bb99-f623fe4da962@kadam.mountain>
References: <20231020024308.46630-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020024308.46630-1-suhui@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 20, 2023 at 10:43:09AM +0800, Su Hui wrote:
> check the value of 'ret' after calling 'i40e_vsi_config_rss'.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> v2: 
> - call i40e_vsi_clear_rings() to free rings(thank dan carpenter for
>   pointing out this).

Looks okay now.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

