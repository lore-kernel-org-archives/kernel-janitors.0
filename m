Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DA1487B0
	for <kernel-janitors@vger.kernel.org>; Wed, 13 Nov 2024 14:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731509837; cv=none; b=foH4fupHNOPhr67c7aOPGG6DF8iZUYV5CffP3K8z5stG41Dc9QRQxmBlSz3icRI7pFkEQ4jpqlhKp9ms584lcMZzt3qYXSANlge0lelgYZqeLJ1uecsFrY9yXZd+4DfwqvZNAbcG0HbYwmkHGhOZT4NwE6dLU2ZpEjjBc+828Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731509837; c=relaxed/simple;
	bh=dm4PD2uTnxJVwcgIe9XGiwRJvt8e+3sX+FsvbpWchxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQx7iJg5XCsSLprwGQcEZ9DZLAPUo/59a8lVRBcPB7mBFl5Ig9KtQL65tsKYfRSN4YG79hbx+ITLuNPSz2M2Mv7kfQDXzrCrdem8HGw2A4juxgIysc8It/bvzb0qX/JTZ18n60ZBpTWzpx6wJb9yzoxuokHuzv9ZcsTs7ls8cc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IzZRDuI3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IzZRDuI3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C3E5C4CEC3;
	Wed, 13 Nov 2024 14:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731509837;
	bh=dm4PD2uTnxJVwcgIe9XGiwRJvt8e+3sX+FsvbpWchxs=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=IzZRDuI3ibg6BCb8UsE0Vh9c5BbMJ1pNpK/bYyGUmBCM74C6prh+jRP7uc2A77jmz
	 FFARuAOzhoUDxs8hghXWLZ9JIPM4qsXuKlnLM8Ma/j+S5wtI8wtHDGK+b6ARqEiTw2
	 uD2qU+SQ26NhcVP5ljxhvh7jmcGhyNasVhKQhjZdnkGkn4zhZtlQz9Au4vxm2NnTwG
	 f7+Paz2Q1xm/0Ldd1Jk7KHxaqKh/Z6Uf/mA/+AGXvyQGCHyK//R46/O/j4EgtAcN+w
	 eztKLbrxW3kAXGRFGcjJlMpTkCH3aCoLwHgVpXZ1wkyYarmbqcDXrSAqVRxQU6JLWN
	 UdRhPz/2VZWIg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id DA103CE0484; Wed, 13 Nov 2024 06:57:16 -0800 (PST)
Date: Wed, 13 Nov 2024 06:57:16 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] scftorture: Handle NULL argument passed to
 scf_add_to_free_list().
Message-ID: <78fbfaf8-3288-4849-bf51-d2a7fc8ccd57@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <2375aa2c-3248-4ffa-b9b0-f0a24c50f237@stanley.mountain>
 <20241112162023.glRj_YAz@linutronix.de>
 <ec532c16-c7c3-4029-b996-284ac32f9820@stanley.mountain>
 <c7b02e51-d738-4523-b76a-c8a84be35124@paulmck-laptop>
 <9c1bab5f-4e72-4fb5-bf3b-1599aea59e7c@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c1bab5f-4e72-4fb5-bf3b-1599aea59e7c@stanley.mountain>

On Wed, Nov 13, 2024 at 10:30:04AM +0300, Dan Carpenter wrote:
> On Tue, Nov 12, 2024 at 11:48:41AM -0800, Paul E. McKenney wrote:
> > On Tue, Nov 12, 2024 at 07:30:03PM +0300, Dan Carpenter wrote:
> > > On Tue, Nov 12, 2024 at 05:20:23PM +0100, Sebastian Andrzej Siewior wrote:
> > > > Dan reported that after the rework the newly introduced
> > > > scf_add_to_free_list() may get a NULL pointer passed. This replaced
> > > > kfree() which was fine with a NULL pointer but scf_add_to_free_list()
> > > > isn't.
> > > > 
> > > > Let scf_add_to_free_list() handle NULL pointer.
> > > > 
> > > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > Closes: https://lore.kernel.org/all/2375aa2c-3248-4ffa-b9b0-f0a24c50f237@stanley.mountain
> > > > Fixes: 4788c861ad7e9 ("scftorture: Use a lock-less list to free memory.")
> > > > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > > > ---
> > > > 
> > > > Thank you Dan. I had to look twice, that `scfsp' above looked almost
> > > > identical.
> > 
> > Queued and thank you both!
> > 
> > > Yeap...  Me too.  #LowHammingDistance
> > 
> > That could likely be improved, to be sure.  I am one of these strange
> > people who wants the pointer to give a hint about its type, something
> > about pointers to rcu_data, rcu_node, and rcu_state pointers all
> > being messed with at the same time.
> > 
> > Maybe s/scfcp/scfchkp/?
> 
> What about scf_chkp, maybe?

I would rather avoid the underscore, myself, but...

							Thanx, Paul
