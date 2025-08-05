Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D35224291C
	for <kernel-janitors@vger.kernel.org>; Tue,  5 Aug 2025 09:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754386361; cv=none; b=LdGG2KGZz+21PdnyOpXtPWDdDuQ8xrp8Qb5eaokE+Z3QMCFp1eaJpdTgZ2e/wjthxOFDIrHizBVypZmwvOHtDQEK7BAeKpINQ4evf/3Xpf/ORZ++z7hCrb1jaH+PU2Z0noBiNUXdRq0OPJ/d+DhnxilCXsPqkU91R9s8S8MkVX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754386361; c=relaxed/simple;
	bh=dmAqZKWXa9hepTM6uf0mvM6C0/XuJFbVnwcjNJRk3UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/UUFUpfor29jLl3Nd/t1HaF4PoAGk6555DbPNLhLrw4zoUW8yZrOO9oZK3/ixh+U+yLgD/IcJWS7UeFXlofHgNSg//0RkCrS7TusNUpuydaTIWUV60EOnBXpJVYPAlGMok77IqCSgv4nfa0XqJmdGJdmS+Is0NAqPffrji5aeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tzrkp9C+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tzrkp9C+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-459d4d7c745so21931315e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 05 Aug 2025 02:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754386358; x=1754991158; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LRrw4vQc3pkEJCBEVdJPyweESFjqhx8L585Qv1xiSuk=;
        b=tzrkp9C+zlCV8WtOYbuwRSgazOrP1uQpu0eLX/EBixE6lWBNQUP+lPxgESU52Yyqf9
         Ku1/t2ofp1Un729MSI6TUY2qhMPgiYfGZsikrlWtzFMfH0fbmqngtTzBEAK8gv6Tl9W8
         Fzf+On/AWjFiYGPK/d29m6+74XU38roxjYP96oTMYypQJHAvBIniAebevCXqQMI8zbvL
         XFpd89N4eK7xh6C1qRFyHM/7aBc5la7yIXQWqZniA0dEm63oGhRxAWy91RgpHIh6TWRU
         pKWkn0UqlmeADektdD8UMQtaZFuOKgkCSdJfxMZKcIZNzvA7tdh59vWLH5d3z6UCSIzh
         FNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754386358; x=1754991158;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LRrw4vQc3pkEJCBEVdJPyweESFjqhx8L585Qv1xiSuk=;
        b=gSAlm3trZPNrZPoXaps9hjX4LYf8otEsI0Av8GSGj4wZk5FGZ/k1tWA/pOvqmQFYwT
         LWTAKWQUJSDuPyLp0xUo6YHZ7SiGyMxxuF37RBvwYxUduOg2ZzkbvYoUbXAuGeVTtqLN
         hNgU39KVjoE7oX9esQvXaV4S4db0ouOyHrdcuupFzHoXA2Btb8mYw766RPQ8PBwuhHym
         atO1eC5pkuymEcWRA+v5fTx919iDERHjdjfE4f+NP4LasP6vR+UQQZK/FeDy0/lzc98w
         5kzqNsbThBvhaJQTth24RYgi3Mx49QOTtreJ68aN+3ZwMFe+c8UVILG1fMNEOknTkwj5
         N+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCV+4JiYfrzrRUV6wOA4O3mIASeyd/cQazSxHP7LCop8716lWJeTjxZcndCQqQayR8GjxajCyXhgnlHziZqq7lw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUxc2Us2VkFPGWwp/Woghe3zQM92orfE9AQIpHmkQqanjBM2X7
	AjgmAQgaezuyqWah2CpD78Jx+tYuLbS/JFZlbpuiTMo71Rkk1QBQBJVL4v1sMsOVsSQ=
X-Gm-Gg: ASbGncvG/1GtETJrKdMSq2uZFrGeYBNGYK0UOqMeeozukUk8Y5Rw0O0tJeIF+7tWjYA
	D9enyur3udW0BuXuL7suhL1C7yYUXT/tdlZ+D4EeuhEDdCw4eb4gadpZdwx4kLCtF1QPZbapHuF
	IIw5no2gGsqcBLYq2Vm4bpMFo+5JuvN4gLPrhRe/Cy16vfG2B2aBtR7432/VYLohFJIPktpHr5U
	ScFtJn0Kk9Yddy617dR6beMFNIUHSDocGjT/Lq3wcWJ16Lzp3BjRTLRhKpzdyjQgRy+YTVmiGuI
	MvMGEarrB6gP97tdKkCGb3u5uPdPKBJ3IF1rdhmpVxNMfEFc77M4J3m/qONFwMIzQJj38ZuMvgG
	xefLKkGEYJo4RNMzFI9dFaN+9oSZ0+gNtRGdd5h1gBOY=
X-Google-Smtp-Source: AGHT+IEniVrm80SsjDo0ryDbz5HLZsIvXe7rO1POHjMJRmY7kr3VgBY3FFchceUynbFM5EdgsuEyUQ==
X-Received: by 2002:a05:600c:4f89:b0:459:d9a2:e952 with SMTP id 5b1f17b1804b1-459d9a2ecf1mr54861285e9.1.1754386357820;
        Tue, 05 Aug 2025 02:32:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453328sm19366833f8f.46.2025.08.05.02.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 02:32:37 -0700 (PDT)
Date: Tue, 5 Aug 2025 12:32:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Val Packett <val@packett.cool>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] soc: qcom: mdt_loader: Fix error return values in
 mdt_header_valid()
Message-ID: <c00ae61c-83b9-4816-bd40-582be9e14137@suswa.mountain>
References: <db57c01c-bdcc-4a0f-95db-b0f2784ea91f@sabinyo.mountain>
 <ece307c3-7d65-440f-babd-88cf9705b908@packett.cool>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ece307c3-7d65-440f-babd-88cf9705b908@packett.cool>

On Mon, Jul 21, 2025 at 08:35:22PM -0300, Val Packett wrote:
> Hi,
> 
> On 6/25/25 12:22 PM, Dan Carpenter wrote:
> > This function is supposed to return true for valid headers and false for
> > invalid.  In a couple places it returns -EINVAL instead which means the
> > invalid headers are counted as true.  Change it to return false.
> [..]
> >   	if (ehdr->e_shentsize != sizeof(struct elf32_shdr))
> > -		return -EINVAL;
> > +		return false;
> >   	shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr->e_shnum), ehdr->e_shoff);
> >   	if (shend > fw->size)
> 
> this has broken all firmware loading on my x1e laptop (Dell Latitude 7455).
> 
> Apparently e_shentsize is always 0 in Qualcomm firmware files.
> 
> Confirmed externally with readelf:
> 
> % readelf --all
> /lib/firmware/qcom/x1e80100/dell/latitude-7455/qcadsp8380.mbn
> [..]
>   Start of program headers:          52 (bytes into file)
>   Start of section headers:          0 (bytes into file)
>   Flags:                             0x73
>   Size of this header:               52 (bytes)
>   Size of program headers:           32 (bytes)
>   Number of program headers:         58
>   Size of section headers:           0 (bytes)
>   Number of section headers:         0
>   Section header string table index: 0
> 
> There are no sections in this file.
> 
> There are no section groups in this file.
> 
> 
> (Not just with my files, also readelf'd the Lenovo ones committed to
> linux-firmware, same deal.)

Thanks Val,

What a great bug report!  Could you please try the patch I just sent.

Neil, I forgot to CC you.  Sorry!
https://lore.kernel.org/all/5d392867c81da4b667f61430d3aa7065f61b7096.1754385120.git.dan.carpenter@linaro.org/

regards,
dan carpenter

