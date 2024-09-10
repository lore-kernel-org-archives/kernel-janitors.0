Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D01176FCF;
	Tue, 10 Sep 2024 21:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726003004; cv=none; b=lXouyFWls88wJFwGgcjLV7D8hEKheoeoq+Srk6ie6/IXFXL6k9geo3RtX7Kvo0WtJTgwhCS2iO2rMlNaFdVvX9ZqA+ZQgCQxfI6mwfL1ocR4cansGsdvlu+er1PTbSfXU4MyilSd2iHbaefjPupduoPJlg4JG9eMghoDwu2RidQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726003004; c=relaxed/simple;
	bh=yY98ZnPqutD75dS1CZ6FtP8zEL2DopNaLCFMIdLjsDY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bcZBjRnOayMsDEyatIDt0Xd46JXqslMU0NSow9j3yev8zksV5E3I+jwq8f3JnOoaM2DpAsG2IDi5SsMIjSJqCbzpoC92eQvRP2r+K+AqXRE3ZK5yAXIzUpv2Cj6odfLHnOokUb7lYBFnJcP5yxHCyr5TQ0VPyfH62HnuYQ43pkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=lYwCp1Uy; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="lYwCp1Uy"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 17F034188E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1726003002; bh=3BCuHwWtjEsbkVAy+MWuOWEp+1aiLJTFeNM0th+mSVY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lYwCp1Uy8PWuJwBvdd4aS7lt8Z3RH5h8jKHHdBI1kAXRXyLcxfqNzKTpEmcFhls2g
	 Jl80W79rF1SoaTYeONVMRgWySBW5kcogcLvL3TQOLWBiscGdAiIsnB+xuviDDBhZFY
	 o6QQbh1GXd6Dft0RNW2a/6bJ0JR7TOLF4FXIUYTIau/JOmrFBNk7rQ6RMyTF3lqdsO
	 guo9F+mL9MDHzYefA9fX71jAjVXBExz+bLuMJ824EC3a0SdlBxNd7AS7G0zDH7aRwH
	 L5Lc/9Kvi9tMAiA7VWAnWSgKfCu2nUocekn6uJZvBMVgUuFdaSaxWjTj1Y8mxxqpWh
	 pB0iJUwl6e1Zw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 17F034188E;
	Tue, 10 Sep 2024 21:16:42 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Andrew Kreimer <algonell@gmail.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew
 Kreimer <algonell@gmail.com>
Subject: Re: [PATCH v2] docs/process: fix typos
In-Reply-To: <20240907122534.15998-1-algonell@gmail.com>
References: <20240907122534.15998-1-algonell@gmail.com>
Date: Tue, 10 Sep 2024 15:16:41 -0600
Message-ID: <87ikv36wg6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andrew Kreimer <algonell@gmail.com> writes:

> Fix typos in documentation.
>
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>
> ---
> Synced with docs-next as requested.
>
>  Documentation/process/coding-style.rst   | 2 +-
>  Documentation/process/maintainer-tip.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon
