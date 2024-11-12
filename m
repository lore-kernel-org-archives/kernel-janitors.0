Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B537621E109
	for <kernel-janitors@vger.kernel.org>; Tue, 12 Nov 2024 19:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731440922; cv=none; b=SLIHbiRJUmInWREGQjOt+TD+mpY8vcI96IoHgNTlW/dSaTdKH0OY8OTrWBQQPiEvsxe/wdwiOnrmfrq2h8pcgIxajXZ7Fq3pASVLCJg0fqMhrZsleANzQvr6M0WgyDYMC8lQleI5YOA+96UU79P4NjiITk9HbkEpKVOBM8cC7rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731440922; c=relaxed/simple;
	bh=djAWtpD0P7lUawn/eXm+lSeJa83RlIDf/sAHJqiXbdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMo16Bosqv7gwW3eULLZf3+SBWUPWYng7UjlUY3OngTtqHFYxSInfnoB8uPNdbIcQ3J3oS85blsOKI6iO2Iorn/XWXzGqlNSRnamXnUdpSWhQ4A5/dWocNSCs67XpbbK6l02s9uQ5T7j6fI8QFLhepdWwf2S/qvk5ZpMJ6cbIw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQFHlsUr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQFHlsUr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F6DC4CECD;
	Tue, 12 Nov 2024 19:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731440922;
	bh=djAWtpD0P7lUawn/eXm+lSeJa83RlIDf/sAHJqiXbdA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=GQFHlsUrmEv1tm3tSLfxgw1bFjoHLAvtSqEHYKeF/pQVfPE5LI5ZV9CDFxVFdSOmZ
	 Pd/vhEwGgubKh84pNJ9UgoXGO1DKnvbK5fXliEl6YVmHbpAxwiLvbvVUXuVtq+4s0k
	 sGxfpir9ZKd+lZ/0J5/KcQm8FNF6pv4xier3Pn40nZzBksZSeqT9EcOOs4wyGmB6wA
	 RirkI/cbLREvIwSdd3vhI2hufsoWzczchw1O/CfTQ7WGwkCGzt0Or6mAOJCA/y2vef
	 vkxeAY7T5Ss/BpGu4hCcYqXMTavWhD+2o9VE2BRvgmO8uALsxcTNjUuMhv290FYDIX
	 cuHfXElHUmPZg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B8006CE0FA5; Tue, 12 Nov 2024 11:48:41 -0800 (PST)
Date: Tue, 12 Nov 2024 11:48:41 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] scftorture: Handle NULL argument passed to
 scf_add_to_free_list().
Message-ID: <c7b02e51-d738-4523-b76a-c8a84be35124@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <2375aa2c-3248-4ffa-b9b0-f0a24c50f237@stanley.mountain>
 <20241112162023.glRj_YAz@linutronix.de>
 <ec532c16-c7c3-4029-b996-284ac32f9820@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec532c16-c7c3-4029-b996-284ac32f9820@stanley.mountain>

On Tue, Nov 12, 2024 at 07:30:03PM +0300, Dan Carpenter wrote:
> On Tue, Nov 12, 2024 at 05:20:23PM +0100, Sebastian Andrzej Siewior wrote:
> > Dan reported that after the rework the newly introduced
> > scf_add_to_free_list() may get a NULL pointer passed. This replaced
> > kfree() which was fine with a NULL pointer but scf_add_to_free_list()
> > isn't.
> > 
> > Let scf_add_to_free_list() handle NULL pointer.
> > 
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/all/2375aa2c-3248-4ffa-b9b0-f0a24c50f237@stanley.mountain
> > Fixes: 4788c861ad7e9 ("scftorture: Use a lock-less list to free memory.")
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > ---
> > 
> > Thank you Dan. I had to look twice, that `scfsp' above looked almost
> > identical.

Queued and thank you both!

> Yeap...  Me too.  #LowHammingDistance

That could likely be improved, to be sure.  I am one of these strange
people who wants the pointer to give a hint about its type, something
about pointers to rcu_data, rcu_node, and rcu_state pointers all
being messed with at the same time.

Maybe s/scfcp/scfchkp/?

							Thanx, Paul
