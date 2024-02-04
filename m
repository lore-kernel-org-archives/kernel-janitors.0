Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A3118AF8
	for <kernel-janitors@vger.kernel.org>; Sun,  4 Feb 2024 09:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707038885; cv=none; b=T2olCK8ZWhnDRHftIjN73FUV08kBULFnoIGSkGl8g18+xRndwsjThbmQzJN6DAmcFQVFYjfi8R6br4T1E4VFWVbMGLd3l01+WrFVLBr9wINAnaj+Mx6OwQAkwVct8Xds5ZJlwYZceI5q28pCOVGwyYmrCIB92Vd3rC9r+bdPa2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707038885; c=relaxed/simple;
	bh=UuFaKeSRYDkGrMKG+Q0ICLTYQicuRK3ywZvev5g2U50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tn5u5IE5nMHuL1TWjKN1ZBbE0h8sXqsK3lSv2wkaHfg8qybKQOQLEKv14868d4vGualDTTfLFHr4kciRSz56iqvCm7QrE8flshb+t1JoSgA0GgUK6cYe81VE0fuHQTDndNmfw7dEsfccz/wFWMUlu2l87WDt9GUSR8Gc66gxkK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AOMqV9/K; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AOMqV9/K"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-603fdc46852so36307277b3.2
        for <kernel-janitors@vger.kernel.org>; Sun, 04 Feb 2024 01:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707038881; x=1707643681; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P5sjWNa2Zbf00IkE3XpgyHgd6FEK1NqFbKWHmhVWEP0=;
        b=AOMqV9/KnjoGzF0WNMejWggwkPdEEu0okhAvt99G2K30nN62rVipREgM+uCN/KH6jP
         J/XqdXd2g6WHETDHRzEXJqT+jXdO8ppyuVL9WesxzgjlafqJJk7NwZm7id2rlxyoj1dP
         Ses1PIGgB8nYRI1w/FM3AdgKRZg9FlyQWGGiCOb1uicleDVsGso309oAevUfAGjXLNXT
         q79+PmW8GutCEsFX3SjIcJdn6ZrRFOsTZKjXu+iWm8x9X7H6QvbWS+BCE5mDBZWCjYiY
         vDtZi58RFD3dZRtbdo6BlaRjH9yhS2HAjQfUARvsPTglSmHQzKPk2OqO6mga9LfZw7qD
         KJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707038881; x=1707643681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5sjWNa2Zbf00IkE3XpgyHgd6FEK1NqFbKWHmhVWEP0=;
        b=nlZD41IM2YQYF2c1WtKraPC+2XD8s96iijUkI0UFy9WSu6qRc3xIAHb09GS5RRh/yb
         AQKMXujobItxr6DF1h+Ap/cQQs5pT6JjTchSCH+P2NfVjcaBT7KAPOF5d7ceD4bp7yEi
         Debbo8phpnQ8V9FdSVdF7rTH4RmMnwQgNLiCPy+KHJb8WuLc8yjgfJCbfIqdgLnFQlPd
         fXldcEQx40JrKyMP9n55MV0IiKISNITLxOe9yzRmjM9kqrsN29+m5R0349dlerTD4eXQ
         H4ghgnf0Xdqh6HBqN7IErt927VkrHHloPgBENSCvh837LpED3GM39e84lbje0DAt+gTE
         MfUQ==
X-Gm-Message-State: AOJu0YzBZi+xYw72GbYfY61Iy4e4InMy55e80q3+T5CsUbgy/+BDsKcJ
	Mk4oRgECm6FusBFOo8000hdkWyAzYXZ+LiT1sQhYI/QoUXwjIIim0YPAebwDY+FuhW0aCh6Ojho
	skk6sP9ZthkeDrQBawT9X7lCP8S5lrUcU0wb1ZfdGTaetUc6BBta3qg==
X-Google-Smtp-Source: AGHT+IGxeuAVCwWLRLJEi0G5Qg2/frr1rMxC4V7Vrc5AkNETrdVpT0PrBSYn6iO926ISWNBNkyqrg+bgXGDhBkb3aTU=
X-Received: by 2002:a25:8310:0:b0:dc6:db64:67a8 with SMTP id
 s16-20020a258310000000b00dc6db6467a8mr8149346ybk.43.1707038881088; Sun, 04
 Feb 2024 01:28:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <82a0768e-95b0-4091-bdd1-14c3e893726b@web.de>
In-Reply-To: <82a0768e-95b0-4091-bdd1-14c3e893726b@web.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 4 Feb 2024 10:27:50 +0100
Message-ID: <CAA8EJpquHiz2r7+0ck6KFjpiQHNhgfH5D7n+MEYLKDhDXzBXGQ@mail.gmail.com>
Subject: Re: [PATCH] spmi: pmic-arb: Replace three IS_ERR() calls by null
 pointer checks in spmi_pmic_arb_probe()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, David Collins <quic_collinsd@quicinc.com>, 
	Fei Shao <fshao@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Peng Wu <wupeng58@huawei.com>, Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 4 Feb 2024 at 10:24, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 4 Feb 2024 09:39:48 +0100
>
> The devm_ioremap() function does not return error pointers.
> It returns NULL on error.
> This issue was detected once more also by using the Coccinelle software.
>
> Update three checks (and corresponding error codes) for failed
> function calls accordingly.
>
> Fixes: ffdfbafdc4f4 ("spmi: Use devm_spmi_controller_alloc()")
> Fixes: 231601cd22bd ("spmi: pmic-arb: Add support for PMIC v7")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>
> See also:
> Suggestion by Peng Wu
> [PATCH -next] spmi: pmic-arb: fix a NULL vs IS_ERR() check in spmi_pmic_arb_probe()
> https://lore.kernel.org/lkml/20221115090927.47143-1-wupeng58@huawei.com/
> https://lkml.org/lkml/2022/11/15/197
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
