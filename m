Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CBF345CDF
	for <kernel-janitors@vger.kernel.org>; Mon, 12 Jan 2026 08:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768207771; cv=none; b=t6rO/ElLDk/lkJYQZIMrDiQ+ilxmQkCvNEtO1itf+4dZuttS8HI9JUx0YmPq6Pa4fPMgBoVwuMmgyqGJkV4DHElR+W2JiwzeRZ/mqIB4qbXnMcbBpHpQYpWK9RTvG4LhbHovQuwlccrDekqJwlrX1dExvPird8H8GCLCAkAsRrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768207771; c=relaxed/simple;
	bh=h10s5/HW7aqFZlO2ki21yW9EFRy51rqvbeI2/xs+6Lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KmtisBxs4/0wXfxQjVqeEgKe/dJEqlqkFvJJSlsrTGhvobPp64o+PKpN8aB7DxDXolDcYwd0ZgZiPVJ1MqaM0EizLFd1zxGyyiQZk1VOB7gu6KOACp93ZIdLlxFJVC4k0kihMJI9IsGshmoaS1ns+9cjTpwhjJrVSozTZ4vWbjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fS6RO1JB; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fS6RO1JB"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so56645375e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jan 2026 00:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768207763; x=1768812563; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XOMrE+myOP0LrQl1OVUBU894BVCq+VRbLawR48Sw+9o=;
        b=fS6RO1JBpa/qoOaKtNnPwB0gBNA7CEcBnAMHh6GMRYRdMNlKxCZT9XHwHG9H/+fSyo
         888cDtQnfRVffSA8V7JzBkpZHBjibJrcgfhGSGBCh0m7acx46xflHH7PEIt8fTEcrvQN
         Wfqr44Qt8YnoKwXqkCkiTSHvYt6w2D94InevtWEuE8FWrehfBjhDPifOehXaPwigqtrH
         y97BGalS8q4+KDTI+6FhzWCzijRM76Qe3wPojDFMjhiR/JEv5HEyqFF72WG2vDNgT4Rm
         5XThpMRYg2Ack2ogJjuKxqQj8KA257OYLDv8JzToXyuHnSdotrZl/4F1RYD4t+IiwR/K
         U+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768207763; x=1768812563;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XOMrE+myOP0LrQl1OVUBU894BVCq+VRbLawR48Sw+9o=;
        b=UxQVoUuGggILUm4lCvY2z30ToARWogJPq4OKjhLPE3OCLz/0QBn22SnURgorxj2nN3
         vOerUNe2i++LVBYQZEK7gvU0L6QSSG8+z4EdWoB2BQZUA8VCmhRi0Wv8leYc3z/6QrcM
         5p0UfYI3pJIwwRRQTM1C+JAUeZ2EuWe7eDauvXSf5WXIiIXA5h9EiU+zMTeLD+bCKNtr
         jCSNFb0pjVA1YRq8FekG6SRQtNvn0ml9mmg+gvfaVLv0NoYfo5VjXm1BequfTq7Au+0W
         +cg1PcAT0MOat1nuClBnQTMq5ASp8kwQSAw63BIVCoBRrVjeRbblde/wVANGoL4f1ref
         g9tg==
X-Forwarded-Encrypted: i=1; AJvYcCXdTTaJlHmc2se5JXqC6rnHY2YZokSSSLQMw5/BY8s1kBUZkXgdEZWluz1dfksY1+UW8sT/iWBNOAr0S7tA4Vk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUBfWLSeqNyL0jtmX9EzDBp+UAxqvGbGYrUu8yItF4hCWLBW0V
	/EtVkKi1YVRou3hXYczjebhIx1MGC1eGYG2YeYBVH75K3reAcy9nD0UtvgQ1j2pNS60=
X-Gm-Gg: AY/fxX6/5ktNOKtMeIyTOPcUG6QObB7gJMcLbd41Gk4joLu8cF0xk6c1vpIFy4CJfKJ
	+PbOWpPGwZdMOSNKgsUa4PS/51YYSTxMx94vGz0R/1gT3dE/maYjxOrwPikflPmNo2FqDg3QUsT
	wR8rrUO+7Tu6kcCcgNhHzviW3xX91llblgIohpYpZN4qlLUWYLtXgIiNLuyeWld81ziWA7cLa7m
	1uxMTo/kwdkDogIQmOJjUg+J4ojOgKGsNBD4ba6XpvPsezlYGv7qiIW9KPPEm9IEGC9N8yqPM51
	6iyOdiQyH/D1RYSJpVVyBDscS9MVheZvyCQh7RYso35MaUD9e4PLFDZk2UMcpQpK/6Wff831x3j
	6rQwW21HwMmdN1SpY2y9363b2k43DfvX+QsvHpQnJ2t5MAkFSxCjSj5zEn1Dv2khldPWzh7HbN3
	TfI31QLbRXCNyQNpoC
X-Google-Smtp-Source: AGHT+IFSkZ9Bt+jF8EteEZVt3riac8CY7G/+vj9cJ7tYZqvtQj002QQ39KN6Q+Ht/zbeRDd9tCK5Kg==
X-Received: by 2002:a05:600c:1e1c:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-47d84b0a211mr166896665e9.5.1768207763187;
        Mon, 12 Jan 2026 00:49:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16ffsm38391032f8f.12.2026.01.12.00.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:49:22 -0800 (PST)
Date: Mon, 12 Jan 2026 11:49:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	linux-sound@vger.kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vinod Koul <vkoul@kernel.org>, kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, lkp@intel.com,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] soundwire: bus: fix off-by-one when allocating slave IDs
Message-ID: <aWS1j7IdRLCJTj1h@stanley.mountain>
References: <20260110201959.2523024-1-harshit.m.mogalapalli@oracle.com>
 <732ad24d-d88f-47dc-bb6f-bd1b64ad354e@web.de>
 <aWSwS0PQHumb2TJG@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWSwS0PQHumb2TJG@stanley.mountain>

On Mon, Jan 12, 2026 at 11:26:51AM +0300, Dan Carpenter wrote:
> On Sun, Jan 11, 2026 at 10:27:08AM +0100, Markus Elfring wrote:
> > …
> > > Using SDW_FW_MAX_DEVICES(16) therefore allows an ID of 16 to be
> > > allocated, but the IRQ domain created for the bus is sized for IDs
> > > 0-15.  If 16 is returned, irq_create_mapping() fails and the driver
> > > ends up with an invalid IRQ mapping.
> > …
> > 
> > See also once more:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.19-rc4#n659
> > 
> 
> Markus, please only comment when it's a bug in the patch instead of
> wrong advice about commit messages.

Sorry, if that was unclear.  The link is a real link to the documentation
which says:

  - The body of the explanation, line wrapped at 75 columns, which will
    be copied to the permanent changelog to describe this patch.

The rules that we write down are simplified guidelines which are designed
to be easy explain.  75 is the upper bound where checkpatch will complain.
But I think line wrapping at 72 or 74 characters is more common.  Either
way it's fine.

regards,
dan carpenter

