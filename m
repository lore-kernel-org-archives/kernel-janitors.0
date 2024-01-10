Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA11C4EB28
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jan 2024 19:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="blerndvp"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33694bf8835so3801001f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Jan 2024 11:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704914390; x=1705519190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tdRnEqYu5wrFKOGAWOsEOlXkQ2QD0vaqBMcEARPLObw=;
        b=blerndvpUZlaPwbzDpOFvoN3JPgbRgxoPUe7qPbHgz4k4KeVJx0U0QjdtYOR4NcFLe
         Jmfy77PvKkEPesceDrOScYLVDX6ZKe7PPPRZ2mQa1/Jyxw2AeKxjiPqqhoIlMQOjjwtT
         JhVOgZtMsAGcoFmcsNvJknwfPnIlA/xFGYRNIcPfEAlg9/cQ1XUL2v09ubgNlKrZ+jqV
         ylUg6QB8dz/yV2ZG5Sq5r3ULPeD9vRENvYpaG8kktncv3tph0yAyxXpoyugDOdzhRoEb
         XtzvGROsSU3elTDCEruTEYNl/FaVEWvBINkcKo00dBdjPAsutfz6K9H3O7QX0dJ1sm0C
         A6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704914390; x=1705519190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdRnEqYu5wrFKOGAWOsEOlXkQ2QD0vaqBMcEARPLObw=;
        b=hKgMEN9BK3C58zlbu/pRfOAO1Inyz9oBkR7jtPje+WIeyUR8L13AQxm2cZIs71D6tv
         T5dPBqQmiWYp854boMyIpnPOr2CHcCfB8GJhM6zLSf/sx7kcQJePEnATmCPT0W1gQ3WI
         2J6IFQia9UkCl1FSELnOvhQoY60SpuMxjh3zTGNNjgDzH3zIPjbMNfMmEQynXSNoR9Lf
         UYnuQHgqorF7Si1GkKGo773i8NUsNiM17LX0BE0YBXyuWeNL4YrZeK7+DecQhvNgyZK2
         tEXauVDrHEIxknXJZtJRCe2IUCdBOtjUblQaCp3UOqczsHYqC5r8dU4ReFTbJLf+4+3x
         uX5w==
X-Gm-Message-State: AOJu0Yx3b1ma/PSY/PuNzS0/BsQWcJxYEmgtR50ibWApssRbMrehtpMy
	C0zAFeBxzVivgfwcAirAbHWLzS8+JukwjA==
X-Google-Smtp-Source: AGHT+IEmLeC2ktmpxo2R0vne+kJgsNzB9Hdh3HfglcN1MpydgXEq5JzAFIUMU2GngEm9WdIR9Tp/Ig==
X-Received: by 2002:adf:e448:0:b0:336:3b1d:6020 with SMTP id t8-20020adfe448000000b003363b1d6020mr645749wrm.92.1704914389899;
        Wed, 10 Jan 2024 11:19:49 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id d4-20020adfe884000000b003367a5b6b69sm5535607wrm.106.2024.01.10.11.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 11:19:49 -0800 (PST)
Date: Wed, 10 Jan 2024 22:19:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Rengarajan S <rengarajan.s@microchip.com>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] serial: 8250_pci1xxxx: off by one in
 pci1xxxx_process_read_data()
Message-ID: <ce131217-64b6-4c4d-b9ec-7b07b832dba2@moroto.mountain>
References: <59f8aa13-3f88-4174-8e20-aa4467e7adac@moroto.mountain>
 <20240110141146.6422e7517fe7e07a833b66df@hugovil.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110141146.6422e7517fe7e07a833b66df@hugovil.com>

On Wed, Jan 10, 2024 at 02:11:46PM -0500, Hugo Villeneuve wrote:
> On Wed, 10 Jan 2024 21:52:28 +0300
> Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > These > comparisons should be >= to prevent writing one element beyond
> > the end of the rx_buff[] array.  The buffer has RX_BUF_SIZE[] elements.
> 
> Hi,
> your commit title message is very confusing and doesn't hint that this
> is a bug fix (or a potential bug fix)...
> 

Most C programmers know what an "off by one" is...  But sure I can add
"fix" to the subject.  I debated either way, but left it off because the
subject was already too long.

regards,
dan carpenter

