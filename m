Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6189A8F47
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 06:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gupgIl0O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2041C433C9;
	Mon, 13 Nov 2023 06:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699856187;
	bh=f7P/2FEufZ6MYuuGYCr4NLzyjnoJSoG0mGhvbSldVZ8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=gupgIl0Oorx/EUYnLi9gflXFNcVlYijoJbZ8mg4wh3+MALWVo8ExGSYwey4gPnbiB
	 Ag6XYbgKkTznV/iaM12asMO25A41+c0Hzz15n8MlbjS6HYu4ZINNAEqkfX1GWLF13L
	 ZwB+BoTnyPQSuAZxwSHWihgA1L20bjbdxJOLCmGzh57PvLFvfRFhbrYvmJT4weKve/
	 lqSdUd91Bzl7pbYWik7UFcYj/2yfdniQkiAD6mhsDVDGRW3AZTygdWByFON/2RzWat
	 EDN+W77+cuGVt3WSyTQQ5sEDplLDW+JBGDEQLWlSMZ/S3Mr7eHgKYtfSFJLahITp6l
	 +6GUw5ZcM/6NQ==
From: Kalle Valo <kvalo@kernel.org>
To: Su Hui <suhui@nfschina.com>
Cc: linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org,
  kernel-janitors@vger.kernel.org
Subject: Re: [PATCH wireless-next] wlcore: debugfs: add an error code check
 in beacon_filtering_write
References: <20231113044113.74732-1-suhui@nfschina.com>
Date: Mon, 13 Nov 2023 08:16:24 +0200
In-Reply-To: <20231113044113.74732-1-suhui@nfschina.com> (Su Hui's message of
	"Mon, 13 Nov 2023 12:41:14 +0800")
Message-ID: <87h6lquqiv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Su Hui <suhui@nfschina.com> writes:

> wl1271_acx_beacon_filter_opt() return error code if failed, add a check
> for this is better and safer.
>
> Signed-off-by: Su Hui <suhui@nfschina.com>

How did you test this?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
