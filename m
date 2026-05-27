Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8548E2EBB99
	for <kernel-janitors@vger.kernel.org>; Wed, 27 May 2026 12:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779883552; cv=none; b=ACEdaK6Qm9ZQfKPtrV00X1E8TwLyZgxuEXdRjLkkjuV+2oDy2C3CL+GiehONBzfKFU/zsaIBe1cIBIfSDxUS+YQrhhVxcGkJpCnlm0HFwWQbGmalyaPTJ9yMq9eVncHDwcgTKDBXS8y3OO3cofIDm69MTmAB6oZ4JBuZD5RQuOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779883552; c=relaxed/simple;
	bh=adYa1Lpyft+sSshPCyVT78ZL4TPiNqJulxJyuE0U0s4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OoZKInqyWTkI2tHWXPsAwGD01yqMFyDmDbfes+N8HAAS108lLj7b97G/ar+O/Rmd4MNHY6W8BDCa51DDzjAoZOp00/n/rwojAQUoW7C+uD5YGwU1rdVV0SLDEXXBZycsZJPnCHJ9C7/YDaIRWLYU4afEIxOkjHEZN8baARcv24g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8WKEWja; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8WKEWja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 317F21F000E9
	for <kernel-janitors@vger.kernel.org>; Wed, 27 May 2026 12:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779883551;
	bh=adYa1Lpyft+sSshPCyVT78ZL4TPiNqJulxJyuE0U0s4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Q8WKEWjaXbwcTY8fK04gUvgp4uwbEkzZyAeAX1M/KCn4w9S9Vwtv6Cav4JrSriQCy
	 QC88bIHBm9pDF9QSPegXWXgz6UqAfSfPqQXIy3JWCU4zXRS0/pY8FIPGHFuON0QNX7
	 w2tHEwizWzTrLHHnUQHHRCbTcc3YmoBu52N+E4jps0+0luN+B+Ft8xmazDVk6kQcva
	 GzCQku2HFbqSPtxddPwNk+ZCRqABkSOFd40nTql2SRAIrZWWaFu9eTq9jjSWvT5Myk
	 RuyXwzOx8Xqn9xrTFKtB/NVVfSHPocO2oa187u/WT2IU/1S101fEhW5bJVGfL/z2xD
	 EeXFqEINVNESA==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bd3d7c29b4dso1677011866b.2
        for <kernel-janitors@vger.kernel.org>; Wed, 27 May 2026 05:05:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/zn8FLSiFkO2E8a2YJPwkRAnR4lZ9ICFwA7srpnSkTs8csp9BqfizQdA97QnXK4HjtZche0hvp6NJlNo6GUAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMup2pTBW0KEA2PTYQbI4+gDzC/ipZ0zNJ9QYIu2UMgPYPvw2z
	zDp3IXPy+vTb4CQVxL1Faq+rZ0o7DipKJjqmvn1n/u4In++b7TOgRVxCKFtWEO3Y9oqImGVso9T
	WzoZvo+wFhpL39qrO08E8GFDeahz4V+Q=
X-Received: by 2002:a17:907:9309:b0:bd1:2c29:a6ac with SMTP id
 a640c23a62f3a-bdd269b6755mr1466163366b.44.1779883549805; Wed, 27 May 2026
 05:05:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527074942.17393-1-colin.i.king@gmail.com>
In-Reply-To: <20260527074942.17393-1-colin.i.king@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 27 May 2026 21:05:37 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-y1bP+=2PrPf_wGkCotT7j0OrVVV89US4siaO=k2v=Jg@mail.gmail.com>
X-Gm-Features: AVHnY4KxVlAW9Fk2OSBRPw728Xn8jdObUeEIwAXQ0pQn8bvqeW0R2z4AL8FpkGc
Message-ID: <CAKYAXd-y1bP+=2PrPf_wGkCotT7j0OrVVV89US4siaO=k2v=Jg@mail.gmail.com>
Subject: Re: [PATCH] ntfs: Fix spelling mistake "etnry" -> "entry"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, linux-fsdevel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 4:51=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There is a spelling mistake in a ntfs_error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
Applied it to #ntfs-next.
Thanks!
