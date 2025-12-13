Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE9E2DC335
	for <kernel-janitors@vger.kernel.org>; Sat, 13 Dec 2025 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765619168; cv=none; b=JFaoo19mLuC6yiL8145s9NMkGQxeMAFYdR6HbmCjTJJn/za8y4/auktcSGqt+xIASrZpLGE01Whji/WV2/yChTuS6d3kNUBdgAo/oH3Iwhh/xP+xP4DOl3Zt5WChdKkH1YzpFu+/EMh+OlS8m1Nlp+BiwlWSXUMeziciLpeE0Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765619168; c=relaxed/simple;
	bh=NSbZQBOFUXaWkcuR/hJOF3n1LVHIwUIhkJnljZs40gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZXOMIhxKTJxDOIEaWnUruWiYEaDvhNa4aT+yklfEDVuoozMqYgNBdoTL/kh+/oe3gnTlhzz7ALRSXBGGb4zRDvPlGpcQwQqo1U8XmVZYqHG0TZobh9BBnN+85tL/83F2lAZNrwHNsVQ/SMyQ77KlEoUC1Ri4fEbDEJt4kcBU/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BApx56E5; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BApx56E5"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bdb6f9561f9so1741384a12.3
        for <kernel-janitors@vger.kernel.org>; Sat, 13 Dec 2025 01:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765619167; x=1766223967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=caAzMdu0TkrR2UL5lOMmu+hJ8etOlD/LjX1U1H7Gx84=;
        b=BApx56E5peedh2GTXnMGUvE4UaAQoPnPHMkfN+28EDPQmdMQvFvNwN/wcMqKLhXXZJ
         GBrx71iUYBWRh0CyW3NRrRZrSsLmyqEYaUF5lRmbwdlNdfqpgv1WLdVuHm2rpO96HGTA
         juQoaaEcDSluhCCbRpNI7OELYzSz3ujrYjMUbCg2HnfNAv+tQBHCs6AoTIRzW4GyZ6Bk
         FyHHsq8Py1RxvCGp3NrW1bvLyXIz6xYzarDgfh0efmgI1JaBFHzrkNBdZbxdExK6Bq5S
         Uu/+BkYyWf4tv8+koesiKOvNDbh3tNkZ6Lu7aQOQhD6+OGs35ewyXlhGrqHhW15iEYDz
         m8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765619167; x=1766223967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=caAzMdu0TkrR2UL5lOMmu+hJ8etOlD/LjX1U1H7Gx84=;
        b=PDG1cyKqocQn+BMGKirhU4qNLlBM3TlrY4RN8hng214rucz0GZHifIA9n9tKUjDJFV
         YfJJYqbjIakToo+mDhL3+9oK/0+MZ+jHuyV+l9JMx7g9AfreyEL6ncQ5WmVXjbSm72WR
         j9ic6FJIQk68E6hQ0HPqUsLNFon5g89npyleMMto2N8KUWcVLyIUntf3afjUS8PnWf1p
         mn5viI6jE4R+n500GwW3VkcA7AruxvCx4bZm3HQre6OQQmppTK+35d7p4JTlfWW89Jry
         sTKSNqkKl9nTdbT0jwTwGOKw1952d2JLCHK9dVvyvHMYycEDn06BOzbWVJcJkVsPt8G2
         HEkg==
X-Forwarded-Encrypted: i=1; AJvYcCVBsvvfgaYRv8Qlbo5O1SY9AjpPmAq6cVH1VkhaF+/rRYHlYdGFf0MWmq0vnqMze1t6pVEGdnzR0lx0KhDT6HE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAACRLjzW/E3xvkLN87L/XSQ3ymQebTKjIZqD1RADcLr99j0hf
	HRGOFkswQzVqU4j5gwhWbGmh2wPFsFDPiKgfrLhQX4DYvJ2oWHf5gpLy
X-Gm-Gg: AY/fxX6MCLoiHAnvMbyDWclIXrxpX74uBthAp/FMC4TlnWkNeBIO9Ho+jx59udOIdF3
	eBto4h/BRe4VybVaLFc/jvknq3WOfiPfEXUHaIyVDaR/jyABR1Do6Z+8q3vAPPt7u+qjN5OhXTi
	qVKr2NhkD19nZedlF/fk1YTpEqZzRwr4QNPLM/pJiY5jOz8pHqyt7Rsw6qqeF3hMd0z0oNexEwA
	P3qWr+qy+dTVALtuA1KlY/S0lmzoOmVYiALDRYS6/luYARWhFYqo8D8FU3taeB4+PPywKgneduq
	DhvgiiK45NUyMOwOOseQco3TDD98niLPYDmVzGxFiHDpxpiv/Ay413NKSbWsybC03T6WDvxmGcv
	XGCwYhQqOQYwkQBx519rISgdOSPRckvXuFr3kuCQwni7PoMSOkPGuuv2ZbB07SmyFbTed2b3MXK
	9Mrm5f53SX3aJxdr1wv3Ls6uf9vGXXJGsLWhP9eRoQHOA++XSSB/Ez0e6u2RefDag=
X-Google-Smtp-Source: AGHT+IHEwKVmlUftku9bZpvLbrn8o4ZbzGaitvRNC2Wvc4P/QcAMM+FztDiB812Mo9LIJVcrlS8yDg==
X-Received: by 2002:a05:7022:2209:b0:11b:9386:a3cb with SMTP id a92af1059eb24-11f354f39f9mr2913885c88.44.1765619166468;
        Sat, 13 Dec 2025 01:46:06 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:3478:9150:d4be:149f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e30b799sm23915360c88.17.2025.12.13.01.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 01:46:05 -0800 (PST)
Date: Sat, 13 Dec 2025 01:46:03 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Job Noorman <job@noorman.info>, Frank Li <Frank.Li@nxp.com>, 
	linux-input@vger.kernel.org, Rob Herring <robh@kernel.org>, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in HIMAX HX83112B
 TOUCHSCREEN SUPPORT
Message-ID: <rfgg3zmapcfkh5krj6kmuvgmcoxmzrzbwlhdslfte4wjzs6svw@yvrgovad3pwh>
References: <20251110054733.441893-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110054733.441893-1-lukas.bulwahn@redhat.com>

On Mon, Nov 10, 2025 at 06:47:33AM +0100, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit a311c777f298 ("dt-bindings: touchscreen: consolidate simple touch
> controller to trivial-touch.yaml") aggregates a few touchscreen yaml files
> into a common trivial-touch.yaml, but misses to adjust the reference in
> HIMAX HX83112B TOUCHSCREEN SUPPORT, which refers to the removed file
> himax,hx83112b.yaml.
> 
> Make HIMAX HX83112B TOUCHSCREEN SUPPORT refer to trivial-touch.yaml, in
> order to inform the maintainer on changes to the device-tree binding
> relevant to that hardware driver.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Applied, thank you.

-- 
Dmitry
