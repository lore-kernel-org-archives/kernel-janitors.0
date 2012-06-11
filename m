From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 11 Jun 2012 06:56:47 +0000
Subject: Re: [patch v2] iwlwifi: turn on a lockdep assertion
Message-Id: <1339397807.4520.1.camel@jlt3.sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120610112521.GA20676@elgon.mountain>
	 (sfid-20120610_132551_124529_BB46BBBB)
In-Reply-To: <20120610112521.GA20676@elgon.mountain> (sfid-20120610_132551_124529_BB46BBBB)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Wey-Yi Guy <wey-yi.w.guy@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2012-06-10 at 14:25 +0300, Dan Carpenter wrote:
> CMD_SYNC is zero so the if (cmd->flags & CMD_SYNC) is never true and we
> never check the assertion.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: enables the assertion even more than v1 (based on feedback from
> Johannes Berg).

Thanks, I picked this up.

johannes

