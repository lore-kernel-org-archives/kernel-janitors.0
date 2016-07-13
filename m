From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Jul 2016 15:01:35 +0000
Subject: Re: [patch] dsp56k: prevent a harmless underflow
Message-Id: <4560698.1o7vFVpiPH@wuerfel>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160713101119.GF29468@mwanda>
In-Reply-To: <20160713101119.GF29468@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wednesday, July 13, 2016 1:11:19 PM CEST Dan Carpenter wrote:
> There is a mistake here where we don't allow "len" to be zero but we
> allow negative lengths.  It's basically harmless in this case, but the
> underflow makes my static checker complain.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
