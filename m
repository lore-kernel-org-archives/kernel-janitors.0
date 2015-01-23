From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 23 Jan 2015 17:38:00 +0000
Subject: Re: wlcore: unlock on error in wl1271_op_suspend()
Message-Id: <20150123173800.940811417B3@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20150115114340.GC17976@mwanda>
References: <20150115114340.GC17976@mwanda>
In-Reply-To: <20150115114340.GC17976@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ram Amrani <ramrani@ti.com>, Eliad Peller <eliad@wizery.com>, "John W. Linville" <linville@tuxdriver.com>, Arik Nemtsov <arik@wizery.com>, Johannes Berg <johannes.berg@intel.com>, David Spinadel <david.spinadel@intel.com>, Luciano Coelho <luciano.coelho@intel.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org


> We recently introduced a new error path which needs an unlock.
> 
> Fixes: 6d5a748d4836 ('wlcore: add ability to reduce FW interrupts during suspend')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
