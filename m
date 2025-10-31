Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FA142050
	for <kernel-janitors@vger.kernel.org>; Fri, 31 Oct 2025 11:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761910040; cv=none; b=TCtG/NSfx1euO/SAsBYpqp4p2/hwbqggJFSPgybepYht5cxjZybDU7XStu8SA5eiLklwICEqs7+qkscNi3xIdI7q/uH4omQpiPZ9I+O+ET/5k8bnHJCVXprbah8/5kSydEquJNPMDWITzead/nCaSU+M5LPOXCuNkURApFNA/Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761910040; c=relaxed/simple;
	bh=plC+/6CrEBYyMLwLcmmekRAtRmr4crxYvfBWrqa4EsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/Lg1rLpGX1/ZMNNbK5pjSJgORADiThNOl0krg05rp7QGAR8A9y8qxslpX8sSw0VYudRtkeE1oqS7iKRUd+TjXhjMb4b5zuG1JZpzwVpxcZzqw9P74HHlu79f8pbeSXDRYnASwA/UneNoi5j8aknGMCbWJ50q7yZCdg8UU7IdKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mVx0TeTu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mVx0TeTu"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4710022571cso22769735e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 31 Oct 2025 04:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761910037; x=1762514837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gwf871RDbtgle/X+gHRRa1kmehrfWm8Nitz2OZjIhxk=;
        b=mVx0TeTuTskgFvVTRNFRNe6XPJ94tkP1BMM3Y+K2B68F7NwdV8zrYxQtzarW4GnYHN
         2akQ1i0UOJPhSqXG78UBb3x/gjoD+M1vtBRBMoRzCz+nr5/hoE1RUzwdR6sK30PiSC0N
         UKgyltXMeNnjYB8zeitgS/3/LFrhIXkoDINbmEfZtBL4SvulrJ4jZmymUYq0y+khpK5q
         H0Xqr0TMWLZ/853vx/Z2BIy84xuxgKHy+s+RKgYKNiQnj1Yk8XOnpcZUREm2FZev0Vns
         Ex34fuxZ7RZBIM/sWha4ANvIYjrhV9aubPIfpZQQeEu1rcWjUVVCaY8Scvt9JYx6O+1p
         Ltyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761910037; x=1762514837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwf871RDbtgle/X+gHRRa1kmehrfWm8Nitz2OZjIhxk=;
        b=sbs0EgAGK8GdeP3G4j0Q+dfCyQWcb7HbdPa4kCKEvZGFv9s7rrVDyZ+IinA3xH9Fwq
         wWmcjDcSCU19AXqu+n4HYybM2pkxCYiCxtQFRhi5hMc97z52VyddD/yVPKqXrE7iUvOQ
         Jn2J433HQtKszXUjAW/8dpyNmR0GzyNsPdeeQQN0IzuPSRytk7GOstxyXsiBnGTFL9HV
         OM1z6tHc6ykOCbCAckg+MrtaDphpp0QoAufQdK2u1/2ioTNn+dLQGsNQBVUPgCRFIVac
         5W0SSM9kmJBf6fMLE+fdcJRyPAstBGY3DjYPwFM/qVKPMiEoYKLgK7oxnKTJRglPpKKG
         9W8g==
X-Forwarded-Encrypted: i=1; AJvYcCV7ipnwrR2qb8cXFHJHOUCO3LnXNasEkt62IuS7iiMrU8jahvHetNPnn8Y1C1I1ME510tNRb3msq8pcFfzRZLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YypA+K/Hx8bl0OwdtP1sHVpseLTcRjelqPY+4HmXk5znk+3gIHt
	CzuBxNgrFCSLWxqqDxGady/zogJyYYLrLauqKmk4yblkAHtItpfwGlacDT/qXcYuuOs=
X-Gm-Gg: ASbGncvmGRDyuwsrPIf9dED7CfZz02QArc0/r/G+LbmQKV3q9wiqSY3JcuWCgJBOdGD
	/0bHUGNlxz+UoXaHwV67EBZA4QJVefKqm2nO9DGnT8BROU4CgikVuMYLfh4Tou+otO2ZVZIhoHI
	XmxvDTanAFvhm0kl1TSuKRUztgSAliGpjS6mreEzUjJqpTugkG2Izx/t750sXEYjUxb2c4QDkwR
	VRn1kUZy4RkGUMj45eG5cLOYc1/Jm7eaScOrnVAeNRIJo2nln2T5eBXpk7am2jtha2IZitwMQjB
	ZOdRHSpE0S5dQUmcxZsWqbGS2+DLobXmXCUoGbkEs4Uo2oFUJls4/8Xtc14r7ga83t1jv6GuXcM
	HAKWE7JQwrKFSore27NHwURhnHmMVxhJbGeDNvYuBLSWXY/PyfPr7ErwYkn7JrzI4XGPd1kxr8Y
	fEYyxZTw==
X-Google-Smtp-Source: AGHT+IHOCxnrV9vNtIsoHM6missOnF5vwOTnrAGX8+16mZQ7e1sifCeCAgu5UUuGQnX7eDw9qPPn1A==
X-Received: by 2002:a05:600c:5387:b0:46e:1b89:77f1 with SMTP id 5b1f17b1804b1-477307c23d9mr27753125e9.9.1761910035750;
        Fri, 31 Oct 2025 04:27:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47728a96897sm90006865e9.11.2025.10.31.04.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:27:15 -0700 (PDT)
Date: Fri, 31 Oct 2025 14:27:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, sparclinux@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Christoph Lameter <cl@linux.com>,
	"David S. Miller" <davem@davemloft.net>,
	Finn Thain <fthain@linux-m68k.org>, Tejun Heo <tj@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH] sparc: time: Use pointer from memcpy() call for
 assignment in setup_sparc64_timer()
Message-ID: <aQSdD5RFHvzJOlak@stanley.mountain>
References: <2fa899eb-60b6-4637-9035-aeff78e261fa@web.de>
 <CAMuHMdX-uKt3-Lb2NaxmONEqWdtFgTOqXEo1nOfGq-R8ysHfcQ@mail.gmail.com>
 <33199802-d83d-48e8-9032-f1c4c61cfee7@web.de>
 <CAMuHMdXL+YXxwAM+HkawzTMxL2ez5O4bQ-j-LCCXTjz=NoLOKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXL+YXxwAM+HkawzTMxL2ez5O4bQ-j-LCCXTjz=NoLOKQ@mail.gmail.com>

On Fri, Oct 31, 2025 at 11:08:39AM +0100, Geert Uytterhoeven wrote:
> 
> The above function could be shortened by writing
> 
>     (sevt = memcpy(this_cpu_ptr(&sparc64_events), &sparc64_clockevent,
> sizeof(*sevt)))->cpumask = cpumask_of(smp_processor_id());

Heh.

regards,
dan carpenter

