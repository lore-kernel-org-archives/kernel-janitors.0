Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A79C20B28
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 23:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFPppTHb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A4CC433C8;
	Mon, 13 Nov 2023 23:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699917209;
	bh=7+/zcxGO6lPV0Gz9Szr7juclgjxrwXfeqmICyjwZJf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XFPppTHb/5Va9ufC5gyqMsSZGmhFa/faLikrS11jLNJyZj73DgNitNgs7DYg/2tUc
	 uvP13w84f3GJNjiMypAoZOzBfN+Q/UBcRg6QrsZVNYtue0CWn8bCaf2s5rhraQLSJt
	 JkNsMWMFxvlZRiqpjInGEoDk+lieeN5M6nx1CkxVeoZbjq0iBUP40bcq9E+APIuKIl
	 zLeBva33e8EIZkDs5I0Ot+0ObtSOIpeLZmyUqWu2dZAoCWbEYrLIGrqnT6yfW9hEyB
	 sLtPIHjv5Q/ASMjeQckKbDtIGNyCO93XuEICBbbA+448uU8eezAGTcRHSoW2lAoBTU
	 xKaABAb0mg6mw==
Received: by mercury (Postfix, from userid 1000)
	id 5578C1060A25; Tue, 14 Nov 2023 00:13:26 +0100 (CET)
From: Sebastian Reichel <sre@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Sebastian Reichel <sre@kernel.org>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HSI: omap_ssi: Remove usage of the deprecated ida_simple_xx() API
Date: Tue, 14 Nov 2023 00:13:03 +0100
Message-ID: <169991694447.227822.10264740296784385491.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <d72106fc9de28ef8db2ed653febe366d141362a4.1698831563.git.christophe.jaillet@wanadoo.fr>
References: <d72106fc9de28ef8db2ed653febe366d141362a4.1698831563.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 01 Nov 2023 10:39:39 +0100, Christophe JAILLET wrote:
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> This is less verbose.

Applied, thanks!

[1/1] HSI: omap_ssi: Remove usage of the deprecated ida_simple_xx() API
      commit: fa72d143471d04ce3055d8dad9743b08c19e4060

Best regards,
-- 
Sebastian Reichel <sre@kernel.org>
