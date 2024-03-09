Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBB01C3E
	for <kernel-janitors@vger.kernel.org>; Sat,  9 Mar 2024 20:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710016436; cv=none; b=MBwOFngV3EoklLA47yco1DdcCobyTdXXO/cN+4rg5OQCcO65ka1eKI1zaCjXIikhj5ttTK+6m3pnvFhF+TiCpvZFDLFj7hRB1RuAzBW41hcCeaWDh6FD8E2hYzU3DETc7OF+9CcNpS7v55jAuCIAjaSF14rAu2wYu95WnCifyPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710016436; c=relaxed/simple;
	bh=EcVIXfIICY3Ok2eDXhdHjNP9eppBGwoPoBbQbWCdGQs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mb4IkZH4k2DkFHA71LBK20rxYfEXfoyWj5h7hk9Yv8EhGXs59kxvCC0LlCHLTcS+FX7umDom21zEKru7xpBLn7stCAGuxc2xM0vYuGXhPi/RTiB1o0HuJNrR/4fTjWst95enrWairRi46jD/tf2qCOsz8xRFOh4N8x/mPzpZ/Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H0VGmGZX; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H0VGmGZX"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5d3907ff128so2667110a12.3
        for <kernel-janitors@vger.kernel.org>; Sat, 09 Mar 2024 12:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710016435; x=1710621235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsLvds74XFvPRZt+5SLhXxXFTA14aJAZhNEVhjPIrvk=;
        b=H0VGmGZXyUF+OV3/clYF/ovjxWbHc2nKovGKsUKXgr4m0F4BoSTLxopfmw7MHCxtJS
         Qf384rAFnF8rjq+UkIiawNKdPbYQytf8KSQAl8XnilBaIEKmxR84O4F8DTBPjC9KoslF
         3L0f/k9BPEJqOdpVWpBiJaTXmfgwoZieyRfVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710016435; x=1710621235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsLvds74XFvPRZt+5SLhXxXFTA14aJAZhNEVhjPIrvk=;
        b=hMxDSp3QwhuhYllpw5Y7wVDTyupYNsYO9BHxjrhrH177AKraG9qajoyNZIDCXZe0Qb
         kLvHTktGJc+ESfkSD02sdqZB4sVPyVu6N5ucZFfrAEWxKMovZFdSz/nHM5t+nMR+0adC
         w00wClj9ZsKU4KiB+4cjptqxkUcpe9CG0TYtAwMwwQX7k24eNYe5HI5bYYmAcNXk4Clw
         c7ignnZNLfmeuT4gssqzNDNUWHPJfiuYttp0lTMEpdyL3x5KSqtPLRjklCGRD7xSQZY2
         gjuh5q+hWQrJBIqT2GzQkVCYaNgg8Y7vlrV0zGEKXR519d+IiJUiLmp5nRLH/z4eG2aN
         jRQA==
X-Forwarded-Encrypted: i=1; AJvYcCXBkQRbz5IpY6D09P/DmLzg6VRFL7dlJgUK6adeIA5UaGYDVIbXxmlPkWION0T3BFlGELrdZCGKPrrAxd9TmjloYCIjRwZGmZuJzYojb1kk
X-Gm-Message-State: AOJu0YwDenTLaKGI8XyPvqK3D3vmK1CH2A5Wjdco2QRI+R88lydkWukL
	564Kb4VFemkUqL/aBnWX+DE06x3upYOLtLNHj4cAgGxr5HsI2aSvk0GzO+rTmQ==
X-Google-Smtp-Source: AGHT+IGs8pUXb5mDGS8kHPviqknzo+hzJ7Te+hq+G7yo5xcEkhGPpfVIqG3exWqTnYNB4l5GZuju7w==
X-Received: by 2002:a05:6a20:72a6:b0:1a3:11b7:a0de with SMTP id o38-20020a056a2072a600b001a311b7a0demr317316pzk.15.1710016434950;
        Sat, 09 Mar 2024 12:33:54 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a18-20020a637f12000000b005e49bf50ff9sm1644000pgd.0.2024.03.09.12.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 12:33:54 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Kees Cook <keescook@chromium.org>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] pstore/zone: Don't clear memory twice
Date: Sat,  9 Mar 2024 12:33:51 -0800
Message-Id: <171001642971.4101342.15404186717889149238.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <fa2597400051c18c6ca11187b0e4b906729991b2.1709972649.git.christophe.jaillet@wanadoo.fr>
References: <fa2597400051c18c6ca11187b0e4b906729991b2.1709972649.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 09 Mar 2024 09:24:27 +0100, Christophe JAILLET wrote:
> There is no need to call memset(..., 0, ...) on memory allocated by
> kcalloc(). It is already zeroed.
> 
> Remove the redundant call.
> 
> 

Applied to for-next/pstore, thanks!

[1/1] pstore/zone: Don't clear memory twice
      https://git.kernel.org/kees/c/c8d25d696f52

Take care,

-- 
Kees Cook

