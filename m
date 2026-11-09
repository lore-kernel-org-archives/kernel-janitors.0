Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203244;
	b=MAJVap3hspr/lXnBl6jdJz6QoqqebMeq7R2uSr1aAknJ35JLdx66e9khRdfmjIvLoWvw
	 YqigiT52s33YreH8Bl21ta4agwbiMnjRjmrD7w+QAHtl7haQvNTNca/yWzpI4TKH5njiD
	 ekY/LOoupOWvfvjwe02NRx/Fv2Jz9ES4UZy2g+FePeZUP4qiUCmzwr+bcuEpQMqImeNNU
	 GMXTIZYslRSZqVzbBY9IGElYQpXE1fJdk6Dfy9G4eFp7a+b1YkIpiyC80K02u6GSTqWzt
	 hR81M1UOdinjRHpZrFLMfprcsiQ+f6Ncs80s/sO8fYWkGDVYIrD3b1GPdfOgn68wF7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=byaI0cUQu2T0+QBNSGRsOncWnFfV4y3lh2H71TsBHYg=;
	b=MAO2m46zi3iwgcbZ/ImCkr8nINqN5ivep0krVshNTxyXT8rhkUAIqdj7k9lkKMx3xLmA
	 dRw8vggKGOttvs4igtcrftulxabb7Sc/VoSfnWWRhezsR4bwufuBFpgPkrbtKcqEQMf7t
	 l0XswnhnAKbNZin/REQMOd3UXKfDhxA1jkHFyqXBgIKiN1sJCdioJF0O51XQFMDxa3+Zx
	 Qwwtn3YbOPJxHLv+9Q3VK6yiNRijayvGn+VC75qdjLmbGjPR330ts5pngI6s3NHiKTx3A
	 4zh4ljHjxuSL1qLOM1uvsQrc+sakfeihpMY0akUiKs/ps8n3JTg9rVLAD9NiAsYjc8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=06dYORPp;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A625C606A323
	for <kernel-janitors@vger.kernel.org>; Mon,  9 Nov 2026 05:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A625C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=06dYORPp
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so5104235e9.2
        for <kernel-janitors@vger.kernel.org>; Sun, 08 Nov 2026 21:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794203242; x=1794808042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=byaI0cUQu2T0+QBNSGRsOncWnFfV4y3lh2H71TsBHYg=;
        b=06dYORPpzojU2j2eWqVP4SeEMOaYCTvlFbcfvSI2ITWvvxv1I/yXkxZQXoZ4VWAZxj
         xkkiVGsuZiE3KkukRPUwYlYbmaSWqi9S0WH7ucuIMsRY42DNbFP+E/+uFpUSNHOertRC
         oDq/DdqmYyTDvpZk0nnlrk2u5wIPKiDJlcBm7CcF1wTPtXqJpef16AQpu9tMIXBUcO53
         TdN/QbM5CWzBaCSV/FMJWYYYxpVLbmvzcdL0hS94Ho8X0hLUNMGNl/31Rq1yWBqvuLcM
         Mq7llBlAclB0TuNmx+QE4BRFloNgcdoAARTfIZM05QBOZyDBJOUWZzCZ5j5FXKqkZ7Gl
         Wz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203242; x=1794808042;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=byaI0cUQu2T0+QBNSGRsOncWnFfV4y3lh2H71TsBHYg=;
        b=lXt7yItgjDOoTSazrwSab3oFWrI27NXQdlQpTqz9ie353KY65TLiTMsc+aQLfQYkVh
         iz1Rh5UqI/ZVYX/BMNj266x3lqcEAsn6NXqdlYgC0Cf6SeuCgimCw15JbRnoays9GK/N
         cJXt1BeI1vaDRIy8tn6/yjXMopFszET5dVUUCaI/Av73x0pCkmeAVsxj0EGAK0ftZuaH
         X6oN8OVw7U0jOIyr9U6S62KS24TpTnw6VWec/EvKjuWjg68Mc5AYLXdYaPydM/ucUpEy
         EG7jsVVkiykRrYH7F3vGxGJafTtoNuwmLsysdotP2pkYOOSl0KqCUdDy8ySS9EXJIkEy
         P0oA==
