Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AB021CFF6
	for <kernel-janitors@vger.kernel.org>; Wed,  5 Nov 2025 15:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357044; cv=none; b=WInjjKNXQy2LST7JhOi7cQe4jJLH/Y6fjoH+TEnfnsQwburnZgdslv/HbcSUnDEn1NJ2AEPUzcGSnZDFC/B+Jw5wbVunaLRgFoWGrJ1TeyyHHXCoLhdkEas8RsRqwvtZ1wRA+JrYOITiK9k6xzYP/jP5yN5BMhWHpDgaKs70Yb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357044; c=relaxed/simple;
	bh=m61O97S6NfmxGhxTal6dIYh1VqdktvSQyC6eowRi2jA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1WirUT9FeYrwjoSRPqToxiDvl8/ow0Vmh7xgleDpe+04TtaKG66xebKZwWQn2lQJ2K62B92r/uJUmn6lxrDu2goUrxiqJTNVdd9gDEExjMRAdmgAgZ6T9ZK3S5VHM1wikv9/mcg1MT179Pt8OrgtZqzdBqYTwpO8YVTJMuo9Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IPOMLgzq; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IPOMLgzq"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b403bb7843eso444164066b.3
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Nov 2025 07:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762357040; x=1762961840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5uqExUgKxmFd3ttKHvhc6HJuV8mvKHp8nd/APxExqdA=;
        b=IPOMLgzqk0eNxGfwcGGgpv5p/QPQsf0NE8s45PzRux4MarUAXHiu1fpevoYPcPaXsj
         EcHsdE0fepdrKYEd1m/pYaJva8eQJhvRfFv/oDlpBzkRudL7s6wNMFyPUXY5uYlvrSTt
         Z5kiWYrnvR6JQKGS7RetPKAHo97dd1NFffMJd7mjxKPVXoA+OGAYs/XwFBl63Hlgaao3
         6+3K6rKkWHehIy1tHA9+uxwlUssrxyUwagd4m3UyiLrjhH7ASfSuzb20g00+I/3Ozr2M
         RFvpQKG3mOOPvEvJFtH8TQeiWZp/LkTJkwn9efiUXhFvpRId/YiKLNyqljjQdq1ky3KF
         y1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762357040; x=1762961840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uqExUgKxmFd3ttKHvhc6HJuV8mvKHp8nd/APxExqdA=;
        b=oSIi2jhzcdJQ+Kw63Ahy+obM8Dr4Dlhf5eP9gcQsbYxHnGmcuvgU1mipJ6W08PmFXM
         MGybPnKS0XZBjktRCKfzXs4t6QV61Un5u67fpNvqFh+2mnNASWLxBKJ48/zL3uhADBkN
         iu2BzILSo4VBsoxV6CXhCZNL/mz8U8NKlwzYjmUihsLtcvdiYgvHiQ7rnU3vjWwRz0A1
         R+RTF/P1qEtnpeyFlO+TEHTJfgE9y6+Z3T76SqY8encfkvdTi/zirMw7358FIuqOVcG3
         Cwbuj4xdBtvfVHcXoyR3ctHxuGjOup2fyRVsL1k1REa0OWGalZaHyS1oDj0onAOFeh6R
         nmjA==
X-Forwarded-Encrypted: i=1; AJvYcCVJwmQ5y//Q/eeDXTVNPvJezQOQlbXtce4Hb0Y2yeRTZEUmBJKr4aArPmewvFl//Tnzteg/m0vJv2OR1PWQ2uo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzgqgKg/lW4hF/bWpk68+q4WVBh2GzbF98oKYjf5kOR279EzCc
	B9DLSpzKssXHDzWoDbWChXN5XZmvJ8qTqgptLGLg/P+YJfEAInpdT1NNWvgfSIbWv5o=
X-Gm-Gg: ASbGncviuGkR35xYBkALFLPfTEBqSt0oipjZfBuiRIOSeNzzu+d/34VqJZ8FoOA5usv
	rqO5BP2qTWCcRgrfZazJKaMLED6WTcuaCPfdxMg/EI5vEOIb9TFm2KU3mydZTQfCBdK4bEUZvif
	KV31ZK7dHoQE0xnkmf6/9zs7VXynniKsMAemETQxsqVDpQnhREFt19TynDTwVfcOx+K1jOYvl00
	62ukt4WJTf4EXVuLQ9tsW+wbqw6UPv+hKCelBYIrfTdIG/at/pUhENVObzEDM/jwD43r71ZjiPG
	FFTdWq36i/cA2qAd5MJNIWVFW4stHY8fXn1OuMVOuJZuuX4F4++q/acTTVXljA1WWqwRukKpl8d
	6FkFPgo7LPWhwK286ikf9tklQXAyLOEI1YlOhM6+JOpEhWeQVWbQXxEgbudcIhqGTRCiEUAG7ed
	mrkaM=
X-Google-Smtp-Source: AGHT+IE+8ZNQFkhcdImMvcXqqcsY1PZctR5NHXTk+Gv9/xtr4yKr1SrmgJkABmO00giNnP9d+YmbRg==
X-Received: by 2002:a17:907:3fa9:b0:b70:30c8:c35 with SMTP id a640c23a62f3a-b72656cf1a1mr345765566b.62.1762357039656;
        Wed, 05 Nov 2025 07:37:19 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fe37b7asm510757266b.60.2025.11.05.07.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 07:37:19 -0800 (PST)
Date: Wed, 5 Nov 2025 16:37:17 +0100
From: Petr Mladek <pmladek@suse.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: add printk core-api doc file to PRINTK
Message-ID: <aQtvLS7bB6pnhgxF@pathway.suse.cz>
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

Makes sense:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
