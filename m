From: Samuel Ortiz <sameo@linux.intel.com>
Date: Sun, 18 Dec 2011 20:43:35 +0000
Subject: Re: [patch 2/2] NFC: use kfree_skb() for sk_buffs
Message-Id: <20111218204335.GR11800@sortiz-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111216202600.GB18570@elgon.mountain>
In-Reply-To: <20111216202600.GB18570@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lauro Ramos Venancio <lauro.venancio@openbossa.org>, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Fri, Dec 16, 2011 at 11:26:00PM +0300, Dan Carpenter wrote:
> This is a struct sk_buff pointer and it should be freed with kfree_skb()
> instead of kfree().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Samuel Ortiz <sameo@linux.intel.com>

Thanks.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
