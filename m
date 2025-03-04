Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE031F3B8B
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Mar 2025 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077608; cv=none; b=lnMGcIPzl+uV0cpG/UHvO0dHTu1vZ43xl/ZC0AofUJdL42dK6Og5JQAqYPQxSLHlz0k0a9DPJT8rqdhw3ZQ7nOlUsD5YDzB58W/NuBtqU4/0uoPwLlH4vT6t3g6JkGVO4LHgDb5jFt1MZ6S9532WqT9Y1EoploNCWiN2OnJe99U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077608; c=relaxed/simple;
	bh=YK/v+HTjGEFPbEINjripCBl0YEaMvBdXG3vSD9bGu5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NfGkaSdmOoUVSEtzAind9mLjf5Zs+GDCcyfWyK8T08yfcMlcBdlN6sOZRgw+/H2mWDBOsL7fs7d6eCNKznDgyH30bjDnZLPFIazvV21C32CEXA0U3a3PlTn1j8Kyy9tdsRoWFmkv+fYHpGaAyHQYJSUnL43Tfacfiu+2pSrph80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lcMJYJWc; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lcMJYJWc"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6f77b9e0a34so41947887b3.2
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Mar 2025 00:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077605; x=1741682405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YK/v+HTjGEFPbEINjripCBl0YEaMvBdXG3vSD9bGu5w=;
        b=lcMJYJWcyFv/O1o3KqIUHZv9hFomU32mdKnoZULCveMCmgTXFYma84DF+muqVNQ8cb
         Ye8eGspmkhIBsgvhUtb3rpGFykGmTo3RQEeOTatfe9uumuD/gupiV4IVHZ1HlbqQY/NU
         +DOzgujaNkqonuHs2g8DxQnusiMHqFSu0NkTAukXEkrrgpibNQtoCW6Ehqnw1lPLILcE
         TrTSGDQ4vNZr3Jx/QBr/fBMFBVTH//OcnUAVj1md4uN92UFT1UFe4weaMSPVDZBXZJ8X
         KRySWc8JREgxXvUqx1eRtGf1TCl2Ud/xLIj4zi8XImHlK61TgywozZC0mKkmwpHCjDAJ
         0qLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077605; x=1741682405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YK/v+HTjGEFPbEINjripCBl0YEaMvBdXG3vSD9bGu5w=;
        b=ELWoc+zy9LrIKiDs7JYqD6oW9H9pKoUtu5IG3tDWfGiC38ck6v3srtCVXYYbodLDqn
         lecPPgn2AsWEq7lavgzsLmsgLyiXagU4sT84btQUwXbAL8lybn9bSOokThfF8m/2F8B/
         WtIwbeIvkJY3HGG2d4OGOoksERRspMNZj5PYai4CZOngr/JedmoQSl7p+5XHc0y9Xc0q
         PX4I41+CSqqny70cdEOhrHdQncAD/E+aZ1GCrLN9QvqXopCqQtYg+sW7lNG+s2qnjaNU
         3c8/aryp48ED0qsgjsDklOWSAA5IoXgxsfJuredoe4MaDzvwJqBujJNHRcbKt6uvwyCa
         0F2g==
X-Forwarded-Encrypted: i=1; AJvYcCX4vj/5IQU/H0OHclITo4Lv+zL/9kD4JU5txYX49z2C78q+Ex8GE5rRqwxWwKnq+Dr/Nz4JepJDjogQUSV6qvw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc61EmK308PNHp2da3LUux6CpTEKYTx9Aw7ZNgI6w5RTwRzHea
	+Fq/dx/SoppwnDhu68hm8wxrGcoP0lQjau5sH4yeia873Jo7YzQeIVbxC8b3K7gOtxoACy1Kl2O
	x7VNtWn9UuHIUxeF9ODZvcif+4Y0BD/n4gCs5lxMH8sw279WC
X-Gm-Gg: ASbGncsg6ez5r+gAtH7iHDeTMpNjiDPEgUVBuS0fzkJausi7jltD2zYd7naJGFHtmkq
	2FOghMDtdnIksw41N9vAT1j9NXXYhOWVs+oCvmfQEb3HRXN645A5uQXA4fjCXee1xTjJGyMn5YZ
	Xca4/fDpz4lq0HzlgNqittnHecjA==
X-Google-Smtp-Source: AGHT+IHzjcSCOgliNPgzEIfJP4zRqA+GXbH1gcPHEqHVdjToORnVLP+q+n+ER/rA0dxnmWxFxju94KxpZdoxEUjQw0w=
X-Received: by 2002:a05:690c:3387:b0:6fd:4521:f9d7 with SMTP id
 00721157ae682-6fd4a1b5ad8mr221954587b3.24.1741077605393; Tue, 04 Mar 2025
 00:40:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303092826.318638-1-colin.i.king@gmail.com>
In-Reply-To: <20250303092826.318638-1-colin.i.king@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 09:39:51 +0100
X-Gm-Features: AQ5f1Jq2rfvBPsQCyevIyKgnAdZxW9QavsIRuyb9v_d9Hj7plbiOg3wN5ZMKg3c
Message-ID: <CACRpkdZwjOWTJioAY92LwmEGmqZJHu3d6foKNbtVmNDN1h_cFw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinconf-generic: Fix spelling mistake "paramers"
 -> "parameters"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 10:29=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:

> There is a spelling mistake in a dev_err message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Patch applied!

Yours,
Linus Walleij
