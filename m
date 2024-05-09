Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397B412F38B
	for <kernel-janitors@vger.kernel.org>; Thu,  9 May 2024 10:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715251664; cv=none; b=UR0ad+8sTagA5CQo4/dDBz62j2Dq4dP7hY0tKV7IBTyZqtyfJ6UvE+vzIsm6CAZ5pdBI/hmZmebUSd1zQNl6TlYTZB4Nb7XijCcvx08uaaSLq8ANs9NDjlbe85uwc7zIWNL2VGb1b7j/FezKPMF1uoQwvE7ZCwrusq6tQVuUypw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715251664; c=relaxed/simple;
	bh=rm5tKlmmzDvxykhjXtAahnY24hMhcwI+5x2kT/7OVE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l+GiPyjTVvgL+q5X17ULfaoo9sbwXQBFAoLHs6jtDhBPBHCs/z5/4nYLK5IjR8W1AAldDqtRIrUje2cAlvYGHx+Z1d8b/TiBQ3eqx+opcvXH5tNEKBfRoprnEuY6yuRxe+dO1W1V0cn0KaKrOZ4Q/J/LZH5B8a6+k/0mL8r1S7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vq3Jmpyh; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vq3Jmpyh"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a59a17fcc6bso167827666b.1
        for <kernel-janitors@vger.kernel.org>; Thu, 09 May 2024 03:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715251660; x=1715856460; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1rUGSw1BOvy4nSCnLDtXwjmmz6sz4Fg4JvkDjn2tH+U=;
        b=vq3JmpyhZRc3TR4cEjBGRDbyb7flDs1B9zCrNJi8ceyjfew37YYFlILBv7Y4aOX3NN
         QzeIZuLN4JjUglakAYoh2qa0uWv7E8ZsGChseMCjfvQCU6m8CaERDYjKiFSdtJNOTH5T
         9QdlQPQJuuM3+22NubkXiFgC4RXmot0Awl+etVOpw6Q/UePzy2Nhgokt5n51Zw+uXLW1
         fApW7tHj88rCSIlbqk76hpwS6MdMl4h4JKxU8GGOwur7EwZOIA1d4LhZecY5Z2dg7lNf
         Z31Me0l785CTrTJ602WjYqgMDTEe6z5NHLEuQVyFmydKASh2Eed5LrWKebbClikTIlu1
         K/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715251660; x=1715856460;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1rUGSw1BOvy4nSCnLDtXwjmmz6sz4Fg4JvkDjn2tH+U=;
        b=J8GR+Bjg756uJplcskHEuaHk3IZW8tydg7nBvoVtXJwxVqHcWh051WSVG4JIOPlA1C
         +l1/6tb+6QiAPKgGC8yA3GGpuBZ1p/ifLIJ+XwzZE0cIQAnPoygmvCfQMiy/CCRSWa8v
         cgwnMIVVK7B8c4nQs2l2Y98RPagyl7cW8LvJijJwvTdVNV1HvQRm3H2UOYuljj6k423T
         Qt09bO+M9ztHw+3h8X+Irmq5VlTiB9cVNqxRaElsv4+HnCSXtWRS4I6VYZeIzFpBFWA0
         toK/osiPpfOpD01CAS13feDYllSM6nHQ34RlsSm/xGDvLq4xW3N1Uo9F4jedvs1hx0G8
         ggzw==
X-Forwarded-Encrypted: i=1; AJvYcCU3DYAYd3Xgq9sLf5tPTIeU5Y3MV8lnw/0Baus83U91WqRPQXQ+qfY4AHEaoVrcO/LNvVZl83GBvxRa9IYt3vAYYhve5wwpqpm70FwVqQG6
X-Gm-Message-State: AOJu0YwKkG3zjqqhPBafhcZb4UBCK60Hw0w5aJpvs1MZv8PJavOY5fXe
	ewKmSMoFc15TY4SYpVtskvtPpCDvisUEjOWgGF+fgATgTyUDvrHjmVv9754A17U=
X-Google-Smtp-Source: AGHT+IH93eb6t4ZGZhsfBVUwyJEUTNQ9gpPokGEI/RTskChoPPUKWX5A9Rf3MAwsN76xfbFTLzj1Sw==
X-Received: by 2002:a50:8d41:0:b0:571:bed1:3a27 with SMTP id 4fb4d7f45d1cf-5731da9edfdmr3363456a12.38.1715251660386;
        Thu, 09 May 2024 03:47:40 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733bebb6bfsm564708a12.28.2024.05.09.03.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 03:47:40 -0700 (PDT)
Date: Thu, 9 May 2024 13:47:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
	Neil Brown <neilb@suse.de>, Olga Kornievskaia <kolga@netapp.com>,
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 0/2] NFSD: prevent integer overflows
Message-ID: <332d1149-988e-4ece-8aef-1e3fb8bf8af4@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There is a potential for integer overflows in svcxdr_dupstr()
and svcxdr_tmpalloc() and XDR_QUADLEN().  I believe the fixing the
overflow in XDR_QUADLEN() would fix the bug, but it's safer to be
more thourough.

Dan Carpenter (2):
  SUNRPC: prevent integer overflow in XDR_QUADLEN()
  NFSD: harden svcxdr_dupstr() and svcxdr_tmpalloc() against integer
    overflows

 fs/nfsd/nfs4xdr.c          | 12 ++++++------
 include/linux/sunrpc/xdr.h |  3 ++-
 2 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.43.0
