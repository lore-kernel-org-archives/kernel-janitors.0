Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7530E1E487;
	Sat, 14 Sep 2024 15:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726328122; cv=none; b=qSh0fsDlwx89pdSjagLouVRR0PIL020aATACrcnvJoQNxiq0/01DUhk1UR0UFDD5mOK8adt3MU203mNSCu4ciHLSpVfqBAZTRMMn0bNWzj7JIFucBXvBLQYl/HYFlrO5jKIVhXAlwBhMi9oHxz9C09LtjnmnUW6FeufsbXq/Pog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726328122; c=relaxed/simple;
	bh=YUiVVIN1byk9IEgbqpoRtEXRLK+aMNbubM3NnX0qqwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWVNg15s7bpYgGIQ6SfF//Q8egstU4v+uQoCbBHQ/k18CLfPJrl4alzk6LnDU9KXtom0QErUXrxyLzdz67QpLf4WAPB74J6OgyP46cnkIajto4gJs4J2FjFfrWnEIJ8ujCs+faDJDrtS8fV5bEcEWOJHlNGwzncnhxIBGZxW0E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZESC0Kz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZESC0Kz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DB9C4CEC6;
	Sat, 14 Sep 2024 15:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726328122;
	bh=YUiVVIN1byk9IEgbqpoRtEXRLK+aMNbubM3NnX0qqwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZESC0Kzh0zT3CnDnrRxh9HrjnbshfqyiNbqaQX2qc/Uzjg+7ilJYcMoPhHguCYEe
	 Tn0Q8T6T/2SJsSm+XB5WdmE1YV4gPEend8P0qBlYTkh8cJRnh5wXc3IriFVBmuP/Zu
	 NC30MFtn/AQXTGdWGJJJa1wIBch2s0oWPpHaExAEzKqJ0amJUcWN4OI005gaVbkfZ8
	 JoDoFzmBKz/pcqR484aTps86XyqoO9Tjvd/8Nzf3KlJim56y6wbI/jQ36xqJgp4A0m
	 L0avmgSC0TdKDd1PX7MJi4jqyh9fvbBnJKcjNwl/lr0aAbj+ktI6Ug+eJ5CC+nTSa1
	 Q08byLBzZtgCQ==
Date: Sat, 14 Sep 2024 16:35:16 +0100
From: Simon Horman <horms@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Piotr Raczynski <piotr.raczynski@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] ice: Fix a NULL vs IS_ERR() check in probe()
Message-ID: <20240914153516.GE11774@kernel.org>
References: <6951d217-ac06-4482-a35d-15d757fd90a3@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6951d217-ac06-4482-a35d-15d757fd90a3@stanley.mountain>

On Sat, Sep 14, 2024 at 12:57:56PM +0300, Dan Carpenter wrote:
> The ice_allocate_sf() function returns error pointers on error.  It
> doesn't return NULL.  Update the check to match.
> 
> Fixes: 177ef7f1e2a0 ("ice: base subfunction aux driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Simon Horman <horms@kernel.org>
