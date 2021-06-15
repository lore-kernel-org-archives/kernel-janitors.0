Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FD7C48BE8
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Jun 2021 21:37:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A2E46128C
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Jun 2021 21:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbhFOVjq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Jun 2021 17:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbhFOVjm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Jun 2021 17:39:42 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730CEC061574
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Jun 2021 14:37:36 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id j17-20020a0568200231b029024900620310so148139oob.7
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Jun 2021 14:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BNZDhyuQiy36D1r83AzhJvC36jFd8GNMJF0umN1XQ3k=;
        b=2Okh3fGr5tKEnaVRIv2XO8JiCngsW8bg9ekpblQ5m4R8nCN0GpWiMs/rRdijFcqkXf
         t+An0g2Yb1PVAvD5zVv2kJEaR5z0HJbExysPltC2z0/M8dV4MmjaX5zVxq78tVcLgw4W
         SbJ4RvgX3kVpT/AT4jYhHRopOA5mDsLcoOm8Hy33NCkyZs1ZtcTkfrjylGwOcr0LhLkO
         jI1qaqNGf4utr4jBtRF07ayiKNhAH2C6P56Y0HvG3UTFTQE+F/XzBGiB16bmhfPk1r/l
         gOnq6IKGZE9sCUJbNxSt/uAFhptDNo9PKHPcZG/HNteShxNbpky1LAzaCqwjIorW8fsg
         Xn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BNZDhyuQiy36D1r83AzhJvC36jFd8GNMJF0umN1XQ3k=;
        b=CKHX//bdnGCObAeU79GGFMl2mcOwMoJdfyYyvccJTk52Q1hNNEdFteGfl5B2vOGSEz
         fFQZJz4+yz2KCfBZTa+poEwPwD1vKv/26yPJga2r5jbJQFUDrEwhcufWo9ruxsbu2vQ5
         5nec2MXfDArjbSqswaSPkidHQGOvv5IylwFNSKDsDFnJ7b28IG/AtJjzkrfbxRQ9RSvu
         Ft30xQtAUKHPfEWSSoEHJ6F2iHpsALcXuk9VD/TqUfol76/Nlf0qNAWEeEbzFrsyKw+l
         Fhkl4ERkNSv7WfHgHp4SWv2HL9qWi75EMONuSzHFIRUrRufeNT8A0KvFB0f9HdZOQkKS
         eskA==
X-Gm-Message-State: AOAM532AVU+0WxIPUdHaefi62mqE0q307aN6NnhCqp3fCLOSl+eduTH5
        6ZyH5neAmc/0oJHGOg8DyH6gyg==
X-Google-Smtp-Source: ABdhPJzcb98//bNrZnTNjspwsEtwYhjL8bdRqZFBU4PM5HoAVHr3gKmWv5njZFm7Ht8onQeKLbPxGA==
X-Received: by 2002:a4a:4c8f:: with SMTP id a137mr1006772oob.65.1623793055844;
        Tue, 15 Jun 2021 14:37:35 -0700 (PDT)
Received: from [192.168.1.134] ([198.8.77.61])
        by smtp.gmail.com with ESMTPSA id 94sm43414otj.33.2021.06.15.14.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 14:37:35 -0700 (PDT)
Subject: Re: [PATCH][next][V2] io_uring: Fix incorrect sizeof operator for
 copy_from_user call
To:     Colin King <colin.king@canonical.com>,
        Pavel Begunkov <asml.silence@gmail.com>,
        io-uring@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210615130011.57387-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <90dae495-a383-8afb-85c7-293425338b7c@kernel.dk>
Date:   Tue, 15 Jun 2021 15:37:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210615130011.57387-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 6/15/21 7:00 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Static analysis is warning that the sizeof being used is should be
> of *data->tags[i] and not data->tags[i]. Although these are the same
> size on 64 bit systems it is not a portable assumption to assume
> this is true for all cases.  Fix this by using a temporary pointer
> tag_slot to make the code a clearer.

Applied, thanks.

-- 
Jens Axboe

