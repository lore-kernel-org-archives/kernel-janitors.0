Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5352028CF45
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Jun 2025 13:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944289; cv=none; b=XTlheC0iFcJ0+y3NevKhMEsRJlOHV3asojmHGCk3njQAQXzW8uI7x/YTU6FGwbTW87/s31WMu9u1aNp3Aaa5NKV4bAuKVtSAYeZWDvtZVv2RmHglpS29gciZ7YOYSduJu3umJyudXNnG4lrJBYcDx9aInEuvb6bDeGQqT5v17Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944289; c=relaxed/simple;
	bh=10uMTxglxknsiw2t3ZQh4FroAAiQNW+3m4lfHYqa4NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TT51QSeVEyYKpJ0PSjuXZ+c7dyynTkVZf4O3/qKLhvJroLaQH2joWUpNPxAtkh8NXfPvdsHluadeL3wN2+DSko51AawxP/Ev0JAdFz0bmCiCC225cMnxyiOsv/PWXJCGuwheGIN4uUHvPS+bFqBwkL4eEY+vJX2Ud2YKRAZxMpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K4zMmK/P; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K4zMmK/P"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2ebb468cbb4so841682fac.2
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Jun 2025 06:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750944285; x=1751549085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QZlXkSD04zlKolE5r+OxRCc3dIBq/n6l6fhQYaRGqmU=;
        b=K4zMmK/PpZJ4azhGeAaQBhjgVEqJqamRoMRpcyeRytdXTenaRYYzv3MYjqNjcr9AkG
         NRY9t97mD2jozLp+7XfaliZhhNdEvrA+zncMd/AM/6SrUrUIuJLS00ttSIa08WUv2wLE
         FbdXpDWZ+g4qdLQtoYmot1LKdMCbG2raltHnUnfQ9cEPSFA9m3+CXLdGdq5pCj5k6BsV
         qr9u2//c4d0CtnnmI5ZQnCNMdkXj/ZDoHuHbGyxPxTnvHFI6u77a/0kTk9I90C49Ok1X
         v3ZmzulW/dpXsYoOlI87JX7J7mfT23QqxYjdxJPyfxhYi9go1YIjg+sn03Z2TIUd3XJf
         AWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750944285; x=1751549085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZlXkSD04zlKolE5r+OxRCc3dIBq/n6l6fhQYaRGqmU=;
        b=QkW+frJwbE++6iOfnO/ukBb6t0SjRuDZW+jYG8Q1of2vapNJj+bm7Kgh1V8wHyTbDt
         TkRu1krHVv65T1w6w7LfaR/I8N5+PXXtYSywRQ4Qi2lUsz1Lsahw7KUmUOC8qGcwVRyG
         uFLXX2E2hiX4ZU2mimbdGa1RzQX+y2IryO7I2F4OHmfbUW8Fss4klg0eZ8antCUrLG/5
         JfsypAM7MXeoBTa1JFwnVUNNVS9b+jy3N40S8nA7/44bmJ7pBR729wEiWpacHx7P7G39
         Aynf1WI7BnUnSNBbcaw3QBTLok6FARnmaj/BwSAOequ9IzYiSMgHtTiq3NcTmUEAuFha
         OiWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1vPud7JzhsGlikfyN2NfdT1Dt8i/Lk+FcX83ZI2GhnUVtI1TaqzvAG18dUUeyLkSFxJGvhJpzZqGZli4/IPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyArMmAlfJdi3X0+zbVUSBpGVSOUez9e1yzLD0Flrrm0CstEN0k
	0ButyAPZVODkdr7DbMCDE4uxtVuoy7N6eAswCX/wA7J4/wYFtceg59bpKNjKJ+mhT7g=
X-Gm-Gg: ASbGncvWiy+mVO016GYfvQR+gwhGWzY1YujGVKIzmetIeozYHrsWoLWEYEgLObT5efs
	zzxfHaqrSZxrug2LzCuH8xyfzxEmH3yuBPFa14My9hSqw5HriKydY3DoeQTnMmD3DaOO0CWQu3T
	FzPmAZ7S93RQYIWGsH4FKg2PxSR3vVrq65pmj0qi9tJbkSNRvOym17+SgzSl7+i52roxjY58Xe/
	cQDwwftSKLIFEE6LSjMv2hJHZOHksJ04P79AKrdGaym6znYJy7FHLyDsL6S6h41914xRt5Zd3r/
	CjpKQMCrXVOEkoTYNZ0DcOHey3/9MYPXR+z/hfg+eCFFXGGBfiO24rsIRfV5Kggn45A=
X-Google-Smtp-Source: AGHT+IGHmrXQmGgiM1O4FMJI4ioJnomDeQhk1q4uAMvdGJQNa+bA3kRfvZeSRk6fLbxwCVrLnDbVRA==
X-Received: by 2002:a05:6870:898e:b0:2e9:11c9:1093 with SMTP id 586e51a60fabf-2efb27ce26dmr4871522fac.31.1750944285390;
        Thu, 26 Jun 2025 06:24:45 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90c92150sm2575206a34.39.2025.06.26.06.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 06:24:44 -0700 (PDT)
Date: Thu, 26 Jun 2025 16:24:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, vgoyal@redhat.com,
	dyoung@redhat.com, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] fs/proc/vmcore: a few cleanups for
 vmcore_add_device_dump
Message-ID: <e891bba8-9f67-47c6-8f84-a62abe35f837@suswa.mountain>
References: <20250626105440.1053139-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626105440.1053139-1-suhui@nfschina.com>

On Thu, Jun 26, 2025 at 06:54:41PM +0800, Su Hui wrote:
> There are two cleanups for vmcore_add_device_dump(). Return -ENOMEM
> directly rather than goto the label to simplify the code. Using
> scoped_guard() to simplify the lock/unlock code.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

