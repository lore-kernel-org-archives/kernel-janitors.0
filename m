Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8C2C7EE25
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Jun 2023 08:58:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235651AbjFHI6L (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Jun 2023 04:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235736AbjFHI56 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Jun 2023 04:57:58 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B1C92D44
        for <kernel-janitors@vger.kernel.org>; Thu,  8 Jun 2023 01:57:54 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f7f6341bf9so2792185e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Jun 2023 01:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686214673; x=1688806673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jtme5s3dRQf7Gtdgff/AfDj88pgSYDNPfGdCGVzp2R0=;
        b=gra6jAlodbU30t5m7gbdPhx1pmD3IYs4W5CF5e7hZz0ughSR54Qmhb0FbJWse1Xlm1
         XdkDYHT+hlIKFWiiLJznQwhuxbGB9YuXZh4ntt22vuiYvDYkACBpWgER6p6r72F/Rh0H
         vSqJo1zRg9aIqJRGg10zUQSMhHH4lVZmTeok6WF4OWh8Dn0ls4YORpjvQU30QHQp2hL3
         dfhtKEIW5f3FTrczaxzXv1CvHEPVLZ/97Z/FZ1tgXON9l+d8tAUWIpv758ut5jfiDuvl
         1lB3D1lkIuQ/yEhN0TUavj6iR5hTRCPAWRUBn/UTtS0tpLfPXvLV0TLHq+nstox4cO/y
         wszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686214673; x=1688806673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jtme5s3dRQf7Gtdgff/AfDj88pgSYDNPfGdCGVzp2R0=;
        b=RdQmXzziDCuocqYJxgMB52n8zr4JvPd72coAh53LPcFdzpRDWdmRlf3+XeIoq9vTip
         jRnOkuz4ymqp4dHnXCy4a8qqZQ0gst27gCESXndZZfM9acxOK5zaYXIq36+TTJzeOWCL
         eYr+dPTQmuOAf3l1f5tG6vxW/DFirbahI7bz4lYb6Rm2gIoNRBX5rWzwdM31fbynm2F2
         FRJcFwEYKLtW/LMJhnhQccwrc6unuG4myy6AduKMS74dUXTmut1SM1CCbSS5bIEAJ/h9
         GCyxE3DcHM3yaIICBZ93aJ8E811oIBvfPYawIrHQ6vOKwhxyjCnGSDmFeaK/TO72qrx5
         ZZuA==
X-Gm-Message-State: AC+VfDzHYeWRIKaBDaYu1+afDjYmJFv47ZClK7r8+uzmMPMKNkzarBDJ
        RVaFqQdqa+mvHyyf277ySVx42g==
X-Google-Smtp-Source: ACHHUZ5Oj7KBjt/jU4KYcCWRyKtv4qWOgTZdAtGVt+sxedJk020uqbAfEPNcT/IfNVY3AFUKbwvv7A==
X-Received: by 2002:a05:600c:364b:b0:3f1:93c2:4df7 with SMTP id y11-20020a05600c364b00b003f193c24df7mr780513wmq.5.1686214672973;
        Thu, 08 Jun 2023 01:57:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o17-20020a05600c379100b003f4e3ed98ffsm1259957wmr.35.2023.06.08.01.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 01:57:50 -0700 (PDT)
Date:   Thu, 8 Jun 2023 11:57:46 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Trevor Wu =?utf-8?B?KOWQs+aWh+iJryk=?= <Trevor.Wu@mediatek.com>
Cc:     "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "tiwai@suse.com" <tiwai@suse.com>,
        "amergnat@baylibre.com" <amergnat@baylibre.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "angelogioacchino.delregno@collabora.com" 
        <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] SoC: mediatek: mt8188-mt6359: clean up a return in
 codec_init
Message-ID: <72aee5eb-792e-40c0-83a5-79618fca30a3@kadam.mountain>
References: <42f2a995-3545-40bf-82a0-fd9b8abc16ce@moroto.mountain>
 <a667139fd91f980eca1936aed7c973b750d30858.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a667139fd91f980eca1936aed7c973b750d30858.camel@mediatek.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 08, 2023 at 04:02:07AM +0000, Trevor Wu (吳文良) wrote:
> On Wed, 2023-06-07 at 17:57 +0300, Dan Carpenter wrote:
> >  This code triggers a Smatch static checker warning and does sort of
> > look like an error path.
> > 
> > sound/soc/mediatek/mt8188/mt8188-mt6359.c:597
> > mt8188_max98390_codec_init() warn: missing error code? 'ret'
> > 
> > However, returning 0 is intentional.  Make that explicit.
> 
> Hi Dan,
> 
> There are several similar instances in this file. If using 'return
> ret;' is not recommended, should we update all of them simultaneously?
> 
> For instance, the value of 'ret' at the end of this function should
> also be zero.
> 

I would prefer that, yes.  "return 0;" is always more clear than
"return ret;"

I didn't change the "return ret;" at the end of the functions because
they were obviously intentional.  I'm doing static analysis and I have
an unpublished check which complains about the return ret at the end
of the function but I'm not going to publish it because that doesn't
find bugs and I'm only focused on bugs.

When we have code like:

	ret = frob();
	if (ret)
		return ret;

	if (x == 1)
		return ret;

More often than not, that is a bug.  But if it's code like:

	ret = frob();
	if (ret)
		return ret;

	frob();
	frob();
	frob();

	return ret;

Then that's probably not a bug.

regards,
dan carpenter

