Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F6E1A256B
	for <kernel-janitors@vger.kernel.org>; Tue, 27 May 2025 07:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748332013; cv=none; b=KFoD50AqGb0AnoQqdStxXld6ZXA5MM7GDF6iG5jdOeK9ry0cJE8TO8V+8ZQFzXSSVyCnQLxQ8ntl9UmIubCTKUXQJBMa/8dWODjO7L/QhtaEoMfXQFyYtilBYy9wsy4+uhUSRoAT5JBZQEdncgtSXTSJl0Ll9cCLLh9Eh2emimU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748332013; c=relaxed/simple;
	bh=UU7+oRb86zVwx+HEnFQvsgq6dEP8Udyba5tT6b19DPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3vBHFfPeXaksqwheN7+Pd4fEODKgFY413euJQyzRqTtKnkZaDj86LLcfWTtKNAusykPa/vFRXnfUhsDgUTNOdSs16NeP4Cf6rZLjI7Ug1ABCxXFQiz3yAtSwj02mjS85N5QHx/8uhlSAk+a/7Bh/SV2/XGyGJWPyEi+OHib9yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Im4qVtpx; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Im4qVtpx"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad883afdf0cso207744566b.0
        for <kernel-janitors@vger.kernel.org>; Tue, 27 May 2025 00:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748332009; x=1748936809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kGjUxtNR3mJ/2u7hranrVFwikwHAbHm/cRFgPsL7dCQ=;
        b=Im4qVtpx+F4huEWmY0J0/WOS+oOH04KEMoGTiqfzBvF6fMNs9a/e0yXLwflVeV+tr3
         406rYR0ZGeWtWAtiIqKULbuE6m6CWECUEaIXvExkepk3DaK5015n7vKsmtcug40Zc8ke
         yBulrFiS1XB5zRlgoOZxJqKWfT4NX+En2PUQMgN1bMpdaK4a8gj4rtHUjuaVXNZ3NxlY
         qT28V5k6SRvBGZvcqpraYlHW+m622tvZmyEaNAUcmA9YHFRhIYS1ioi12yTrbAPKaYdt
         UdGo7cSPJ+fXLM5QaqThyxLTQLZfOqZkw4yFMIxUqgskVM2m1tHTpOX+gzjVVX1auloG
         Tz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748332009; x=1748936809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGjUxtNR3mJ/2u7hranrVFwikwHAbHm/cRFgPsL7dCQ=;
        b=w3pMfM6v+Vn7KUWAXhXHg1haa9/HQg0B1S2zduTwwg9Ce+AlHhsaKTKe53h32jcbRw
         4GWNWJQPnU//0XAE42Az80s2M82jW3ciDV52cLmzLoiT2sxUzP9QK64h/RJYpp4oDbyJ
         SZAx9uqLuxH6WR7ioxbU+5ejuKYb5PGmO97GIIgAg8dDwJvw4sCylejsrJsxT2Kg+6Lu
         m+JvxCnN9U3aPZlZW9qCtqqRJ5B5phStLdOFufbsICZ0cXFyG7FEDFM7ee2VT9HX6o2Z
         c4PXbWpCYVoM6ehfCJ2Boi56so6uFD2/JFEbJ/1Jg4Fy0iJ9d625K9r8P8h+49YySgUS
         Jizg==
X-Forwarded-Encrypted: i=1; AJvYcCXhGD/NpQIwFqk+jXKEt4OLYcBEwNo3v4/HdmWmN3tLhkOK7aBmoob8BbFsErwxMmHRUCYGk8YgeM0WpfKA+DE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNgd3rGM1xa8O2oDv5cMImy3IOrMlzACbUTEUngUDoVvP/yp5b
	wLcn9WaeI8MrPUl4e3OSFuuLgLG9vePD4EgZuVexPkY5JyFDzY+xlszQz/kySO6ekqk=
