Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A2DEC8742
	for <kernel-janitors@archiver.kernel.org>; Thu,  7 Sep 2023 17:33:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237629AbjIGRdU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 7 Sep 2023 13:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244684AbjIGRc5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 Sep 2023 13:32:57 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D95AA10EC
        for <kernel-janitors@vger.kernel.org>; Thu,  7 Sep 2023 10:32:31 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2bceca8a41aso20524611fa.0
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Sep 2023 10:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694107903; x=1694712703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FdAB2Jh5naeisydTV3u43XXNVH38AlgAr9dXqaut4m8=;
        b=WxDzS1a3bbbbgEPp4E3SkD0BgGCtmsTBVDW+PHr/TVY0ooZS9s7tgEZFe6lXS93hKu
         RK2W3D2jOLvn06IbP8BX1m7ekOvDsrQTbOCHVzp7JgbdP8gDdjgHCaB+Y49RLsWyuGFu
         H8S/PvmRx3lKfNsxeK1ouH8+5vyrjrzW9tDiWyTV5WjRSe8EgUMlY1BXQBVne76q8pSl
         V7wWvAPNYyGbUw8rHV/9U+1sMxLy3tdcGgARgIApjCkWMO6WR2s90MaK/6mytv/D0EM6
         7U1w7B1ya0UWfeyYSV1Uyp5UDOgdOgdzlvNYodG2AOTyeImGoHkm2mup1z72Qn2yDooz
         7jWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694107903; x=1694712703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdAB2Jh5naeisydTV3u43XXNVH38AlgAr9dXqaut4m8=;
        b=eNb5HdQIY11xZANvjztT0fMFJ1qOm59USIkjY4Rz43ILAXA8BE7x+LneYcRdgLsU+0
         CbXssvf72iYleZ6bcIVVI62BVcOLHTGR9XrkrcDbAFoVkS/j64be8dw4hJnl9oOY4fu9
         mVflwcz1cXgeO7rXihGTzlwZRexPumvUWFd2lSVIJUGNhpGEgYrl0JS5wo/kh6HjYIyK
         iIHYFX/3FyjcPn/orONBeN0ZypRhHVNNrK96TIesD2UczgoZiscFg+ggplfFfRaVxT21
         qhs8/dnTnu1qaRXNVwBVbrxZi3Pg3fTmT6jsHAL5mxBtWie3X+ye0AxkHVmKFncD81+c
         MSBg==
X-Gm-Message-State: AOJu0YzJJm+cKL/xRai5kr2lFTcc0VsHCAEmK934fDlhr9SP5tpe/xB5
        kBSw646oMNA3WvYdRRLXSJBaW9MCB4RsgOwHejk=
X-Google-Smtp-Source: AGHT+IFVw0hhgJ9cIVl3OyrJhRbiJmQ67lfQPapydSicLHG49QPh+uB3ol2Bh2Lb6O0nBJh4qYsOpA==
X-Received: by 2002:a5d:4441:0:b0:317:e04c:6791 with SMTP id x1-20020a5d4441000000b00317e04c6791mr4011818wrr.62.1694082564882;
        Thu, 07 Sep 2023 03:29:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k11-20020a5d6d4b000000b0031ad2663ed0sm22917456wri.66.2023.09.07.03.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 03:29:24 -0700 (PDT)
Date:   Thu, 7 Sep 2023 13:29:22 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-m31: Fix error code in probe()
Message-ID: <4c60268a-0896-4ce8-8c9f-61ff520cc90a@kadam.mountain>
References: <7926c8e6-630e-4d7a-b0b2-d29b3c8b2c09@moroto.mountain>
 <20230907102405.GA7987@varda-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907102405.GA7987@varda-linux.qualcomm.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 07, 2023 at 03:54:05PM +0530, Varadarajan Narayanan wrote:
> On Thu, Sep 07, 2023 at 12:54:39PM +0300, Dan Carpenter wrote:
> > This accidentally returns the wrong variable.  It should be "qphy->vreg"
> > instead of "qphy->phy".
> >
> > Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > When we're adding new drivers then we should use the new driver
> > prefix instead of the subsystem prefix.  For example:
> >
> >  Bad: [PATCH] phy: qcom: Introduce M31 USB PHY driver
> > Good: [PATCH] phy: qcom-m31: Introduce M31 USB PHY driver
> >
> > That way it's obvious to the first person who sends a bugfix
> > what the driver prefix is.
> >
> >  drivers/phy/qualcomm/phy-qcom-m31.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
> > index ed08072ca032..99d570f4142a 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-m31.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-m31.c
> > @@ -256,7 +256,7 @@ static int m31usb_phy_probe(struct platform_device *pdev)
> >
> >  	qphy->vreg = devm_regulator_get(dev, "vdda-phy");
> >  	if (IS_ERR(qphy->vreg))
> > -		return dev_err_probe(dev, PTR_ERR(qphy->phy),
> > +		return dev_err_probe(dev, PTR_ERR(qphy->vreg),
> >  						"failed to get vreg\n");
> >
> >  	phy_set_drvdata(qphy->phy, qphy);
> > --
> > 2.39.2
> 
> I believe this is addressed by https://lore.kernel.org/linux-arm-msm/20230824091345.1072650-1-yangyingliang@huawei.com/
> 

Ah, I normally look up these sorts of fixes using the following command
`elinks "http://lore.kernel.org/all/?q=${FUNC}`
before sending but Yang Yingliang's patch wasn't in the first page of
results so I missed it.

regards,
dan carpenter

