Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E862A2E8DFE
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Sep 2025 07:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757317143; cv=none; b=ODpIkt5r5PfOHzV1rtw+oLK2ykIto/F/F7wana8lFIeSZbm9+kW9WvMl6KcbGWvG9Cmtb0piUcfl8XoTOvEZWKj63mp5Mcm5lxiJgrVKPoAmkHep5RvUEPCK77uKh5Txfmsu8xCX312+4JMkwBNdhwFBAjZa8LN4V9QkVgX1mIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757317143; c=relaxed/simple;
	bh=MPT8NiohwpIH2FRM+/GL0Zo9ZEY8NsCZTxRtvHtMSMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RIjjQnbcXKrsDDMt6amJjTQON/0Lyonxcf5BF9kMnkb9vSv3+y7yLbEiBsHICA3mmmcSxhUKMuPFSN0AVpenGwyx1+eYgs6kZMF+ndfhQr+msOuL8+644Y9zg9fxoUS+v5fmPqOWXb3fbbzD1q6QMF1ajSnMbXaT4A/sQ80uGXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bn0+CyOL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bn0+CyOL"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45de6ab6ce7so3209315e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Sep 2025 00:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757317139; x=1757921939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6Qgw00JLihNswGsKUrWXq3EQB6PCDyKUk5esdN3dkc=;
        b=bn0+CyOL4Zht1NuKe0AMRI5SUB8Bvx7QhKI61DOQSyNZ/3KGk4LrAq81gipNoy3EAt
         T4qffOU7W8jhZg4VQ7vKLmsUgFKgN54Q08KRuxh41lMy7UGr5U7ea8nVZQKN2+PSXAez
         Ik+7c+UQwiZJ0FxNnRmJS+f/yCvtlKSaijp3u3aYPVjL+cFJfHfP8LM+Wc1eUkjE+Ixx
         A7cOtsR1/FS470qvoWLvge1W4W+e0q2aE+J7wqKCQvAonu0CUgr4bMwfbtAS3Voy2xOB
         e/sMW6ggObVlGOlosPPMTo1zGXhOaeYdMwkLsP8eP1HdHEYQ8FcCiquTw9M8Scia+UQm
         9IKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757317139; x=1757921939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6Qgw00JLihNswGsKUrWXq3EQB6PCDyKUk5esdN3dkc=;
        b=oBgO81+pEPgrk8+AYgu8VGItkqjfNMN3Zo3kHcaC2hCUsEXVvtim86rqmH8QX146ms
         FdL6HY9q/SHul6+hKk+qeH6yKRjX2WHz9XAseFmVGmjXHZ0k7DbGc0+Z/V0R3372PvMs
         BAKrDPjGyIqAtvJ+id1lKLmRiFeWPxJmd92oK2DVHa5k3GZOyVAsyStAjQ94+GKN/IfR
         FG3x8OZomTD9DqcG/0+K9qLngX5dL2LrR2OxmXrmsNIrRwMewx50fodWp9BlkweGVlO1
         QCQ+h33MlPXJBTLVDcy7RP7WNSyrQ+lf3Vooveu7rd+L/pZJNa2XK/pJH9dGqtXyAlid
         PQKw==
X-Forwarded-Encrypted: i=1; AJvYcCVjSNRFBRHFOwJtqWye2s55t+NzaHnASQ1oEGFYmQvKCVhzEHOCuvep7KfVIshTxyPbvgq8ri4mxVz/zoVu8+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtDrLxvfPl8UuCOJMf7fPUMPJxEYSFY61veDcDCaUK9vbmxVlz
	YjJ3VgS5gm3gi31vFbJ0iN0fY5/vS3yJHYwHTpcoUTwnnC+nT5m3wj3WOBZG3k98JDI=
X-Gm-Gg: ASbGncvfBxrN10dNVyyDQdtG1rCTSPQptvxoJUEF5b+9Hc57PeR/FgOcoBpvhWMDVxx
	jiRKKm8l2m7sp1nGysPiYwkb3N1w2J2wYseCSJ6uQLnUIZnax/mM1V0ubsrat05ebynljH229mj
	1yLPc5Pn61OZI6c1zsmiDu10DQl8ipORsn+UH7a5Nw83kOX3B2GbF6G7hAEPSMHcoVV6oMdT1zU
	KeTjOUPlb1xyR068mgbRNc5qSyvxXpXgWsruHw+f+GCZ7jwuOhj5gPHosnGLztXrsVibfCWEvJI
	UyA1Suf5xwCyc24G414hAfdPld5EqWuOmda3g8RMB8C/HoSV7HFmjwMx9MPAjLIPQaqvlcIpJEY
	BFi8vpr6OsYXu+AjFNrQVXoWkz/7VptGkCvk4HaygNQ7USQ==
X-Google-Smtp-Source: AGHT+IE11TRP6jW/sA1IoRyIuD/EMwHLllVmU+DHqF0PMbyJk/g8CcFlOS/FaP1Ivex22BkhPP0yAA==
X-Received: by 2002:a05:600c:4e51:b0:459:d645:bff7 with SMTP id 5b1f17b1804b1-45dde66c671mr59265535e9.12.1757317139282;
        Mon, 08 Sep 2025 00:38:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5cdc:d980:b6fb:1eb3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e92a42asm429977665e9.20.2025.09.08.00.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 00:38:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: pisosr: Use devm_mutex_init()
Date: Mon,  8 Sep 2025 09:38:52 +0200
Message-ID: <175731712491.48218.6418145557482787417.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <01910ebdaba7d8d0cdc4ac60eb70da8e29cb85f1.1757251512.git.christophe.jaillet@wanadoo.fr>
References: <01910ebdaba7d8d0cdc4ac60eb70da8e29cb85f1.1757251512.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sun, 07 Sep 2025 15:25:38 +0200, Christophe JAILLET wrote:
> Use devm_mutex_init() instead of hand-writing it.
> 
> This saves some LoC, improves readability and saves some space in the
> generated .o file.
> 
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    8431	   1808	    192	  10431	   28bf	drivers/gpio/gpio-pisosr.o
> 
> [...]

Applied, thanks!

[1/1] gpio: pisosr: Use devm_mutex_init()
      https://git.kernel.org/brgl/linux/c/474014cdec1758e1802082b94043189e198c58a4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
