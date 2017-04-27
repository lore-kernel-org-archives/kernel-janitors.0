From: Dennis Dalessandro <dennis.dalessandro@intel.com>
Date: Thu, 27 Apr 2017 17:14:00 +0000
Subject: Re: [PATCH] IB/rdmavt: restore IRQs on error path in rvt_create_ah()
Message-Id: <418a9680-c856-5b9c-b3b5-c46aaa367882@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170427091420.j7kl5tmzqnyami4s@mwanda>
In-Reply-To: <20170427091420.j7kl5tmzqnyami4s@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Kamal Heib <kamalh@mellanox.com>
Cc: Doug Ledford <dledford@redhat.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On 04/27/2017 05:14 AM, Dan Carpenter wrote:
> We need to call spin_unlock_irqrestore() instead of vanilla
> spin_unlock() on this error path.
>
> Fixes: 119a8e708d16 ("IB/rdmavt: Add AH to rdmavt")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Dennis Dalessandro <dennis.dalessandro@intel.com>


