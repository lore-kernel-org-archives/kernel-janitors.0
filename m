From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 19 Oct 2013 11:08:02 +0000
Subject: Re: [patch] firewire: info leak in ioctl_get_info()
Message-Id: <20131019110802.GM11731@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131019091020.GE9312@longonot.mountain>
In-Reply-To: <20131019091020.GE9312@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Oct 19, 2013 at 12:24:30PM +0200, Clemens Ladisch wrote:
> Dan Carpenter wrote:
> > There is a 4 byte hole in the bus_reset struct at the end of the struct
> > after ->generation.
> 
> queue_bus_reset_event() uses kzalloc(), and ioctl_get_info() does not copy
> the hole.
> 

Gar...  Sorry you are right.  I appologize for that.

regards,
dan carpenter

