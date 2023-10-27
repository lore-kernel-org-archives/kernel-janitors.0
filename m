Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7025C25B67
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Oct 2023 12:17:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345585AbjJ0MR4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 27 Oct 2023 08:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbjJ0MRz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Oct 2023 08:17:55 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9FE1B9
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Oct 2023 05:17:53 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40850b244beso15676585e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Oct 2023 05:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698409071; x=1699013871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HnSSviJMbW73CYFlxlkiiUfIJKhXBNtv3pZYT4H9PPE=;
        b=co579VLKrA/JlhVxKXF5+hGXDgFVBxmXYAzgiJ5jBXxBPKOJtLDSjg8djtCBdxrKUb
         DSFZb+dKSZYCZZnRTqufoVBQa8V+4xZ8kS3BfpKNnpebUKl7p4nV2suCTaLlunvJARDk
         73im62tM3BHSZFIEvadj35PMZYgzNOWOHE8VBH1nFcTXGUQamri65FRMga0wxpkjE1Dv
         9a1COrLCABMLurxhonr/k6OpL6l/vp0QYYAmlyqNu0wOTB/v44tpp6iTVsA94IR0aLPb
         wwpXMB/47RptYSxE5/WgAh/b9x58H+WyXIdgf5RCZrTv30ruPvvt0blydCMAc7rG95WX
         J5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698409071; x=1699013871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnSSviJMbW73CYFlxlkiiUfIJKhXBNtv3pZYT4H9PPE=;
        b=TsC7g1uLPUV8F8qD+qWPg1hphaBIexNkLckL7bUI7Rt/DuX+huv/eg0198PKCq8XDe
         gkbGfKBYhlXEa/77V0ohpOSH2xJaY3HqGGSWkpbLwA8udS1W6DxFMX6a23Lz2kv6DNV8
         7h15EpYRzZ/Xh97VcDx9S0kbZyz4dpUfcAyNj2UStiKABRm0deqoJlgnVyIUA/40BVAp
         hLLk324hLYgn4rLqFX50bEs9jv/BU3FxZJVfh3TZ7hVEEZQo7b6W+gCYwWlYA5x7mqc3
         hyyBNC2RoJga1Qkw0izT7Jv5n5kcPNwTXiJve7z+7SHMmbGtF5v6QPK+HGwVN6RZylTD
         3TKw==
X-Gm-Message-State: AOJu0YxAlG5L83GVp/SE8ywT7iQp+qNt6vK/vsZSy3Vgx76WLqEP+Dhm
        BMxIm0dmemu4BZgriM1yhiAVOA==
X-Google-Smtp-Source: AGHT+IHC6uUGgPeWGP9gaB+YAHmpUGN6zGIl085NvPG+QmhGh3Kqwvs35IBgNlyG8cGXTzKE3kaLCg==
X-Received: by 2002:a05:600c:5251:b0:407:8e68:4a5b with SMTP id fc17-20020a05600c525100b004078e684a5bmr2473427wmb.38.1698409071274;
        Fri, 27 Oct 2023 05:17:51 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l41-20020a05600c1d2900b004090ca6d785sm1554896wms.2.2023.10.27.05.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 05:17:51 -0700 (PDT)
Date:   Fri, 27 Oct 2023 15:17:48 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Bo Liu <liubo03@inspur.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, kvm@vger.kernel.org,
        virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-XXX] vhost-vdpa: fix use after free in
 vhost_vdpa_probe()
Message-ID: <1eaf041b-6556-40e3-ad80-993754b2bc0f@kadam.mountain>
References: <cf53cb61-0699-4e36-a980-94fd4268ff00@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf53cb61-0699-4e36-a980-94fd4268ff00@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Ugh...  Crap.

I modified this patch to apply cleanly on net but I still didn't change
the subject to net.  But now that I'm looking at it actually goes
through one of the virt trees.

It should still apply to whatever virt tree as well.  It's just shifted
70 lines.

regards,
dan carpenter

