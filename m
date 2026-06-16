Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52443335081
	for <kernel-janitors@vger.kernel.org>; Tue, 16 Jun 2026 17:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781631351; cv=none; b=AtdViAScpVq46KhUeELopbX+ppPzv3gHn3WWjTPR1MSFYl4V3hXRjERlIK6Op8p8s7D84bdLSsgMLv04WH8lqeGhXuWS/M1kRA3aNZYklHOFE9biBMxOi0ZPvustc/bEA7pR0jxnzUXk6mHRLg/28tOWaTEEKRSBmyCu0gyqNis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781631351; c=relaxed/simple;
	bh=8SwKPdk8lv3SVVHS49D/4N5bvuIvm0lP0uTjHPWXmR0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjEsMd87taTU7xjPMPEP5UPhY2cfEcMfFas/VfjYOl7tMpfT43Rpg20Clj8PWCweMovuFIZWZTwSNBU26/VUf+sKUVzO9pW5xN6WAM6Ku3WV/xnpbKkFp4pI5NXeAW4YWow9uxAKu2m9wN++Ev/c3codNNc+jfb3n9aU8pkdZ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UN01oS0s; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UN01oS0s"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa68d9d4a3so5475141e87.2
        for <kernel-janitors@vger.kernel.org>; Tue, 16 Jun 2026 10:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781631348; x=1782236148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KbOx+LMEUy3q2Z9BniGOiSIrdAZxqD3imqYDZwzy27s=;
        b=UN01oS0subU+9pYb5w27aM/RFbBFdnZXfz6bUi2CUNCRXh+fqW/u38Quznx8sVHf+N
         HMfNgdi1mvncTTQGAhIexFi8o8WJSISVPVVKPMgHS3itqcIhT9U8t3C/7aJhdCWix1U8
         1NZpYuDhqW8wfMMM5zxbz7MSzPr6OPBFbnZnPfyE58GtPaUhd65srz7ab/N0lvzGUR6K
         F9pC/Sr8Kf7xGlhHNEVGU45TmcKLaHybZd1BzmPJIsZOsi3HRkt8dWS+jVazPMJeLbA9
         ylMumgGd3WBj44wyJY0US2UJrGp5QnA2ALnIw43m6O3+jUjnPMmXwe69xAHqiWpXSuJ0
         /NpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781631348; x=1782236148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KbOx+LMEUy3q2Z9BniGOiSIrdAZxqD3imqYDZwzy27s=;
        b=Kt9OZm3pG3eD8O11tGbwRb1PIj6QwRV188N1bKxY7CpeMw0w5MK+7NbKZgljU1obYt
         zGsEo9dznZUqGbAIaRwbbGCHCJ6bSCJDVmEdbZf0Nd0IviyBzOcOcqQL3CPphlN1YWC8
         /ca3Srl4rWoYyfJiI/xsmZYNYczxfzMUHnPafjIC9pjD/xpXdCzeuaS3vKii7RMIjGCa
         R2VR23oEwJW76Y5TMv9VYYVHsKwE0oOlcvVC87DAzVMQZGXMsgXP2r1Gzr6zRBhqoSVC
         SaPeL2o08NHXRLQnXS5nsxLFO/iezSsxkjnoA2DB/qx1GsEHeomZes1a9LYa5vK9AlAD
         aqgw==
X-Forwarded-Encrypted: i=1; AFNElJ8w/NYysF/UtRf3k3iKhN1P/roL/BQ6bhSkfox4XTnT/eQCanOttZ1Kdv3YlazWPeb0khF5Ut8dwol1M0j3w9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS/k9UzJZ5XYAKK79oIg2AXCAgNaw62Am5icyNeclMIHZ7Y9Zn
	I7asfyD/aZKIxpdhEBRGZwLHg8mv1fu2qmsJk32cstEr+UD5O5ymx8SB
X-Gm-Gg: Acq92OEp5nRbmdomCTLfJPE2q3dbS7we+xDvJq2fRrJKN0w21nV7LtdkCSTPfghQ813
	T7RXc1+PKAH9u/B0u4fxi4f5FjC01FCf349Dd2//PpFaxLMHYaJpuwxXVqkckmleQazN10d5+Vv
	rbqJrm+zEx0M58jWVR/eHitthw9lz6QVF7+ct2+b87QrB28NddegrNR+q0RfU+cF7FIK/83g/F0
	bk3NDddjPlLY1kxYFmgBp1l2m2altrogHo5b62a8RylbnVjYBxhmB3ZT6JsMm414RKtMUiEj3z1
	tD0r2m+JlMfNJV9R6T22znRFw78TQHlkKMfDzLnmO8ADzbJn5IQsmltqF1f7QB1Y7Cjppq/G1HQ
	6vcaOh+VXk1t/PQASqBfpDWon6C3dHRr5NZC3hatF9SdHg1xxJqxXVT72cbW3WRHMXZoU1JHXgR
	MtsMAXxB9aid5ppNkakrf9zIL2resAY+V7CTnAsT/4DLfFgF3r
X-Received: by 2002:a05:6512:66da:b0:5aa:659b:2a96 with SMTP id 2adb3069b0e04-5ad46fbf967mr115311e87.23.1781631348300;
        Tue, 16 Jun 2026 10:35:48 -0700 (PDT)
Received: from pc636 (host-90-233-213-1.mobileonline.telia.com. [90.233.213.1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e162008sm3762252e87.16.2026.06.16.10.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 10:35:47 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 16 Jun 2026 19:35:46 +0200
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Daniel Axtens <dja@axtens.net>, Uladzislau Rezki <urezki@gmail.com>,
	kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH] mm/vmalloc: Use more common error handling code in
 pcpu_get_vm_areas()
Message-ID: <ajGJcjK_qknoKTys@pc636>
References: <453375c4-c3ca-4e6f-8880-0e6ff3c74ee3@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <453375c4-c3ca-4e6f-8880-0e6ff3c74ee3@web.de>

On Tue, Jun 16, 2026 at 06:14:52PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 16 Jun 2026 18:00:16 +0200
> 
> Use an existing label once more so that a bit of exception handling can be
> better reused at the end of this function implementation.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  mm/vmalloc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 1afca3568b9b..21a890586fef 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -5198,9 +5198,7 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
>  		kfree(vms[area]);
>  	}
>  	spin_unlock(&free_vmap_area_lock);
> -	kfree(vas);
> -	kfree(vms);
> -	return NULL;
> +	goto err_free2;
>  }
>  
>  /**
> -- 
> 2.54.0
> 
More removing then adding!

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
