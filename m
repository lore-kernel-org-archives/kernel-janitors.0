Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA4517BA5
	for <kernel-janitors@vger.kernel.org>; Tue, 12 Aug 2025 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990447; cv=none; b=SGg108T6ixP7FPgNfhJc5VARXRjtIz9U7vGeClkQWcpwiJis8UweuOJm200fG0cCkcmsVggCwC74heXZR/eBZ0a8Fu/JkYxuHhk6wDdFY4PO8hHFEIkupEYsgnkbXR/GKFVDLt5YysSI8JXvKLwwqqMUKxO5UsGz8MzK/lSD2Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990447; c=relaxed/simple;
	bh=VlyJRw6fjn+cGBFDjG2vyIh5vFz+jjEif6UAkbsfgRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KaW1KOrvPh4wWtWJqNIoQ4mhpkTdS6Lw0lqrYzjyzC0bGka5WQSOD9nDBNeedAskcxr5+mSJtdD5IUrOzWpnKyQFM4dEpnudt7QgxQTZCGCo0aJG16efQNyY6yv5sdg4OPcLzy6i+hnCbL3zCeTUEvGArj7AovqtTPHVE3aMAAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yY9BAJk5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yY9BAJk5"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-459e1338565so49043225e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Aug 2025 02:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754990444; x=1755595244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=flLwVRQBtS9lSLzZddc/x+DXeymZfEUE4F/7WVbfGqA=;
        b=yY9BAJk5S3cpuIAxclrrVj4pIGbXxhEc7EXc6eum6dRFeY7HGePyQQzY1P0KWYDAMl
         v/I3Va7L2TQEp5JX2q1otT7EF0xnW0jqU/Z3YgW6OWlNYTIo6lFnb23Z1kDqFFlkvBnE
         25Z79sHfkPjOKO9AnbgoyuuBbwbqr9yqt/eqpBddzkdY32HyAJPTcuf+m4rjZKahyTXQ
         WQK3Br11KxjCSivdjOTD3fX1FvDU5gIJGSU+jkDMF1jKz69uYLvxIQvTJzwfXlzXMdCy
         Mx3/hXpNpp7GNtefVBQSaVpT4kMjrNlE6KQGpV6b9CqSEiE6ssEPgSLcZTFd1Q0iIMJp
         /uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990444; x=1755595244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flLwVRQBtS9lSLzZddc/x+DXeymZfEUE4F/7WVbfGqA=;
        b=YphOXkOiZ1osusZMU7ksf20hTBsfez7hJP5pwmG+7AdMqx58wsXhrTVvSmFtvhNPkH
         lW+Wp5l7ODN9VCqofquNV4PSQpXX4pM3E92xB8F6t6txJFhguHDffKQFOg6QdgMfWobb
         QCriPR2UgEb+dxP+UPdwdFSAKLrrJT/soAb3t/U2gFWt4MGGbzIUnH3OnRwFeg2I47qz
         XivLoF1NUfi/FbRgL3utmVgqkhI9aNH1fwOLYgFK0/KJvcVkN3pAVioojcJK4H0wkz5j
         +FNMTjTk7R0jtSrSj35gIkeeqERAypYXjDZp6DW1Mph31TH2HTBfudPQX26Fasc0EJPw
         dw2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnPBfw42qL3Jh1KVb9UUG6cHUjIAiVOEJeVE0sfIrn64Buzi3QqTVJDcH40c03FMxnt/cAJMlER45XkGwLHRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJUzkyRfOZ3s7nf68cLQ2BEeImGwaRN4Ljd9bDs9DVnji+AYdc
	dSGnpjiH66nhSRChJzsbr6PWkKpi37n7Mqkxjk891EBu/mR6Ar5OdsXGoPFRFQhKXNo=
X-Gm-Gg: ASbGncsfYe3zVaTGE3BcBG+MMMJpPbp6SehOEyVkQfM4eRdFZM0k5dU+7eksmKqB8N4
	EkYNB5toFTSTAgYLygXmmTiiSX1KtU9Fa3hI+IRvJRpBU0NtOdRXLFFDcjWS+2kYPMQyAzNypaS
	4cqMi3JIo5iYK+t9J+veepPrDhj1trjwH4PIW5GXRv6k2Ct+sx85RA4hQoRYJHRD4sdIB37DfzB
	QX+H/pcBrfdOXFH8w0worxZNGfumc+pcNwcFCo8aUmwsP7A6zvQV+7OSShxPJx7vn7bROyiuXW0
	Yh8DXOQR3xYId54uN6B+mZXqHrTv0buG/zy3wSgP1bIBY3HWYWAEs+o3CZzmx0Uqx/OPS+h6tWu
	qLfJG5lWXa+PJikoTFkzNPG6ylfQ=
X-Google-Smtp-Source: AGHT+IFrIo9/UNEvyO7O0y53JZzndWiEpzx55oxCbBR3AWHX7mjJt83BXH44/bTtMAxbhFy/v2lNzg==
X-Received: by 2002:a05:6000:401e:b0:3b8:d138:41d3 with SMTP id ffacd0b85a97d-3b900b8101emr12499799f8f.56.1754990444236;
        Tue, 12 Aug 2025 02:20:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c453328sm45866511f8f.46.2025.08.12.02.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:20:43 -0700 (PDT)
Date: Tue, 12 Aug 2025 12:20:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Scott Guo <scott_gzh@163.com>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	Scott Guo <scottzhguo@tencent.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: squashfs: Avoid mem leak in squashfs_fill_super
Message-ID: <aJsHZmHN2I712xX3@stanley.mountain>
References: <20250811061921.3807353-1-scott_gzh@163.com>
 <24759bdb-b427-47a7-b9c3-724a11d0162e@web.de>
 <461ae944-5fb9-4860-81c1-1ac48c3d888f@163.com>
 <aJr43n1np2nB8bht@stanley.mountain>
 <dceb4471-82d9-48f0-94dc-e9277eadeada@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dceb4471-82d9-48f0-94dc-e9277eadeada@web.de>

On Tue, Aug 12, 2025 at 10:38:59AM +0200, Markus Elfring wrote:
> > Please, don't introduce more of those e_inval, e_nomem labels.
> 
> Would you find any other label identifiers more helpful for sharing
> error code assignments according to better exception handling?

Just assign "err = -EINVAL" before the goto everyone else does.

The common kernel error handling style is called an "unwind ladder".
Assigning the error code is not part of the unwind process and it
messes up the top rung of the unwind ladder.

//=================== Good =============================
	return 0;

err_free_thing:
	free(thing);
	return ret;

//=================== Bad ==============================
	return 0;

e_inval:
        ret = -EINVAL;
        free(something);
        return ret;

Now imagine you need to add a new free:

//=================== Good =============================
	return 0;

err_free_other_thing:
	free(other_thing);
err_free_thing:
	free(thing);
	return ret;

//=================== Bad ==============================
	return 0;

e_inval:
	ret = -EINVAL;
	goto fail;
free_other_thing:
	free(other_thing);
fail:
	free(something);
	return ret;

Also, in places which basically hardcode -EINVAL into of the unwind, then
it's pretty common for later updates to carry on returning -EINVAL even
when it's the wrong error code.

regards,
dan carpenter
