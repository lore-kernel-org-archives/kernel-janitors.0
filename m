Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B0B156238
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Jan 2025 11:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736163345; cv=none; b=bG9TmvTesWPuTWHcjuFYF+uv23OqDvc7sjWl1w+IswA4Dsrgw5ECSMQaQcr7B+rgSVtKnXN63wA6MhXoOnv2RBs3BbQQGVXrm94F5vfyD+Mn8g2FGKRZbt3C5lal3DxwpFNOAIbXThVZor0LacCmU4ulGCgyJ4gnGm040QiQaAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736163345; c=relaxed/simple;
	bh=h9x7fU3zMZ3O9SaobNmcIu72VxHRH47G5BsxrJmlDJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTd0FMc9pJ52axYaPqf3Er2NMcXOYzJhBuQJeVbQ574ua6jjqdbhn5JtmMZwChnpSqEkl5EJxI7QgSlehwYr3nI6gZvVMcphKNeHWVFbkxqpcjT8BnQRiXDQzKsIXCPOTNQq/p8YTj+opraK3+sqNlWB43B/Y1dBKe5VAhXfK5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yReKwwIl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yReKwwIl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4368a293339so109567365e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Jan 2025 03:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736163341; x=1736768141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CxVlOv7MRs9GINJz5QT9QdIbM+9oFglvGClM+Y848Rs=;
        b=yReKwwIlTTKtclaM8Dxg9zx6LJLkPXbM8gtmgYZx3Yf41JwnRr8mI6AOTXnzFFhEOn
         +hBTFAmmRjbbWKcLKRGk7q30E7c0XQjKEH8J6B10dI6APZgjHIhUmVCSqZfPr9OWKPMk
         AQaW3r/Nmkzb2SmYG5jbFmX9KA+P9mzfHDQG1Ysc5/RfX+Mol4wd8NnY+DYboeu0HAO4
         VooCyzlKak5seO2l0tPk1nGljqv5MG0TNFdPib+z1miNsBQsmKfEjRaOM4l+D5MPaJfi
         FZVbqQZOu+WxvJEmrCDzMBPQGFZ25I1+cmxnZgc4UBoC70H83u3c40KrWIhmQvXjS1Y8
         QJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736163341; x=1736768141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxVlOv7MRs9GINJz5QT9QdIbM+9oFglvGClM+Y848Rs=;
        b=Oqs4IqgjGpkw3pX/1bBMJTi7uWNbstnZyA6e/kFXNEbi95QxdfVMNXaJyEbEV7Wa4i
         oQym/oNsSuCF/2/o8LKPsv6+SMEgHW/+Av3ShhYK5mfiWqHOjQAPUo3Mz6Rtzge1gUdG
         j6DCf/gvslp0t1oPZAzpterbW1MdiCvYVCIB6iScwmUvjbMeKQJDoJkymLTbq8NzIA+a
         5jtSn41N81nvIgnW9zzKKW8PUBvil/m0uxg8PYvPKcrEox+K175ky4XqrV6GDnUl+bFg
         7GmG/Qv4MYOslSOsPAF8nxi3Kj+AZypXyyZXo7A12pilTuWNhcDbXnVTgZnuhGkT5KqU
         lUcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXddXmYsIAMu5kYFpqPDEbDL+0tPXtKu1y83ySgvj7fHU27Gzl5bCB9W0ROm/FrYuK9JIH9nMzWfesRSUORWhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPG0Oiv3c1YtBOMe4oS1RT/mmgvXnuUNr/wAKbJ1eoAqWRdNyn
	PFh6eA+KAlhpA+gTRtoq0+Jo0jqSywX70jw1/ZwhWOWGNo6jFfzcenUmsNIzacw=
X-Gm-Gg: ASbGnctvQgWZAUWNcU3RIvG8Tl67uIz7Wz+w4LvZnXY+Qm8QL1jbc5VwXHI5h4rVg/4
	8rtBIqTAw1+BsikLlxbyDuWTRoAOgaL3yIujERmHo9Iwn4ghSmgDDIEjEjgqlY39N2D7vK1coto
	UzIOjzxvwF3r0kk+8VSPdBvOi/DgS4+SMAfHo1opQ5aCrs4dbxZEvyQVNq3Tj906vxrWE70ILgI
	2Xil+NsEIvn7j/8NciteaobBjHJUmX6Ilh3e7b/WD14KuWz+piJ45fQ6PRPww==
X-Google-Smtp-Source: AGHT+IE3U13MuikEBJhPkofq9DztLszvAkOREJWx5lHij9sjXdSLNKb8luysFS8kXjLfs0Q3ROwVhQ==
X-Received: by 2002:a5d:5f56:0:b0:386:1cd3:8a00 with SMTP id ffacd0b85a97d-38a223f5b41mr56111928f8f.40.1736163341471;
        Mon, 06 Jan 2025 03:35:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8474a9sm46997867f8f.52.2025.01.06.03.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 03:35:40 -0800 (PST)
Date: Mon, 6 Jan 2025 14:35:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Alex Tomas <alex@clusterfs.com>, Eric Sandeen <sandeen@redhat.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Andreas Dilger <adilger@clusterfs.com>, linux-ext4@vger.kernel.org
Subject: Re: [PATCH 1/3] ext4: Fix an error handling path in
 ext4_mb_init_cache()
Message-ID: <9383bdd6-ac04-4a14-aec1-bb65b67ace75@stanley.mountain>
References: <3921e725586edaca611fd3de388f917e959dc85d.1735912719.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3921e725586edaca611fd3de388f917e959dc85d.1735912719.git.christophe.jaillet@wanadoo.fr>

On Fri, Jan 03, 2025 at 02:59:16PM +0100, Christophe JAILLET wrote:
> 'bhs' is an un-initialized pointer.
> If 'groups_per_page' == 1, 'bh' is assigned its address.
> 
> Then, in the for loop below, if we early exit, either because
> "group >= ngroups" or if ext4_get_group_info() fails, then it is still left
> un-initialized.
> 
> It can then be used.
> NULL tests could fail and lead to unexpected behavior. Also, should the
> error handling path be called, brelse() would be passed a potentially
> invalid value.
> 
> Better safe than sorry, just make sure it is correctly initialized to NULL.
> 
> Fixes: c9de560ded61 ("ext4: Add multi block allocator for ext4")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> 
> The scenario looks possible, but I don't know if it can really happen...

A pointer to the stack can't ever equal the address of the heap so this
can't happen and it should not have a Fixes tag.

Setting the pointer to NULL probably silences a static checker warning
and these days everyone automatically zeroes stack data so it doesn't
affect the compiled code.  However generally we generally say that we
should fix the checker instead.

I've thought about this in Smatch for a while, and I think what I would
do is say that kmalloc() returns memory that is unique.  Smatch tracks if
variables are equal to each other and unique variables wouldn't be equal
to anything that came earlier.  But I haven't actually tried to implement
this.

regards,
dan carpenter

