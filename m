Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98504288C88
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Apr 2025 10:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713966; cv=none; b=UZWsJ2h+uUA++x8eRTKxZZjCms7AqP99axdFO8dSLE6RAA7BPAajeQXXJzUt+1Lf6rRHoc0Oex80DPm3lKsISWaW7XYEFsxD1ERdtw1gOj6HpeIXaF+IGRJv3O6C6VRfNj8DDvxqU0rWXNlQvu0XFoliHYH2ImiD8qyxCO/wA9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713966; c=relaxed/simple;
	bh=62EDoSV5fr/+NmDoX0H93net+ojkqMEqG9Aj1TnT+E0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sqcPB0Y/5LuaXAvKJwYwZD6zokuiDP1xImu+Rf5YlLGsFounfskB1gShD16hXV9pMcU7tVVKPRSuKuaSab0CokYjQ4eeoTHtcfTn7O/GUxvbyyZ1nw/uftk91uEOW4kGrNThxvpTfuP06fWy94B2jVyGpHJKfh5gK70ItQTtHmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P8gLzSIr; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P8gLzSIr"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so46879885e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Apr 2025 03:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744713963; x=1745318763; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YQaWyRKtoMYOuzjQi/UaY0dF/POie1UHEF8CXbYiDJk=;
        b=P8gLzSIriEwqcJ3SVK3V3MDz0sb633Mpg390yEMZwLxYtGg6hPNq+JeOAe1cEtRf37
         cVvQ3/YZFsPKRj9dyDEMgssZEPu8UWdO3zBVeByD+q6XXaX9HRPO6FmAFtOuKxDQsO2T
         j+tzG83mpWZ85mIG1siSq0HbqrXCBF51vRvM0PpfUNZNdi28NcRWlTb0lmX+b3kmNozL
         zWAp+NzOkQagGKX3o9ur46YYxY+HckOopzaoFwVAtNmv+NhktDamB/CGa+e3H9NJn+Nj
         bYe8F+3MOUKEjnr/lEQA+bGBCzROZuWWD1E63sDgyFn8yfSAn5DNIK0FgSZOuBaF67Ys
         zmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713963; x=1745318763;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YQaWyRKtoMYOuzjQi/UaY0dF/POie1UHEF8CXbYiDJk=;
        b=RtcOwQuGK4bjczJLppJBgByHmmxDG11nMq0Qt2ursvYO7ELg0CYlQ60njz18lcTCZt
         qLA9AxvsLdv93OpWz/C7thaOt2xLT7Jh+azCHbc3vBhX3wHK6BdAEwHaNKSvEd58wbTq
         6Kfq67RK8kbfs4nwGAmhHNH2Q9WiA0J56qGMPZ/eexlfs/RLx3Tt0Zmxn9W7JcFaELBn
         3jD+r6Ma9V+QVF34RMKdDDjGX3699zrFcRvvCyYoCjt7XW2+eSwVnPV1mqr0e9ZCpiPU
         /hEgI10nn0bL7v8bwxGd+6aVQJJT61GBZ88r819SUs2jnCyAOBRfChraCHLogMDGmzxU
         WJZw==
X-Forwarded-Encrypted: i=1; AJvYcCWXK7BuUCqu5HZ+Uxr6H2KdaPkHMJQ5/XFXw1u6JlYaYgjvapGXSR6czE8rjrFUdB5z3pTtCL1PBP/skCo7PFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWHuz6+bCllOIPz5/NwUB3kQbIj8PlZbkpvhsWGI5t0roAser9
	pqxo5kO1Wn6xWLQRQyJGOsSd54Vh8Lzq2m8LShqDuKX9Nxpn7OFDqwRo2KW61Ks=
X-Gm-Gg: ASbGncvRRhsrigzcXhXhVTMDqKMVwGZiSS741hJguTFFfZwMC3AA007IJ3SD71zSwPz
	QHc8458bYJNPwcd1q537+d3llbwpV9jYcKL3/Zo4NFRaZHsVzRPN6By0m8bZPKLaiJstGyqNtrP
	ngzV/6FLpo/6PpM4TxJozh62lPQAx9hV4AY4d6pUAVQvdGvAf0O1Wtv6Qrv5KHOaIJWg/Yy45tc
	yNkU9U4xRRx7m/3DpZKxIHFItUYwLR+9nvk6QHaAaDmFLf64rupFq2O+/nyTkfRYRSJwzJlXe+R
	6bQW591WvL3tR8kgdY5IEtujHCh4SASoMsgTNHrGPgFpeNFhfYCCY02h
X-Google-Smtp-Source: AGHT+IF9J6YTfX5akGPjOT/s3VBMw222DuUVaFgs0VJ6eOUCfIE607Qv0sYxi3xUVj+vgeq2WWXWzA==
X-Received: by 2002:a05:600c:1e28:b0:43d:7a:471f with SMTP id 5b1f17b1804b1-43f3a959967mr143990565e9.18.1744713962777;
        Tue, 15 Apr 2025 03:46:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f205ecb8dsm207835665e9.7.2025.04.15.03.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:46:02 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:45:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: qcom: delete a stray tab
Message-ID: <Z_4458uUI3LURa8M@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code is indented one extra tab.  Delete the tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/usb/qcom/qc_audio_offload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 5874eb5ba827..8b096f37ad4c 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -379,7 +379,7 @@ static int uaudio_send_disconnect_ind(struct snd_usb_audio *chip)
 		} else if (ret < 0) {
 			dev_err(uaudio_qdev->data->dev,
 				"failed with ret %d\n", ret);
-				atomic_set(&dev->in_use, 0);
+			atomic_set(&dev->in_use, 0);
 		}
 		mutex_lock(&qdev_mutex);
 		mutex_lock(&chip->mutex);
-- 
2.47.2

