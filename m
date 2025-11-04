Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91E43064B5
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Nov 2025 10:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762251055; cv=none; b=PSBsthseCpp0/dABMm2rM9hojUDg5Amcf8k62Ilgek9JXmYC/2wj1veuRSWhbg2oBQR4zug5H+ib2f24SqFpmHg+352jIhhLfxnQlgZi79iJ75k6hmxgZToA9rfiYiRZLjNGXkso2EVLd8OO9O1mK4eL9F8Wl8hNlSttxFB6t0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762251055; c=relaxed/simple;
	bh=vphX3sqVulabTSJQXzMXPyWDMPXt6ICj4L0/fNeVBd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNXp4R23e419K4KmVfscQcY1WidIEls7VnnmkrvkGEeW0B4efPBJ369yxtUYhu1JEO2uBxs9T+dIGI+AIAZA/JPqQ5lIxVWUz82pf9fME5Ow6HxmcXqtyy+qMGG3sGbtdCkdAwGSDN9+mB6EAACbJfgFuPIQnKZwnOAOvYkVjUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6399328ff1fso9106166a12.0
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Nov 2025 02:10:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762251052; x=1762855852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQRyYoU8dE0NiQKdt3NAGh+nYpn/CK2YjzQBoDa64Ww=;
        b=k3VPXO1TFIUynmPoJT89IVIPPO06m6NJ1LiOhkqJXcUSZnGfYNEAEcv6dnPhKUPpcX
         HG+Xtj98XnlLQ1Pz7ib582uYTYJfufQBjGSNdcQt7EqoebACcoU/tlYHxK428vMTHOGF
         YcYqbeLlIjstSFAq/Lm/107xTT2+r0Uv4vz+EXInUovls3M063eGVlhzOxjdoFZOX5oP
         EhAP02bZltJS49VxwSyEbvNinfi5+EKaDwb4+3zN1mI7ncGcCxiu9ieSDU6Hm7Y/Ekct
         ySeVnrbWpZy0PGypVnmv2325O3uhFLG8lFFA6VgiPjQo5UNxgS5DJmkSysQqA+ZCLhmG
         rCUw==
X-Forwarded-Encrypted: i=1; AJvYcCXzCaT6Izys9ussTZjkxPtvwexWup3oXKkg1Pcv78q8TnHVWm0F2RsXE8bDoe2Ey57egAhcaTlwVav3f7SVyG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXiF2qQRSaNEihC6eV6MP2/ED4f+q5DMKVAjYibjQsdp22Ij7W
	mQXxK3RhvJ1k4WzM/fY0xkCf+Rz2cSwbUOMxMtKahEmsF5hte00yIAPyM9lptQ==
X-Gm-Gg: ASbGnctMyw+xi9E1VfHDeXOBsmA685j1ovjy/wzdrA9Lleo63V+9W9gZJa6xgfNdloz
	Q/LnluAV0DxuRQmQFM7If7ecwkMheAZNFyJdTOord7vk7PfcU6FDtXxqrchaXV4ocZSPBfhXc9M
	llgwUUWvucwVV1XWk2eNiC4XBd/yFrHxlUX5atj+eBeS9bjqubmr5du6B6VPgSScdomwsmigFfA
	Ua/7c14bfXxd0fnHYvqzKFxot77O8L53Qx61Au9HAVKxMVDGOvPquiOTEhSN7lsmMsdPi06zT7g
	stodP5xXiXc4jyvYdoLDobDITFW92aaJzVVpnmRUYbbxijDbxx41vWLvxOBZu6DG0j0uji/oZxp
	RLkZFBmuXR/ebbgDYzdSUevA8OAhEmptbxU6hPLD/KDNPN2D0DUlhD/+rny/vFdbXyw==
X-Google-Smtp-Source: AGHT+IE5n+W7kuHxaU2GI3gUJHfZsywJ1XbuGrnd2U3e2o1L03zP/wQqsIBEVZktbbdno7CzDzzZ2Q==
X-Received: by 2002:a05:6402:460d:20b0:640:af04:d71d with SMTP id 4fb4d7f45d1cf-640af04d8a7mr6788744a12.22.1762251052101;
        Tue, 04 Nov 2025 02:10:52 -0800 (PST)
Received: from gmail.com ([2a03:2880:30ff:9::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a70b50sm1688166a12.25.2025.11.04.02.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 02:10:50 -0800 (PST)
Date: Tue, 4 Nov 2025 02:10:48 -0800
From: Breno Leitao <leitao@debian.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: a.hindborg@kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] configfs: Constify ct_item_ops in struct
 config_item_type
Message-ID: <3non5zhg364r3hajwl2td5xrajjy24drb5ehd3jdvuyjxhhff3@eyl5m45wlckz>
References: <cover.1761390472.git.christophe.jaillet@wanadoo.fr>
 <f43cb57418a7f59e883be8eedc7d6abe802a2094.1761390472.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f43cb57418a7f59e883be8eedc7d6abe802a2094.1761390472.git.christophe.jaillet@wanadoo.fr>

On Sat, Oct 25, 2025 at 01:15:38PM +0200, Christophe JAILLET wrote:
> Make 'ct_item_ops' const in struct config_item_type.
> This allows constification of many structures which hold some function
> pointers.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Breno Leitao <leitao@debian.org>
