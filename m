Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wHnr+BU6"
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F8E120
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Dec 2023 11:45:45 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50bfa5a6cffso1508536e87.0
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Dec 2023 11:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701719143; x=1702323943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OL0YCwWLeVAAaS8V6Q9QVlcCyCHJm88AKIY6T+RHXgI=;
        b=wHnr+BU6XBf3H8SDWPtRcVxcqAQWgAVOcrbFqmdhTIbDK18cYtaUCDJoIlXJ8bsL4f
         bWcVEu55vG1m94HfeU5K7GcUe49dXmWoHKp53KgKyzykz6z3/SaO6TyjFeGvBilyPTaN
         P3953tl3wmWReWCpK99Gn6AC4ooMdy8rUPAY2Z8xXzjZcj+MPyM/P0SWDHSFXRJwbiw2
         2/3ys0QPI35KyEJpaNWPVc5kVAywfp2VSt3IEVUsbeYPePy8x2+6S88Bs93PegagRnOU
         x9Vp8VcJBHSqcjefGhI4gCVALMgGm3iekUrTqcUUVXt9ox8Wv0Qd2TukpF1asUErlNON
         VHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701719143; x=1702323943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OL0YCwWLeVAAaS8V6Q9QVlcCyCHJm88AKIY6T+RHXgI=;
        b=FnL3DjPkk44ikoworK2TPf79yl/NQtRGgO85aQlzs7SaIuyALF4XlQf3g98lMBc5dN
         C0X9R7p3WltnWgYH3DIx19397AmJVMZwczc9ig6J1mxzEWtO/EEnR+R7VsGr6sc1K1mk
         vXDg1r/BrEcf3iqLH5pOcYbzKHmWbw9wA4aHF0y5CyBiMy9gTJmd9snm8I3X88qFdXgf
         9fRKQBScKq/sYdRWAKiLvHjVK9zZexbK0Nf6SPIN8XfbLTU8HFgXR3QmXyUDhC8IRBNN
         na01Pgez2rvGwMb+NWsuhZ6msVUXgTlyNjBDfvlIfISmGGaonY8dcz24EaePy8iba6In
         Tegg==
X-Gm-Message-State: AOJu0YysWyBIMI26A9Gk/R2+A3u1e8U+H4mLlcm/T0mDk+iGpeF2Ta1G
	DZqckMziW8Vl3xbsu34Kp47vfA==
X-Google-Smtp-Source: AGHT+IGUU2+rL+VrrRankPr+xbpBILPjIFZNhDvGINb4xeFiR7O7TGptVO7yxax82e3WI1uhyyeE2Q==
X-Received: by 2002:a2e:9346:0:b0:2ca:1282:d61c with SMTP id m6-20020a2e9346000000b002ca1282d61cmr116222ljh.15.1701719143192;
        Mon, 04 Dec 2023 11:45:43 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f1-20020a05651c02c100b002ca02e43f40sm455120ljo.74.2023.12.04.11.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 11:45:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Vinod Polimera <quic_vpolimer@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: dan.carpenter@linaro.org,
	kernel-janitors@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH next] drm/msm/dp: add a missing unlock in dp_hpd_plug_handle()
Date: Mon,  4 Dec 2023 22:45:42 +0300
Message-Id: <170171913105.1455672.8865445448285442373.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204171317.192427-1-harshit.m.mogalapalli@oracle.com>
References: <20231204171317.192427-1-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 04 Dec 2023 09:13:14 -0800, Harshit Mogalapalli wrote:
> When pm_runtime_resume_and_get() fails, unlock before returning.
> 
> 

Applied, thanks!

[1/1] drm/msm/dp: add a missing unlock in dp_hpd_plug_handle()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/801207c18834

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
