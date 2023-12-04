Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bRBqh33+"
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7549CCE
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Dec 2023 11:39:07 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-db544987c79so3218784276.2
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Dec 2023 11:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701718746; x=1702323546; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YTaRrGnNYWJXMSaCAkRjN5SkjpY2VkDKl0lQohgIOR8=;
        b=bRBqh33+WEasPCrXglkOCn49BOxneLpHspnV+h1wN69C1SjEIa9ZVvF/elRuMy6SzB
         7/FKOSfVChrx2/VN1RB6kNzBjYgFtfO8G3JsWaLrtpd8vXWDO0oYCMSQrI0zrnQsqtSt
         IHjOkoLTg29XwYn6QFuvvseTSuMgoeKhX/y121yhRXMcs4PnBR4MpvwfWaCYyRA7+mEP
         18NKqoLxb0F7l5ob5qN9o8PLsHfSaPLqFG8QzuMiXAzU7nay7r8qBqvCRI02+LYYC5wL
         XHo0lJm1KOuOvyrfuHOKGJcW+/ek2Sso3fQPjkz89LUSFkiwZDwZHh2FZIhEnbZMhEw8
         YRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701718746; x=1702323546;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTaRrGnNYWJXMSaCAkRjN5SkjpY2VkDKl0lQohgIOR8=;
        b=mH3pQi+QGa/w+d9tqDWM8khkw9dAcBPPg13Y9k9YnqZ4xcCfFs4BlDD6fnR4K98eR0
         A/HCuRpmDHjBKIPPUqQ62mKNm+2sLr43mkZXCwda8RT4gh/Mt1+tERGBCLl/gXf3F86t
         tuqdBOp1T7/zz+NF8wbrTDWC2bRU0ctA0OSRmnBKy4epDPliEmoBkMp3rfaUz1IrAUpU
         pw+zN/Fmd0EJNt0guVGlPOON9GowYK6j4elZRFzQBudB9Z2vczOl8/dyqxfhA9VKl8uI
         tE5wTnQYrYMKEEhnyD9JaEKfnmi87mXXJVAIBRZZmVcew0zuPdFTeTojQjDFpt+tn7Ah
         OogA==
X-Gm-Message-State: AOJu0YySSgvmWeq70HPE46e8m+5lT1dV1eldzm8VeoMcmRXgqnSnxnbZ
	sqc6PA7PbHnzobmjfiDDyzlJaP/4Xl2ypezRq15DMg==
X-Google-Smtp-Source: AGHT+IHnf+wIvLq0T+FY2Q4ycS6tDbC03pIpYzm4f+CmPYNLG73XmpwNsbHDjLnCXb2W1bDF/n+0HHpOQ1t0sBPlJMI=
X-Received: by 2002:a25:2cd:0:b0:db5:4e94:67cd with SMTP id
 196-20020a2502cd000000b00db54e9467cdmr3836892ybc.58.1701718746667; Mon, 04
 Dec 2023 11:39:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204171317.192427-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20231204171317.192427-1-harshit.m.mogalapalli@oracle.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 21:38:55 +0200
Message-ID: <CAA8EJpqdJFxM=Ervg6Gx3umV=K7HaprAa2RrtSjxtv_qv1VO7w@mail.gmail.com>
Subject: Re: [PATCH next] drm/msm/dp: add a missing unlock in dp_hpd_plug_handle()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Vinod Polimera <quic_vpolimer@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org, error27@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Dec 2023 at 19:13, Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> When pm_runtime_resume_and_get() fails, unlock before returning.
>
> Fixes: 5814b8bf086a ("drm/msm/dp: incorporate pm_runtime framework into DP driver")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is based on static analysis with Smatch. Only compile tested.
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
