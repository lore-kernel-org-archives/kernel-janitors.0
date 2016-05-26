From: Richard Cochran <richardcochran@gmail.com>
Date: Thu, 26 May 2016 17:42:26 +0000
Subject: Re: [patch] ptp: oops in ptp_ioctl()
Message-Id: <20160526174226.GA1997@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160526064622.GA6776@mwanda>
In-Reply-To: <20160526064622.GA6776@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Muhammad Falak R Wani <falakreyaz@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 26, 2016 at 09:46:22AM +0300, Dan Carpenter wrote:
> If we pass ERR_PTR(-EFAULT) to kfree() then it's going to oops.

Thanks for catching this.

Acked-by: Richard Cochran <richardcochran@gmail.com>
