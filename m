Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEA822173D
	for <kernel-janitors@vger.kernel.org>; Mon, 23 Jun 2025 22:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750719368; cv=none; b=NqW68vA/W6INsg5vfZ9k3t/ivum+KydyLD2LTz2CWAttcqffkz/wAC6Zj3v29sE0HkQX8uCSjzjzG4pYkEigr869pY3zdgb7n2GW1Y8jqQP5leB7tF405Lt3v1URL/Ns0P05+nc8J2PMxIcxv9MIxQVZtN6DUVO4n0VUboHx8Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750719368; c=relaxed/simple;
	bh=gO+eL83KdifAzJPi0HCo9DgdX1PW4Hs4m00dnR5SKys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubm4HfZCumnuM3wAqRPG1Eea4MJKygQb01IHG3tZzs8aLF+Pk+a+s9wls/hnwAsH57gilMXFatGuJXSZEO/B6Ww6iN40bMMS4EiMLhkdJp16OzX6OpYQnWluW3jn5Ew+IZUcK4O2E9QUEN5SJtOlhX3cCJPvX4dj14E3DR6SMp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fK1qWRxx; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fK1qWRxx"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-739dcdb012fso1295429a34.2
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Jun 2025 15:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750719362; x=1751324162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kCYGlmL5zX2bvvlJbBCCxMvXekeyhiCldD5Z4r6oMog=;
        b=fK1qWRxxFk8KoA9+HYzWPLHkjFtZFRBra9lBnYbWdMaj4sWY7PO4Yv4XgdxADr06iv
         15RJv35vb9BlFUgT4Avxvj+Lt7HmEIUuzmY0anbU1z4TiVNB1kUstDgjR0iqF7EiGtPG
         GaXPnKS+58dBGti5EI1tDKWNGYQNSaVcVx3NSZEXtaCrrL1hnZAuMJPmKhnSVd4jSRPZ
         cDW8AtlLCS4QWUBy1LPBlDMEjvean8CV9/2ajPpaZIoWD9///VCoRytUTg55SaiIwytA
         Y0vQb/nia6kOlXTKXSgwxC8/QbXSi++g9Moi0oJjrpQlCPBXXC8FSDNUdiDmCIXjiJKL
         73AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750719362; x=1751324162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCYGlmL5zX2bvvlJbBCCxMvXekeyhiCldD5Z4r6oMog=;
        b=Dx0r+7UTv7L61wGIVgPkPqtHviiJhNrMRf/M6n83Hto/w0zH4oSzeXAundTPxlB+zY
         6YGO6AiXO5f8LBX2LhBV4ALWNGSy5eG5CNHJe8p2tJ+JhZ3l2LTwzGyG8ZE/HsFCl3U/
         v/pd9X5Hf3h1Wo6swfyqAj76Vo4lHUOG/wgy3eyL1oGXK8zQy4J8JwTKMX/pepBxkANC
         N1f4ThqxH37KryiCLNQPlhd3HhJfCn/CbztI7uvmC6Ia9Dz4Jf+NIOCHPDvsSHe5EUBa
         Z2p+aUVLXaiWVkE4tbFMe8ekRGspxJ0cCIsgGq6hxE+mBMoR+loJZW5sd31WzFK3GTcF
         7JNw==
X-Forwarded-Encrypted: i=1; AJvYcCXtxpDbdHo/10v7myRDBYlMbZ5dl7XTN0/LccO52KE6Y2NB4a7Xstpn4G2gI9eQze1vShM6uulGJqlLZCL/Ke0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/jJIyBa82/exXiNj0Dn7SovtjMvKmazbu0AOrWVQp04fEcnmS
	jjyQOVk2SDTbbHwRODTrNNuHMygnf0BUKNbhiwntNUcEKtXRyLX0eXo3a2F4Unv52Ss=
