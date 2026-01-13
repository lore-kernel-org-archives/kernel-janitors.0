Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4A638E5C4;
	Tue, 13 Jan 2026 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303483; cv=none; b=tefNF2/7wisC0Nx1Cyqr/uU8f0AIbjjAu7XLcDv0uQr49h4Rs1L+33Q8GN8jQxahh+xTQ6jmizGh12oqHy2OOC7BM6lhmx/UpMv4PHi7eryeRdudYA3cotqVnUHoh21LWzAW8uWv09Tv0unOKpjwSqrUDGlte+jzS82W3PInjls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303483; c=relaxed/simple;
	bh=o2c5RE8RgpLubjQoNmMSAE3LCBKng5eVHj0IQlXJKWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brEC3yP4iekdhseze5Rt7GoMH2f2ysQ+W3xKbvDilSzyjbhh45eLOXPbaEIExl3Xa/csO8kbTe0anjYyqh6hN14W28bSuTjwVfHOhvib6egps9BI0APRCerNzsE77VhuGGrK1bW1keUDU//9c+Qr4KXzr5rY/2ICZp/GN2UAj78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxXML26x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxXML26x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2F2C19422;
	Tue, 13 Jan 2026 11:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768303482;
	bh=o2c5RE8RgpLubjQoNmMSAE3LCBKng5eVHj0IQlXJKWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PxXML26xyiZFueCrFGvo9FCJ5XmOpmGQdXujr3g99WxztUuumOM6TtOvnLbFbWp/l
	 mJD3DNqw7ffEFpOp4WnmZuqg0PiqPVS0oLvViMsZ3ojN8qogNYU9+1PbDRl+FG4oan
	 q0TTAmwUZlBeZmrJpkZ+wnlxcPH+84K/FMkX4hgyql3FhR2aKXITZI4gZd7U57TaUG
	 927YRR8Kqx+EmrB5Lxx8NEPbKkeO2QhmPIYx7Cvm/GflFXsKx5Z0EOf7f1uB+RRgEj
	 Nm/ocPp4/2Hm0vvwi4sfH50vM3IpmY9wsm/JUF1LIa2TzzWjlEWo6FWeP9FUPh/nrF
	 BqcYh5Vyh/wpw==
Date: Tue, 13 Jan 2026 16:54:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Markus Elfring <Markus.Elfring@web.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	linux-sound@vger.kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, lkp@intel.com,
	Dan Carpenter <error27@gmail.com>
Subject: Re: soundwire: bus: fix off-by-one when allocating slave IDs
Message-ID: <aWYrdoF8Z97UkDV4@vaman>
References: <20260110201959.2523024-1-harshit.m.mogalapalli@oracle.com>
 <732ad24d-d88f-47dc-bb6f-bd1b64ad354e@web.de>
 <aWSwS0PQHumb2TJG@stanley.mountain>
 <aWS1j7IdRLCJTj1h@stanley.mountain>
 <35084885-09dc-4255-8ec9-ba23c3a2a925@web.de>
 <62e256c4-a616-4c80-ba29-43f767f4d342@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62e256c4-a616-4c80-ba29-43f767f4d342@opensource.cirrus.com>

On 12-01-26, 11:13, Richard Fitzgerald wrote:
> On 12/01/2026 10:55 am, Markus Elfring wrote:
> > > Sorry, if that was unclear.  The link is a real link to the documentation
> > > which says:
> > > 
> > >    - The body of the explanation, line wrapped at 75 columns, which will
> > >      be copied to the permanent changelog to describe this patch.
> > > 
> > > The rules that we write down are simplified guidelines which are designed
> > > to be easy explain.  75 is the upper bound where checkpatch will complain.
> > …
> > 
> > Can we benefit a bit more from this system configuration setting
> Why is this wrapped at column 64?

Good one :-)

I have a tendency to not look into a lot of things our friend is asking
for, seems to be not worth your time!

-- 
~Vinod
