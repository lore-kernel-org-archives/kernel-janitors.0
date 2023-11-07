Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EA2C2DE
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Nov 2023 07:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oE0jf3Ty"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79DFFC433C8;
	Tue,  7 Nov 2023 07:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699341616;
	bh=zE6s17byWtutyeorY6k2ptjknyn3c3xKtGwM/S9QtA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oE0jf3TybdxyISxQ2xWJm2D7gPVHLu4owV39NP9b/0p1yt6VGaq30Y24hg6X8G2ON
	 T3Z4srTOib2rAd42EVyOmAa2bNn2GJRKxJuOv5jTtMsTzr33zIuPtf9CLRv8VDh6YS
	 y1U4P8OD2Gw5ZL/h1elfni1/9qKzMwOZ2Lnv3Lnk=
Date: Tue, 7 Nov 2023 08:20:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jens Taprogge <jens.taprogge@taprogge.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	industrypack-devel@lists.sourceforge.net
Subject: Re: [PATCH] ipack: Remove usage of the deprecated ida_simple_xx() API
Message-ID: <2023110759-strewn-although-b56f@gregkh>
References: <435bd17b8a5ddb2fc3e42e2796117ee02263d02a.1698831664.git.christophe.jaillet@wanadoo.fr>
 <CAP+cEOOEmbgon-VjUQtVBVXDcsgmJ1EZr7p=kqt04eUE3D9TeA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP+cEOOEmbgon-VjUQtVBVXDcsgmJ1EZr7p=kqt04eUE3D9TeA@mail.gmail.com>

On Tue, Nov 07, 2023 at 08:04:45AM +0100, Vaibhav Gupta wrote:
> Hello Christophe,
> Thank you for your patch.
> 
> Acked-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> 
> Hey Greg, could you please add this patch to your misc tree?

Will do after -rc1 is out.
