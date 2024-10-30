Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6B21DFD8E
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Oct 2024 07:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730274207; cv=none; b=a14yyXif4sP6rDWRj01hwEql9i5n3DYfMwA8yG7Qlnktf3coBfaXFEU6rXS3nd1MZQQry/g9h0R/ARo1tuUMlJanZSgjFBwLPdFCqMJWmgtarIZDzh0BY63jEgWBbpwCawBXJp2gBfw/m8t+/Ve2XhZTHrrXGsQO4r2y3VugTPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730274207; c=relaxed/simple;
	bh=aK3JFmOfrvS+WYS31AQmFD//9Yu+/FhtPay7G8FPYAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VK8m3tfKJhZP4UALrK4m904mCLS0iugJTSg++BN9pQko/ZgYyvwuDLAq3rfL9Xvl6myxtsCZzaOCzjh3S+Ac/uakHS71rXietKwfUt/ZaPo+pJjcIyXRZ0c5OmMPlrpxEA5keXb9maIHMVuwPAIcCAcvZQdq0ppGWylrgqoAYao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KuwJ1/cL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KuwJ1/cL"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d4c482844so4220921f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Oct 2024 00:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730274203; x=1730879003; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YArs62SLFVbBhxDoxdcxEnSLD2gqspuosa4yM1X4YqE=;
        b=KuwJ1/cLRQ0MjXwdXU1Ce8m4BEZSckQK/oCW5nP6LYqfLi+hatyMx4vqcKr+9d4aMQ
         Dyn5MSlzNNqrDd5ojZN0J3Z2fXoJRgO9v72L67vZwePcVgNNWuBPf2lUEaBJzrpkkcn4
         jhcj50MeZIYfv2orqJla9fxGKAsPZKh+zc+3vmjRao2eaUUFQTQS8n/cNcUExjGUTslS
         8TUHlnlp2cGOBfHsbE4VZKeCoPlFUqqOGYILO2DlU7YNKRi2rwz6ldofXoiR6tGgPFrB
         Tt/2gWDQVa3msN6OIb4XAzqLvh34qu0k2tHiSuPtYCzn2IJ5WSnVhhbirzhnzXEzCPc6
         f/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730274203; x=1730879003;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YArs62SLFVbBhxDoxdcxEnSLD2gqspuosa4yM1X4YqE=;
        b=c72ZmV6TEkarQIabSzxG28fEY3GsdSC0DqBjWDfvhyXJ8RV0Th9Q3YMRpOX/k8q321
         bBq3XXfvqO/xReWdyGtJ/8wEqjrDhLhg2xCFrYTX10gTWXpdlLGQL3KhPJPK75qvv0Mi
         dW6zx5UI6RXukWTzP7I9I1sg+wszBshKxagRQpVReMatkaH1MoFSb42478rCeIcJywpg
         65X9rP0NhIMpAoxQeYIVuKuhFM8BI/UrTBwuadqxiEBjwlK03kFhQmOt81x+FtgymJh2
         KcOkyK2pBGXrrw4L43sSCwsu3HMGvSlFxVVxlny+0sVQxZb1RhdPp+fzxsyPV2YrN9Qt
         fHbw==
X-Forwarded-Encrypted: i=1; AJvYcCXOeHrW3QbBfJ9gcm+G7NMlaJHUhkQcY7xPtnCrK9OBWe+jB8Fsv/rK/t1rd6nDmIzvRyYQfvPdddHCaFHnMZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkdZ/U1rw0N1yxxjRYGDjLYb+Rnko4vJHQdY9pb7xYFji/+2jT
	nh3TjN0WtkNXTZIrnqYormejmaQ8xqM43AiOUKhC90vTpxm1yo/zt37T3c5UbZY=
X-Google-Smtp-Source: AGHT+IFWQRjUTiGM84bWIK7VbEw3CFseHHrAQKgIOZUGcHD8dS8vTtszQXMb8MBg3SYqNXqy5EEvLg==
X-Received: by 2002:a5d:4c90:0:b0:37d:370a:5248 with SMTP id ffacd0b85a97d-380611e0c2amr10320365f8f.39.1730274203431;
        Wed, 30 Oct 2024 00:43:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b479ffsm14591895f8f.49.2024.10.30.00.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:43:23 -0700 (PDT)
Date: Wed, 30 Oct 2024 10:43:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] jffs2: remove redundant check on outpos > pos
Message-ID: <a81d5fbc-e66a-4de0-a015-e9a6b73c2ed8@stanley.mountain>
References: <20241029222015.3069873-1-colin.i.king@gmail.com>
 <cf07a880-1429-cc75-657e-55b32841cc00@huawei.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf07a880-1429-cc75-657e-55b32841cc00@huawei.com>

On Wed, Oct 30, 2024 at 12:45:42PM +0800, Zhihao Cheng wrote:
> 在 2024/10/30 6:20, Colin Ian King 写道:
> > The check for outpos > pos is always false because outpos is zero
> > and pos is at least zero; outpos can never be greater than pos.
> > The check is redundant and can be removed.
> > 
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > ---
> >   fs/jffs2/compr_rubin.c | 5 -----
> >   1 file changed, 5 deletions(-)
> > 
> > diff --git a/fs/jffs2/compr_rubin.c b/fs/jffs2/compr_rubin.c
> > index 556de100ebd5..9854253d0108 100644
> > --- a/fs/jffs2/compr_rubin.c
> > +++ b/fs/jffs2/compr_rubin.c
> > @@ -276,11 +276,6 @@ static int rubin_do_compress(int bit_divider, int *bits, unsigned char *data_in,
> >   	end_rubin(&rs);
> 
> Maybe this check could detect the overflow of 'pos', I guess.

"pos" is a number between 0 and 4.  It can't overflow.

regards,
dan carpenter

