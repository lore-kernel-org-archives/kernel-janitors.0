Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2B22BEFE2
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 15:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867135; cv=none; b=Vjr/sRv2nc41Qxw4JNx1IqdCWTUD9kvZuW0tP9QlnyQB6dn3W3AhSypc5D9l8TEY5AcWBQFPBz/5fkK1J4gLYUz5C55q/xt5PCRHy95T0jU6VjSlvND+LqNESMV4Zgd1MHFJmkN8EaCmi0GCu3lliGGsF7ab3DUqSIxSQqqywx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867135; c=relaxed/simple;
	bh=5ivSU5P1ybOP4JXEyPg2b4KE7hth8e9XxndTgLMPwek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWgeAHBmS2d+FLsfk+h3aZpMZGgLL+7CbrzrC12rfYddAnB1KBXNocZTp0D5Mgtao4s0nlxS11BOu0MuQVm1uB301kjkH11XM1w9Fd3+/Pvnb7NJcVpntGnjI1M2e95x6zo0mDE8B8Dlzn74+mR/IBV6YLHg88dv+vkBpQYl2bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h4easKFl; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h4easKFl"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2ef493de975so40728fac.1
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 08:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750867133; x=1751471933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S50u2pGmO0FJNNUATSBkFdTyq4cP6tNm57kv4SYiUhA=;
        b=h4easKFl3gNSZbbw3TX8q89MHFIeYi+sajm30MVRaNq97IZnerBVflGYVim3nf7WwJ
         cf1tLbBxnM2mLfr1+EIybCkcwnGnP+ulxM347jWEBm0fOvBRkp+b8KDbulOMAqpG5oD0
         dQjvOSmf6UBugRsp44Yp1Q6F5/Kl+A6e1P0Il+MCO2ejYdHIACS8PA0/rN9N86pVfQk8
         R8BKM2D0Xt6oM03CRkWdE0n7BAZd8hFUpV37LPyqaB0MB2rHH1nairxKN5xPq3LZT2F8
         bn6KO2pOyfBsSreyKWcbLFpId65ebd1ZizyvAtoyrL7id9YKrqfngvjgIsBeKGhjzLFm
         yoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867133; x=1751471933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S50u2pGmO0FJNNUATSBkFdTyq4cP6tNm57kv4SYiUhA=;
        b=NVFsbLxj+xWCs3ONFS/NZ92KJy/IDzDSLWoyI5CgTNrCUj/U9utVksT6dR/isb/o9R
         2eFb2jtmo8IAv6gJK9sBOqQZyqmf36ZCTdFDKNjpYzrzcsXHSajxqFqMy17B02f1U0fq
         +4LNC3iNepfHkiUHTO6FFYOXPquKTZxoNenRkuyfKULxGfQfDM878/UN/4FIZWZsw+BE
         jbTDwDyJaWzwB2VC4agk0DrS+L/sCXv3uCAuEtJjNC60xnBct60ZV6zDzF1pv8qg7h+J
         fCNKodfvAsbjWoQSUpGOb4fe8Ub85XeigL6UK0EHW3coG+1pMJLBBceGjujg+l576nRx
         vuVw==
X-Forwarded-Encrypted: i=1; AJvYcCUTAAn+4U3Z3o4eTZpMWi0Q3+i0zUqATLrHzUGqn8Zfxh78m/t8z9QvgVw6RmGKuwU9r2iaPMxiXunADHHedJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZyplHsItVQ+uxBnGTP9KvItoEgobhz8OsgumOojE6oPX18Bh3
	4mUan+RvwLdJ5y4dZYLNcv58FAvK0BKBQqA3kl4bkEaSPfyyPs6Ip3i+VKZjcKNKG4U=
X-Gm-Gg: ASbGncssH99qpwq926aPv6Xzqvf3jndGDt1DAPI+iqbRdq2q5Muha9dHWeRS9DRLOQG
	9t+4F8UqrI2OaaLytPDqWdIPKicb6aHsVlf7Zv/2/hFPcCW9qhNP20JjkP+bxgDMsabWZZCMyPS
	AmA43LE2l0J+DXvZKnBschW4ekhq9egUIDdCpVuntPWJrYVmAf/c21LzubIHwjkdlB+SGF7oNqC
	+YY51zGX1H6N6qGildSUPEQImXwIATicpSdL4eQXU1uyGGQO9Q7kTtSr9tosdeLQ666NUliGtha
	1LBbfVnJs97brzgyUJWANXGJ7Gtq9k56NTpnbmfnIfSqy3QP8ba30+QlS5E1OS4WrTU=
X-Google-Smtp-Source: AGHT+IFJT824h/fVUdrtP8VolwifhwFVWo0IkVtlZ5cdp9VZgCFy3WBGpkfdsvju1vACYv0c0xsXRg==
X-Received: by 2002:a05:6870:8a0c:b0:2cc:3523:9cd5 with SMTP id 586e51a60fabf-2efb22133d1mr2422068fac.17.1750867133090;
        Wed, 25 Jun 2025 08:58:53 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ee8a8ea97dsm2626851fac.29.2025.06.25.08.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:58:51 -0700 (PDT)
Date: Wed, 25 Jun 2025 18:58:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zaid Alali <zaidal@os.amperecomputing.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, Ira Weiny <ira.weiny@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] ACPI: APEI: EINJ: prevent memory corruption in
 error_type_set()
Message-ID: <738b8abd-5825-48cf-9c5c-697ae057ab79@suswa.mountain>
References: <4d800ffb-fb1a-464d-adcc-2802187cfa9a@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d800ffb-fb1a-464d-adcc-2802187cfa9a@sabinyo.mountain>

On Wed, Jun 25, 2025 at 10:23:26AM -0500, Dan Carpenter wrote:
> The "einj_buf" buffer is 32 chars.  Verify that "count" is not too large
> for that.  Also leave the last character as a NUL terminator to ensure
> the string is properly terminated.
> 
> Fixes: 0c6176e1e186 ("ACPI: APEI: EINJ: Enable the discovery of EINJv2 capabilities")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/acpi/apei/einj-core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/apei/einj-core.c b/drivers/acpi/apei/einj-core.c
> index d6d7e36e3647..e77c0d4b4ee5 100644
> --- a/drivers/acpi/apei/einj-core.c
> +++ b/drivers/acpi/apei/einj-core.c
> @@ -826,8 +826,11 @@ static ssize_t error_type_set(struct file *file, const char __user *buf,
>  	int rc;
>  	u64 val;
>  
> +	if (count > sizeof(einj_buf))
> +		return -EINVAL;
> +
>  	memset(einj_buf, 0, sizeof(einj_buf));
> -	if (copy_from_user(einj_buf, buf, count))
> +	if (copy_from_user(einj_buf, buf, min(count, sizeof((einj_buf) - 1))))

Nope.  I put the parentheses in the wrong place...  Let me resend.

regards,
dan carpenter
