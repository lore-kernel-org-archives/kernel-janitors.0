From: Roland Dreier <roland@kernel.org>
Date: Fri, 20 Feb 2015 17:04:30 +0000
Subject: Re: [patch] IB/qib: fix a do nothing for loop
Message-Id: <CAL1RGDWFtMaKwnLWpkoFNWOkZwqGkOg-5XP0d5pEDCncD2QZQQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150220105600.GE7895@mwanda>
In-Reply-To: <20150220105600.GE7895@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mike Marciniszyn <infinipath@intel.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Fri, Feb 20, 2015 at 2:56 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We accidentally deleted a semi-colon here and changed this do-nothing
> loop into a do-something loop.


Thanks!  I folded this into the original "cleanup" patch.
