Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D1825A2CF;
	Wed,  7 Jan 2026 19:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767815743; cv=none; b=M3jMyvRMBqoBnMGCoWiUF2B99EOftJL/VBgQPBUCYI7asYb/1jvKS6KS95R1jOnEnYrnGwtzGQwCrQuCziB0xSFmYZh26CNCaJs6gHKcmTq1BMGUSgu+nb2vLnVzkiB1B2ZS8glA6Fkh7nTDrqmfa29VEqdW2/lZ2ah86ctovi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767815743; c=relaxed/simple;
	bh=fe3cNW+BgOW0g/Yj4JbAc2KxF5WEMbD8WPo88Bf5sCw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=i+qKGOkeTGVfxp6lRYavI7BZ7s75L0dmjv79mHMFXdk7Sz4ic+Wph8mvgG08Avsl0i8zUILHt+ZgN7jBXRfCrwew5I78sGHKETPuuQDEdzQ9Y/m2t8FGzRLy2Yu3Lz/uRV8xcPxCjWRp9XZD9s7rMfiUf/YFQ1/19/ZXTD4N89Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1ZQS4oC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1ZQS4oC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44A4C4CEF1;
	Wed,  7 Jan 2026 19:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767815742;
	bh=fe3cNW+BgOW0g/Yj4JbAc2KxF5WEMbD8WPo88Bf5sCw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d1ZQS4oC8x9+jsh0H9ADB1NoSNLDg8vTNJncoxJL7BYLjwD0ul4uInLq97s+AVmCc
	 WF6tl9wEiy1jKZ3nUOjnu1ZTiaVyCInx6eq/97aSnHEQPHBCZhqQJl0JMxN3/1hD7I
	 8JgHadKD74jst6z7vYGHU6mQ5o+wGFdhmfoZPkg2bDLV0aOgZdfuVU416FU3A7WA+O
	 B1VbIlSwRaM7pdUTiF0znllayxKF8snf9iAPrT36VD3Y8v9Qqy2NmRs341+sgUAL9c
	 GK8Dd5C7uwJrnou79MLIrxuqBfIZXh9MReIo4ldZzzFbOGT2PqcpCigF5dOXgbmS4c
	 MNt9bybzQVJpg==
Date: Wed, 7 Jan 2026 12:55:39 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Lukas Bulwahn <lbulwahn@redhat.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, kernel-janitors@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] riscv: configs: Clean up references to non-existing
 configs
In-Reply-To: <20260107092425.24737-1-lukas.bulwahn@redhat.com>
Message-ID: <e28b10d9-7974-020c-b558-197bd129363b@kernel.org>
References: <20260107092425.24737-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Jan 2026, Lukas Bulwahn wrote:

> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
>   - Drop 'CONFIG_I2C_COMPAT is not set' (removed in commit 7e722083fcc3
>     ("i2c: Remove I2C_COMPAT config symbol and related code"))
>   - Drop 'CONFIG_SCHED_DEBUG is not set' (removed in commit b52173065e0a
>     ("sched/debug: Remove CONFIG_SCHED_DEBUG"))
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Thanks, queued for v6.19-rc.


- Paul
