Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129181C07C3;
	Mon,  4 Nov 2024 17:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730740219; cv=none; b=T6cWj/6kjEWyq+ftCvOuJRMLtqCf5uE5w25CK0D8b0jKh+ICYzvjAf/CwjEgivPOLs0bctaUehn6ItFAiQk6o8HSOvTLQm0zG/5Hyeb6FSyiiWrbmcu9V3ZG8VxZzJi1UpFRvZWQSzObvUx4XeGn6cPLtpnSMI6A7Qzzgndg1Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730740219; c=relaxed/simple;
	bh=zD+e7Ojg2G0XzWuMkqnyGzhL+ew7ufPdH6lQEy8c9bI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CkSGbSS+1rHc+yVIBYL04w8AKf1z2gFLJgB28AHVRSirXew1h1VboF+WSCNhfLi3Epe/QfQmkuRXtfKCylffOAdwhQeKPR3HZu+pVvI9EZ0m0R6usJStm3qHvvQlq8z0+lwr/pniLpDtFy0PBX7pTPUOYn9ai/F67FVrsVK2G8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CEB2C4CECE;
	Mon,  4 Nov 2024 17:10:17 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64/fpsimd: Fix a typo
Date: Mon,  4 Nov 2024 17:10:15 +0000
Message-Id: <173074012615.2444105.10660252555826650982.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <2cbcb42615e9265bccc9b746465d7998382e605d.1730539907.git.christophe.jaillet@wanadoo.fr>
References: <2cbcb42615e9265bccc9b746465d7998382e605d.1730539907.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 02 Nov 2024 10:31:54 +0100, Christophe JAILLET wrote:
> s/FPSMID/FPSIMD/
> M and I inversted. Fix it
> 
> 

Applied to arm64 (for-next/misc), thanks! I also fixed the typo in the
commit log.

[1/1] arm64/fpsimd: Fix a typo
      https://git.kernel.org/arm64/c/525fd6a1b34e

-- 
Catalin

