Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE20202F8E
	for <kernel-janitors@vger.kernel.org>; Tue, 18 Mar 2025 12:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742299424; cv=none; b=WbhUExuSfWY/6io1N3kVUe2RzOt3rEyjJD76jNkKC+lZEydJHTq5ExALkesjFxPSDlVHjDx8FdmxyVOFo3Hy+m486IXRY0PiLNl32+sgSWj0nj2bCd1f1ukOQdyp665kp6wsjxZuoqZW34EN7UlJk3DY+27hCVdGUsDskrILXIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742299424; c=relaxed/simple;
	bh=r9W2oByKMjCUexc+U6zWTeAxEfds9Y3CGAAEJo7W7kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8DTNqfGCYCYGCaaUbhRzd55YPeMij8c1swp8lsq5yRXKi4fyrr0fhy2c0bCGaYK8ZIKKjSX29TPrNL5/IRYZSwJ+8OAi08+dy0qCTF8chHGwThooVqiui9mt/kAeBY0FZ4H8qfTqi+budjRVPXNeGfL6Pvvhn7cxJphkNNboFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JbTLrSD6; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JbTLrSD6"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39149bccb69so5491330f8f.2
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Mar 2025 05:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742299421; x=1742904221; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EIvZ3Wp+90RhosIdCp8kn3gSMcgQFE9Tp7I7nCfwJ0E=;
        b=JbTLrSD6rcyk0Tvz2JPLTKXj9kN7vzhkbj9R+pYYpJyhgizGjU9UREYU0VwnTyKHBC
         YDu5DMjV9NMqrgqbFXRkWUVIqBxowYo9UVenN+BHyQJIuiUYD0cwB8vpNYP2j33Rp088
         C5tq0qkFOvYI8z2E15p3agM5pYfU6JewIIuMIe9GsZZbhFzmjb1PX4/1quhDxGaGrwTQ
         BoQvCQMLxDAn+Y035nfJ8Jd+tbCxOBURAYkAtoajCYbvDEDENTiXpvG/a7L1vMcU5adA
         PY2ytl6YL0BjvLyn3wNSffmJzr8kNJiNjDzqJSJ9AHUppmKYTVA5/gqM6ZU/bp/WWC+E
         U76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742299421; x=1742904221;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EIvZ3Wp+90RhosIdCp8kn3gSMcgQFE9Tp7I7nCfwJ0E=;
        b=TFzKTalaQNS7HTDpUaNaI+VZFVvs6NwfEUg3E58HsqTXEW3CFtf3epbYB7jGIjdCfg
         Om668FG+a/HB9fl2Rm5NXPVS437bJjVG4RwKE7+7fjKyiFTiQWju/oDNG2mueQiNxE/t
         OpPrgfY7WQVZa4/0Ck3AY2WpqhnbHDLPdGcWickLgt4ASD31o1jhtnkpEADGPvGyqKV1
         SFalz4eQpe+UKSQsZEWEMe+sKxGerkl4pLxRQIGQD4c9fI39cPRbxdrt/fSKYXqP2lMQ
         hAQaIMyuCy3U5kT1HCcytYSBhpn6ZkAAFarQmhZj/8sMRmElzda/ntkhjGLdjDvs0lBF
         wKzA==
X-Gm-Message-State: AOJu0YyKp3IEQ++Jfs37upXuJg7X20UDaXpiMrLye7fkTJi37yWZ9sPD
	IoXwdpzWXNUPN0tIbcUpG3aCohVhHbuC4DIPzhwRRFZvcL4XOkhkTvZFDA8CR6Y=
X-Gm-Gg: ASbGnctmXR7mswPhBW86hbSU1w5vlLZlt2IVtnJQuPuRk/jlSkty3JvO4Bkn9fsDNlJ
	HEzQfXtG7wjoSPYNc7AGwuWcrYy81FZB2a6BFoeJ65bC8wXyA7NnJGp/91RuTA1s8kVRX9Px3tz
	ObovKD1ID4xA+2KfMvLUYMQfWKdk8zDtgQ/9HmV1B3u0lT7obgnIE5WdfqbYRQ20bn+UCa3BGvL
	8GPE1aCEGRFSHNjM58CgUt8uDFMvCq/Y0MAauBoP+RV0ssiDEhUeWgecUee0dkOQWdYiPfo3TNQ
	mfeehAB/VpagDX9XsUsohQo9TDMeFmxzB8vNwamY9Mqadhn1ng==
X-Google-Smtp-Source: AGHT+IFpsBv5twsMP6fmrTzI785OG9MT2p6MsEQHUu8xAsUGZO1uS02mqQn/S4PSHW3veon64U20Lw==
X-Received: by 2002:a5d:588c:0:b0:390:fbdd:994d with SMTP id ffacd0b85a97d-3996b47cab3mr2750146f8f.27.1742299420841;
        Tue, 18 Mar 2025 05:03:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395c8e43244sm18330917f8f.60.2025.03.18.05.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 05:03:40 -0700 (PDT)
Date: Tue, 18 Mar 2025 15:03:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, cocci@inria.fr,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] mtd: cfi_cmdset_0001: Fix exception handling in
 cfi_intelext_setup()
Message-ID: <7eee35fe-0d88-4f38-b381-1ea2ee4a4715@stanley.mountain>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <3675f707-bff0-3caf-29a2-b99e5b9c6554@web.de>
 <d7b2c8ac-e052-4b93-964b-4cc58a459ba0@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7b2c8ac-e052-4b93-964b-4cc58a459ba0@web.de>

On Tue, Mar 04, 2025 at 08:21:53PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 21 Mar 2023 20:13:51 +0100
> 
> The label “setup_err” was used to jump to another pointer check despite of
> the detail in the implementation of the function “cfi_intelext_setup”
> that it was determined already that a corresponding variable contained
> a null pointer because of a failed memory allocation.
> 
> * Thus use more appropriate labels instead.
> 
> * Delete a redundant check.
> 
> 
> This issue was detected by using the Coccinelle software.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Don't use a Fixes tag for cleanups.

regards,
dan carpenter

