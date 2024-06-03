Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E1F84FD6
	for <kernel-janitors@vger.kernel.org>; Mon,  3 Jun 2024 12:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717418830; cv=none; b=H+eWFbPCxKOJSzYdviNmjBkIzEo1FI5qjxHP+DoKInj+MjbUWc54/EnVenATJ69l0XAKKfzZgHKDN1aGoe89IfnW6yWALYIWXJr2v2RcfkyUM0DKOO38CjJBoERuQsR5LXrzOxmdNqIm88jXQ4hJBwBInALwr9vD7fiE0xm7rKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717418830; c=relaxed/simple;
	bh=8rzxrBuaT9uCUeYvlL1cIBanvAVdK8Uy8/hC8Fi/esE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGFJzLYs7v2f2KgsIGyjCaomrRMOk+XPohSydrXPtKemM8St3Y9EkQy9e4cFHcZge+pYLmRvN+DQvFd/Lod8glg6j1xVRBo50TISJOjVA8JPoBRO2LFjC/5l9jdntOawkHqNw0vcfPxgTwRyj4SusAbmIRaFj9eObePu99ulh00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=g3+XNBuz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="g3+XNBuz"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4214053918aso3899095e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Jun 2024 05:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1717418824; x=1718023624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jNpD+hHTMFWI7U+mq2gErMhYo7h8tLmeifk0ewKOvm0=;
        b=g3+XNBuzCbSp7nnAdIFzYbqRyhzTej1jxz6VTYhbKK+2ohVWIsgs0Z6Gi7qfSa2Oh3
         5GLJ76ktOm6FFTN2qqaGx2nUno8FGFqzqJKKsDymmVlo/sotGjR2INl4WRuaWd5/rutZ
         BJuhB4f3eHCoCjARXqzuMF5HAuqR8Ua9sby1namVC1M7xqoFtbA+2ICRna8dC6+KGA+e
         HPfJIvlulvbWdBclqgv4emMGnyQJnul1MEE55q2dLWh+ljwl5mVP2uzNqIsXuXa2UMTs
         YqNGA2xp6zkj+5UTUCxf6ASkPXCpUPqJDH2zLK0XpPn6G3VBJX//DXZ2vzDSYIEtfEUB
         At8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717418824; x=1718023624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNpD+hHTMFWI7U+mq2gErMhYo7h8tLmeifk0ewKOvm0=;
        b=sIT6zTDsJiic1QSi4vuKI4n6vKeI+1veaq8KuueNDpztSkp/ZzIFeJNhloFpZ3OW1D
         bhFJWrAabUHnURgrEamBs/NCo7DNilp0LkutYcERJhuukQC4d54Em+6cGArEc5k7tXXI
         TwXuo9nZnQPHkAL7f/KBOFUMByHWKiOi/smTxL6zEGEDBXdCK2WgNAIXQhMJL+Hi3isx
         qqCBtWwzpBQXI11XJbeEgbG4NSlBjYD9iGB9Lz6zHrF7atuxBVoBscP/q300NRCGbx/q
         P324ek2O3KsjC6/i8ayIQ6xXMQ9maKWDsOLh/s+kscuanwlg8Hdvrha4NPUVQXpQ5lWX
         fmKw==
X-Forwarded-Encrypted: i=1; AJvYcCUt6USnhZZmjZe6x5vbn08xQomYEP2cBMq0KQcnZ8pLjyggY78TUGFF4WPyokJr3uYupHSm4iDzgNSCLYTUYALFzsQ/esVTQh6m+MgnnQAB
X-Gm-Message-State: AOJu0Yyp2Sjm2ISW6IceonuIvHlyw4jfyniIxBnxaeeJefqQwpwjQVWP
	IwOitVf5vsDsoa3Nc/9OjrUHmIwIxoxHrYpk19SEvE4h9YeNHXu3hlbb3z/GJy0=
X-Google-Smtp-Source: AGHT+IEsOzIuklCyugaxK7FG0ztwJGvAO7VIwURTBe4cCiL2gDYbFLm+E/bk1RNjA7FGajo81wIWzQ==
X-Received: by 2002:a05:600c:4314:b0:421:2ddf:aec4 with SMTP id 5b1f17b1804b1-4212e09b9b9mr70764925e9.30.1717418824534;
        Mon, 03 Jun 2024 05:47:04 -0700 (PDT)
Received: from localhost ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b8b8c79sm114367645e9.48.2024.06.03.05.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 05:47:04 -0700 (PDT)
Date: Mon, 3 Jun 2024 14:47:01 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: idosch@nvidia.com, petrm@nvidia.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 0/2 net-next] devlink: Constify struct
 devlink_dpipe_table_ops
Message-ID: <Zl27RT29aHxmjAjV@nanopsycho.orion>
References: <cover.1717337525.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1717337525.git.christophe.jaillet@wanadoo.fr>

Sun, Jun 02, 2024 at 04:18:51PM CEST, christophe.jaillet@wanadoo.fr wrote:
>Patch 1 updates devl_dpipe_table_register() and struct
>devlink_dpipe_table to accept "const struct devlink_dpipe_table_ops".
>
>Then patch 2 updates the only user of this function.
>
>This is compile tested only.
>
>Christophe JAILLET (2):
>  devlink: Constify the 'table_ops' parameter of
>    devl_dpipe_table_register()
>  mlxsw: spectrum_router: Constify struct devlink_dpipe_table_ops

set-
Reviewed-by: Jiri Pirko <jiri@nvidia.com>
