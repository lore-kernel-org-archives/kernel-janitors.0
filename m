Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BE814601B
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Apr 2024 10:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712830890; cv=none; b=Lo0YM/E5CrQ7VykgN/40lnreX1ktvnV9fnkt1MXqqPmMn02ynviDrEpn1qCUC1q8q97G+LVyrazADzEm2lXotjJl7DzFeD6Z4Vo3oUHTbZ4u4yOApdbTOUHQW6h9sr7EcEW84DzFiKXWixscpB9Q62UARAXq477RQ7s6sWkytnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712830890; c=relaxed/simple;
	bh=zvOqY81UI1gje8b+KKXpBiaE2ZEmEDpgfgaX97t3ET8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvAxYaB62FPXEa/vXLDQn5CCQfudxOso3sBMlLCKV+SNqj3x58UYMDH53LMTGSwTVWcTJsn2uzwpo6/g3AqMCxcLDmG4+lpBr/oWX1GEIed4PfzYnVNclmO9fcZTv4gCqfgqDgi3y1O9cyuRMwvoYN7yqezyW9hlspgz7DvvtHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hfjqtKyB; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hfjqtKyB"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a51a7dc45easo753039966b.2
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Apr 2024 03:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712830887; x=1713435687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Xvdfu9ArjMbK1qf/YQdnlhdZxBJiNRZlOj4rVjSQLs=;
        b=hfjqtKyBF3Em+5dKq/Pe6ryRii+9+6IEBbhJQp+HOHlaqeG/sJ+Pvku2CflFtBcdE5
         qlgkaJa9HYlduLNmqjltr9q5vK+JB98bxnAjIDiWwEIJ4ApEk0Atf/9U/xZuBu83Scb8
         kqiLj7tKdIkL9CyO4t1vS8YS7Ns7PmpnVOMV4nt7MSCIW3+SxMSQsATGKwafdyK7ohPR
         izpqgnBTI2W7m0kL85XJBXJaLdPWGnqxUpdwSfzLJ0CFAYs57xOVW33rIUByQB7gNE2S
         XNb4hI7Iut2bhB3HWUmiBKbIADKFv7lnvt+u0T64qY8B2IZUAoQ6/a03JwFJk4b3L1/v
         0YgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712830887; x=1713435687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Xvdfu9ArjMbK1qf/YQdnlhdZxBJiNRZlOj4rVjSQLs=;
        b=Xxmy7IO7NfHCfW9p0V4YvPhpdref2BobT97chlX72BI1QUfEiqa0ob6qzeBPRaT/m6
         cXj2denyeNxSafe5rvUgpZEisaFiSPCmiLL0acRqyj+q+hu2LIW8h/Ru1WHFIoDJewpD
         hTFXnafXLQ99pKOyU+ZywhK/ALvkn2J2FssLWcHj+XFm5JuPwV9PuyvgHbagWqEY44P9
         3e8Ni3ftuZ/XStXARhOmKJDTNTDRHnZoIKr01fCIXgy4VS8S0WJZ4Q8FAz0pBk1zBkFJ
         VWJ+nz8Sldm9Q4SoeEHwrgzAP3QxXBqvhtJ/xLpfvvJkPCXq4d7o6jpbUA29iISXOH3Y
         xj1A==
X-Forwarded-Encrypted: i=1; AJvYcCXTuPdlzz48mz8Y+30vggvt5n5flAYIvdgnFDHGtWyIn1/9Kuh9AOtAHMUlIIUTGRc+oWzN2A3r10wcvOlMMNJjYvM1TqX+EMsvizOW/PCw
X-Gm-Message-State: AOJu0YxbeQCm6yvyVIpoF2b2M/BHYAhlw/bOIYJCgbFLyXjVpBqt9i7F
	zCaK2efkaVWipl6HtB1ZCvimu/0kD5CEjMUOoc0okmWU4u47fEsTGb4GPCdnIKw=
X-Google-Smtp-Source: AGHT+IG136xJRDYzgDgQExKc2yfZPoo7wrVxMm/rzGH1QMYV8XsYZj/631Jbg8RJ77bGIRh4geUH4g==
X-Received: by 2002:a17:907:d15:b0:a51:fa5b:8b9e with SMTP id gn21-20020a1709070d1500b00a51fa5b8b9emr4430989ejc.60.1712830886922;
        Thu, 11 Apr 2024 03:21:26 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id w22-20020a170907271600b00a4e48e52ecbsm605751ejk.198.2024.04.11.03.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 03:21:26 -0700 (PDT)
Date: Thu, 11 Apr 2024 13:21:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: Lukas Bulwahn <lbulwahn@redhat.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Brian Foster <bfoster@redhat.com>, linux-bcachefs@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] bcachefs: fix typo in reference to BCACHEFS_DEBUG
Message-ID: <b6d90387-7892-4c28-9855-ae35faacfe9c@moroto.mountain>
References: <20240411082931.56362-1-lukas.bulwahn@redhat.com>
 <a2683fad-07db-4857-9ebf-7adf31a09e50@huawei.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2683fad-07db-4857-9ebf-7adf31a09e50@huawei.com>

On Thu, Apr 11, 2024 at 05:21:05PM +0800, Hongbo Li wrote:
> Also, I am curious why such spelling errors cannot be detected at the
> compilation stage.
> 

The IS_ENABLED() macro is testing whether the define exists or not.
In this case both "CONFIG_BCACHEFS_DEBUG" and "CONFIG_BCACHEFS_DEBU" do
not exist for this config.

Lukas's scripts make a list of macros we expect to exist and then checks
against the list.

regards,
dan carpenter

