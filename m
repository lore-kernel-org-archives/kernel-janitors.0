Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2CC18B04
	for <kernel-janitors@vger.kernel.org>; Fri, 23 Feb 2024 09:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708682263; cv=none; b=pjNy9HoG9/+zE80kHygpxjjxK8GI5XL7hI9wTCeL9+UxQ0A/frH6UaQPMND5IIZO/q+YtbA0IEfGMX21I5jmXqrGeFSlE/biYyIT6N8DLY34uZSlHkpWuw3JyRC7+BdcECuX7lBtSTP7DmUXoMtxVO9gYsHVwHZZr42rsFKU/aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708682263; c=relaxed/simple;
	bh=v0l7HTP7lsDPJCnwCBLsqGp+y2UNKtugLO9N2xkevdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3tMQLMAYoHdIm7mLKQbAniH2L7BlOzeTKWhH1QCTGD0eTeDct92wr+ypp0qETPNt7Px0q42xBngrHbAaRty4UBJVhXYkJF8O75GoLjYPcCUrwSoFlZ3LhWuqCWP9/riyGQqekEdWD4l1fzd/igzNr8M9Fsy7OzAD+W52f3XGxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dZjQNpvo; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dZjQNpvo"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33d26da3e15so116398f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Feb 2024 01:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708682259; x=1709287059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0/y/rI+M/5qiVISNkhUYwwY4gRxXJKTqbidyY3f2wE0=;
        b=dZjQNpvo741c6WI3kkW9Pift5Phe9OtpEs0BgP1BJttEQ8vsMS4HELWROU9kj+sJVj
         6rbizHUaiPQ4CGZxIeZyknUF6OUisNqJ9jnaNeraJpQ2roTdpxeNVrjcN7tcWoekUCn2
         KUOYr+t3Lufi0bDLX8N5FzsDNV+znnXgmymeyKHE+77fKQGr4BtpnLZh1l19S7BoAryx
         THPu2RreYc7Kf9gevUAVkzb0e9gapt5iCFOQ31Wo2q+1KQESBOmXoNRA/dLzjamA8NND
         oaqsnc72jbmp82DT+IrFmcMBwP/mrCTmQGDSSZRSllGT9e4kyek3DQiq4JWr0d7keRs/
         bQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708682259; x=1709287059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/y/rI+M/5qiVISNkhUYwwY4gRxXJKTqbidyY3f2wE0=;
        b=q/gEVzIY8tKkZvqEzPaJ5H8PvIRkHXY/YaqIAfz8KkYsmEuEDGv7zXsTOytFztUQbw
         u45B8ovrH63a3UlbEF2gNTCSdE1ucNrA1sCazIm5v9+HiQIxz9Xzxcn5Yy7iLx5PzxlJ
         YxxSr40FXWvs7OykrvzCa2LKfV54I5lTuvnUkd/OLMCQURjMU8dHSrOFOlnHLYyB5A6U
         ddz93cTwmJchntaTe8Qow6DvsGzfEavMdLu48MT7md9fZXuUJ05f5DNcrM+SIZrLaMLI
         KKPmNbAFL+DdIDnJhkqoEiKh4tJF+GzwGvGImHsOSlLBhKxpWG74/Okp63Eu2btJ8uTY
         CZow==
X-Forwarded-Encrypted: i=1; AJvYcCU68MG1aQfGeZg6Dc3WsnZvXfcPC4x/Z21j1jNMofKtmnvL1EZlVVa1oifHL1oL6p5zW2fhl5awFqzwvWJC/KH2kNWeNoIkqJ5CI9lfk7aq
X-Gm-Message-State: AOJu0Yyd9hl06czmoOI7O3cvfcQhHaPDmjcHd/KfpWgs+LNnwwsm+Ha6
	qBh8IgMhcNMds+gsq+DY8m7vCZPodats8I5Oyx1qWVDOoHF6p/vuQpBvHMWi2oAj+RX+klkM5S+
	/
X-Google-Smtp-Source: AGHT+IE6tVWqEE3mCN+25DqhP/CUP5T/jGAansZoun1aHwjyncsoYOjI/jf9FiAzxP2Z7I7QVismBw==
X-Received: by 2002:a5d:6691:0:b0:33d:2567:995c with SMTP id l17-20020a5d6691000000b0033d2567995cmr1215561wru.1.1708682259350;
        Fri, 23 Feb 2024 01:57:39 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bn22-20020a056000061600b0033d81d9c44esm2313054wrb.70.2024.02.23.01.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 01:57:39 -0800 (PST)
Date: Fri, 23 Feb 2024 12:57:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] orangefs: re-fix sb refcount leak when allocate sb
 info failed.
Message-ID: <32506721-f81b-46d8-b421-d5d2a4b3540a@moroto.mountain>
References: <20240223093639.1794556-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223093639.1794556-1-suhui@nfschina.com>

On Fri, Feb 23, 2024 at 05:36:41PM +0800, Su Hui wrote:
> This problem was previously fixed by commit ac2c63757f4f ("orangefs: Fix sb
> refcount leak when allocate sb info failed.").
> Add a judgement to fix NULL deference problem and also avoid refcount
> leak problem.
> 
> Fixes: 9bf93dcfc453 ("Julia Lawall reported this null pointer dereference, this should fix it.")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> ps: Thanks for Dan's suggestion[1].
> [1]: https://lore.kernel.org/all/c4bf77fb-c289-4f5d-9f20-e0861a543d91@moroto.mountain/

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