X-Forwarded-Encrypted: i=1; AL+hErG/FyiPGzp3EDBQe7A5DOteKAUGqWynkxA/6d1jNOEWbWv3Enw7YRGWar8JSURbHLKgWQV2WLv3cV8o37YTGiQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dgeVv4vdw5t8jagBq4gEQ1rxRyvwL7msTgTy36AJmAXmugF/f
	k15bcPAt1tkiBXtT2Dh5CdHnBXi4xVAfwV1llx2D+2H4QDScBNLIFMHV
X-Gm-Gg: AYBFou3Ow5PSpeLpuocRI+320HaLVE2QAcIoV7dY/UhOXs/vCmyX+BIJsBWfFn3k2aK
	iS3E6Bgjkt35/SdW8Lio/PshLJHVLvfXgoNJ9THaP/XU/7K42Num6OCUv1WblVWJ/b/gTugiLm+
	aqfGXWkVe+TOLplo0CB5xWxdod7Xa6HbU54k9zAjxBq4U02yG1j5yBLzhwugMYKXoXpBibeARg3
	y1JQHj0JWVyR8KObwhTGAB+ugPgjcknyJottHNZD/YEYqrjk3FA23bZs/qW2zld7/ji/DBRWEcT
	LxgIfVzXXgBubXHWsbaKL17IMfiG/HY5gHMOU8wSvxKoVos1bKkPE+kG5Y46OrKh9HHzZW41a6C
	X0uoqQ4vpHJ7vi/XV9H9R3gZ699zULoXAJScLr8YAFfPqax3yR9WOBjlzdjtBpOuOK9EBYiSF20
	K8veRakcnnwBE8akAJhcY+viom1WTZ9N9p+ViCJRzqGN0BvEuRLLn1NxuhTFgJP+RQSfsEYn6aQ
	hzMbNt3BIIu9eNf/TsRtz2IyVbrqtv+IE1+cfR/cKkHfejyAwgyX1ZrGQdojDAJCWaL3CxcqMzl
	zw4HlR62uwU2M6euuMQ7Nl5nRIFe7M87VHu9yNFKmEnVgesrkenmxbPal7mYmXTudEXITD98KQG
	xta18hgHz8SRdJhVTY/faAVwV6vMX6rv1ur6nPfjhPNlm6aDQ/3wpEhJuSO5MDu9tW2AzwyfBuf
	gI4dgEvvVYJ8E=
X-Received: by 2002:a05:600c:83c4:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4b963c6a8ebmr57095265e9.19.1794203241970;
        Sun, 08 Nov 2026 21:47:21 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79501bdedsm130008445e9.3.2026.11.08.21.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:47:21 -0800 (PST)
Date: Mon, 9 Nov 2026 08:47:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jiawen Liu <1298662399@qq.com>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Markus Elfring <Markus.Elfring@web.de>,
	kernel-janitors@vger.kernel.org,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: omap: handle clk_prepare failure in probe
Message-ID: <avFeZWgJgID5XA43@stanley.mountain>
References: <tencent_B4F504456790E8BA3C4EAB80F4BFB6954E08@qq.com>
 <20260820154323.0a7c7929@kemnade.info>
 <tencent_A1BF4495D1F5E54524907BBA2A4ED480FC08@qq.com>
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_A1BF4495D1F5E54524907BBA2A4ED480FC08@qq.com>

Andreas is the expert in this context, not Markus.  His suggestion to
use devm_clk_get_prepared() was a good idea.  Add a Fixes tag but a
CC to stable is not required.

regards,
dan carpenter

