Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109FACCA47F
	for <kernel-janitors@archiver.kernel.org>; Mon, 27 Jun 2022 20:03:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240931AbiF0UDn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 27 Jun 2022 16:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240882AbiF0UDj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:39 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E941A3AF
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Jun 2022 13:03:33 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id u189so14353668oib.4
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Jun 2022 13:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pJGIaiEzHKU6wwx8OVu6zgkeNxxNlZC3+zNUJNMZgL8=;
        b=OvKNdR22tXslO+7i0JA1hK1emUidBgKY6WKYfKG+pwb3AzXYrlZVTaa8ksdTNY8xZt
         nGpmRf/j4jl9bymWyQkPbgvc4hZYcktfHWWSzEjNY7kn5c95gBPIIEBkPQt9KjqCjU6Y
         vOehsMzSTN4V6R1RYLzwyBeuHvrt2d4yU+wMzs6UQwezIfcs4eKq6xMA49QO3EE5w5Vg
         B8+VWa8DQLvUXFNEcP1VEIa0GAzvZ5pY0jNhZfHMdd019tEWgifa8MXcmgy+Nvo56H5E
         teE1Vr6/DDhXkALhCs2WzsXyELyh2Yg3h7WmnAyox9YgBvm6IA3yf4nBjdMoUV3SGT3V
         L+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pJGIaiEzHKU6wwx8OVu6zgkeNxxNlZC3+zNUJNMZgL8=;
        b=CfDuxB+O9+LJHv23Qiewn2s6ez84NgsP+TUnq5RdMxjwq2G/Ac0Cooh+pq9P8ZgbTP
         M3wbpfyXTFTlM7j4yS9TvgtldbdxNhlg1+B70FSDpqF+K1eKuQzOSFQdA1yr48bYjZ+a
         XC6EwTFAum7qKmp1Pxbe2BhIv1UE55+lCg2MWIVE9xTtpjvg8t3bugTlfj+1vjJ7hSLE
         JV/l4gtUf1lzvn/kNZ+f+VX58RSZLrmdNc350X6a/FpitFHP5KI9ukfoxbVOUX015e7a
         ysQFoaLmKTxSj5x8izv5d2eH6z3bzuHHN8iVS0SglEsdfFXPfAYCEJLt8DdN6Y8qSxrK
         Xikw==
X-Gm-Message-State: AJIora9AOPGD1dpyvMIgZQN56lLza+IeVkMSsKY06fkhLoNBVjuYe0rK
        tXjp1Yo3eOwYkHiwH9TP5pvpRg==
X-Google-Smtp-Source: AGRyM1snTvVLrNYu5gxZnjAVSrpS6qGlrfVIMksL2W1ijXFWHxrWdG8kCC557j2qQDl66bekNZgkNQ==
X-Received: by 2002:a05:6808:1a13:b0:335:870b:324e with SMTP id bk19-20020a0568081a1300b00335870b324emr1832264oib.297.1656360212870;
        Mon, 27 Jun 2022 13:03:32 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:32 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Julia Lawall <Julia.Lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] soc: qcom: rpmhpd: fix typos in comment
Date:   Mon, 27 Jun 2022 15:02:51 -0500
Message-Id: <165636016350.3080661.12816692025292966241.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220521111145.81697-9-Julia.Lawall@inria.fr>
References: <20220521111145.81697-9-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 21 May 2022 13:10:19 +0200, Julia Lawall wrote:
> Spelling mistakes (triple letters) in comment.
> Detected with the help of Coccinelle.
> 
> 

Applied, thanks!

[1/1] soc: qcom: rpmhpd: fix typos in comment
      commit: a20e55d4771c1bcb531f77434a953cd7acdd1687

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
