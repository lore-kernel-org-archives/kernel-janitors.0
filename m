Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D3C2C11CA;
	Fri, 10 Jul 2026 19:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711946; cv=none; b=o0wfpiOec7dAD/nTEliHbhag8VmwFW0sfICtds5nRDjMp4THKi1fh/W/7seogSrmiuYHTcvlhZtWrGXDnjTsMHNNsmV2v+5jnHyKD+QG46i6aRa567z7zdgAbc9OwXNd+lAlA4VjelENh7JSPh4MZZvJCOJm6s/jrd1mzLuhbQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711946; c=relaxed/simple;
	bh=cy6eHoj6wMzqyhTHb9Z8wels1ROtg0e+qCaZxh/JSMc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=shiRy0HBi7TVl3LokkWu9VbYbD3maJiZ08Et/gXVHzn5+YhiU+tiLbMd7HRCluAx9liWkgihsJMRt/jl3+rsQ3SiehC/sm6NekIiL5sp/BiAG3T7vVIExclK3gvOQ9cWhfoCA3c4iMl5v9/cMPcLRyGWVyOQeCeqxtWWbD/0JIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=SPZgKOMF; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="SPZgKOMF"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EB2F0415A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783711945; bh=YFSaPKtkyrXVy6WhmJ7Z0X46tRlghCuSNTJf/sPiK+w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SPZgKOMFp/Mum2V4FeUkp7kI+ps3wWepnhZgZSf5fEOHsmSyJfXOwVn1JLrScew6y
	 kOizIjWD5aAdZ4YTf3Nbl+w6i+U/Jl5tMfIhj+eORJEZIo/pM0LIDIdSdRH3y4d2wf
	 mdDd24M98Zz4pLLwfHKk2xEsnzjiahK8QizC/qqbGP5/NGLmh11rH534wYVS4ysdMF
	 f8A466JvGqNcnrzpZRfMdbDMEKDX9XS8UitV8UFSx+Q4HxnvQiGMWC8nwWljBYiBjC
	 V462RTJN+nic2GlFIWYPE+i/4Z5dX/kFR6pJ0qxL761vpLLzc2qdER77Fyd6yO4W2a
	 wQiJAogP2hOiQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EB2F0415A7;
	Fri, 10 Jul 2026 19:32:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Kernel Janitors
 <kernel-janitors@vger.kernel.org>, Manuel Ebner <manuelebner@mailbox.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/kernel-parameters: fix brackets
In-Reply-To: <20260703080806.223782-2-manuelebner@mailbox.org>
References: <20260703080806.223782-2-manuelebner@mailbox.org>
Date: Fri, 10 Jul 2026 13:32:24 -0600
Message-ID: <87v7amk5dj.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@mailbox.org> writes:

> Add a few missing ']'s and a ')'.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

jon
