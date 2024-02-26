Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8238129A74
	for <kernel-janitors@vger.kernel.org>; Mon, 26 Feb 2024 09:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708938950; cv=none; b=ALnFESYpMqyA6KUH1HKAkpbj6f3MjK3ACB6iVaRLik9+BHsp9KipqqTSBb5v1oEVpKiPSWAbtK5gbAMVa28MMciEAxuFDRGADYuLRr91XZ/lapcfY6ZbqJhoOweQQFK7jjqC08wHyI45TK6vepj0cqJ/t2FQ9a0UOTpyZVxxIdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708938950; c=relaxed/simple;
	bh=B1VvnK0P1FlmJrbO/JVZFYLy8Ss/+g/BAdsgVdmRAzk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S/GAgfO6t9bSQsK0hy4qzxk8NN4QKzSIPMr6cSeDqQ8vEVRNrybMiACwLeBgGraLdsgVcTdRZ3kRYy7h5erb1YAZLBC3J70SdbqfjAKS0kBtRm5yAXLhq+WspE3oLuYAipcj2UZE+Eq/URkplNaPF6WHmIZEOSX/edzmBXA63Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OiJMEiOz; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OiJMEiOz"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3122b70439so315452866b.3
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Feb 2024 01:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708938947; x=1709543747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMRgoAUtSN5Ck2RhMavH7hlZPPY3JhOWKPfiauprr90=;
        b=OiJMEiOzJ1ikzDbyJqwHo869d0Kr/NInoeR56507+zyCUW9IWpcRHegNGsAJlXIJrj
         iuC3DnZnXpJuQXeRS7Oj65pKGnhqIJE4T0Y4cSn3VoU5S3THJq5UexuQHOmejQmZwHNe
         yVSf+J4oDT8099Ds/uYM2f+dGeS+PF9nM7Yv1Xri8dWBGwqkT2+QRXS4IQ1ZYkRK1y8Z
         a8Oh0kqDddxCMCoBQJI7CpnvFOWELaJFcZyVe4abaMl3XrvDwjjJuGXHhsmdmnsrvTfY
         I80qz2+9pr6Th2e6p751p9swpK74MQbs2IxLxurQk4fmOY7V9WWdzaxlz7o4dHZweP0U
         9BHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708938947; x=1709543747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMRgoAUtSN5Ck2RhMavH7hlZPPY3JhOWKPfiauprr90=;
        b=X29MYGItg42r34O3NGrrdxNvfQUIYdKqwrvMMwflcsYZ7BHmm//V3xhCLgPzfWdIst
         EpSZTzxaD4PEESYQ6YrEi1q+Z7aOp24FyujI1rgjwUmjYAlVXp8XQZDoqTZ9L99Plin7
         lVvmkfUtyb+86nVHVvMQOLKgUrInFMyYktCNkEBfXAQmp1RNByBBTOeW/ytUI0AvSxzM
         QKHaBQRJnwb67TL+jkoHWmqEyQnoqVmhlWp98TKoBNOMH+Ksr+VLknkePdSODXFknJk5
         tjPkyU2dzowsRAOkVJMXT2ETeauCcRv+aOrMcv6uU0ipMRcbUcrhEMsrCP0NfHh7TQvE
         ec0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkKs7hIcR5TS59KgVmoRwGDgGH8u0PZIAXkNUt9IfiYbqXhpQkN46fBL79TA5lVDVQ45PV/EDwIvb7+xTEJqgYz8t5oW9J8xXwMGuEioSN
X-Gm-Message-State: AOJu0YzqaxMrSjIM/hLNJNxzTehWkVuqyjKq/hJl/wjxp+PU5WPtRNc+
	6RFDCXuzj8WoPujunV3HW19oX8oKmn2/2FiNX3KvI9Rz8RqD88UdlyqG181EAGo=
X-Google-Smtp-Source: AGHT+IEifvcg1VVqeXHvGwhlcQ3feko6nFw94q2Cwdrt1A+BRQIuLqp+6l3tAihxJzMqtKkot8TAzA==
X-Received: by 2002:a17:906:3397:b0:a3f:d797:e6e2 with SMTP id v23-20020a170906339700b00a3fd797e6e2mr3943939eja.28.1708938946971;
        Mon, 26 Feb 2024 01:15:46 -0800 (PST)
Received: from hackbox.lan ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id 7-20020a170906308700b00a3e799969aesm2191088ejv.119.2024.02.26.01.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 01:15:46 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org,
	Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
	cocci@inria.fr
Subject: Re: [PATCH 0/2] clk: imx: composite-8m: Adjustments for __imx8m_clk_hw_composite()
Date: Mon, 26 Feb 2024 11:15:39 +0200
Message-Id: <170893890773.1758840.9115935052552967417.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1d494176-2238-4430-bc26-4e4c78fe4ede@web.de>
References: <1d494176-2238-4430-bc26-4e4c78fe4ede@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 22 Dec 2023 17:33:19 +0100, Markus Elfring wrote:
> A few update suggestions were taken into account
> from source code analysis.
> 
> Markus Elfring (2):
>   Less function calls after error detection
>   Delete two unnecessary initialisations
> 
> [...]

Applied, thanks!

[1/2] clk: imx: composite-8m: Less function calls in __imx8m_clk_hw_composite() after error detection
      commit: fed6bf52c86df27ad4f39a72cdad8c27da9a50ba
[2/2] clk: imx: composite-8m: Delete two unnecessary initialisations in __imx8m_clk_hw_composite()
      commit: e1ed0b0362285981c575f12ae9e8b9dfe56a046c

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
