Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486EA341AD
	for <kernel-janitors@vger.kernel.org>; Thu, 16 Nov 2023 15:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hm3krBZU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67565C433CB;
	Thu, 16 Nov 2023 15:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700146815;
	bh=yhaKzC4xxHXc6E+jm/VpLPlXWoQRVF4q21gWBbdXoGQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hm3krBZUbgHv+CA6eFUw5zuEr59VTiYjyeQnPlEEoUNv6/v6FsfOm1V/HxeRK/Riz
	 Cf95PF8V5Ukn6d3cq+xdPzXs5Kc3KMikgmQV1pdMtBJgW1q/X9tSV0aXwK9POndwRp
	 8A3iHdhHAzHLH5muetLX7WQ568lWCB8iycBaRLVQgtlLQlR2lrcsnS9DaRi63cmHjb
	 dO5QCofMZbYb9wIpErXObDmhVG1kkK4dFH0aYIeTR9dkl8V0+g116D+2xHJFGGVN3y
	 hQSZqEzvPvLy6BDeozOnDgdQsnloo66emdE6pLuCG4RjNibo3PhXBAKmFW3ma/xRx3
	 OUoa4T06rywUg==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-phy@lists.infradead.org
In-Reply-To: <d2323636c6cd2ec22f73a0ae6c2d34ac99b4abd5.1698854255.git.christophe.jaillet@wanadoo.fr>
References: <d2323636c6cd2ec22f73a0ae6c2d34ac99b4abd5.1698854255.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] phy: core: Remove usage of the deprecated
 ida_simple_xx() API
Message-Id: <170014681304.545052.17451265867929404624.b4-ty@kernel.org>
Date: Thu, 16 Nov 2023 20:30:13 +0530
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Wed, 01 Nov 2023 16:57:57 +0100, Christophe JAILLET wrote:
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> This is less verbose.
> 
> 

Applied, thanks!

[1/1] phy: core: Remove usage of the deprecated ida_simple_xx() API
      commit: 772dd70a5ed6845d87738f82c788c9ff4e37fd7f

Best regards,
-- 
~Vinod


