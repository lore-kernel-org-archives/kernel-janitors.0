From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Jul 2017 09:38:16 +0000
Subject: Re: [PATCH 1/2 net] ptp: fix error codes in ptp_clock_register()
Message-Id: <20170710093816.wz5uiqoyilgxmgh3@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170710071137.ui2fhjkqzjqhkopz@mwanda>
 <20170710092103.vnanagwpimk43zoz@localhost.localdomain>
In-Reply-To: <20170710092103.vnanagwpimk43zoz@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Cochran <richardcochran@gmail.com>
Cc: Ganesh Goudar <ganeshgr@chelsio.com>, Atul Gupta <atul.gupta@chelsio.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jul 10, 2017 at 11:21:03AM +0200, Richard Cochran wrote:
> On Mon, Jul 10, 2017 at 10:11:37AM +0300, Dan Carpenter wrote:
> > The ptp_clock_register() function returns NULL when it's #ifdefed out
> > because CONFIG_PTP_1588_CLOCK is disabled.  Otherwise, it's intended to
> > return error pointers.  Unfortunately, there are a couple paths where we
> > forget to set the error code.  It means that we could result in NULL
> > pointer dereferences in the callers.
> > 
> > Fixes: d94ba80ebbea ("ptp: Added a brand new class driver for ptp clocks.")
> 
> This "Fixes" tag references the wrong commit.  Please correct it.
> 

There were two buggy commits so I chose the ealier one.  The other buggy
commit is 85a66e550195 ("ptp: create "pins" together with the rest of
attributes").  I should have CC'd Dmitry as well.  I can resend.

regards,
dan carpenter

