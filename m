From: Samuel Ortiz <sameo@linux.intel.com>
Date: Thu, 26 Jan 2012 20:23:47 +0000
Subject: Re: [patch] nfc: NULL vs zero in nci_activate_target()
Message-Id: <20120126202347.GA2305@sortiz-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120126061330.GA15856@elgon.mountain>
In-Reply-To: <20120126061330.GA15856@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lauro Ramos Venancio <lauro.venancio@openbossa.org>, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, "David S. Miller" <davem@davemloft.net>, "John W. Linville" <linville@tuxdriver.com>, Ilan Elias <ilane@ti.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Thu, Jan 26, 2012 at 09:13:31AM +0300, Dan Carpenter wrote:
> This is a pointer so it should be NULL instead of zero.  Sparse
> complains about this stuff:
> net/nfc/nci/core.c:447:37: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Samuel Ortiz <sameo@linux.intel.com>

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
