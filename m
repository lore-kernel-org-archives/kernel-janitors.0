Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E176214F89
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Jan 2024 16:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="OjvbQM1D"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so7486840a12.1
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Jan 2024 08:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1704213056; x=1704817856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KkUQDV4v54E95UdJBzXyZy84b0c1XJbZTZp7leh2wE=;
        b=OjvbQM1D0wXRHBQzv6zp6qECA29sLpOKGnJ/+ZnyoMaqvVzPL1hvi3LMUdADKR0lhz
         DNwbkqDSR9dxRvxC/uLFKkUdJlew223ANNBB2mKyJJwFNHhkkUQJ9nvZ+tggZGsYwjry
         JiBComD0iLvk/IghZUZ/QcRL6s62rDSeZu83vec7SS23699CKJWcx9+61xts+/zB+u1p
         gjkkgxNmj7j0WA1JAfP5tJ+SwvxP1h9FXenHcDWDOG7NGVUNzyklti+WMRS6KJ/5mt77
         K+qh572pSwmYh3yCbpIJfD1imAVCC+Nt9WEqs32kavcUqd8aVnaypI1dbBGQ1N/illZu
         4Qjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704213056; x=1704817856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KkUQDV4v54E95UdJBzXyZy84b0c1XJbZTZp7leh2wE=;
        b=Yerz0Em9O0aqkvxAcWxo/bcHi4GjrzpfysO4V6twgvbTa7d35FJJDreIe4sLNjIzDm
         v/Oz2TmOJdoBQQGlBOmC0GxSqTysbwuuMW/8rj+0eREqz/BpfaRvGaUA+MpWxI2JC/uG
         Y6R6cZy0q6Nho6Y+oM2EiAeBYL6lJJ0R20X2K9e+TexmcLAv9KLYTWJKKcpQACHMDVNa
         r8kKr3EQNO4RObcb11lBqW/syYyXcf5h+e80fszHCX26r1IVUSFpTF8LrMqKuQroLNwu
         86zESWyxUhToBqIAcQHDbEt7CPDVB2A/yeZ7gnVq8yzag6z+fstWyNabJeeE5SlHi6Nm
         fvnw==
X-Gm-Message-State: AOJu0Yz54lCnC5jU1Tod684RX6PSK/EeufyvaY+qU6Uv1KDzsp+7NbMJ
	Mnx85eH0pekyKg1m8ks2ukktXCiGwB+N6A==
X-Google-Smtp-Source: AGHT+IF3r26omkcxVtQHwd2LEZ1N2oumCWEltJUNfhV1+PjxwJfGcY3aGiQQqi4c9WHNalHUZ3ehZA==
X-Received: by 2002:a17:90a:d3d0:b0:28b:12f5:eb59 with SMTP id d16-20020a17090ad3d000b0028b12f5eb59mr8626353pjw.44.1704213056012;
        Tue, 02 Jan 2024 08:30:56 -0800 (PST)
Received: from hermes.local (204-195-123-141.wavecable.com. [204.195.123.141])
        by smtp.gmail.com with ESMTPSA id nc13-20020a17090b37cd00b0028098225450sm27288207pjb.1.2024.01.02.08.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 08:30:55 -0800 (PST)
Date: Tue, 2 Jan 2024 08:30:51 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Willem de
 Bruijn <willemdebruijn.kernel@gmail.com>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] packet: Improve exception handling in fanout_add()
Message-ID: <20240102083051.26f3aa80@hermes.local>
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
> ---

Since you are seem to not listen to feedback from others,
I hope this patch is just ignored.
