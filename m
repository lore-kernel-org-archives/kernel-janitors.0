Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC0221E0BE
	for <kernel-janitors@vger.kernel.org>; Sun, 31 Aug 2025 12:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756642489; cv=none; b=fm+lme4lTylEzstO2HRfLWtJVgSN95tqOWZ+CwfWvTv/XJUo5HC1E/Do5u8eOVXfp2KNROPCISPdtgLVtz2hPVpzJObNUSBzxb0esY87Hz/flGXS/qYGpdOCUGDm9EdcEFpCABQMt+jfthKmdYqNPbWbMvZEj5uHg52uUoJ1iEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756642489; c=relaxed/simple;
	bh=aPuXpq1/3jiBPymNfKQaTwEd8BMMEOqllpEtuaa6v0k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PjwscCqhjX/U6wf43yQ9JxNh1VXLbJPz+1jK3vNV/cd/GU6o2OCyeY4GFYruxJ8hXYxENAUJ7s0Dy/xI2RzzpysJbZSdWAmenK0q/87juWg9oc25A6cMe8DoSlnU7VWrNDYGPc5WI/y31v7XAUe6LkGsP0uN0+IoQJ5pqVlYFqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XOJd5viq; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XOJd5viq"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61cbf01e472so645487a12.2
        for <kernel-janitors@vger.kernel.org>; Sun, 31 Aug 2025 05:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756642486; x=1757247286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTxRKPjZEMrk5xpNJpoGqFecmAtlBpCsUg4LzjTof6w=;
        b=XOJd5viqS78uHuArUCiY6PYBH8RyLsbWPn6CpVaRJagKkHdwbxFTtguJPOUQefwIh3
         0Y17YX76aB0+jfqaUJhV9Wrp0BC/pvQAnqBiZslbrPmc8vuKSH8a3yX09idBY/znXL4q
         AfFzGaU9IgP9ndLhdhxEdRzpOnLOKISzXNkMcOc65IP4OVEg3yV/v41/WTfo0W7d+y65
         d4SPrgaqfsA/QhZle5YixkLeoucaGOjeOiH/HdIBq5KxUWXIc67TCyCiW7iRWMYsnRXi
         nQtA5ARxy6aPVPE2BRPriAuHGk/x/tUwG7WfFYOzpZWFsyD7ShDAxFBJymap/nohpsLo
         ZLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756642486; x=1757247286;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTxRKPjZEMrk5xpNJpoGqFecmAtlBpCsUg4LzjTof6w=;
        b=DAJcJ5bRt4mie3T89ih/jguc/IUA5eSRX23sRZeMTGY48f9s1/wApcsR6GSr9cHxGt
         C/99YSnMOfCmqE5vrcQ3L7h7M3gveSikyzcOhJacvrdcHy5aHZx0hUMJmbVKvSyTcQK5
         CPCNjpmlie8x71t+G6PPul6N9AnzcXLxQmp46oXZZrmo+RsWUdpz2UGC1qoHceitJPHh
         3cxXigWp4T0FjtRmCh9MJrK+a5Sg0wJzop//bCffhDKAjb4BvI95XNDw7LvtPw3AbXdr
         TtBeAzu++SnCw6x+0hY1q6InKPuaQDuvNqxFJrZNyNhBxyJ405z51dCZEUsXy+im8kLH
         a46w==
X-Forwarded-Encrypted: i=1; AJvYcCX9dki1IbAmE9gG3C3iOMkisqRJHZ0FfcNB6iuWKvcYGivJJbAbmJYwBzaVMUjn510HLn48tF4i4GPxH9niikc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Ga+C6b9A9I/Benf3hBskqGNv6nM8lxYCFfKxEYWm4rQlnVre
	oaxhY1Vu3cIDzfPHWZOiuS/Pby8aILAM/DeTktYm6J89RIu+UY1clFlTD2kFdxcGC0g=
X-Gm-Gg: ASbGncsiooaqb+PiYi5goLhKPOYHjOFjscx4c6Tq9V52+H7fwSxsJ6l69H6N0bKPpbG
	jpIiTQDhx1Q95DbJXo1sZgdVhSgkRcKZJyKfsO9l4DThsfUtvJvRloyGPGsPcGuT+f6PlnB/X+b
	ffwbGnBNjb0CV9hPjAOhBRXKxrviB8wozonjNjN/M99P8jG18RgcxYR9A3yF2xtAJ1BpJ0/mJev
	dLuhNFCY+biOdxTfv41rwxIMehE0ii2bayC/KeOLyimDfE9GdLWrCl6sj0BCgU1Uw89gewJzDqo
	obUi96KKsw3rp/LCfAEi3jMffFqs9f0r/bRnX7bU8BiuNkW+f2WADvtm94sl5xgAPAc4J8ulgDY
	jMvIWCcKoy80uB17MdcQkDq8Sz8HZAYKvNA+mvUIvOd8zjTjRnQ==
X-Google-Smtp-Source: AGHT+IFssW74tvTvjz+3fYjfCLUuZKth/+qKSpghRspCt2nEmIjSZt91Zx6O7q+4cCcgww1rczw3Lw==
X-Received: by 2002:a05:6402:524a:b0:61c:5275:11e0 with SMTP id 4fb4d7f45d1cf-61d0d38e666mr3494780a12.3.1756642486047;
        Sun, 31 Aug 2025 05:14:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc5319afsm5194361a12.48.2025.08.31.05.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 05:14:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <458641ad2d7a7adf30a03e70038304f0e6a81ff4.1755770484.git.christophe.jaillet@wanadoo.fr>
References: <458641ad2d7a7adf30a03e70038304f0e6a81ff4.1755770484.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] w1: matrox: Remove some deadcode in matrox_w1_remove()
Message-Id: <175664248386.48246.8354721667053625504.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 14:14:43 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 21 Aug 2025 12:02:21 +0200, Christophe JAILLET wrote:
> The .remove function can only be called if the .probe() succeeds. So there
> is no need to keep track of a successful probe in 'found'.
> 
> Simplify code accordingly.
> 
> 

Applied, thanks!

[1/1] w1: matrox: Remove some deadcode in matrox_w1_remove()
      https://git.kernel.org/krzk/linux-w1/c/25fb0ea986dc10e05f3f4b43cabde4d1853a1fd7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

