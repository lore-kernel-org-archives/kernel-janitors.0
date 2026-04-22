Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FAC37DEBB
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Apr 2026 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776864262; cv=none; b=Lnt/uvh4hGEiw2OHtQjSpmWL8QdXtQXl8JlGODCcXcUwjLx9qFLzH6dAdhn31d5NSp61YwS/UtCn+h+9MYoLZODGGIT7wh0sKJix0/9s//zAHMxNReflNsFhYDXiEWmd37Mq8h7lf99cKbE7tkOzwGTrDdG3T69EJGRYaO1kc3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776864262; c=relaxed/simple;
	bh=vgxoIN557nDFvzI/TTrbPnjmb1JV6mfBHH85hdg3Vag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUoiyKfFH5uwPfR9IxigxU3YZ4Y1nlG7cn70x0qeerhyJZIeMb7tmvDxZc2PT9PS1qYU5bsJimDGAAL7IWAqmNYNiGtdxyLPI+mHb0ghcKUl04r7w/cxrCjsRD5/nNtp8AJmuWXrkJYlNZhOfBoqHAnTdvRknriQ5eiYVK4IXUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlnqBRvx; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlnqBRvx"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79ee5037d44so72256997b3.0
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Apr 2026 06:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776864260; x=1777469060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oy65WrzLsyhPH4xON3+ggQSwKY4cV96EkJ63SIR9TYc=;
        b=YlnqBRvxMe8d8c2SguxtWdKgtb+Mb6lpObECA+l/XlFqXJbIxJ2S4DWw9HoBeUlMeZ
         rMWROTKh/OiWcec5GOprJ49Xj8q02QP4QRatMDYasQLtJe0CSE8RJTGqQh//8QSOM6/O
         68QMMSrHCbiYBtVmfwtS6hdOjre6MCrtUA/+IpwD9IGqz7qQPQlQbas25rfJso3omMs0
         uzMAjNVEDkQJL1ZaExop0LLk69O1fo8K7nqoDihwmhJPNCUSTRHlAXJ3axAW568SJU8s
         /ucimmu7Cs/DOOXN017Iy/qXTyPGZLwluBBQj8gTdOrSAIxGU1Odz5aALBnrKwCF9aPp
         wWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776864260; x=1777469060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oy65WrzLsyhPH4xON3+ggQSwKY4cV96EkJ63SIR9TYc=;
        b=sDS6ZgOTLJG42yZIzsFyvsi9TVdmz4XXBK/1kIjfyZQRvi8G+fEZk6Ax/lCLa8F72P
         L/1IjPSJMCQCm9UcW1DwPsji3kMB4oYz3ZPvmcN9X+gDDP8NGJw0EestP4UWIC/VWHmL
         NAzReUPsZv1oTOxhR4z3KAhRrNmPpRFmMAjyJkN/GkpQQCk/4JerZn/Z9RoCSZ77hvO0
         31a2jdASG/T7/f/Inma3xT3VsWYVvt17QWyCHI8/OtZGeL9IKiZv3UjAdo0fsgF6lwMZ
         ZKPDIHW4N2Sv6ppuKKFqGAkM7B1xHAK//42shlyRS5eO9WHKtZVX29eTQhmeMwCb4UGl
         PTWg==
X-Forwarded-Encrypted: i=1; AFNElJ84j1IDppY46sANvtjY/+63FMKGXnZ782rfBC8CSj6jXrZr2gWHdDR7+9eTslRwaIf5Cuk5AcUhM+HLe8eoqjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyIL1zjWhsXjPzxx8piPtTliZ/Ou2X/yyPiMRdVSHS/YgS/iXQ
	PaLhF9mAJrwJP6/xbW0WdS9mqOB/7CCsxaXaHvUa+EGg6p50qwqwdPtH
X-Gm-Gg: AeBDieuV1jqiz9z+5zgSgnua0xHEk8kbqfypGOLeUP/VbKDEDKSzsm5QBCWa8CAJm2v
	cffBq4/K9z+mC5C0R2pD7FRYmNSIe1C8pbt7YtuTnm2F1kUwHd1dWetoGsk/nGV6Yf0CHCfeR9l
	zyJYn2BbLPYj5zGC7/8H+QML909S5+c36g1iuJvGR5T+65U1X8VBOFHOAHzVZMsqCWzf/6eQl4d
	BypDNeap8vSAHx5jKsVjs/jqHtGEinaKqzBMmt2wm4bktE5WYCbP9RtTn7exC1kH+n4yoYIIB1Y
	fB9sF7WYda7q7Hqt1QoPj/mhCXpRy0/+OHle0cY++y/3/IXOQJGAzKJk5FJwYmH2bqG1TD7+jw9
	t9omNMpcEWCKtYcQKhAgX4lwZxk5yl+Ffg0Ph2TAXCldaGsTu6iSWVQF30CkVFtR/oYXRj5SFoS
	dIlzXEy07zzyWrKdmLS9OXjY/ibuWI
X-Received: by 2002:a05:690c:11:b0:796:45d4:9e55 with SMTP id 00721157ae682-7b9ed3d2454mr162986717b3.15.1776864260449;
        Wed, 22 Apr 2026 06:24:20 -0700 (PDT)
Received: from localhost ([172.216.252.13])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee9ccdc4sm67554937b3.43.2026.04.22.06.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 06:24:19 -0700 (PDT)
Date: Wed, 22 Apr 2026 16:24:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jakub Raczynski <j.raczynski@samsung.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org, przemyslaw.kitszel@intel.com,
	anthony.l.nguyen@intel.com, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] net/intel: Replace manual array size calculation with
 ARRAY_SIZE
Message-ID: <aejL_upxRzEZx3qG@stanley.mountain>
References: <aeeFh1zQqhVysvxI@stanley.mountain>
 <CGME20260422105813eucas1p1a59a07ab8c1ac0c4b7eba37d509f69b8@eucas1p1.samsung.com>
 <20260422105710.268003-1-j.raczynski@samsung.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422105710.268003-1-j.raczynski@samsung.com>

On Wed, Apr 22, 2026 at 12:57:12PM +0200, Jakub Raczynski wrote:
> There are still places in the code where manual calculation of array size
> exist, but it is good to enforce usage of single macro through the whole
> code as it makes code bit more readable.
> While at it, beautify condition surrounding it by reversing check and remove
> unnecessary casting.
> 
> Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
> ---

Thanks.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

