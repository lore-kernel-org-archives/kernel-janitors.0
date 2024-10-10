Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E7D1FAC3A
	for <kernel-janitors@vger.kernel.org>; Thu, 10 Oct 2024 18:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584756; cv=none; b=cK8nL32KlsE3yGkq/TyFZNnmlKqwKpPxD+qiGh6PMPea5dgQ7+WHmzUnOWXPoqyKP/hgHc6KGdfAw+225wb2BR+GH81GnBlM3uM4tN3RbxO20a58sh6H7EHXsbWaaWQrVZsPAdKlNiN9sjpumhFWsRyJMQpJJAFARS9KpP8KsYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584756; c=relaxed/simple;
	bh=WjZnkR+Hp1Z+sTURaerUVo9hnHxey+gpfAsg0efFelE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeHvXtMPDzcxMrRaq9A7parGWRblF9CWUvfiqcF9Pc+taUGEyUVLmv9KGH1Tf5NmSt3D7lpIcC6tmEk9D7MD/px+j3hhcgfTK9ew9DajPc2K6peLMm5RTLJgkQeE75wXN2eBdjRtwedK0MHazmR2Dku8PXLSb5TkdwFDeZsPq+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VOoOEMaq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VOoOEMaq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43117917eb9so8782395e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Oct 2024 11:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728584752; x=1729189552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MmVxF6On3Xud0fELRG4PtMnUkfzrftmDE77HKJT1fqI=;
        b=VOoOEMaqekrzuh5tyhYzdIjoNad0OqMFw9WIrtkBwmmvMLplzSR1AJjqRyVzDrgnW/
         Rrwa9MKIMLQvARiyEyrsoM8RDDR/HJecg7ruic+fRjjPO0FlAj3fwSIeJATlWmlIXcSn
         UVzckPPYK08hDuN86C9lUl0qs/88N3kYVsoq6KXrO1KdI01mfaI+jiXmz6cK/+Dz+8iZ
         IQssypRolci7ISNT6LbiNRQjfQgeCO+FsPTv2Lnc6dROe0R0+1xoybXyDhM55ur/V6eq
         lWeXq2sjQ0mROyq2JFZCiY2yGSVV8ghHiNtw02u5KDP3sDEuoUz9tNdJYm8kswOjZ/vQ
         8uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584752; x=1729189552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmVxF6On3Xud0fELRG4PtMnUkfzrftmDE77HKJT1fqI=;
        b=Fo5EBtk9z+HV77PehW5+vzbD/VcSnfopVRiq4etSHEt1dWmfn8dZL/XKD3I27LrEEP
         p3yC3qxqcQDUczwYkygrXyaD0G2EAGltO4+HqM8kUBqMIFkJo9iREReY7YriLgC6PYzI
         1Erp5h6T6u5+cv+W8gvMHs1snj+AIMigoLMZr7iAFE1uQFfMxSAsFnzNNI2TtUc81r8M
         w7LoFPFNsb5LPM0Vav2W+/FbmwYCJlxQSNt4cRNi/Y8Vpc5RPlu+fK4fhcc8iBqk1TMN
         leR6hSdBx9bAc5NiB5vSUrwWclyGbMZpcwy1EEKtKd9dJO4VrIUC3V3j9IcDMeUQ/dH8
         3/OA==
X-Forwarded-Encrypted: i=1; AJvYcCXT/gvMNLvO0vhDsHMcQU4tQ0romDa9tQBPsD2zqs2qc2Xei7lZrBdwOOn400QW/T/qEYd56R9NjEaFEJ/AZj4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlk2obFBvKTL8Lw5YtOJ95VTkF87bGSIZF6jS9DjU5ie8xOOCG
	Ib0HFGiHQWxbggJkvWssR8DLmcaGWionZcnH8ZGhN590HeNcpylCCatn9qL9nwY=
X-Google-Smtp-Source: AGHT+IHIY6JDhq5wDjFxcjfx2P1BtEHVyGYjVK9PHPhnpKcVYhsRIOHISEEsl5hFzPaSbEhyokkZWw==
X-Received: by 2002:a5d:6645:0:b0:37d:4e03:ff86 with SMTP id ffacd0b85a97d-37d55313314mr31978f8f.49.1728584752146;
        Thu, 10 Oct 2024 11:25:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8ab6sm2113414f8f.10.2024.10.10.11.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 11:25:51 -0700 (PDT)
Date: Thu, 10 Oct 2024 21:25:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Sunil Goutham <sgoutham@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Jerin Jacob <jerinj@marvell.com>, hariprasad <hkelam@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Naveen Mamindlapalli <naveenm@marvell.com>, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next][V2] octeontx2-af: Fix potential integer overflows
 on integer shifts
Message-ID: <91b7c990-1d8e-45d1-8f31-309301226811@stanley.mountain>
References: <20241010154519.768785-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010154519.768785-1-colin.i.king@gmail.com>

On Thu, Oct 10, 2024 at 04:45:19PM +0100, Colin Ian King wrote:
> The left shift int 32 bit integer constants 1 is evaluated using 32 bit
> arithmetic and then assigned to a 64 bit unsigned integer. In the case
> where the shift is 32 or more this can lead to an overflow. Avoid this
> by shifting using the BIT_ULL macro instead.
> 
> Fixes: 019aba04f08c ("octeontx2-af: Modify SMQ flush sequence to drop packets")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
> 
> V2: Fix both (1 << i) shifts, thanks to Dan Carpenter for spotting the
>     second shift that I overlooked in the first patch.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

