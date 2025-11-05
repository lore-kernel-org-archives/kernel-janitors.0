Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CD13446A9
	for <kernel-janitors@vger.kernel.org>; Wed,  5 Nov 2025 15:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357368; cv=none; b=Vu546+tbIcyi7eaVxaHXAZ93nhlWOVz7TRxT3+tjQa/xp9XpZOKeD8b3rd02GD5gWL7A55xMRyL0lQQDVgwblZjInPeCP6bhfpELgILtQwMTkROI3JmKtPJHaqx7RpnTpNJLW169ZPVHud3QYY8cm6tfnyEF1siN1jH0ymKSi/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357368; c=relaxed/simple;
	bh=B29cpqgV7/CYrmcutw7aOHNZMRlEALCnsPM+JLqqYcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/ghUtciRol87JVgPSe7itUgwW5hqQsmXgvR431O8rT3FmSiV8Oy2/KHsdw3UfZrJuG8xRdxuDBRPt4Kqbew5bd7e+02diV/nGh0IRHCU+FGARW35ccVlxjn70tCL8jwg9xQvGDH52RsoEqxfyP6xd8IuQ7aO/tAvCN1XfdWv+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QzKMq9fl; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QzKMq9fl"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b727f452fffso74171066b.1
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Nov 2025 07:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762357363; x=1762962163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tDwsC7iCiMWGLnONAY/ghLYICyEQIZ3pAEFgsRz5/EE=;
        b=QzKMq9fl4uvAJv6x3ONrC+liT7NCtPkzSnKrflFBCUTs6xX3gFyzEaM7kCg7Hfe9JD
         hx6pCxsS60fZ2GkKx0nQra/j8TbRYdcrS13lAHy/r+CkdKr0evgp2bHOERKYR6Shak8p
         3mD2Pc6ViKcWnDJAAHnoPOqeEzxmoU3BgJdkmo+xRBzaQqNu852+xGlnhOGp3+0u1Vev
         hwMz9INl2/NpekDCD5K+uuNw/A1RebUaUICPv0ppy9K4QTnOampG/IPbw9z9fYRDJF8R
         OCB2V05e5ymL3SEg4XeJFfyE7OyM23nqpmmVUTZRIHFWm9v66YXelaPGT1yM4G3NwguJ
         6kIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762357363; x=1762962163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDwsC7iCiMWGLnONAY/ghLYICyEQIZ3pAEFgsRz5/EE=;
        b=o6/JUbYKPEirw4s6iqBuCZaTmP8uLe0JAoIlxAXKD3mmDgIlLWwVNri/eyVea4a1ep
         5livBZVHXIiMueumvrr+u5xo54OZp81KPiB7MJdxQ2r4vDcrTZDPBvVAVoePscw6zTow
         YDBecjFo5359qa5vVaTXTLegbJlZbxv0lUUku973D0e39I+SlOuTfy5Idhra7/iopvWF
         UJvoVDzWufwCYAOEZ4BEDWeLzKUDSYkud4ATqsf2nPRpMXHLHk7poX5ygu8CyesqQrMA
         xuzGDYChXeoGZJzq+F9zyb2P7lqo2FMm2kLjKC/cwhTjkIUUeI4RwZrKFX4PXYRCm5qY
         u+xA==
X-Forwarded-Encrypted: i=1; AJvYcCXG4iNK1MghH8RCDaRIKTFomzeKcD8qg/sgqNpEtVIO6I0SS376tQKaFpdDyES3QaB9EppsSwrXMJPy0LE9bZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKpEzaMT08YeWiTZsre9qpOnE76W5wTGHqvdvMwipzuTyFz8Ae
	lHBkHmefq9U35m8/ZykkXUu2x5B7aHr8UW4k/eoy/NKi86e78Nui188Wy+YuISVQA34=
X-Gm-Gg: ASbGncvMS6RSEvGsfXLQGqZ1W1If3NkxVAJ6INchQLZ9YNYGpL7Iv+tuLa0EGN6fz/5
	uDUkMEAjgG99aksFjzmochO9MbMEyU9cR3iDshYLCOom394A89clCoP8Ym/2H/0+0z4oftrWT6e
	y3wPQ7liFSRYkfG3MWSf/xjGsrUQocrkOk90HfLTmqfYkCXKiHKPi/ErxF0fDAXBL23Mhf2t99P
	G/3f0XO5UJjRgT/UauA1/uKFeI3YmTViZbtxvGqltNl52aGhDpijleoTCg5+2fBIq1dJywjMIFN
	1uHvlOU/rAXD9QuqN2urLvI1EmuRWEZVMYq1Hg3QEu0j9IvddqabRSdtPRdYEipxHmZTYTrQR1e
	qMqaT7uU8QqbYCk/8tGivX5xUKR4mHC/mlt4GojmFSKTQqKy3N4rqGNJDid7RYHRqaMPbfwgsSq
	B9RcY=
X-Google-Smtp-Source: AGHT+IH+mLKaSwB//vN2vHtJqqPgGGlkQnNoDP2deaGEAiC8O4LKEY17zUAUwu1Ex6pi40F1pyUiig==
X-Received: by 2002:a17:907:9449:b0:b6d:671d:8814 with SMTP id a640c23a62f3a-b7263246b5dmr495188066b.27.1762357363593;
        Wed, 05 Nov 2025 07:42:43 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7270b56f18sm145395066b.33.2025.11.05.07.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 07:42:43 -0800 (PST)
Date: Wed, 5 Nov 2025 16:42:41 +0100
From: Petr Mladek <pmladek@suse.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: add printk core-api doc file to PRINTK
Message-ID: <aQtwcU-EEQAwrgDe@pathway.suse.cz>
References: <20251105102832.155823-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105102832.155823-1-lukas.bulwahn@redhat.com>

On Wed 2025-11-05 11:28:32, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> The files in Documentation/core-api/ are by virtue of their top-level
> directory part of the Documentation section in MAINTAINERS. Each file in
> Documentation/core-api/ should however also have a further section in
> MAINTAINERS it belongs to, which fits to the technical area of the
> documented API in that file.
> 
> The printk.rst provides some explanation to the printk API defined in
> include/linux/printk.h, which itself is part of the PRINTK section.
> 
> Add this core-api document to PRINTK.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

JFYI, the patch has been committed into printk/linux.git,
branch for-6.19.

Best Regards,
Petr
