Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F92EB64D7
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Jun 2023 07:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbjFTHkD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 20 Jun 2023 03:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbjFTHjX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 20 Jun 2023 03:39:23 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E909826A0
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Jun 2023 00:38:07 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-311153ec442so3312624f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Jun 2023 00:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687246686; x=1689838686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f9ygZ7yIAEY2d9d/qVhI0amgeoXNE1mQXne5+wfl6TU=;
        b=o8C35uSrEvqAjtB8BTU84BGAVzv5V27RljnynJG/urSw8gln1nYPSK77wTX/DfGNnh
         ouStvQQoAm1BiMsdV+Pcw+zXRKqAij3IDmt8Q2HNlmCce+Vd2wN3J5Mi6IGHqE+xPtWg
         nOOYbZOkx0WbHbuQbSOwjaw2ahP6qphnFUnPhhoeXvR+6dadq1QF43DKO04T6+2dB6cQ
         k0mmoin7wISe+MjOaA9iwZzcYvE71fIewTAp7lygYvIGJrzta3el1COcgZBVi4pftR6T
         ESnilamv1CcDBMgF5FSmjL3cgZG3cWCLhWHtvKy9G86NjjJ0JURiXbkby373yfvzYOgm
         7Fxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687246686; x=1689838686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9ygZ7yIAEY2d9d/qVhI0amgeoXNE1mQXne5+wfl6TU=;
        b=OUk7VCjgf51It0eSIOYNfI6ULKdFkuBy4xoVngIK/cANObIyTj3A7f2sSzqujre0Zs
         zNoXVthBP1iPv99t/y/+9EVh1wbgxEI9lLboGnqxirPsypdN4F2AxzoycJ5C7gtviZ//
         qx8aQ0m6rMpGsn7HuZFKZ2VYywSbfLX9Cp/miaY8pK65HMNUnuT5CPO54dknD/zzX6+Q
         1DGqM3BmojTzQArjySFIb1jjGT2pxsCg22rUIKUBQ5jhO6//cbiAOy8wzylIS5Pa01me
         r6LXIle+d6Ji3qLmEBfC0sP/PawxMZwUq6b8Zw+WZvtOSQJgbIRnasXa8JuWEIenl2th
         VhkQ==
X-Gm-Message-State: AC+VfDya8eV/kY6+89ud+HUlxdviS6xfiFFs3D6CIZxoXWblbkrvvAcS
        9F7lPfuVyrynvPW0b1SUFfQ5fg==
X-Google-Smtp-Source: ACHHUZ5FuDhulJo8756eozh0KRopUTsJakAb65F/au8o6bfOt5vQhNQQ7DZNSJsOaDGBmSoV0WMa7w==
X-Received: by 2002:adf:ef10:0:b0:311:ff2:87e4 with SMTP id e16-20020adfef10000000b003110ff287e4mr10664853wro.33.1687246686193;
        Tue, 20 Jun 2023 00:38:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s6-20020adfea86000000b0030ae3a6be5bsm1315337wrm.78.2023.06.20.00.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 00:38:04 -0700 (PDT)
Date:   Tue, 20 Jun 2023 10:37:59 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     alexander.deucher@amd.com, airlied@gmail.com, Xinhui.Pan@amd.com,
        daniel@ffwll.ch, David.Francis@amd.com, Jane.Jian@amd.com,
        Bokun.Zhang@amd.com, monk.liu@amd.com,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/amd/amdgpu: Properly tune the size of struct
Message-ID: <da6c860f-0ef0-44e4-8b58-0f4d55c1b8bd@kadam.mountain>
References: <20230620045919.492128-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620045919.492128-1-suhui@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 20, 2023 at 12:59:19PM +0800, Su Hui wrote:
> Smatch error:
>     gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:316:49: error:
>     static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
>     static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
> 

I doubt that moving the struct members around is safe.  This looks like
it's in a very specific order.  So I don't think this patch is correct.

The reason for this false positive this code uses a #pragma to pack the
struct.

#pragma pack(push, 1) // PF2VF / VF2PF data areas are byte packed

Sparse does not support this and Smatch uses Sparse as a parser.  The
main reason why Sparse doesn't support this pragma is because Linus
thinks it's gross.  You probably didn't even see the #pragma did you?
And anything you can't see is unreadable by definition.

"Mark the associated types properly packed individually, rather than
use the disgusting "pragma pack()" that should never be used."

https://lore.kernel.org/linux-sparse/CAHk-=wi7jGZ+bVbt-UfXOkpEQdHzF3Z2HBjkGdjh8q4dvPPGWQ@mail.gmail.com/

regards,
dan carpenter
