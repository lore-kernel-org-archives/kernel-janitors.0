Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A5C7E792
	for <kernel-janitors@vger.kernel.org>; Mon, 23 Jun 2025 15:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692153; cv=none; b=pM0bga4TkpzjBrp3fFoNXYNtgIDLqCaKRolbq/l3rjDQeK1U06zYPxndDGa7JmMfFYYijriD/jz6/UCSxAyD3RQD+/ac/pne9wgPC/8WaMTpGyETFFx3CM/ic0E4lAPCB3Y8apZHfILrbQmXl36pIiJUWj2/bEaPelikjU6jcdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692153; c=relaxed/simple;
	bh=hC9peFQk5TvNNRSqpIuY+epye1/M+kNum1ROmrB5xQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f42W7HyPAiZ90y8lQT0qtF0mO1lrKb3ag1U90vpSWjtsu5ZJOhRSWgl37ekOpVYgm/dsawbaizik0Z7XeMhB5zGAlUXt/oU/OmTW5dziW8uHCt0g7D+0YFVjSIvr1qEzIrVdySfYbPt/LH+taGpZmIVKQS453jZigE6wamifOfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mjsgMC/x; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mjsgMC/x"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-610cbca60cdso2800743eaf.0
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Jun 2025 08:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750692151; x=1751296951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bTZ19GRi4KU0H2wNqBnaKkKrv7m6rpdyKuL2QkFh6uQ=;
        b=mjsgMC/xD/7Nu42Lgf44FhzejT4T/f/JDGVCRMV/3hizQOfqv7Nmnrf3s4Rh8gb/Pw
         CSExBLuoDGt4qh+QwFjy6n+w8gZHLhfIZ+085HpT06uJXGwug8J5FM0ialJCKFEblggE
         kd/2/mOPQrPieF6u53cs3Z39hf4GQBu5a6f8JhvMjLATQ6dy+WLiMfyS+zqZCR/c4K2f
         pH+1R5JQxEi+SbAdVLFp2Z5dkaHoRGMRs+fN8sPYHgVEB+49h6TWu+TJ6ncozrliVymC
         LmJli29nXUns52jR4ZM6KmXDAeA6TtEhO1MGsL9ikZCuXSJGzfSZW2DPDyNdUbc7a5II
         g/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750692151; x=1751296951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTZ19GRi4KU0H2wNqBnaKkKrv7m6rpdyKuL2QkFh6uQ=;
        b=ZYtTGSmS5yYW6rxmtfZjwadDiI/DWjpsYpJpIfT955CFgNKHLb+TCur62YYEdVAnZ7
         CApvjkIWLv2qiMsHm+EkY5PgWDgOK0ZMOZYmReZeBySmmRoJc055inkiIUkButVJmrp0
         QRGBSF6ac99QuI7vOqWkAECMIj5kl8hUG0DPQ7AUxdLCqYnFhaEh7jITxmtgNVRRpNWJ
         x+sFASbVwfB3+lA2fLPPWuFdApVUcMfpjofXvC7gdJxYnZq//jvPoP3D2IBQk36uHFJT
         UQ7cwHuMPW14MM9/XMdnp1JzkLMW9SVxfLHAQZrVR0FlHO5IvKbaDRgQ8MQdok4fyY9T
         2j2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVV6NcOhbZkbDGlVxDSfTGsXeY4VRj/rn1sV7gNwEIOvGkG04BwidhP5d4IHvvt00c0HxFx8v0m6stl5Af/R4I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs7218NgqVBUYcghAcrvJ8VrykJx/ymM3PoUQkMZclne9L55gp
	Q1kXTksmX5qiXlyQNKzgTIXbhQX3bwnK2hE7lIrVktoiJUDKx2rRfEWXqT319HpOeE0=
X-Gm-Gg: ASbGnctG6TkWwhET+Ru145pu+ti6KK8sn0HDPJ0EWGXr3EI3LI997WBvwnne9es4OXp
	B1O04teF3s942q/DKiVmV65iQOiO13joRghkRi/ph7I/v5SyWghUrJ5crtXED1Fdnj1ZvEMMyfL
	BNR74OOVcWeKelaHUlJt53wISVGr+8pxwu4EGSMX6SrcC5rwBRwmCK5wqhiI+ibxJNY9M9inmK1
	ew282DJemyid6cSBIcu8aEEXwAjjrlnjmeB+CYcJXN0iJAPMX/FsvPYi6N9yB8IDZRb/6YmZ2cM
	BIZxF81NVg+SKqqGbJNreNDEMsJa12v52fExxUvK1CPvA+ZWp9h1Nl1vIRYBDh7Vc/nJmw==
X-Google-Smtp-Source: AGHT+IFkGyVDoc+8SQ8rASYfcEKGGB/Oc5hw+KdWNqGCuf0XX49CDwKCA3KtlNIgbDKU0n0iNbw/gw==
X-Received: by 2002:a05:6870:392c:b0:2ea:8091:41f2 with SMTP id 586e51a60fabf-2eeee55c8cemr8102044fac.19.1750692151278;
        Mon, 23 Jun 2025 08:22:31 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ee8a8e5eb3sm1697426fac.32.2025.06.23.08.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:22:29 -0700 (PDT)
Date: Mon, 23 Jun 2025 18:22:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Baoquan He <bhe@redhat.com>
Cc: Su Hui <suhui@nfschina.com>, akpm@linux-foundation.org,
	vgoyal@redhat.com, dyoung@redhat.com, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] fs/proc/vmcore: a few cleanups for vmcore_add_device_dump
Message-ID: <d60db71a-0b4f-4e7d-8c06-7493934aa507@suswa.mountain>
References: <20250623104704.3489471-1-suhui@nfschina.com>
 <aFlmfdajTOP5Ik9f@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFlmfdajTOP5Ik9f@MiWiFi-R3L-srv>

On Mon, Jun 23, 2025 at 10:36:45PM +0800, Baoquan He wrote:
> On 06/23/25 at 06:47pm, Su Hui wrote:
> > There are three cleanups for vmcore_add_device_dump(). Adjust data_size's
> > type from 'size_t' to 'unsigned int' for the consistency of data->size.
> 
> It's unclear to me why size_t is not suggested here. Isn't it assigned
> a 'sizeof() + data->size' in which size_t should be used?

Yeah...  That's a good point.  People should generally default to size_t
for sizes.  It really does prevent a lot of integer overflow bugs.  In
this case data->size is not controlled by the user, but if it were
then that would be an integer overflow on 32bit systems and not on
64bit systems, until we start declaring sizes as unsigned int and
then all the 32bit bugs start affecting everyone.

regards,
dan carpenter

