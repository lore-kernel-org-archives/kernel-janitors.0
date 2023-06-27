Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1797EB64DD
	for <kernel-janitors@archiver.kernel.org>; Tue, 27 Jun 2023 05:21:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjF0FVx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 27 Jun 2023 01:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbjF0FVv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Jun 2023 01:21:51 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 716021734
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 22:21:50 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f9bece8e19so63363935e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 22:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687843309; x=1690435309;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5jaeLVQ8cKoY+y8cPo5BXpJfIHKd+bAYhWvUpOvOMtU=;
        b=IFIGs1l0qRFArsqDt9u+8cyAnujDwTG3oMAw/dQfgps8oWGvSaqgfhvRvrhUY/Vecn
         zeEoj69TIxMc7cjjc8HQpIemmffjupc/VijXbikexzB1OZ9N4l+bkKzr1F/Xh33Kgqhm
         7ZfSx/Ya7qK1QaDk8dxETu6V5ELGPIR1N/qspDw6RSMiVI45n57SOGal7Mhj2tcNU+Vk
         j673RdDn5gUefedZKZnm1KtnGPkg/Z5uCFytqWGImtAYIKlyDVXahlm6GFpyBv7ufxYf
         yksubkTbyfsk3bWKrZRkyZwGbG+1J+Lj+/X1VI14lotrqckKoOy7pWzdOFGTL+epX8hK
         4Nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687843309; x=1690435309;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jaeLVQ8cKoY+y8cPo5BXpJfIHKd+bAYhWvUpOvOMtU=;
        b=BsQ3wxIIUrjw0xP5Q6m4VpvJMzbSt0rZJbr4b2hDjZ/FLLJznN9WWds/pV00beMl8I
         BcGS4Eb+GsjG56NOUy/u9m0o0aRk0ba/T481QZC5g1NwuIe0qf39tdkq9se65/ffTEf6
         PwyLIiZdpe/AgMpjCfwNUQZQKYRR4knhav9mhUoPxaPguKTHLwUvXaykkjrbQ0s7v71M
         SJ7/65lgauyyoiT9TTSQSFt8AGaUDl8iSy+R/hOa3L072SKzNzL4QkhHCGgrKqSwRQoV
         HPowZNaohdWVMuJrs5CtvjKRJ+L/yZtRNdyRzPSpRW6dpbRC/LdTRKO4Ghxsi+tI/+KO
         dYNg==
X-Gm-Message-State: AC+VfDzj+EXjoF8fZXyNcbbbfr6ZVmJNbybqesbTNzS15IFV5BW7Bfcq
        knXz+Ym6u8F+uZYXb2a2kPkJ/g==
X-Google-Smtp-Source: ACHHUZ5Elhf5H3/ehHtkBEk4o80/+XqziRfhC2s9IkQUU+0u5T5lDDim5Inpva3wvShUQMNV0LBB6w==
X-Received: by 2002:a5d:590c:0:b0:30f:ba85:52b9 with SMTP id v12-20020a5d590c000000b0030fba8552b9mr32327232wrd.37.1687843308884;
        Mon, 26 Jun 2023 22:21:48 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f1-20020a5d5681000000b0030647449730sm9276888wrv.74.2023.06.26.22.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 22:21:47 -0700 (PDT)
Date:   Tue, 27 Jun 2023 08:21:43 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Tzvetomir Stoyanov <tz.stoyanov@gmail.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-trace-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [RFC] tracing: Cleanup the correct ep in enable_trace_eprobe()
Message-ID: <d1397f75-1091-42e1-8038-b6844757de79@kadam.mountain>
References: <72b05526-4dda-430a-b4ca-2ee4f26f2185@moroto.mountain>
 <CAPpZLN4ACVRrDXofO9jNQznEuF+CK6KNbCCz=5t93kMzESbZGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPpZLN4ACVRrDXofO9jNQznEuF+CK6KNbCCz=5t93kMzESbZGg@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 27, 2023 at 07:39:17AM +0300, Tzvetomir Stoyanov wrote:
> On Mon, Jun 26, 2023 at 4:35 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > If enable_eprobe() function fails, then we call  disable_eprobe() on the
> > "ep" that failed.  That doesn't feel right.  Shouldn't we
> > call disable_eprobe() on the previous "ep" instead?  Or even better on
> > all the previous eps (but I don't know how to do that)...
> 
> Hi Dan,
> There is no need to disable the eprobes which are already successfully
> registered to the given trace probe, as they will be disabled using
> the normal logic. The failed epropbe is not registered there, that's
> why it must be disabled explicitly.  Thanks for digging into that
> code!

Okay, but if the loop fails on the first iteration then it won't disable
the first ep.  Is that an issue?

regards,
dan carpenter

