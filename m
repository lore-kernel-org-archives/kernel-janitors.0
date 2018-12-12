From: Richard Cochran <richardcochran@gmail.com>
Date: Wed, 12 Dec 2018 14:17:02 +0000
Subject: Re: [PATCH v3] ptp: fix an IS_ERR() vs NULL check
Message-Id: <20181212141702.a23sehqcytipsmp5@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181206135719.GA18607@kroah.com>
 <20181207060046.GA3943@unbuntlaptop>
In-Reply-To: <20181207060046.GA3943@unbuntlaptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Fri, Dec 07, 2018 at 09:00:46AM +0300, Dan Carpenter wrote:
> We recently modified pps_register_source() to return error pointers
> instead of NULL but it seems like there was a merge issue and part of
> the commit was lost.  Anyway, the ptp_clock_register() function needs to
> be updated to check for IS_ERR() as well.
> 
> Fixes: 3b1ad360acad ("pps: using ERR_PTR instead of NULL while pps_register_source fails")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Greg,

This patch provides the missing hunk.  Please apply it.

Thanks,
Richard
