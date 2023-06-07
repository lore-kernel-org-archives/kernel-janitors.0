Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35A0C7EE29
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Jun 2023 23:26:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232957AbjFGX0U (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Jun 2023 19:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbjFGX0T (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Jun 2023 19:26:19 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D6AA2111
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Jun 2023 16:26:18 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f62b512fe2so57854e87.1
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Jun 2023 16:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686180376; x=1688772376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=clAyQHagKADMcGEukzKqm8FN+4BHghHI7AVIxMqM/aY=;
        b=d44tE+KKQjfk93ENTy8SveEMHyx6yvK7RQwcjKSFZ+faU2g5xHT86cZ+a65AZVmEjh
         vsP6TBwGAdP/b5pMlRKbgkb0eyPyf63isIOb6EyRxuzMZZlEjefMzN9A4hZB92aVhDC/
         Rtc05tHDQCx0CwE6LDJEMOhveN3R0LwhixWwNdJfCFdkuBQMd5oC0DeXM8NUJFtf5QCm
         JJ/2H2N3qXN2aZ0IN+QyDUqYseyGvQE5yLzfm+T2SK1rLS/D1X8YgNrrhplCxaKua7e+
         y25UddS/c5IbknVfE9a2kCvI1ELwZaaCDd24LYanhIleshJ739CqXQq01i3RS2icJQ+I
         fLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686180376; x=1688772376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clAyQHagKADMcGEukzKqm8FN+4BHghHI7AVIxMqM/aY=;
        b=AezO8vl3xD7TGqDe4vStAgqicessajYt/FwWljzx+hUjG13QWNES2KCwj+aOt3/vjL
         UiTNLlDrAtSlBO2wcNwPu872bAwZ+KtNprFCqP/R4PWLTwAY5DqOXWvmTOU+i7NLmKUP
         Nabt9tct3PzNyur6qn4tcRS9YYEDp9yV0Kjuyb3pxQTLTYLlTr7SxymDDo9AWZ+oNYb8
         U083/P1HONHV3r62PScO/SbX2ZoEW2IF80etFhjF9kPEkmzjViuEBSncLz6ioOBsAYDY
         fta1pzddm8CmGPS7/yQOHhbDeo7/5tMZPgsgkWP+tCnErkt1XzRQAcBMx5lIaHZ/NksB
         nomQ==
X-Gm-Message-State: AC+VfDyj5L3qiUMxeOxpSQ5jQWKhOwQllOUhhnystlIfXh+bZm7BkySe
        AdLNabkGvToNWSbD2E4xtNbp/w==
X-Google-Smtp-Source: ACHHUZ7tMkaummVBZmyBdPLwUs1cTQAxIPGZmcOMvJLsSTK+PfiT6YW5LuYLDmRrqxDaizf+iAijAw==
X-Received: by 2002:ac2:549c:0:b0:4f6:3fa1:19b7 with SMTP id t28-20020ac2549c000000b004f63fa119b7mr1295642lfk.7.1686180376398;
        Wed, 07 Jun 2023 16:26:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id q5-20020ac25a05000000b004f63eea01a7sm468156lfn.192.2023.06.07.16.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 16:26:15 -0700 (PDT)
Message-ID: <b7762fab-ba49-3929-281d-ca57280e31fc@linaro.org>
Date:   Thu, 8 Jun 2023 02:26:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: tidy up some error checking
Content-Language: en-GB
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <ZH7vP2Swu8CYpgUL@moroto>
 <gkeclhi5ouudxiwbd6wds7y2svtdcamyuqcnk42z7hr2js52qh@25ox3nxgeuzp>
 <b27d016b-ff87-435b-8341-45a4369049fa@kadam.mountain>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b27d016b-ff87-435b-8341-45a4369049fa@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 07/06/2023 17:42, Dan Carpenter wrote:
> On Tue, Jun 06, 2023 at 10:23:46PM +0200, Marijn Suijten wrote:
>>> @@ -359,8 +359,8 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
>>>   	 * frequency divided by the no. of rows (lines) in the LCDpanel.
>>>   	 */
>>>   	vsync_hz = dpu_kms_get_clk_rate(dpu_kms, "vsync");
>>> -	if (vsync_hz <= 0) {
>>> -		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %u\n",
>>> +	if (!vsync_hz) {
>>> +		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %lu\n",
>>>   				 vsync_hz);
>>
>> Nit: no need to print the value here, you know it's zero.  Could be
>> clarified to just "no vsync clock".
>>
> 
> Yeah.  That's obviously not useful.  Sorry, I will resend.

I'll fix while applying. Seems easier.

-- 
With best wishes
Dmitry

