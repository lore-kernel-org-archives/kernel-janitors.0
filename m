Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DF3329365
	for <kernel-janitors@vger.kernel.org>; Sat, 18 Apr 2026 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776508040; cv=none; b=QRS29X2gAcnNKSbfNe2bI7VxRMbgfBA1UAkhMo9jnIHlVLKNHhExeIPFrFNJY5H/KzypCI59dLeL20Y2ARmZKtldLjTwwWjeKDexRcbIe8sxKer3uOr/dhzO+zQBD1I6xBErIbKtJk+ty3y+OgiqsMIz2UEZqPxb8d6n/nq8qrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776508040; c=relaxed/simple;
	bh=lbvp+q6Ee1jXl/JddiYXx2sw6/NvDwxJUd93EGYKAco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiZ3NWv44Ta/aEhP3WNS6pKGW1tRXWjNbL63DrTji+fb4YFpoiR/7CcXHSqTZauYYEPTS6WSjadSsVFjwfouhLLvPiXvGqY9+W0w6FfnqcrLRPjvdXhJrat8w4D2Q+LHlWBLyVDi0/cXAolskr+V9Fq4ihZEfQsP+/A9skENX6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYm7z1F9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYm7z1F9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48374014a77so17909545e9.3
        for <kernel-janitors@vger.kernel.org>; Sat, 18 Apr 2026 03:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776508037; x=1777112837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBNI4EdgBnERH0JRaIrNWQCvhm/8BjKu3aOv53OQCzU=;
        b=CYm7z1F9u+ZagNqNK/L5Vu9N3AjMk8Fc0dX20u2kcfsno9rNYrVFHYQ+5tFraTxkI9
         C2VJ2v2NyxV7QGqBSN45+XLyjrt9KmEk7mJTxX9TuY0cHoK80JtwP4UmRFaNHRcBWuvv
         IcTb3SjqQ72NvNkdptr/ANbf0+s3P/YnTcilsHtSqeZgpLJlX4T25G1TzUbnxu6tvqzV
         qFRyMjGz6HKWMOTATsnw67AvQ6h4ZSvL1O9U52OlQEsU7KJw3XFs4xvakW2y3BiEGb2P
         tmPJ2fCtgd4YPfbTEHPtRYQ30rFQZAK+XxJRKvWxebMhekwPY7Y2+vZHhLHqYHz7e7Z3
         tjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776508037; x=1777112837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBNI4EdgBnERH0JRaIrNWQCvhm/8BjKu3aOv53OQCzU=;
        b=Ve/wftvw5VwszDHLXopXTI98vZEhpTBqurJwnhb+mZ0vr96pcYeGwzRQCCfzyEbk7o
         9HTFc9MwPc1z0cB+Ov76ANfvKlRvpq9VAQ/WqD/OcC4xYDKbb47ceZJMK1Kk1VR8pvw9
         BruW1RWIAtqaSweEEyOqrnPL4x0MouGtJidEzTe8cwwUY/9C7zYY6ydhfUR/e3Rv0BET
         kVx4DS7JQb/9ZJqX9Hl1WcDhX/j0pwuDOyz2VuEPS90KK+MZOfj3g6fM+MhGrBW3p4W6
         Rme1NL7aYjwBQrqgRm/MPJc5AyPHy2TlBd1TLkLrKaEmU0Qb5edq5QQjDNRtpswKfouF
         am2g==
X-Gm-Message-State: AOJu0YzW638ierz/Nh3uEciz8ofhs3Vf/gq30+NKIADmFQKDwdBl3odD
	r8+0UB2mmRtif8jV0qIQqMu1Jbw8F9pkNmB3MEaBN7/bNESnJ4nqbB2u
X-Gm-Gg: AeBDieu666Yhv18Qwd2/wVWrfyHwIHpAJ38yYLZWYcD/W0x9yn1TZaN5Mzh9ksv+SBr
	2efeLoHGDKkVyVDxm1xKFUgJSeTcplOnQePK39BkXaqEEg7y9hl43GlzPaBks+kjqh6bRn2XyUe
	aBMp+rL+edlmcwJKwdLOCjWdW/7lwWmpqycbpwJNekfhu5w37CQmKzgKx1Q55oVPNu9dwGdOMrN
	p7Se1EYU9q8eMaIhAFn/7pakWL0t4dzPNCNaZZNGQ5LJVJJbvL9n2+uxfhT+r5+MzfmWbHD97Od
	VkDiHaMs8mToHXgUdrdVskFSR2wMLRiJPU6rj/EFr6dtrIj2pGc/FrbGDaTUkpf7FjHLlRXBLqf
	SfRk6bIjXxK8nNTr3BttwRMvOmzV3ODt0X6B2Vh5iqZdDDuenPZbK9VlaEEFreng3BBbAVDFte1
	S0R4/b3lfjJBJNckZ7Y0xV3slZKRo/3Q==
X-Received: by 2002:a05:600c:6089:b0:488:e192:6fb5 with SMTP id 5b1f17b1804b1-488fb7887camr88648135e9.24.1776508037427;
        Sat, 18 Apr 2026 03:27:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1682sm12499160f8f.1.2026.04.18.03.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 03:27:16 -0700 (PDT)
Date: Sat, 18 Apr 2026 13:27:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	linux-newbie@vger.kernel.org
Subject: Re: [PATCH] Documentation: adopt new coding style of type-aware
 kmalloc-family
Message-ID: <aeNcgSu8kVEyWbzY@stanley.mountain>
References: <20260418093101.130335-6-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418093101.130335-6-manuelebner@mailbox.org>

On Sat, Apr 18, 2026 at 11:30:48AM +0200, Manuel Ebner wrote:
> Would a patch like this one make sense?
> I think i need help with the change log. Is there something to much or missing?
> 
> ptr = kmalloc(sizeof(*ptr), gfp);
>  -> ptr = kmalloc_obj(*ptr, gfp);
> 
>  This one is done. The ones below are not done yet.
> 
> ptr = kmalloc(sizeof(struct some_obj_name), gfp);
>  -> ptr = kmalloc_obj(*ptr, gfp);
> ptr = kzalloc(sizeof(*ptr), gfp);
>  > ptr = kzalloc_obj(*ptr, gfp);
> ptr = kmalloc_array(count, sizeof(*ptr), gfp);
>  -> ptr = kmalloc_objs(*ptr, count, gfp);
> ptr = kcalloc(count, sizeof(*ptr), gfp);
>  -> ptr = kzalloc_objs(*ptr, count, gfp);
> 
> change log:
> [PATCH] Documentation: adopt new coding style of type-aware kmalloc-family
> 
> Update the documentation to reflect new type-aware kmalloc-family as
> suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj() and family")
> 
> ptr = kmalloc(sizeof(*ptr), gfp);
>  -> ptr = kmalloc_obj(*ptr, gfp);
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Yeah.  Fix up the commit message and that could probably be merged
through the documentation tree.  Probably no need to split it up
by subsystem, but you should CC the affected subsystems.

regards,
dan carpener

