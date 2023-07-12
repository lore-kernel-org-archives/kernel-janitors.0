Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BE0EB64DD
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 Jul 2023 22:40:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232478AbjGLWkk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 12 Jul 2023 18:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232477AbjGLWkj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 Jul 2023 18:40:39 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 984A51FDB
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jul 2023 15:40:35 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b8a8154f9cso165835ad.1
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jul 2023 15:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689201635; x=1691793635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W74OVpeHRuNiX8pMSZJwMLioV1gL07KE3H1a2Sb6peY=;
        b=QgNyeryYTTACVv5xzPnNBA4fBv8uhd7VsaVJyHLSkvwtHQ661hFCyV66BZ6tioghkS
         IiSrAN7DKiJZGemA6V8wlUMgmctAMNrRpVUKhk/5Lv33vAAYGSUdGM69pCLaNnlbNOXh
         8XefLt2O2fzoj5+Y6R5Z6VGjlTW+vbMv4QtDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689201635; x=1691793635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W74OVpeHRuNiX8pMSZJwMLioV1gL07KE3H1a2Sb6peY=;
        b=awSGEupUML0/xs4NypKa0zMfbVHR8Y8sqGQdBMaMlBikJTCUMcX0dgdI1K053UAo2K
         wwI+avZE/Nz9Hfsp1qrVBWSam1gebnbZG/IYu68Oo/ASxbTeMLoCNUL8UlYcUrJ3g5de
         fBVUPq4PEUCPvS82oU9HPMYsXYE/n29Y1wuI/oq7seOcJqQvDklFdMzCC/hN2KVGKRrU
         Z0MLW9bwz1IJrVwYEpVEh+DK6vxk4Oxtz5fi0IOwhoWAZX304knELjxEx/ZjrpraPge2
         lNj316X+WqaEQlxOyLghkGdDh29fD+8/QnW5mbddUKHAVXU8ZORTNXZJw1s2oHnx/uSC
         zoPw==
X-Gm-Message-State: ABy/qLZUR2dlA3fC2dEljw82QPddUzLNLiA2025VktUu7QnWYkmNehlA
        lJSh3SSPSQ/q09WKfRbdwiqsSXHfc+CH0m2+6ew=
X-Google-Smtp-Source: APBJJlHjYHPAqP5SmPN3RIOl52xjZOYYkXRgyg60M7GK47U7g8k/67db5mDhdwbCY4s7DI8euJG7fA==
X-Received: by 2002:a17:902:ea03:b0:1b9:d38d:efb1 with SMTP id s3-20020a170902ea0300b001b9d38defb1mr196238plg.8.1689201635138;
        Wed, 12 Jul 2023 15:40:35 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d14-20020a170903230e00b001b864add154sm4475679plh.154.2023.07.12.15.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 15:40:34 -0700 (PDT)
Date:   Wed, 12 Jul 2023 15:40:34 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: smem: Use struct_size()
Message-ID: <202307121540.F8EBBCA1D3@keescook>
References: <f74328551cfab0262ba353f37d047ac74bf616e1.1689194490.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f74328551cfab0262ba353f37d047ac74bf616e1.1689194490.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jul 12, 2023 at 10:42:15PM +0200, Christophe JAILLET wrote:
> Use struct_size() instead of hand-writing it, when allocating a structure
> with a flex array.
> 
> This is less verbose.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