X-Gm-Gg: ASbGncvWpoEQVITz1KL57QT9FZRXIW5RGz68H9DXMSbCE/u+HPUYLA3WBoVtw6lrFj1
	P/fyadtsN/IlcaTTkxkaG0JS/pmOGjkrsXzDyfEWR5uoyxFA+04NtatXENcBJ8r6pp2Ii4X4G3p
	mda3AEOIckhUHqGj3oxgGv4fNyKtECdmXJCSZsz1ZZmSM/i14PjEc24l7occiuOsJVqA9hT1O/c
	0ly0gqmhBeb7Hjno+h0paFplVhzX4rMoMcwk+INJvsa0MFqbhwztYOVgfYDM1Zq9FRToquCveU1
	b3+ibAF04hJW/5l9pK9lrcY80TYnudb/1QbqjlPHGaJjNuFMRvn5hLq7h8YyTq6dO5Q0zA==
X-Google-Smtp-Source: AGHT+IH2qJp3cfXp8vqsQfiwtJzTBVtR00oSUzJTlWLB1sUQjr8uuhV9Ojft3NeNTOmhlhWt7+2srA==
X-Received: by 2002:a05:6830:8104:b0:727:3664:ca3a with SMTP id 46e09a7af769-73a91870a2cmr8528739a34.0.1750719361986;
        Mon, 23 Jun 2025 15:56:01 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a908bc982sm1612798a34.0.2025.06.23.15.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 15:56:01 -0700 (PDT)
Date: Tue, 24 Jun 2025 01:55:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] staging: gpib: fix unset padding field copy back
 to userspace
Message-ID: <30c88178-173e-4432-ab2f-beb26ab9d0b7@suswa.mountain>
References: <20250623220958.280424-1-colin.i.king@gmail.com>
 <cc005697-1911-485f-9c50-30442558851c@suswa.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc005697-1911-485f-9c50-30442558851c@suswa.mountain>

On Tue, Jun 24, 2025 at 01:25:14AM +0300, Dan Carpenter wrote:
> On Mon, Jun 23, 2025 at 11:09:58PM +0100, Colin Ian King wrote:
> > The introduction of a padding field in the gpib_board_info_ioctl is
> > showing up as initialized data on the stack frame being copyied back
> > to userspace in function board_info_ioctl. The simplest fix is to
> > initialize the entire struct to zero to ensure all unassigned padding
> > fields are zero'd before being copied back to userspace.
> > 
> > Fixes: b8394732ff0c ("staging: gpib: Add bit and byte padding to ioctl structs")
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > ---
> 
> The fix is good, but the bug has been there since the driver was
> introduced, it's only just now that the static checkers have started
> catching it.  Oddly/sadly Smatch doesn't catch this one.  I'll have to
> investigate.
> 
> Fixes: 9dde4559e939 ("staging: gpib: Add GPIB common core driver")
> 
> regards,
> dan carpenter

Fixed.

We should still print a warning about empty bits after a bitfield.
I bet fixing that will find a dozen bugs at least...

regards,
dan carpenter

--- >8 ---
[PATCH] rosenberg: warn about uninitialized bitfields

You could have a bitfield where not all the bits are set.  Warn about
that.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 check_rosenberg.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/check_rosenberg.c b/check_rosenberg.c
index 22df8a3e5b64..80e15f2cf5ec 100644
--- a/check_rosenberg.c
+++ b/check_rosenberg.c
@@ -221,8 +221,12 @@ static int member_uninitialized(char *name, struct symbol *outer, struct symbol
 	struct symbol *base;
 	struct sm_state *sm;
 
+	if (!member->ident)
+		return FALSE;
 	base = get_base_type(member);
-	if (!base || base->type != SYM_BASETYPE || !member->ident)
+	if (!base)
+		return FALSE;
+	if (base->type != SYM_BASETYPE && base->type != SYM_BITFIELD)
 		return FALSE;
 
 	if (pointer)
-- 
2.47.2

