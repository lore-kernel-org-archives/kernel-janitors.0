From: Richard Cochran <richardcochran@gmail.com>
Date: Mon, 10 Jul 2017 09:48:06 +0000
Subject: Re: [PATCH 1/2 net] ptp: fix error codes in ptp_clock_register()
Message-Id: <20170710094806.lsrua5iqnmnntc5m@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170710071137.ui2fhjkqzjqhkopz@mwanda>
 <20170710092103.vnanagwpimk43zoz@localhost.localdomain>
 <20170710093816.wz5uiqoyilgxmgh3@mwanda>
In-Reply-To: <20170710093816.wz5uiqoyilgxmgh3@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ganesh Goudar <ganeshgr@chelsio.com>, Atul Gupta <atul.gupta@chelsio.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jul 10, 2017 at 12:38:16PM +0300, Dan Carpenter wrote:
> There were two buggy commits so I chose the ealier one.  The other buggy

No, you are mistaken.  In the original patch, NULL or PTR_ERR were
returned on error, and that was not a bug.

If you want to correct the present version of ptp_clock_register() to
always return a valid pointer or PTR_ERR (like the kerneldoc says), be
my guest, but please say that in the change log and reference the
correct commit (namely the one related to disabling POSIX clocks.)

Thanks,
Richard
