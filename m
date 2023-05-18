Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D3AC77B7A
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 May 2023 15:11:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbjERPLZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 May 2023 11:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjERPLY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 May 2023 11:11:24 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7917AA3
        for <kernel-janitors@vger.kernel.org>; Thu, 18 May 2023 08:11:22 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-50bc22805d3so3273444a12.1
        for <kernel-janitors@vger.kernel.org>; Thu, 18 May 2023 08:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684422681; x=1687014681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNVOr807lBllXOmnzPfFAV1ia3jWz0WfCLT82n5adrg=;
        b=j1ff/j6mEFVVGO/Ezab4uRL1AMhJpK5NcSKVdP2VrD8429LgLdjPfOYU7lJzwl6Vnn
         w3+67SwdvV3aZYKjgk5peRaCU/iN2eUrgagI1/TRpYuUR8MmDE+Lt+P1/FJT8L1q0Spu
         E/dqcflEfon9Ry3UX7Zs1rgT4ATb4Uh8qpzdWPXxP1pvQOhqydIhGMBUSVVDaPmgjaYs
         tjM6ZYdfyy8fy0fHuV6IjTnoyiCMACIb0neMe/DjGD/y2JKJnxz7D8PXHctyW/BaCh0L
         bhjw0Pvd/eyt29qbEESgijRVvATELHJaWUX8Bq4ZCApTlF6UVlrRI+iYgkwWhaVXfnbU
         6aQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684422681; x=1687014681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNVOr807lBllXOmnzPfFAV1ia3jWz0WfCLT82n5adrg=;
        b=TTJbrWImIV/wyc1NGGjV6USqM1DYc0IqJKvsdkYWxoQ+I+VQXQkoSheCIBQ2zUgC0/
         olgIYsm/2xfY8MnuWK+pIurWn1cxtbWk4vSQyOZ39iiimVahhgNs03+qSsqihQlPqjie
         iDw/GomDY120pfrv45WAj8jMnqRoRDFhTCAa4w9y7e9UNEgAG6IoPiYvBgjAy4l1Rhll
         36R3568liIwaW6cFUJUCl76N5IyJ/4hlcAjIVKCW+ds1llaP5XyMsis7LfGUA8lWM3Gv
         8vmDk5s2RpH5OHNB6qu0I1PtDHq6iW8rwI7WvxIlD6th4BKnamlwhC7dLgNI6MXK8C9F
         IIIg==
X-Gm-Message-State: AC+VfDzmuOgHwW7Hr0et7t82fAhpWcN/6z2PGrrZ5SR9bJtVokYMQmnA
        dPhm5YinfkSy8UNxUPbIfYyNqA==
X-Google-Smtp-Source: ACHHUZ6LA4Q2T92mmDuhzN6IPSCnvc3Mt7WL/7UHoW+LN7rZlezwp1zFVAoNuaSN+c9hui2dDXJijQ==
X-Received: by 2002:a05:6402:8c1:b0:50b:ca4a:8451 with SMTP id d1-20020a05640208c100b0050bca4a8451mr5616236edz.14.1684422680923;
        Thu, 18 May 2023 08:11:20 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id m12-20020aa7c48c000000b005068fe6f3d8sm688819edq.87.2023.05.18.08.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 08:11:20 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: imx: scu: use _safe list iterator to avoid a use after free
Date:   Thu, 18 May 2023 18:11:12 +0300
Message-Id: <168442265621.3475114.5682923700459976033.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0793fbd1-d2b5-4ec2-9403-3c39343a3e2d@kili.mountain>
References: <0793fbd1-d2b5-4ec2-9403-3c39343a3e2d@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On Wed, 19 Apr 2023 17:23:01 +0300, Dan Carpenter wrote:
> This loop is freeing "clk" so it needs to use list_for_each_entry_safe().
> Otherwise it dereferences a freed variable to get the next item on the
> loop.
> 
> 

Applied, thanks!

[1/1] clk: imx: scu: use _safe list iterator to avoid a use after free
      commit: 632c60ecd25dbacee54d5581fe3aeb834b57010a

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
