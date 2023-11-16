Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE707A20
	for <kernel-janitors@vger.kernel.org>; Thu, 16 Nov 2023 11:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKdL9HlG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B47BC433C7;
	Thu, 16 Nov 2023 11:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700133984;
	bh=91H4/KMPMkjTV+q/X6xZwFVszTpe0ikL12Gouw7eKGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKdL9HlGEpg2+x2JaPqMsP65qQ2zD0VpHPw/eWcBXd/31rSP0TT56j7WPO3yL31cI
	 b4Gz5gT93Gy2DKQ2aw9u5kjKTrUfY9LkaoiL57bTne9851WEnssHXqclvRLTG1vZyJ
	 h31dHdthwKqIKCmdIg0oy9snapn7Zdb3g7TZaY09AAdFGS9yj/F2XMV6pcm4//vGuv
	 R+WmH/3Ne+Vx2DPowxrqJs6306RnsEUvKiakJgpia2dx/YIZvIxQL0a9EIqa1TGBxp
	 p+OV10sluVANNKwC+M1k4jVaJyW0O8AOCUg5n4abq8p8QuM4enjY3yfVi29x4aZy55
	 Do9ybUoDd8riA==
Date: Thu, 16 Nov 2023 16:56:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Su Hui <suhui@nfschina.com>
Cc: kishon@kernel.org, u.kleine-koenig@pengutronix.de,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] phy: mapphone-mdm6600: fix an error code problem in
 phy_mdm6600_device_power_on
Message-ID: <ZVX8W8+cM0U4j6Wh@matsya>
References: <20231020091413.205743-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020091413.205743-1-suhui@nfschina.com>

On 20-10-23, 17:14, Su Hui wrote:
> When wait_for_completion_timeout() failed, error is assigned
> '-ETIMEDOUT'. But this error code is never used. Return '-ETIMEDOUT'
> directly to fix this problem.

Where is patch 2/2?
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> 
> I'm not sure that return directly is true or not, maybe need some 
> process before return directly.
> 
>  drivers/phy/motorola/phy-mapphone-mdm6600.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/motorola/phy-mapphone-mdm6600.c b/drivers/phy/motorola/phy-mapphone-mdm6600.c
> index 1d567604b650..e84e3390bff0 100644
> --- a/drivers/phy/motorola/phy-mapphone-mdm6600.c
> +++ b/drivers/phy/motorola/phy-mapphone-mdm6600.c
> @@ -421,8 +421,8 @@ static int phy_mdm6600_device_power_on(struct phy_mdm6600 *ddata)
>  			dev_info(ddata->dev, "Powered up OK\n");
>  	} else {
>  		ddata->enabled = false;
> -		error = -ETIMEDOUT;
>  		dev_err(ddata->dev, "Timed out powering up\n");
> +		return -ETIMEDOUT;

>  	}
>  
>  	/* Reconfigure mode1 GPIO as input for OOB wake */
> -- 
> 2.30.2

-- 
~Vinod
