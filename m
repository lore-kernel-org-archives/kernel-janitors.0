From: Samuel Ortiz <sameo@linux.intel.com>
Date: Mon, 16 Apr 2012 18:22:18 +0000
Subject: Re: [patch] NFC: remove unneeded NULL check
Message-Id: <20120416182218.GX24130@sortiz-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120413192812.GE18505@elgon.mountain>
In-Reply-To: <20120413192812.GE18505@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lauro Ramos Venancio <lauro.venancio@openbossa.org>, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Fri, Apr 13, 2012 at 10:28:12PM +0300, Dan Carpenter wrote:
> container_of() works by subtracting the offset of the member.  The math
> can't really return a zero here.  Sometimes people check it when they
> actually meant to check something else but in this case we can just
> remove the check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Applied to my nfc-next queue, thanks.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
