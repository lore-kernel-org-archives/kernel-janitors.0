From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 14 Jun 2012 18:38:30 +0000
Subject: Re: [patch -next] iwlwifi: unlock on error path
Message-Id: <1339699110.9786.9.camel@jlt3.sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120614183526.GD6383@elgon.mountain>
	 (sfid-20120614_203557_447921_E8796EB4)
In-Reply-To: <20120614183526.GD6383@elgon.mountain> (sfid-20120614_203557_447921_E8796EB4)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Wey-Yi Guy <wey-yi.w.guy@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2012-06-14 at 21:35 +0300, Dan Carpenter wrote:
> We introduced a lock here in ff1ffb850b ("iwlwifi: fix dynamic
> loading").  But we missed an error path which needs an unlock.

Thanks Dan. John, this is the other merge issue I was talking about :-)

johannes

