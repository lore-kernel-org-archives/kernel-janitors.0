Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sCmEypfa"
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D0C1B6
	for <kernel-janitors@vger.kernel.org>; Tue,  5 Dec 2023 06:00:58 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40bd5eaa66cso45601435e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 05 Dec 2023 06:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701784856; x=1702389656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LGKU/B3Bx2Yzi5OmM9o3RWqdkFzerbywN5kCuPw1/JI=;
        b=sCmEypfaiwsI/7MlDjFhHWwn3V32m/3Hx/MPZZxhrvEKjMtpYrKKiUGe9bjTFBa6X7
         O181XHmyK4eT0cQLuGUa0V9f3rdvNxpzVclMy3ommLYSFVxzjcYMOWDPXvs9/H9x5fyH
         +2XQpr1t+MFJkMHeXuvIy/4FBOixPtz0N8bbB4pm4emW2Xr818ckg8nWwMqsksgCApA4
         tLs8ReqCA7bdXXOiRDjvKOgzknyuuwEoCjQsu+1VPMmVzE5yzl+iPwS0d8bARScHlPgg
         ccSkXfzN60pz058qjwQ//x0oSWPCQvc17/MCI68XPBGLrNdo1kyzrVnJNYWMcnF1oQus
         Nnbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701784856; x=1702389656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGKU/B3Bx2Yzi5OmM9o3RWqdkFzerbywN5kCuPw1/JI=;
        b=Heq0gI1teT3LUoKrZYjKTgXOVqEmpmKlfS1tvmdUTPCeTZStLSXtvfMNKgwmPMJQDM
         AOfbdmv3cOimmpNRAqp3ibFWI+5yqXz9avrp3vQEyoyj1TbZj1e9ddtE+fktuMjA1Pd+
         pxf27m90PshRzzcxspsMqzzNC1Xqpn9KnXPzESDmjYzMSG5sSIReuiq62We++eOJbKhm
         pSRjeVWJS3/Fv5IdJa7nRj5mKis+fxLoSqVWOxNRrgmgTsxcMr6Y1udzPYHxRZosf3D6
         g4W+SJ7RV2QnrDtS9vhH5Bdvlag6MTjEQPkW0vsnHpgcuMbTmoj27BdvouVOkjFajRZQ
         CEkw==
X-Gm-Message-State: AOJu0YxFQ6IFcKWYu74Up6QRClZ1tDtX61yu0TIXJpsnmcbefCdUCVRb
	iFDW4X/wYzmZ8qRU/4a27lTRlw==
X-Google-Smtp-Source: AGHT+IFbFAD5sWyepu3ePHaYgueIW6BW7i9W1ch4x7D0b2M5vX7xa2yi4WW7aC30oOMdj38jGgYIeg==
X-Received: by 2002:a05:600c:474a:b0:40b:3d6e:16b7 with SMTP id w10-20020a05600c474a00b0040b3d6e16b7mr536677wmo.33.1701784856266;
        Tue, 05 Dec 2023 06:00:56 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t17-20020a05600c451100b0040b379e8526sm22325954wmo.25.2023.12.05.06.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:00:55 -0800 (PST)
Date: Tue, 5 Dec 2023 17:00:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Robert Foss <rfoss@kernel.org>
Cc: Sean Paul <seanpaul@chromium.org>, linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>, Inki Dae <inki.dae@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	kernel-janitors@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm/bridge: nxp-ptn3460: fix i2c_master_send() error
 checking
Message-ID: <a10a75c7-0626-454f-a3c4-d6031713f26f@suswa.mountain>
References: <0cdc2dce-ca89-451a-9774-1482ab2f4762@moroto.mountain>
 <170178410677.683894.16036596185582079991.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170178410677.683894.16036596185582079991.b4-ty@kernel.org>

On Tue, Dec 05, 2023 at 02:48:26PM +0100, Robert Foss wrote:
> On Mon, 4 Dec 2023 15:29:00 +0300, Dan Carpenter wrote:
> > The i2c_master_send/recv() functions return negative error codes or the
> > number of bytes that were able to be sent/received.  This code has
> > two problems.  1)  Instead of checking if all the bytes were sent or
> > received, it checks that at least one byte was sent or received.
> > 2) If there was a partial send/receive then we should return a negative
> > error code but this code returns success.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] drm/bridge: nxp-ptn3460: fix i2c_master_send() error checking
>       https://cgit.freedesktop.org/drm/drm-misc/commit/?id=914437992876
> 

Wait.  That was unexpected.  Neil's review comments were correct.  I was
planning to send a v2 patch which was just a cleanup.

regards,
dan carpenter

