From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat, 19 Sep 2015 03:01:53 +0000
Subject: Re: [patch] IB/hfi1: checking for NULL instead of IS_ERR
Message-Id: <20150919030153.GA30373@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150916062220.GC21542@mwanda>
 <55FC32ED.1000404@redhat.com>
In-Reply-To: <55FC32ED.1000404@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford@redhat.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Mike Marciniszyn <infinipath@intel.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

On Fri, Sep 18, 2015 at 11:51:09AM -0400, Doug Ledford wrote:
> On 09/16/2015 02:22 AM, Dan Carpenter wrote:
> > __get_txreq() returns an ERR_PTR() but this checks for NULL so it would
> > oops on failure.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks, applied.

Applied to what?  Should I just ignore these types of patches and not
take them in my tree and you will send them on later on?  I don't
remember what we agreed to do, sorry.

thanks,

greg k-h
