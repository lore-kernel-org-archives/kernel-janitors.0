Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DCB3624A5;
	Tue, 18 Nov 2025 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477891; cv=none; b=WltohW6yL5lE8Snu/uP7fB2hMTDSv8XYkBAvlTkY/i0uo1Zx5vJwcpdmd6YmPXhFdyA17R0m1E4D2kImD0GgHGwbU9jpXoDXa8FEhoBVYTBnb+tbcgtq9jaw/NPokRDDh0TFy/0QzJ3m88gHiBICl3eJvm6EX7huY53LaHzidhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477891; c=relaxed/simple;
	bh=mXaQ0PbQSdqK1G0ampoRYeGoToUgnBQlAhKb08K2CBQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q1ID+1WWXbuTXrhZffY6eXOwlm+4LjEks5PgO1tg8IvM1hXkRrcpGif6CRtNaEt+pzQ3EotyGdpcWLG6xYQVMd1MJcwtHXvLf41mPtEJUsUjtZibBv2Pko7LgBK8rN27v3O9CFf4D7IzbF+J0z4F9ZfldS/qXVnEhltDRl6M6jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qwVupRoY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PlFkYG1c; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qwVupRoY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PlFkYG1c"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763477885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z/r65hY8SWPaoKncjsGYJmpsCcPpi7Lo1MIAjd+cRLE=;
	b=qwVupRoYSItfwZLGqo/nEuJ+0Oe9Okeq13p/Qs9UrYxDP5//00beg7JJ68iExXHcqkSpp5
	suxKemMmC8I/dHPtKodx0nYytHqSMoDCPrnlpwFHi7uCl1oSljLjBfl+886BTwQ/G28KtS
	4oKyf/I2pO0HCnnEd3kLihD8uFsLqeTZE+URGnZoJ1/oBBPy3I6hlPnPPfc9wiLlP1EGG4
	92mdlWDqM3hR/qBUYfaeoFDkahLZCPfR3IMmZJOwdGYxLsWLShmAVixoA0Jwpy06tCx5Z0
	crgUNRfnqZ9QeygOqoMYThMT1Qq9qp/eT2QJCiPZkzutNHONhpmgXA8jNggzEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763477885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z/r65hY8SWPaoKncjsGYJmpsCcPpi7Lo1MIAjd+cRLE=;
	b=PlFkYG1ckdpNPS4ab39+HM/c2AqRGdfUJ66ycHO9OH51AijoWG44TLRIPDzXe1SjfZn9oh
	t2UuVi6SQXDjKABA==
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>, Ingo Molnar
 <mingo@kernel.org>, Simon Schuster <schuster.simon@siemens-energy.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rseq: Delete duplicate if statement in
 rseq_virt_userspace_exit()
In-Reply-To: <aRxP3YcwscrP1BU_@stanley.mountain>
References: <aRxP3YcwscrP1BU_@stanley.mountain>
Date: Tue, 18 Nov 2025 15:58:04 +0100
Message-ID: <87v7j75qwz.ffs@tglx>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Nov 18 2025 at 13:52, Dan Carpenter wrote:
> This if statement is indented weirdly.  It's a duplicate and doesn't
> affect runtime (beyond wasting a little time).  Delete it.

It's actually optimized out by the compiler in both cases, but yes
that's an odd one and likely a reject fixup artifact.

Thanks for detecting it!
