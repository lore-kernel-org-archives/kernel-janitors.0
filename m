Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D4B198A2D
	for <kernel-janitors@vger.kernel.org>; Tue, 16 Jul 2024 13:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721136592; cv=none; b=PxJSoFNpzr6zh1LEzy5pey7drcErYc96g5DwrKIDrmZseg7NPde07YDIW8T6S4zOMMtd5KFmy9q94ipDsV5+Cw0A90lXiAkcupH5nmxJWa5Q+orlGfAdxJ/UjsMKebqCHeBCXQ3TU5H5LRMkBS93WtfBi8oe2ehVWAhTSEJMEDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721136592; c=relaxed/simple;
	bh=/ft0t505pKh6jWEQYbOIW4grW201GD1N6QXAe49ok8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmVXIGNvPs6xvbHDQ8tmFf+gnZ2W3NyFfhcjuelBXgoIgd+izdeAbg6GMOItfUp8U3kkTcm0eKoV40GT+o+ThpJEkD/5JoL6jk+QzCZUNXZHBVGrCZdUUoHJLpFJnd0mptNIDS7A1GiCFIq2gikBn6fJqnJ/AZtOudjbukouNVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=F8LdvZFX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="F8LdvZFX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4279c924ca7so34243485e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 16 Jul 2024 06:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1721136588; x=1721741388; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ft0t505pKh6jWEQYbOIW4grW201GD1N6QXAe49ok8M=;
        b=F8LdvZFXVb5rH1fq8zcOXEASi2mq5wUiGVw0rIAQujeWdtwyC3IZSnNM7sVsSwnWbz
         sA4QZztmP9DEZSBRqY9V1lu0UpBDP6gBt5+kt9tzGaSo2EVpL8O+31WHdDBoYX/flRN/
         vu308suxdFj/gRRvu2GT9VkECnVLiXn3YUb1LqZTGJC2ZeOXiizPQXDQgWz9fraQSoqY
         LlrFUAEoGXwjrhoGacddcyzDUup1tV1F/aad90YyIkzlvYSoUF2kl3xWyvo0c7sv9yYE
         DEP3hz9YFH8jtSQ3UVPQgtLZWFwGJ1kPk8vp/wL/UY+ilzkZdIpwJPYBCJ9sq56HhYG6
         RQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721136588; x=1721741388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ft0t505pKh6jWEQYbOIW4grW201GD1N6QXAe49ok8M=;
        b=rsUtfbfe2Q82xlgA+d2rGuOtBVYG54LDLTa9xGeIKxKql0JkksqE7LOFGqT8owJOdY
         +vSgiRylHQxcTsHYAcAnMjNL+trAFCiBjMVgxZlZRAycWdp9hb/w+ZoCF4vN9f5MbFFs
         dxHoH9lonwD1Sn65uDVjv/eEUDHZzC4QQ5YuS9Qh7azhRFWVjpFInur94k3+9ECZUEqf
         CpuwZWtO5iM6daGDQRmSc0Ikgafk2zB3RQU+C0BbK6GE0XTqkDHDuf1BZZAn3/+oJlEk
         JL+gpnlwJpuN/2H1/ZU16l3+widiU5gWbjJjpXx+jufe13jbmn7oT/WRbIWzCTNuJLAk
         ep9w==
X-Forwarded-Encrypted: i=1; AJvYcCV5JHZSWRH7QoK0RJFVVkSgae0/nXK/qqTlXo7817B8tJXdu0C8obFF7qltwCRJDNZkIIhwf7WJtRlK11VVJ0M64d8J6J/yJ6/JUZzORIM2
X-Gm-Message-State: AOJu0Yyty0VTJB03qddGs2hHhtUB44kOLkweuo9aO3gTi3CWfsrNwDbL
	ETEiILl1Lb6dhYzMdIrOZ5Z0WKD81axhjG7qKPzQ6ZBfyigbPtZVEe30nBGcR1I=
X-Google-Smtp-Source: AGHT+IGjAdQSxeEVdVw57jLUmBg/hDy2vsxlmLGLre5Ls8iiK8GxsJXzSOiFfxaji1YIcSK/8TzunQ==
X-Received: by 2002:a05:600c:314a:b0:425:80d5:b8b2 with SMTP id 5b1f17b1804b1-427ba642ff1mr14447565e9.16.1721136588514;
        Tue, 16 Jul 2024 06:29:48 -0700 (PDT)
Received: from localhost ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef57aesm124210045e9.45.2024.07.16.06.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 06:29:48 -0700 (PDT)
Date: Tue, 16 Jul 2024 15:29:44 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Andreas Gruenbacher <agruenba@redhat.com>,
	Benjamin Poirier <bpoirier@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gavrilov Ilia <Ilia.Gavrilov@infotecs.ru>,
	Jakub Kicinski <kuba@kernel.org>, Kevin Hao <haokexin@gmail.com>,
	Liang Chen <liangchen.linux@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pktgen: Use seq_putc() in pktgen_if_show()
Message-ID: <ZpZ1yOkas39bIsWa@nanopsycho.orion>
References: <cc21bbb8-e6d3-4670-9d39-f5db0f27f8ce@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc21bbb8-e6d3-4670-9d39-f5db0f27f8ce@web.de>

Sun, Jul 14, 2024 at 08:34:14PM CEST, Markus.Elfring@web.de wrote:
>From: Markus Elfring <elfring@users.sourceforge.net>
>Date: Sun, 14 Jul 2024 20:23:49 +0200
>
>Single line breaks should be put into a sequence.
>Thus use the corresponding function “seq_putc”.
>
>This issue was transformed by using the Coccinelle software.
>
>Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
