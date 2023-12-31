Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BEDC127
	for <kernel-janitors@vger.kernel.org>; Sun, 31 Dec 2023 22:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="sW0MsEYO"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-28c93513462so1634211a91.2
        for <kernel-janitors@vger.kernel.org>; Sun, 31 Dec 2023 14:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1704062664; x=1704667464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGJrf2qGjaqs2Gg0g2FguVq8u9ZcCJz+T1LvcJxj27A=;
        b=sW0MsEYOZ1iWtS9nk6L7vDOflUK+a0mm4mvPEmAO/Yr/ZipkIh99jfiwUWNZOZDjCs
         bxYdcuijlTQRFjn+AP9zTGs0ypsaonJR2mOW0fiMZEWLp8g6SW6FaxJqaZlCW6v8bK0o
         TDQ1eXSltNexPM5wMLnyiTxmRHgO4UlLHdVi3Po9B9DlB5ntCA7nwUunbukafHPzLwGt
         nZ0n/eY35uMxyv768ninBtzgooBDz5HRo1zWw87GeYK6577d9JnbPD1ni6s2st+HyTF8
         HV+p/pwvh86SdNm/EzuoRCyfzQZwrALyVjbelbESgKfIebC+BV3t0v4ifb82Wisobsto
         Ox8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704062664; x=1704667464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGJrf2qGjaqs2Gg0g2FguVq8u9ZcCJz+T1LvcJxj27A=;
        b=stBOA4mFI7bTP5mOZ0d6eXV/mbiE07LMjloAjjvIgoZticJxXTOwzEYotXRmseCLfE
         6Vyya7SlRY2Y4KZAxu2ZSLBv7biHk7p411ry5p2yfR5XQ0d7j+Am9neGWHjzh6qekj9M
         rom3sAhhuIJPC2Tn1trT434Qep1D6I3JtAAZcA378I/ihnpfGzyFppykwpO1dmtt7qDD
         nXUoTVkQ/7IiEejs3Drmwh0+afPoKGxGj/MHCKjWnYUW53kdQE9Cl/du67U6rThVH6XJ
         r99CFqF5Hj69Qmkxs8LKKFP0AQYs7Ii59zNExWuY20v0zjHKudU9SWTkMBf0JxDQcL8b
         edkg==
X-Gm-Message-State: AOJu0Yz6SGQatjZ5jIVRNv0uGIm6c3UM/G/+KUsa04Xari1soHYSzPRe
	z1TLECRxvQjleeN0RptY6sF1iDs9o0yOAw==
X-Google-Smtp-Source: AGHT+IHdx4qvzHy5wMxlbXk9zPFgwgAUCdUHgHgI3QLmX7llXrLOX8UAZbmD65BD02FlwA1TmYLrpA==
X-Received: by 2002:aa7:920d:0:b0:6d9:e2ce:2e1f with SMTP id 13-20020aa7920d000000b006d9e2ce2e1fmr4456031pfo.31.1704062664418;
        Sun, 31 Dec 2023 14:44:24 -0800 (PST)
Received: from hermes.local (204-195-123-141.wavecable.com. [204.195.123.141])
        by smtp.gmail.com with ESMTPSA id t22-20020aa79396000000b006d9b95034d9sm12293986pfe.211.2023.12.31.14.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 14:44:22 -0800 (PST)
Date: Sun, 31 Dec 2023 14:44:21 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Willem de
 Bruijn <willemdebruijn.kernel@gmail.com>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] packet: Improve exception handling in fanout_add()
Message-ID: <20231231144421.13ba1d04@hermes.local>
In-Reply-To: <828bb442-29d0-4bb8-b90d-f200bdd4faf6@web.de>
References: <828bb442-29d0-4bb8-b90d-f200bdd4faf6@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 31 Dec 2023 16:39:02 +0100
Markus Elfring <Markus.Elfring@web.de> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 31 Dec 2023 16:30:51 +0100
> 
> The kfree() function was called in some cases by the fanout_add() function
> even if the passed variable contained a null pointer.
> This issue was detected by using the Coccinelle software.
> 
> Thus use another label.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

NAK
kfree of null is perfectly fine. 
There is no need for this patch.
