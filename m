Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505FB3E0243
	for <kernel-janitors@vger.kernel.org>; Wed, 13 May 2026 08:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778661942; cv=none; b=s/guAW1d8cE1snkMqVrZ8uDx2mcLrOmaMs+p49i4heHdPXO2wfE4eQm/QYRFHAMXUj3XMzLhVCHr7z4o8m7Uj9aBXGNwrqDcFBPZqEfrEaLDhQy6/0cPdbcAbV74Wbx5uHsiL5MVhyPtel5gFnTosiNklYnaB0zoptgujsSyY6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778661942; c=relaxed/simple;
	bh=tfN/A+uXROgRjiThF9EntiaA+7j5yrGR1abShOaAWK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQGDAMqpaay90fi7b6AzRgHP3wmgXHPBHQ1bpiHKPzaEjFvECmPFr7izpVrexb9HH4tOng+tzr+d+bFp3u24voW0kjOmUlOd4jJtJChdgnUC3+VRIbPUs9dSAu1ErHyRWE09wFG33SxWMJcvZK3OrFaEGzgx9RWUAeMmv42cvG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D61H4M4u; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D61H4M4u"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ad135063so52114955e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 13 May 2026 01:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778661938; x=1779266738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z0pInp9+f0jBzXEvjcT6WxyKGA/EmTFO5uTJw4bcKow=;
        b=D61H4M4uK1F2tgAe58pqxX84QGlH9hV/utKxgdiLlTtiyNxGgRzdUDMQdBQyXF6VRg
         AX+bnqb1vmBdF4ohqbToRHvJt+DZ81l7mW5tSKGmcRXHOaJGVzYB0VXfpEaDwA4FH6M2
         m1AbDlAljSMkbuhjujWqgRfkZnqTYZDpHw2NlxgFNRjoNq5wIG6oS7MUp13M1mWpbr8H
         JFHmuEFmGnozaXYvpBblZXfCNrXcEBdzwkp6R2/o1g3Iwt1ghNo/hGR2UiHblN8wEMlO
         oxPoKhQuooJu9F3fNGM6dfZND7+OWLgQD49eyF/ek95R0j9Vtpg54cYc9p1pup7Ha0xk
         Eqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778661938; x=1779266738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0pInp9+f0jBzXEvjcT6WxyKGA/EmTFO5uTJw4bcKow=;
        b=B56vLfi9v3MQ3NQHrvgGZ2MYN3RSPI7+LlVUf9vvP70KC+LDfsBLHumwETCZCv4QaT
         dx2xZX0Y5hcGUTUqNFPRVe7DHssTuaR0kxz7PsVIBlQ9jM3mm1Bjj7hH+xIkKZ4Dr2WN
         o28eVh1q753pPQvvuO8SaYmIhxD6ah9ThV6EUluQszrWe+LKe7R9RUD399QPd2IBCfPm
         wm2/+Lwnx1s5tocJfLowWGiuQiA74880DVDwkHXUgCbiBURjebP8ucxGfbt3VOeITisQ
         lC2AyNo94I+Uklbnkn1i4GaCRsfKroduf4CEAG4UonAa6BVf7hSGD9kc9GI+fBo6gjjq
         0dzQ==
X-Gm-Message-State: AOJu0YzGMUfqrD5Yyv+D5wmd1nktvc7fHTiHF/ep0An6lZjuatioxidE
	NWc8BalYwFUsEr+toCdlKGcne5w2/eRDR0895wdsBJsIeJi8VvkzWDbeO/kDPw==
X-Gm-Gg: Acq92OH/ZOO5+a5FltNAhNuEOZAtLha/8U48e0HU87RxoPy/8LKt3H6yzMH1s/dvAPc
	ZJbZUiB/XC9ZAvwMB5vO9g5VJY0erEjbEGk0msZMvGYMOOGNGBRn7JgVWWtHY/+g9Fix1wjd+Z4
	g/1feGcSklNLAiQYGg9iQ/3d6lrnI1j53HVNmlCN4YuvOA+aZAdZFKjN+4Yoh5D/DDZBIsI79kh
	iiXbu4vyM3qtVPfqdgmqYDH0GG0fKVQrXo8PsVsezrragJJFA/UTT3375RqqIQvEBQ+5bsMgVxM
	BfUw9DmHThgeADAnUdVMUzJGNJUZLRvt18ueU9NKXJuIxdLJ0ep7OP0Uf3/ffENg8oLda/FpJA2
	Myrp68Xi2XyDKVry15dHYxi6gQI3u2f1HZzSPwjaPZVzG9ZoRn6fDVP+zuENoTnfiJf4lNg1Rsk
	dlu5AxxnjeWgOR9JVBvOY=
X-Received: by 2002:a05:600c:6305:b0:487:2439:b7c8 with SMTP id 5b1f17b1804b1-48fce9b58d5mr26970435e9.1.1778661938352;
        Wed, 13 May 2026 01:45:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4549130549bsm40128600f8f.18.2026.05.13.01.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 01:45:37 -0700 (PDT)
Date: Wed, 13 May 2026 11:45:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Antonio Quartulli <antonio@openvpn.net>
Cc: kernel-janitors@vger.kernel.org
Subject: Re: [bug report] ovpn: implement packet processing
Message-ID: <agQ6LjPwlIaLbJ1b@stanley.mountain>
References: <agLovl_hlXHNhnLi@stanley.mountain>
 <aad4cfba-6781-4a74-81a8-9fc635f44aa3@openvpn.net>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aad4cfba-6781-4a74-81a8-9fc635f44aa3@openvpn.net>

On Wed, May 13, 2026 at 10:41:40AM +0200, Antonio Quartulli wrote:
> Hello Dan,
> 
> On 12/05/2026 10:45, Dan Carpenter wrote:
> > Hello Antonio Quartulli,
> > 
> > Commit 8534731dbf2d ("ovpn: implement packet processing") from Apr
> > 15, 2025 (linux-next), leads to the following Smatch static checker
> > warning:
> > 
> > drivers/net/ovpn/io.c:207 ovpn_decrypt_post() warn: variable dereferenced before check 'peer' (see line 148)
> > drivers/net/ovpn/io.c:305 ovpn_encrypt_post() warn: variable dereferenced before check 'peer' (see line 304)
> > 
> 
> Thanks for this report.
> It is valid and I will indeed remove the NULL checks.
> 
> What/who should I credit in the Reported-by tag?
> 
> On a side note: from time to time I also run smatch on the ovpn code, but I
> haven't caught these ones. Any clue?

I'm doing a big re-write so there are a lot of new warnings (mostly false
ositives from me breaking things).  It's going to be some weeks before I
can patch it up enough to publish.

regards,
dan carpenter

