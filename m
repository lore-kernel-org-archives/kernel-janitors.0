From: Johannes Berg <johannes@sipsolutions.net>
Date: Sat, 09 Jun 2012 18:12:56 +0000
Subject: Re: [patch] iwlwifi: turn on a lockdep assertion
Message-Id: <1339265576.5029.1.camel@jlt3.sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120609155718.GB6488@elgon.mountain>
	 (sfid-20120609_175745_768929_5935229F)
In-Reply-To: <20120609155718.GB6488@elgon.mountain> (sfid-20120609_175745_768929_5935229F)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Wey-Yi Guy <wey-yi.w.guy@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2012-06-09 at 18:57 +0300, Dan Carpenter wrote:
> CMD_SYNC is zero so the if (cmd->flags & CMD_SYNC) is never true.  I
> think it should be if (cmd->flags = CMD_SYNC).  This enables a lockdep
> assertion.

Good catch, thanks. It should really be if (!(cmd->flags & CMD_ASYNC))
though I think as there could be other flags set which don't make it
non-sync.

I'll commit a fix on Monday unless you want to send a separate patch
(which I'll then pick up on Monday :-) )

johannes


