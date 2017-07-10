From: Richard Cochran <richardcochran@gmail.com>
Date: Mon, 10 Jul 2017 09:21:03 +0000
Subject: Re: [PATCH 1/2 net] ptp: fix error codes in ptp_clock_register()
Message-Id: <20170710092103.vnanagwpimk43zoz@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170710071137.ui2fhjkqzjqhkopz@mwanda>
In-Reply-To: <20170710071137.ui2fhjkqzjqhkopz@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ganesh Goudar <ganeshgr@chelsio.com>, Atul Gupta <atul.gupta@chelsio.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jul 10, 2017 at 10:11:37AM +0300, Dan Carpenter wrote:
> The ptp_clock_register() function returns NULL when it's #ifdefed out
> because CONFIG_PTP_1588_CLOCK is disabled.  Otherwise, it's intended to
> return error pointers.  Unfortunately, there are a couple paths where we
> forget to set the error code.  It means that we could result in NULL
> pointer dereferences in the callers.
> 
> Fixes: d94ba80ebbea ("ptp: Added a brand new class driver for ptp clocks.")

This "Fixes" tag references the wrong commit.  Please correct it.

Thanks,
Richard
