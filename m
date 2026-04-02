Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B903E5561
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Apr 2026 09:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123458; cv=none; b=HOYuZe1Es5gY9G0KKnbBCJPxblLSY4Jo5mchZRO+jzjqleOehdhCTe5BmQj7oGRVWzHgMkcyTk0p6HiruYcr5KtZO0oiLzeX0twqFfvaHytZhQeOYuenAXOkwQJypG346oUevl6VyAMaJEPIaO65ZIJa7qhCVj6s3L0wbhxf8ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123458; c=relaxed/simple;
	bh=i8xELImoKt+NkSPmYN2Mz0gHpDISMKGrccCD7ZDIqZs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=CYWUW9XBHNffef7HnMHu9Zl7qwZCDrsBnQdNBuDJY0GTvMO020zdcztSSC84lP5kFsOpPXxCkFiAsxqBkuBhrANrgYZDXsTXO1J8VDoMulpfBAig6u35dkGpv8JBgV/I1z9IUbqFBKhbd/t5dDgosUF7VwG2o/kKSKnETsHXCWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXbVjd+K; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXbVjd+K"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38bd60d7a2cso6496941fa.1
        for <kernel-janitors@vger.kernel.org>; Thu, 02 Apr 2026 02:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775123450; x=1775728250; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cesA+d5sjjwb+YlTQMQo7Z/YYAmTyVQLSN1pk0dWYE=;
        b=FXbVjd+KuyIzCY50uWy6piSgnKyMpMfUJFjtjVRVaFri42pJLN1ufE4/5Dwl9dp9tO
         QdxPUHSZFz0TRScVXIYuP++g1qoSL5sij1e2LZu3BCNqSVPgA/zug+/6sY7oHG5J7xow
         Nr3lGRF0JqVbjtubii95hHgg4f+n8StFYa0ilg8mXWiCBmLgHJUtMfwlMY08s5Xh+nXq
         x1XvA8V44/uhUy/hrl1v0XXvLKfaOxFNcJzPPQsWax6IZO4lDRlewTsczDYvE2fQdrA5
         ATMZAJfzwE5MlbgA94U9SrL8LxNlJcL/U/zbZjjypWMkXmEJiVWy/8tUuFEkEE/NH47S
         ChZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775123450; x=1775728250;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6cesA+d5sjjwb+YlTQMQo7Z/YYAmTyVQLSN1pk0dWYE=;
        b=YAWuj7WA4D7gCYp9dW9mnWMWBXp4xF9xXH5yfQTlVBQgluYFDUhGFf0iQJO+iPv/a3
         dasLE3HAEd27cNfs9vW/mfcLzUf4vtrM8bUbFNY1f0cLnfHkQNAi8nLMaEhD7Vi4+/JA
         o8CpLdIjFlr+Mj39IIWXOguFsZlwe6sBnVOhyQrKtdoa6FBTUOEKiNLwnIXXzVR6uh9+
         PoDqEP/AvMBbIoC2bQWPkQrzjSVmLuQ+M/lyMIyD5MtDSR1oLDFhp0MTSgi5rSVoizaJ
         ldqEOkbLQfbrDsO0IyRZOGxscY3tJJr+/pTjOa7yi+NqALppgBcBRnOFw1aoKgEFkxAk
         xlVA==
X-Forwarded-Encrypted: i=1; AJvYcCXKJYgVUgmCZcI61r5yFM0UBBUdHLl+duZFRYPpQoLxdHoaZuHAuwKUL+JtPBUL+qU1Gg8/apVXWNclRU8g42Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk6qhLlBFTd+AvuZWa8nKH6pIrk/GEVhoVhcT/vkUxkasLk3vw
	IU04cGWxxPvNuszH/9QZUYhy5XCp2aqsun1KJiTi4nEZAkW3bE3bePMQUwPgq5Vs
X-Gm-Gg: ATEYQzx8C60kbF4g347AbvZCoQd0QTO0MqjhqX3q9QzoCmi7uh86IRvIAQb/2kOCHvo
	/LuknVBWA2K/+5PWER+a7eSD9LqA1zHpUGZ2Tnw6ZKWoRPYB6m3KIHc+lJ468u+SJg7u+QO9jpt
	8MuBWTpV+dYvH46ou+7NptXURqk2w7S2BHh7lqLcEGAQ0rJkgDxvsM7gHZ/uVwjzVj1cJXO/oGZ
	98Z8rkV3pqvFzSZbhzqPZmPu2lThr3EgtWNHyNiA5jzVsH59OJwjgYz2SKq4HomdLvZ2dIZ4yAT
	9Yb41X6SVHemE8uzk4c73AtpniSiWfJBUhRIgjP4z+9Jm6qsPRBPSB1juU5u9dkG/ZqoBiqPbhx
	usQSF1KJZEOz22B+K3v+CK3AFPfBnpZHnq4VCgbNd1ZEFp8ZFufrk8J3eWpgD2PP6WhMkyyGuwD
	zR8rLRdPrbeh0IkAaqYIzGQII8L5Iz
X-Received: by 2002:a05:651c:e17:b0:38c:6a46:b98d with SMTP id 38308e7fff4ca-38cc2f389demr26014361fa.1.1775123449317;
        Thu, 02 Apr 2026 02:50:49 -0700 (PDT)
Received: from localhost ([2a02:aa1:115f:85c8:99af:b9fd:7f92:d8b4])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd2108a4fsm5043391fa.23.2026.04.02.02.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 11:50:48 +0200
Message-Id: <DHIKQUBU2MZS.IOSIJB5DJYJ0@gmail.com>
Subject: Re: more potential janitor work: simplifying test for power of 2
From: "Linus Probert" <linus.probert@gmail.com>
To: "Linus Probert" <linus.probert@gmail.com>, "Robert P. J. Day"
 <rpjday@crashcourse.ca>, "Kernel Janitors List"
 <kernel-janitors@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <888a08d7-1d0b-f114-dd3d-e840f16c8803@crashcourse.ca>
 <DHHT7K60IORC.2DG3PT7PB2OSO@gmail.com>
In-Reply-To: <DHHT7K60IORC.2DG3PT7PB2OSO@gmail.com>

I took a closer look at this. Many of the occurences here are actually
used to check if a binary flag has more then one bit set. This is quite
a common pattern.

Eg. 'if (a & (a - 1))' would pass if a =3D 0b100, not if a =3D 0b110. Since=
:
	0b100 - 0b001 =3D 0b011 -> (0b100 & 0b011) =3D> false
	0b110 - 0b001 =3D 0b101 -> (0b100 & 0b101) =3D> true

The power of two check would 'normally' use the negation:
	'if (!(a & (a - 1)))'

Just a heads up so anyone else reading this doesn't go blindly swapping
out this pattern for 'is_power_of_2()'.

You need to apply some thinking. No 'sed' work.

Br,
Linus
