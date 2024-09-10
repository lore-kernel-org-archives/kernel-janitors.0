Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D337817C231;
	Tue, 10 Sep 2024 07:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725953744; cv=none; b=W1RqRqspp+DjRepAwQ2wRMzyp3Fg1Q6iHYXcf78WM2ebYsX8bFP4iMGSVLjW14BezKE7cfgccsOEIChLfHggwX1FcxSpsSAeMZH68msLFnP9qqA7ytZTKshQgDlC+TnXsopWOQn5hvQ0jWqq9gKYynHVveldFA9PVuI7er7UjCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725953744; c=relaxed/simple;
	bh=mr8XvHNsiLz95NPj4gzHNsXQjjy6cU6eIPrWByINPBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shkDVMF+ysXCF67T1cmoCb6ZCEbdtUsElF6iYDO8VKsRWk+nJhNi7OnBO0ey8pP0CNSD+WHrWOVE17R8Ac5nQhvY6sPpAGAnufWWlWqEedwRWI3TdsuqyjOXVY0Yzbpg7aSHJcKkUbWR9Y9pnsNbfh7cU/TUZYjmZZvBnVf37Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+LltnAv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+LltnAv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46480C4CEC3;
	Tue, 10 Sep 2024 07:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725953744;
	bh=mr8XvHNsiLz95NPj4gzHNsXQjjy6cU6eIPrWByINPBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F+LltnAvFPIXt3RyLBcWL89DQOVgII2wPBcJ0bZsZcDXBSiOvSKq6Zs+YYN7ywkAH
	 44vXRD1iskOjHh0FlDRzLNtoMcWY4pCR99Co/PiuBxYoq8twiP75CnXo43noW+cCy2
	 z+GugpL3ETW/JweHSv1WARuibugQ9lUqrhADeVR2LhShsVbFN2X3+TMJiPjsb3cazf
	 vs7RO3YyL9iXla6oBlyhaT1moplymnUONutumhYg5RpAscysiiO58DvpF08BJBL5mk
	 I6VCCesiKllsqYr7qDEuhK89ZvNi+hmjTf7xYQEFngcEDVDav6XHz5eKTSFjInBtpc
	 bB2ennlka90DA==
Date: Tue, 10 Sep 2024 08:35:40 +0100
From: Simon Horman <horms@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Justin Lai <justinlai0215@realtek.com>,
	Larry Chiu <larry.chiu@realtek.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] rtase: Fix spelling mistake: "tx_underun" ->
 "tx_underrun"
Message-ID: <20240910073540.GB525413@kernel.org>
References: <20240909134612.63912-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909134612.63912-1-colin.i.king@gmail.com>

On Mon, Sep 09, 2024 at 02:46:12PM +0100, Colin Ian King wrote:
> There is a spelling mistake in the struct field tx_underun, rename
> it to tx_underrun.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks Colin,

I've confirmed that this addresses all instances of this problem
in this driver. Thanks for also sending a patch for the same problem
in the r8169 driver [1].

Reviewed-by: Simon Horman <horms@kernel.org>

[1] https://lore.kernel.org/all/20240909140021.64884-1-colin.i.king@gmail.com/
