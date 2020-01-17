From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Jan 2020 04:42:16 +0000
Subject: Re: [PATCH][next] driver core: platform: fix u32 greater or equal to zero comparison
Message-Id: <20200117044216.GC21151@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200116175758.88396-1-colin.king@canonical.com>
In-Reply-To: <20200116175758.88396-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Simon Schwartz <kern.simon@theschwartz.xyz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jan 16, 2020 at 05:57:58PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check that a u32 variable i is >= 0 is always true because
> the unsigned variable will never be negative, causing the loop to run
> forever.  Fix this by changing the pre-decrement check to a zero check on
> i followed by a decrement of i.
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 39cc539f90d0 ("driver core: platform: Prevent resouce overflow from causing infinite loops")

A better fix would be to revert this patch.  It doesn't fix a real bug.
The ->num_resources is typically under 5.  It's not going to overflow
INT_MAX any time soon.  There are "architectures with smaller ints."

It should always be "int i" unless there is a valid real life reason.
People think that declaring everything as u32 will fix bugs but it
normally just introduces bugs as it does here.  u32 makes the code
harder to read.

This is a sore spot for me because apparently there is a static
analysis tool which tells people to use "u32 i;" everywhere.  It's bad
advice.  I have asked around but I haven't found which tool it is, but
which  we should find the tool and delete it to prevent this kind of
stuff in the future.

regards,
dan carpenter
