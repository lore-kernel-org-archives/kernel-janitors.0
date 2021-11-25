Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98083C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 Nov 2021 08:19:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234796AbhKYIXB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 Nov 2021 03:23:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235766AbhKYIVB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 Nov 2021 03:21:01 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60300C061757
        for <kernel-janitors@vger.kernel.org>; Thu, 25 Nov 2021 00:16:38 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id n26so5239413pff.3
        for <kernel-janitors@vger.kernel.org>; Thu, 25 Nov 2021 00:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lfriBRcXpshyF1kq92nAu2kh1POupA3b+vD7MqpK/Bk=;
        b=M7CDb2za+voTT19XexwjvCjECDIDANFnViMmvcQvXI2lwzNojH/a1gHUacduX5+9LF
         GovyuL4OsKFxv26LWRO/OB1Bz18zBE5vfFVFzCXwtpBcAb07TxtbvV1LL64K1aKrLkgi
         NCtFsEnWlPqxajd6KIby45BD5sdulZPQjmXG6REQlq9nLxWEG1EmQtYCSxr8YKpfldCf
         sXSo+FWyFKM4X7WrbUdK40N3bB9aGyvTzZykclhW9bzCuEo1hvsGFRPs8y6dP3DzH6S9
         ezqKj+SREBDBHeeoBJuJwjUijEfH2ZV4Pz7pU5OKperI/ap7OmvCgJk7Rnx2ESTlmNSz
         KRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lfriBRcXpshyF1kq92nAu2kh1POupA3b+vD7MqpK/Bk=;
        b=w7cSH85VcM0ZAwxK/gWRM843Tpp+ZI8RyqZ8/C2IUWutBVZAxXqZVHA3h6cZdws/a2
         cOcCaLlLtnDtUeF62cMKRQnoyPSpBrvDQqG+x7r25H07KMb044jpwAAX3psvLJxOVKzt
         TVfGtWNbRbAA+xF2QqA8rIbDqs3Ja5fySlWH9jaBFHlDoBpNRS4kcULcn2KrNtUgeLQW
         +W1q/LWQ/3HUqIR+rXxL1kyXu7bTnIXh6tcrdPlItU1kUJJrVBJmi5v2ENNHDzO6mz95
         g20b5OGF4JdtbELtj6oM/IFR8g1Uh/5gX3QX+LHimucWcDzsCbcrAsQq1azo3VX7HaJX
         m0Fw==
X-Gm-Message-State: AOAM532dil9r3cE3jEBZQ7fCYWv50bpE4l5R5nHRw0B6BJoiyp1O66Jo
        PBvCC6TwFox2Czpv9K0hZN0dLA==
X-Google-Smtp-Source: ABdhPJyyASzkTVmZnTpKVd0QOD0Uo0JG8HVXPrFLTOWG5xoT0mHr7GP8AuxnMVLFiEIUBIaBuAe9Qw==
X-Received: by 2002:aa7:8b14:0:b0:4a3:a714:30ed with SMTP id f20-20020aa78b14000000b004a3a71430edmr12324262pfd.2.1637828197688;
        Thu, 25 Nov 2021 00:16:37 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:cd6a:1959:1c65:cc19])
        by smtp.gmail.com with ESMTPSA id c18sm2385652pfl.201.2021.11.25.00.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 00:16:37 -0800 (PST)
Date:   Thu, 25 Nov 2021 16:16:33 +0800
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Xin Ji <xji@analogixsemi.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: anx7625: fix an error code in
 anx7625_register_audio()
Message-ID: <YZ9GYUrBvmCQaZtg@google.com>
References: <20211124145219.GD13656@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124145219.GD13656@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Nov 24, 2021 at 05:52:19PM +0300, Dan Carpenter wrote:
> This code accidentally returns IS_ERR(), which is 1, instead of
> propagating the negative error code.  The caller doesn't check for
> errors so it doesn't affect run time at all.
> 
> Fixes: 566fef1226c1 ("drm/bridge: anx7625: add HDMI audio function")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
