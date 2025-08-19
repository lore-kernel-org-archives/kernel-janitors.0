Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7945026B2CE
	for <kernel-janitors@vger.kernel.org>; Tue, 19 Aug 2025 15:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755615729; cv=none; b=rm8YR7sqyC9TVs0M7gwBpjLHVZZJhE7RdmWj3dMKMbCn60OeBALIV9W5G3cljFPzVK7RDLmnNIHzTFVi/gijU7hAsHQEp00IZbReLU07n6ZzOxVqoxC7MJE6nuh+8bfCDm4VIpIzxYsePqSfJJ6BzArgBSSEIdofNztDxQHPR9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755615729; c=relaxed/simple;
	bh=wgptnB2H9qnTUUT6jPDhuUrrnXCFncKWtJShnB5mGLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9EczOYqVJ0vZpZGyj2FbzQh1GHNZIqtXJN+RmENEDC2xwtlNIa/sM5n1GW/83siWJlpJuOQ5fWypg4FUYdjYYKlGyldcjOIdp3gVxhFlT/M4jSxKphNkKr4uqS8ZyHmuRHoL4V9Da/cEYJ+Idw3qqwLalvP6tS/RFDjJoV4SaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pvpOL58W; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pvpOL58W"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9edf504e6so2608982f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Aug 2025 08:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755615725; x=1756220525; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nT1w+5e0mD/OXT08jYsZeNEMDZKcQ/cmvsGpsw6JbVE=;
        b=pvpOL58W5jyjhruSBvaShxDnGH8GtmPvGyBUs5b4HjH7QVW+9QtlFmAuO3pkKPPRtb
         DMB8rTDdxPuI9VmoAFB1Id43ur6cge27aR7koNCvpx5Z7oNUTIgZYWvu04z7VVuof8Vs
         B8qRPS0gxxnXRDofPCsvvJTqwdlkLsb1yjGdoYM0ffzGoO2VSJCLExPrW1AzQ9AP24N/
         mrIYEvWA0DMb4qfw0KiD3S7UwnKg7XyYsLKu+v5NGu6FilTdyaD8m7ikqEX5RX0M0pOM
         g4trL/V/XmWU3hrTp6i8wlVGDj4+zlL+FbHL0RrMozycPfCBkmHKpuMz11v0TYgk/HeG
         CW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755615725; x=1756220525;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nT1w+5e0mD/OXT08jYsZeNEMDZKcQ/cmvsGpsw6JbVE=;
        b=qJucHzSR5GE5uq/TmB6eZcwSLu547XBurIID9S3z+sFRU490N2dtq+UWXqmvb1Gsfp
         wcZDu7EBVdipuh3mmTfJxbC1GRLngr9tBThRhH45Vi9MvZX0bksSt9gE+i/O9stSl60J
         TVH+ukRNCtFQUU23Hte+bXwdNR5FwgINVKe7KYjNOklBRqr2KnTkNqgGOB72aPGG4aDn
         Icg1OFImKfGFoabieXXnngCiRGiBppov6NNG56mrhlC6sXHCDptImz4K1YjdHnxReneW
         WxvZR0muBBy6+C3kJoP+1d/h0JX9d9l+RB77/OSZ8G9zdnLjvn4j4ebN616Kj6GQRxC/
         /vzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8GyeU6wluj9n9eGMOk94z2k6k66teoL1sOxDk5Qket7vQtraUQzAFcSH3YpbRjmLGnTBrGfIgA9uLyM/hh4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjSLy72KlF33I3bLnl8Xc0+Vj+3Cp0FlsVpQ4bq0yDq7DCT/jw
	hlQ+zWLy6ZyGg+ZI4WHLJ+8/fPTTCXBj7L73/K38p3QZ91mg5iEPp2kjukpjrsbJjJs=
X-Gm-Gg: ASbGncuTWhvJkm0xQOu9DasojgSqUeHvhZWWfJnp03H4pdVgqM8cZilnHNuT2X21ie+
	i0SkjbUNq0xWdbbBTPqTzhK0ZqU6sMnBG+SZ4wQLJIe8NZKpPrBKUeSCn1mmNPrY2wiAwomUrf/
	0RcfZDIF5lwdzRR9IadXQ0cCKfZvB/6sNf481UAB9i5bfnovw6bTzvu+VcfL/KE68DsU+yC9X8N
	Dv0goKrHl1lQxfuQRwS5cNChV2EBhUGdzdz5mz1pe7AKa9SFN3tXIODzT2Gwy6oJ+gmUXvjPuqo
	JtaQyQ+AexeRAatFFzJi+g+bm2LfSjs9eKareDOMMgoF8b2x+eJuPbJ6m2XL07DS1UNxhMsXew4
	/1pOtxtPruGHTxEQnTqgzr8P97aiuNbdRQW8/cMID+Nc=
X-Google-Smtp-Source: AGHT+IG9xBgfwY4xXs1ZR1sBwj23DK6i912COuTKguLY6aIpRkqXOcV+ILsGwy15iv1BwlYbHystyg==
X-Received: by 2002:a5d:64ed:0:b0:3b7:84fc:ef4c with SMTP id ffacd0b85a97d-3c0e00a27c2mr2292475f8f.6.1755615724584;
        Tue, 19 Aug 2025 08:02:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c077789106sm4085293f8f.51.2025.08.19.08.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 08:02:04 -0700 (PDT)
Date: Tue, 19 Aug 2025 18:02:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Waqar Hameed <waqar.hameed@axis.com>,
	Song Qiang <songqiang1304521@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] io: proximity: vl53l0x-i2c: Fix error code in
 probe()
Message-ID: <aKSR6MMr9aKWw9ff@stanley.mountain>
References: <aKRGXFJxf2bdQE-Q@stanley.mountain>
 <CAHp75VeTL7mJ-Ttgpkjd5A04DgHqkkPY90LtJriQjoaUZ0TbhQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeTL7mJ-Ttgpkjd5A04DgHqkkPY90LtJriQjoaUZ0TbhQ@mail.gmail.com>

On Tue, Aug 19, 2025 at 01:18:35PM +0300, Andy Shevchenko wrote:
> On Tue, Aug 19, 2025 at 12:39 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Commit 65e8202f0322 ("iio: Remove error prints for
> > devm_add_action_or_reset()") accidentally introduce a bug where we
> 
> introduced
> 
> > returned "ret" but the error code was stored in "error" if
> > devm_add_action_or_reset() failed.  Using two variables to store error
> > codes is unnecessary and confusing.  Delete the "error" variable and use
> > "ret" everywhere instead.
> 
> Agree, this is a good catch!
> But please, fix the Subject to start with "iio:".
> 
> With the above comments being addressed
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Yeah.  :(  Thanks.  Will do.

regards,
dan carpenter

