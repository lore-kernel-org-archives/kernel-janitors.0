Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B696B4F5FB
	for <kernel-janitors@vger.kernel.org>; Fri,  9 Aug 2024 17:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723224453; cv=none; b=AzeG1NPS3kumRhh4yL0K3nnClPC6opk9Q8N3VxpJGqvGXJDOM0ossC+SSxQDbdBlNx27DlEdj4Ey1Qg9lBizdip4oZTRIkUAyoIvcI+YQB3fdJbtihRKY06SVAXlKPw8HPi8YTFvch/fHfLAI+g8N3F83k49jitozR0HhV8lEc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723224453; c=relaxed/simple;
	bh=E8vvekebT+o9aZPEr0peeFB1FrcFbUQ0v706isrJR/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucCL+373/12ChyQWt+nsnwn5kSTAwWPVDitwgp1WTEproGieLMbVBuK9tRXCB6/YHCNZWfLDzGb78h8iEPPvD6KnHTLkFojBkRPPV0ijr93OSbI1FjkQ1r4sz4C4l9biLeS6mwytFC7C3XwXjxIqP/cz9Eir9vYRRnUfwlKLrQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OdlI+B+3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OdlI+B+3"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7abe5aa9d5so297101366b.1
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Aug 2024 10:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723224450; x=1723829250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mUUC2zt5X7wGSPTIR8Ixuv2LhaewZy5GwmEU0+51Nm0=;
        b=OdlI+B+3mGuQZ9OJ6Tc47WIiyaBF7VK8KBNkgywuhY7mjTBc5esNYz4pM5nS+Z78b0
         LEJQ5abPWA9GWsTwA0ycNMeMj7yJ1NPWyx7cuiQC13XSPySQ3KL16IrGlEyj1vSriFjU
         HWOkB6ZlUd+XRukmDw9mW6VaMxq6iRQBxl0ioArHioU0lb4WeHvpftLEeUB0RavCwkfE
         H3zDoV48LTU98ho8j7DwcH3nAUTHwtaKrpKRCxWstiIzyCRKCriA5dMo/jDlcTSrtIoV
         Ltmw8ifCYKDyepm2d9RuGkAD548VQpl9f1Q/2JrREPyai+T8pp4zrgCW9Itv37u5bsBe
         soaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723224450; x=1723829250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUUC2zt5X7wGSPTIR8Ixuv2LhaewZy5GwmEU0+51Nm0=;
        b=VulTqhA8G/vf1AZ38K8w9QJe0NecG/sobxoDYabqcsQ3YCF8dTvxZyZyctq+ax68mU
         9qr9nckoZ61fb8tlomHuDeyx1zPMgMkWgzRa+OSTtCvWFovd7Led6v+aE0w7YsM4KTfk
         OIRN3OePVRx6PCBk/iKyPJarlFAEEDyDapP0Ij1cnmSxK1hltetkZdOTUgtgM1tq0cHX
         pf8H6+94OEpXIQIHbynQFkNVV6J4zw0aAvpQnCoJ2iGOMaYx2LMSEuVdZyXom0/2F2I/
         yXwf8/QVc9ZeGsZweAKabJNKPon2VxME0UpQZaNwP4w1InjpxO5B5RhfzQgy5xutkJgy
         1tFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpAF+FiW/H9ijmAZN4YtP0hcekz1lXVPxSoYiUU0qcqbZtnj8eK9qvgO/iW/XSBTiAunGft+XAaOiinajQQwlukfyPUzeO0uHHDrk4XePt
X-Gm-Message-State: AOJu0Yw7EWzjqUJPtL9RQ1Din1dRfYHvg+62X6F+QYDRDgHVBV1WLOPn
	w/fDhigx2SqMhENeRLevSGgS8kFRsBAn4ha4w2W2puGj1ySYtc4h0125z2/YUcI=
X-Google-Smtp-Source: AGHT+IEt/sHmuz7dJKBZZUaDhX8rTZoWgVMRduT848TvSQgHICmUMTu+jIQDGGf6Tbh7WDA/00FZDw==
X-Received: by 2002:a17:907:94d6:b0:a77:dbe2:31ff with SMTP id a640c23a62f3a-a80aa67c935mr191733566b.66.1723224449833;
        Fri, 09 Aug 2024 10:27:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bcadbesm855994366b.21.2024.08.09.10.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 10:27:29 -0700 (PDT)
Date: Fri, 9 Aug 2024 20:27:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matteo Martelli <matteomartelli3@gmail.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, jic23@kernel.org,
	kernel-janitors@vger.kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: pac1921: add missing error return in probe()
Message-ID: <c70e6337-fd03-446d-b890-4c3df0ae87f3@stanley.mountain>
References: <1fa4ab12-0939-477d-bc92-306fd32e4fd9@stanley.mountain>
 <36b1a47a-7af2-4baf-8188-72f6eed78529@wanadoo.fr>
 <66b5c5df76766_133d37031@njaxe.notmuch>
 <93f18533-da95-4f29-b6d9-8b8337a4cc90@wanadoo.fr>
 <66b63af81a153_27fed37066@njaxe.notmuch>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66b63af81a153_27fed37066@njaxe.notmuch>

Just delete the -Wconversion?  I'm not really familiar that option but it sounds
an even worse version of -Wsign-compare.

https://staticthinking.wordpress.com/2023/07/25/wsign-compare-is-garbage/

regards,
dan carpenter

