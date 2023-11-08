Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CCD32C6A
	for <kernel-janitors@vger.kernel.org>; Wed,  8 Nov 2023 18:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tOaxwE5s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA45C433C8;
	Wed,  8 Nov 2023 18:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699466813;
	bh=ZDpHDGVEFP+bE91rOEdXGu/bEAWDoVUCkXyc/7UOY6E=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=tOaxwE5s0EKWY7eKOUavVDZadTIn6hx3G+jt1RsSq/WBnNxnaFQN+QIiUDj/SG5WA
	 ifxo/x7WObLSoqpyTGmZgqB9M3deGJgN/UKWTypsK4msyMNIzLe+17UH77qvK2ZhpK
	 1duhzK2fYSbu1+pXtkHhBSyiek20YxFFVsmQcKVzsfNlZjrcmCjscRWzZuASAVnpOa
	 imef0Y48WgEoDVnWmydaMxpmObaMmMMTlMnGn2fxEGQoreyLLxfEnBYB32XfCZLPf4
	 RyAEVVBm62Srp6pYb0Wx198yxdno2J7D2XmXiEtDuxnpHSbAWyXRB4J0BEDyaLQvPM
	 REgmJ8bTMZT8A==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: plfxlc: check for allocation failure in
 plfxlc_usb_wreq_async()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <e8d4a19a-f251-4101-a89b-607345e938cb@moroto.mountain>
References: <e8d4a19a-f251-4101-a89b-607345e938cb@moroto.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Srinivasan Raju <srini.raju@purelifi.com>, linux-wireless@vger.kernel.org,
 kernel-janitors@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169946681070.2821494.11583175295083759020.kvalo@kernel.org>
Date: Wed,  8 Nov 2023 18:06:52 +0000 (UTC)

Dan Carpenter <dan.carpenter@linaro.org> wrote:

> Check for if the usb_alloc_urb() failed.
> 
> Fixes: 68d57a07bfe5 ("wireless: add plfxlc driver for pureLiFi X, XL, XC devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied to wireless-next.git, thanks.

40018a8fa9aa wifi: plfxlc: check for allocation failure in plfxlc_usb_wreq_async()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/e8d4a19a-f251-4101-a89b-607345e938cb@moroto.mountain/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

