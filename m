From: Samuel Ortiz <sameo@linux.intel.com>
Date: Sun, 18 Dec 2011 20:42:11 +0000
Subject: Re: [patch 1/2] NFC: double unlock in nfc_llcp_recv_connect()
Message-Id: <20111218204211.GQ11800@sortiz-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111216202529.GA18570@elgon.mountain>
In-Reply-To: <20111216202529.GA18570@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lauro Ramos Venancio <lauro.venancio@openbossa.org>, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Fri, Dec 16, 2011 at 11:25:29PM +0300, Dan Carpenter wrote:
> We unlock inside the if block on the other side of this if else
> statement.  It could result in calling mutex_unlock() twice.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Samuel Ortiz <sameo@linux.intel.com>

Thanks,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
