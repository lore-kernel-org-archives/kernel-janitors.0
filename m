Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22D7225AE
	for <kernel-janitors@vger.kernel.org>; Thu, 23 Nov 2023 10:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Acfp10Yp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF343C433C7;
	Thu, 23 Nov 2023 10:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700737057;
	bh=1C0m0iqt2o1iTmLe2K+yT/+7q6+nm1Oz7Sg7gcJaVaM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Acfp10Yp7h+mRlKnhBlJr2fJcXXuAu96Yo6RnvYnwyzJERo0e6cLC4YSH/gXyHcI2
	 XzruhLBNPjW5IQcWEDm5JPwciIDD0vzb4ktAxV7CuIEJqcL2JX2a4Tpao2g4QeKHvI
	 ugzVrxtToCP72bVZ33+ze8Kbiops2IlY20snqoSp5fgqvngiX/JLiKmbZe882Le5p+
	 7oeLpTdac7czH2EtLTXrtbb6U0q53+qNuCE5f9NPJg2qfyplznhnYzYlB6iTo3wbUa
	 zNYwo1HsDv3ABaJjoQosoaiHqB71x2yuVVr5pIZ91QhBC2kdBY35Lq9yl4U9v//MV8
	 j1vouhR6NbbCA==
From: Lee Jones <lee@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <a63f3da5745187f5a9b1e2ec0492f2fe2e0b0b8d.1698854117.git.christophe.jaillet@wanadoo.fr>
References: <a63f3da5745187f5a9b1e2ec0492f2fe2e0b0b8d.1698854117.git.christophe.jaillet@wanadoo.fr>
Subject: Re: (subset) [PATCH] mfd: intel-lpss: Remove usage of the
 deprecated ida_simple_xx() API
Message-Id: <170073705658.1241275.6336543036694475269.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 10:57:36 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Wed, 01 Nov 2023 16:55:38 +0100, Christophe JAILLET wrote:
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> This is less verbose.
> 
> 

Applied, thanks!

[1/1] mfd: intel-lpss: Remove usage of the deprecated ida_simple_xx() API
      commit: 1026cd156d1099e0999f060a23af7470a8530efc

--
Lee Jones [李琼斯]

