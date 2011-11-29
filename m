From: David Miller <davem@davemloft.net>
Date: Tue, 29 Nov 2011 23:40:06 +0000
Subject: Re: [patch v2] isdn: avoid copying too long drvid
Message-Id: <20111129.184006.1024419970584749707.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111123064345.GB6871@elgon.mountain>
	<20111124124209.GI3195@mwanda>
In-Reply-To: <20111124124209.GI3195@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: isdn@linux-pingi.de, lucas.demarchi@profusion.mobi, nhorman@tuxdriver.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2011 15:42:09 +0300

> "cfg->drvid" comes from the user so there is a possibility they
> didn't NUL terminate it properly.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: use strnlen() instead of strlen().

Applied.
