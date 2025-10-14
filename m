Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4543D19E992
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Oct 2025 01:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760405818; cv=none; b=O+JOTYMbLhB7N645Y3nuPAht0Su64/2tik93KjEut1Y+2jh9vTpvy9V1IqXnHKEPmkaR7FedvvAM7jCMQYrBgP676eewJxnKYxdhqlqyc7SJXQ0buOGanJywBzzHGBe5m8O6CBEWZetQqJg0sGPAftYXfqVgnQuYR8+/QB/KY8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760405818; c=relaxed/simple;
	bh=oYUTc+AiKPmCuFjgtibw0G1ReJpHfIxZl4AuXoHKHw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahKyVZ0qlnQIKDVX27BidKxX7hFCTqkkhFh4/wUQgQuaEh3i/f9s8oaiW0RXs96vLt2qcjXdNy1IwLtsL9hu74seETldkiBNx3EaOwiZIYinGOiQ3GchRzOEH4cjpjay6/PInRlUGO7PCe2fmIm0Vg1nJHwvPVGTrSLahnApI70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=mDNESBMC; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="mDNESBMC"
Received: from trampoline.thunk.org (pool-173-48-82-170.bstnma.fios.verizon.net [173.48.82.170])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 59E1aYI3004509
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 21:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1760405797; bh=rvGcC8DQtR62oIljxLGZ2Ip3IzftfQwCzWaFyinA5YQ=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=mDNESBMC98lqwrOOseOoDDAed1fmSwDhP1Hdz6MlmaKn8t6d/SjoqiiSBwpW6tQsY
	 pzlZlmlBo1tRwDZ8U7iBwBEQY6ozcCl0aTi6VN/0z6AsTSyaZzpFdoOWf+GFGKLtBS
	 DZfj1iFlZExw5Na9rTN8k5EOYSXEzFJjtQ1eh4K70HoGtBBR8z6r8dplE7tTqP7Udp
	 rG9iYACYP1rSaJrWZF0xMvQ3IgXlXcdBMlI3SAx/Ov504c1dD+DP7j0VFsUW8mwg8a
	 PmhbXbYW4GSOfHQDGPw9cFVmSfJm8fg2nkf/9aIfSUivLiVLWPhO6D+zOlNYlCWIUF
	 VyQJfybiMbu7Q==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 165C42E00D9; Mon, 13 Oct 2025 21:36:34 -0400 (EDT)
Date: Mon, 13 Oct 2025 21:36:34 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Lukas Bulwahn <lbulwahn@redhat.com>,
        Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] ext4: remove obsolete EXT3 config options
Message-ID: <20251014013634.GM354523@mit.edu>
References: <20250827090808.80287-1-lukas.bulwahn@redhat.com>
 <3900725f-c30c-4783-a1e3-b2f3df1b22e1@roeck-us.net>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3900725f-c30c-4783-a1e3-b2f3df1b22e1@roeck-us.net>

On Mon, Oct 13, 2025 at 01:34:56PM -0700, Guenter Roeck wrote:
> > Remove the obsolete EXT3 config options.
> 
> It would have been even better if all references in the kernel were updated
> as well, avoiding all the resulting boot failures when trying to boot "defconfig"
> images.

Oops.  Sorry, it didn't occur to me that there might be defconfig
referring to CONFIG_EXT3_FS.

I'll add patch to fix up the defconfigs, unless someone has taken care
of it already in their tree.

						- Ted
