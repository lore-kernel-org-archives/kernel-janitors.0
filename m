Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105681DFE8
	for <kernel-janitors@vger.kernel.org>; Wed, 19 Mar 2025 12:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742387469; cv=none; b=rDyMTTdPycHAjCc6uz6tu/YylfnGd+HUtz569uf9/9K1hOCDjDO2Wj+GF3wdnTJeCPwhT9x67ziRaTySzifQxgJFwvt85GL0hilAG4R3/5WpfsowQeO2S4LsfvfaN6SQ6veaQxeYsDV/L7vKkkW7An/lFFaKn7Efp1EOQKvGjs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742387469; c=relaxed/simple;
	bh=8Zl6EbMiBAInVqz4phQnB5mGB+cjBHeRcD82DosQexw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCiH14oJRT0LcpPk0qvWo0nHwAhVpFi5bcZDjukGPb6PQPT4S5eWPOxFLRJSMElYb4N/ZrbNkwU0XKy9hv0Ie87s8IPo9JraKG5TMkIcTlcORD57rAn47D3jhkVA9jSiLB84Ye3dIqOkDk4EyJ5IzkzCQ2I8KNWhUhFuXqrBQrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W/pYHM4+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W/pYHM4+"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso31920755e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Mar 2025 05:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742387466; x=1742992266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=APw5roZ0SwNdDnAV7zjswJlLE3ojquwnF9XsXaCcy8U=;
        b=W/pYHM4+wpNm2aLeQsDJ+9dDyht9BloZjtFQUC6pVPVEjp+5Pe9fAMWkL3xnx9OtZs
         uR8pvnFGU6xvFre4qhOxhvoyMmufAmw3l/H2bkZfAaOvWqqKZua2mODoSxEz4wLPBNvq
         A+uCogZ4/uyKWyt6Fd2ibI3NcqHq8d1JjP7sQkhlgLlPiTRvpjnobAn8m7iONVADy2lx
         SoCIx7d15Z72AZlbxNqd8GtbuYWtIanyTSGhn8JuI+Kc2esMvaDDVeHMR+8iyYSiQm5w
         dghvDBiTCihe8Chp+h6WDFflCanR636EcvLXoJ03rWTBkwnrt54ycvuoG6qHD1XXKthW
         m1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742387466; x=1742992266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APw5roZ0SwNdDnAV7zjswJlLE3ojquwnF9XsXaCcy8U=;
        b=VN6oN79U7NY7FXOc0OxrIcaXOJC5dd/HZVYs9Y4O9CMnLThPzlJis+GVzp58f/ByOT
         XYTwJpxMIa4lzI5dmBE5hHRhwIfvbG0XNdgrodKKqF7Xb8ikzrdJwOKl5Y8h4C5F4jU0
         udybcSVTn9IZLKr0Q4+Pya2QbY/bqs/atkGOf2iDKaIO0+9OQiuO+7iFv4l1x0zXUuop
         hmuv2JS8jAS1NmOgW4N8M3v4E3V0j+UTpv9lF64kwycHsIVoRmfUNO0yVVPyQkQ80YIp
         waU3Qi7MR+pp8+FY9xPyCibt5lW/m5lRyzQXgLA0vVnnQmZBLsD62vNfDUQQMrNyp3Z/
         YJRg==
X-Forwarded-Encrypted: i=1; AJvYcCVc7wxOZvVGJcLYJ+a9U0r5BPignE/52pJbC2LJ3xDN/51rP23cyyYBCd18es7+1kqSi2WeJ5l3SU1ojDGcye4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVRd+/TQz2j4GDXzYE/TlwM34kU/bo10D6787jpLMR5IUnrORT
	HxHR/IFe3zWrxcA3+5ucobvV/rqJ9sYc9OV4GmfAakDftAmtN/HY8fUD27Q1R8M=
X-Gm-Gg: ASbGncvXlwHMjvfzQofbrwmEFYSXcp+mDAvUyK4iv43oGpwgYSPR2jC207SDxvNjD9E
	gX1bqUfM5QB1RrYXAiwHb5ArmWCXJyWuGdVjHrvsHrjKPixru81ENZimeghSe56nNVfG/T/NbyE
	XKiVJB5cjb/dwILIuOBe+vx+iKLBdtSTDd90VZHLftpL6b3xuWmNNMws1CZHaLyCgXtW6Jo2ID8
	NinBXqLPFdTRN7iX0pQ7Gfo1iiSs9qBPQJIkuqo/def6HTmY0v5hXUOu4jDk4723Ww5wUopxx9L
	S7RYutz4HvnveAh1B+fXJP4njnfuw1tHxZ6974XeeLFsGFbezQ==
X-Google-Smtp-Source: AGHT+IH5gBq2KWLgBq7WpJUU07oAE/+qUjAOTHRdyHSwsN6mzL5qmAYtEHrU8HiKf7wPT/AHNvl3+A==
X-Received: by 2002:a05:600c:c115:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-43d43bee99emr13202575e9.21.1742387466306;
        Wed, 19 Mar 2025 05:31:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d43f43cbasm17403325e9.9.2025.03.19.05.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 05:31:05 -0700 (PDT)
Date: Wed, 19 Mar 2025 15:31:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] f2fs: remove redundant assignment to variable err
Message-ID: <a9c06462-5fd2-4724-9d44-0285f281ecec@stanley.mountain>
References: <20250319113011.791319-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319113011.791319-1-colin.i.king@gmail.com>

On Wed, Mar 19, 2025 at 11:30:10AM +0000, Colin Ian King wrote:
> The variable err is being assigned a value zero and then the following
> goto page_hit reassigns err a new value. The zero assignment is redundant
> and can be removed.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  fs/f2fs/node.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 5f15c224bf78..37c76bb19a8c 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1497,7 +1497,6 @@ static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
>  	if (err < 0) {
>  		goto out_put_err;
>  	} else if (err == LOCKED_PAGE) {
> -		err = 0;
>  		goto page_hit;
>  	}

We could remove the curly braces as well.

regards,
dan carpenter

