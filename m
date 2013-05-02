From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 02 May 2013 22:00:34 +0000
Subject: Re: [patch] configfs: use capped length for ->store_attribute()
Message-Id: <20130502220034.GP5123@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130430072813.GC7237@elgon.mountain>
 <20130502215152.GB26770@localhost>
In-Reply-To: <20130502215152.GB26770@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 02, 2013 at 02:51:53PM -0700, Joel Becker wrote:
> On Tue, Apr 30, 2013 at 10:28:14AM +0300, Dan Carpenter wrote:
> > The difference between "count" and "len" is that "len" is capped at
> > 4095.  Changing it like this makes it match how sysfs_write_file() is
> > implemented.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Joel Becker <jlbec@evilplan.org>
> 
> Do you want me to push this up, or will you be sending it?

Could you push it?

regards,
dan carpenter


