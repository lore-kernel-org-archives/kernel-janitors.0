Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C50B14264D;
	Mon,  8 Apr 2024 16:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712594247; cv=none; b=MF82S/sXkMioaxaOFDHCa9rr16QPWp4YvF/PY0kr0QNieUEU2rawJEjg9dOUMBMwHB8Kwcw8b8B/5IaqVHuZNoIWArWcZEjgBNV0ywFjTkptBvxh5LL+N9tvgFYmDoIzhxqCOxJ4O6AZIEuyhgc2POy/wZb/zwzGUxdAoUNuX98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712594247; c=relaxed/simple;
	bh=KXF0+yz4mDf7mQJ+5POG2HHe9Fygkfazi8qoFDYHgxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSaiyXKCUJzpzKfjoIGrYUjb0EOTWXqpGazwSgHIx2SYESSLXKcyYqfBr2QQz1O9NCpQ4B+3UeLEs0c/a8rsGS9Qi6LTr2ZhVmT2bqGilFPyhkROLZITDfcTf01w5+Kvq89pz+UjMvR2l1J+niWKtGsMCiqbNQKjkmmQjZ7xd0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0VR3n4O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0VR3n4O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01816C433F1;
	Mon,  8 Apr 2024 16:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712594245;
	bh=KXF0+yz4mDf7mQJ+5POG2HHe9Fygkfazi8qoFDYHgxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a0VR3n4OrRB+SA9cRU568qi/0bhXOaVNaLYppQ2n8/5T6qRhpvzXqunk954BO16X7
	 RYpBuU6U/FLkulcvcHHgr6VaT8WxOf7jSJlWkVZv905Du2ZS5sIh0zmmYnKyBEJE/E
	 AlstLlDVVxeY9iBUybdqXNu/LxJCpS29LEjSXBZNj7EE3pn12c5Ahq8YUKx4kpIBQu
	 yZ8ZqSTOfFmbryg5jhfmqDy2MEdvZCNTm0pQcncr+nd1jLDPM5X8Q0fzsqANrKIUh4
	 0vL6avO46CYEseoS1QvynzgXEUDhXHcZEwoOU0UFnLLbgvqJEwYp7/orX+N32OPlJt
	 kXxQZuQrXI14w==
Date: Mon, 8 Apr 2024 17:37:20 +0100
From: Simon Horman <horms@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Eric Woudstra <ericwouds@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: air_en8811h: fix some error codes
Message-ID: <20240408163720.GK26556@kernel.org>
References: <7ef2e230-dfb7-4a77-8973-9e5be1a99fc2@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ef2e230-dfb7-4a77-8973-9e5be1a99fc2@moroto.mountain>

On Fri, Apr 05, 2024 at 01:08:59PM +0300, Dan Carpenter wrote:
> These error paths accidentally return "ret" which is zero/success
> instead of the correct error code.
> 
> Fixes: 71e79430117d ("net: phy: air_en8811h: Add the Airoha EN8811H PHY driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Simon Horman <horms@kernel.org>

