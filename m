From: Bastien Nocera <hadess@hadess.net>
Date: Fri, 04 Dec 2020 09:46:54 +0000
Subject: Re: [PATCH] USB: apple-mfi-fastcharge: Fix use after free in probe
Message-Id: <9d9568fe9e1d5c00eab345c212ad0fa8cbcbc350.camel@hadess.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8ik4j8yJitVUyfU@mwanda>
In-Reply-To: <X8ik4j8yJitVUyfU@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Lucas Tanure <tanure@linux.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2020-12-03 at 11:42 +0300, Dan Carpenter wrote:
> This code frees "mfi" and then derefences it on the next line to get
> the error code.
> 
> Fixes: b0eec52fbe63 ("USB: apple-mfi-fastcharge: Fix kfree after
> failed kzalloc")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for catching that.

Reviewed-by: Bastien Nocera <hadess@hadess.net>
