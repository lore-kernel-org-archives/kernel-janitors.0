From: Yann Droneaud <ydroneaud@opteya.com>
Date: Sun, 04 May 2014 21:46:30 +0000
Subject: Re: [patch] RDMA/cxgb4: info leak in c4iw_alloc_ucontext()
Message-Id: <1399239990.2957.6.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140328082428.GH25192@mwanda>
	 <1396002468.3297.63.camel@localhost.localdomain>
	 <20140502235616.GJ4963@mwanda>
In-Reply-To: <20140502235616.GJ4963@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Steve Wise <swise@chelsio.com>, Roland Dreier <roland@kernel.org>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net, roland@purestorage.com, dm@chelsio.com, leedom@chelsio.com, santosh@chelsio.com, kumaras@chelsio.com, nirranjan@chelsio.com, hariprasad@chelsio.com, Steve Wise <swise@opengridcomputing.com>

Hi,

Le samedi 03 mai 2014 à 02:56 +0300, Dan Carpenter a écrit :
> On Fri, Mar 28, 2014 at 11:27:48AM +0100, Yann Droneaud wrote:
> > Unfortunately, it's not the only structure which has this problem. I'm
> > currently preparing a report on this issue for this driver (cxgb4) and
> > another.
> > 
> 
> This information leak is still present in linux-next.  These days we
> count those things as security vulnerabilities with CVEs and everything.
> 
> When is it likely to get fixed?
> 

Thanks for the reminder.

The patches were waiting for some times in my patch queue, I failed to
provide them earlier. BTW, I've taken time during the week end to
complete them. They should be available on linux-rdma@vger.kernel.org.
See http://marc.info/?i=cover.1399216475.git.ydroneaud@opteya.com

Regards.

-- 
Yann Droneaud
OPTEYA


