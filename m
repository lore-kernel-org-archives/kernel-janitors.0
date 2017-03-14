From: Peter Rosin <peda@axentia.se>
Date: Tue, 14 Mar 2017 16:47:38 +0000
Subject: Re: [PATCH] mux: checking for IS_ERR() instead of NULL or vice versa
Message-Id: <8a1d806c-1626-0558-855b-02d7396baae4@axentia.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170314075243.GA6169@mwanda>
In-Reply-To: <20170314075243.GA6169@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2017-03-14 08:56, Dan Carpenter wrote:
> This error handling is mixed up.  mux_chip_alloc() doesn't return error
> pointers but devm_mux_chip_alloc() does.
> 
> Fixes: 4f5078327db1 ("mux: minimal mux subsystem and gpio-based mux controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Eeek, thanks for pointing this out! I have apparently stared at this for
too long...

However, you did not update the documentation (in include/linux/mux.h) to
match the code, so I'm going to use an alternative (and more localized) patch
instead to align the code with the documentation.

Patch in followup email, please review! I also updated the Fixes tag
since I have amended the buggy patch since the version that is currently
in linux-next was picked up (linux-next isn't getting any updates this
week, which is why you're seeing "old" stuff).

Cheers,
Peter