X-Gm-Gg: ASbGncuJB4TgFGNewdU62srIPs1CeiT+ivZarKOD8QniQi7cg296JbkkMyZ87617j+a
	6m03KujUBpNdar/Gfx64CwUErGoaHn9ZzXRzaiMIaihvxLrRck2vm6KJVylTiDdzosaXz10PgE4
	2wO3ixOZ6iCKxeKWXwZDce81i5cye3DvSRbk8Sk1PQavzPeA1r5wRpv04oL1i9sLHVWviZZAWEI
	+5JBrgBL4a3UkG7+Hz499vxlHVG1vSerha6FhrDARgxBMVycEOi3XUm54TAn1AHuJAF9XQzHkdM
	7VzQEeW9YpBun7RdBC+Mg27F/oz2NPNvEM/Z1konHrzRHvJxCHxgkezjS6t6nRG6lxWYUHmfM+0
	=
X-Google-Smtp-Source: AGHT+IEWcJvokDvwPgBmEe7nvuQpRK4D3ziJpdJh7OejYmQl2V009fIRSgH2jBGO0ZeLuhaFxXPszA==
X-Received: by 2002:a17:906:dc8a:b0:ad5:1bfd:30d2 with SMTP id a640c23a62f3a-ad85b2795f0mr1165498366b.55.1748332008808;
        Tue, 27 May 2025 00:46:48 -0700 (PDT)
Received: from localhost (hf94.n1.ips.mtn.co.ug. [41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad52d437585sm1789776266b.115.2025.05.27.00.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:46:48 -0700 (PDT)
Date: Tue, 27 May 2025 10:46:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Subbaraya Sundeep <sbhatta@marvell.com>
Cc: Eugenia Emantayev <eugenia@mellanox.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Or Gerlitz <ogerlitz@mellanox.com>,
	Matan Barak <matanb@mellanox.com>, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net/mlx4_en: Prevent potential integer overflow
 calculating Hz
Message-ID: <aDVt5LZe-jo7mVxt@stanley.mountain>
References: <aDVS6vGV7N4UnqWS@stanley.mountain>
 <aDVqSjcpG3kvl-0g@b570aef45a5c>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDVqSjcpG3kvl-0g@b570aef45a5c>

On Tue, May 27, 2025 at 07:31:22AM +0000, Subbaraya Sundeep wrote:
> Hi,
> 
> On 2025-05-27 at 05:51:38, Dan Carpenter (dan.carpenter@linaro.org) wrote:
> > The "freq" variable is in terms of MHz and "max_val_cycles" is in terms
> > of Hz.  The fact that "max_val_cycles" is a u64 suggests that support
> > for high frequency is intended but the "freq_khz * 1000" would overflow
> > the u32 type if we went above 4GHz.  Use unsigned long type for the
> > mutliplication to prevent that.
> > 
> > Fixes: 31c128b66e5b ("net/mlx4_en: Choose time-stamping shift value according to HW frequency")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/net/ethernet/mellanox/mlx4/en_clock.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/mellanox/mlx4/en_clock.c b/drivers/net/ethernet/mellanox/mlx4/en_clock.c
> > index cd754cd76bde..7abd6a7c9ebe 100644
> > --- a/drivers/net/ethernet/mellanox/mlx4/en_clock.c
> > +++ b/drivers/net/ethernet/mellanox/mlx4/en_clock.c
> > @@ -249,7 +249,7 @@ static const struct ptp_clock_info mlx4_en_ptp_clock_info = {
> >  static u32 freq_to_shift(u16 freq)
> >  {
> >  	u32 freq_khz = freq * 1000;
> > -	u64 max_val_cycles = freq_khz * 1000 * MLX4_EN_WRAP_AROUND_SEC;
> > +	u64 max_val_cycles = freq_khz * 1000UL * MLX4_EN_WRAP_AROUND_SEC;
> 
> 1000ULL would be better then.

Yeah, that's true.

regards,
dan carpenter

