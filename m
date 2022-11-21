Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8344C433FE
	for <kernel-janitors@archiver.kernel.org>; Mon, 21 Nov 2022 07:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbiKUHnP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 21 Nov 2022 02:43:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbiKUHnE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 21 Nov 2022 02:43:04 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7C04C271
        for <kernel-janitors@vger.kernel.org>; Sun, 20 Nov 2022 23:43:02 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id f7so15003766edc.6
        for <kernel-janitors@vger.kernel.org>; Sun, 20 Nov 2022 23:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TUVIyfnzpJrJjjktkuqFcVCWlSjqMueZ8oSh19wEx0=;
        b=u8HULqbgDO1V1jjNHkBZ+tyxbUE+H5slR0LHOlbfeZAo3EEj10DJVA0a7eNayrx8QE
         qkAIPnZN/1pyhj7djHgxGa6H6GOEPzp/BK4X9QN1iUaQzkZv42i3cBJppROe/Ej/iZ3E
         DrQx85QkfKzETnYKoXMc/xsfBK04j9UbGhery64BTRSdObqu0tUQYDhy/q1NdZpfw1aY
         6ZBdw+RMjZ8k2siwz+RcwlWJnWHhxYnldUPd4gqHu6++LVwVBmdtRmk885K7XmSv09fm
         WbY3hF41oKOfCmenytGGcYFTMJYtm8wOhq+6nnTuT0a8an7eKvRjiv2AKO21kjqiN3Zo
         tiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1TUVIyfnzpJrJjjktkuqFcVCWlSjqMueZ8oSh19wEx0=;
        b=4TTwYlZetUDD6ej+MptiQoJssZpPMeXiUv/l98AlRRFqPwCyyCKWbV0j1Ieh0iJxK+
         hWdTe3uV+Eah/I3YHuUBDB0ETL5Dj4Lnkv+wndTT0ItCAN6qnz4jzInly5KKV1tVsC3o
         S+y5drcnOtJ28Mc+mzjpmZ6K8NwqAYwPOTHuqwzMrYbp93aUZ5I8dTBxenrmnSWA0V0+
         1tB/7gaqi/Qv9Zm0ZWGTzJLzF6s7N7nVql92fcMT4xcKtGzdgK/mlODGyHOI4loLyaFM
         NXWcqHAPnCQ1YOuTwHaeYnACpGn2Npw6cc1RM1y5a44Y1X8VldD/zAm9yMfsIaSgdP7G
         0Pvg==
X-Gm-Message-State: ANoB5plXfF44rDXTvQjtvjyymixUpH6gPLCITOUIYBXOCYiUJHMuw1mU
        Yy+XJLPLf03hinqfnFGFw4EpHg==
X-Google-Smtp-Source: AA0mqf70Zc1BNt2e8y7KjZG/3WSjRLleM/arnX0rg2ndkyr3oTK5dpqVHh4yYqJ77f04oWtSKx3tnA==
X-Received: by 2002:a05:6402:2a09:b0:461:30d8:6742 with SMTP id ey9-20020a0564022a0900b0046130d86742mr14964115edb.172.1669016580728;
        Sun, 20 Nov 2022 23:43:00 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id e10-20020a170906648a00b007adade0e9easm4667280ejm.85.2022.11.20.23.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 23:42:59 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 21 Nov 2022 08:42:58 +0100
Message-Id: <COHSZZ9A5570.1P4NTXRE9IRZR@otso>
Cc:     <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>
Subject: Re: [PATCH] interconnect: qcom: icc-rpmh: Fix an error handling
 path in qcom_icc_rpmh_probe()
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Georgi Djakov" <djakov@kernel.org>
X-Mailer: aerc 0.13.0
References: <ec929c37c655ede7bb42e426354093c8a1377a0b.1668947686.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <ec929c37c655ede7bb42e426354093c8a1377a0b.1668947686.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Christophe,

On Sun Nov 20, 2022 at 1:35 PM CET, Christophe JAILLET wrote:
> If of_platform_populate() fails, some resources need to be freed as alrea=
dy
> done in the other error handling paths.
>
> Fixes: 57eb14779dfd ("interconnect: qcom: icc-rpmh: Support child NoC dev=
ice probe")

I believe the same needs to be applied to icc-rpm.c.

Also there shouldn't be an empty line here between Fixes: and Signed-off-by=
:

Regards
Luca

>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/interconnect/qcom/icc-rpmh.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/=
qcom/icc-rpmh.c
> index fd17291c61eb..5168bbf3d92f 100644
> --- a/drivers/interconnect/qcom/icc-rpmh.c
> +++ b/drivers/interconnect/qcom/icc-rpmh.c
> @@ -235,8 +235,11 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev=
)
>  	platform_set_drvdata(pdev, qp);
> =20
>  	/* Populate child NoC devices if any */
> -	if (of_get_child_count(dev->of_node) > 0)
> -		return of_platform_populate(dev->of_node, NULL, NULL, dev);
> +	if (of_get_child_count(dev->of_node) > 0) {
> +		ret =3D of_platform_populate(dev->of_node, NULL, NULL, dev);
> +		if (ret)
> +			goto err;
> +	}
> =20
>  	return 0;
>  err:
> --=20
> 2.34.1

