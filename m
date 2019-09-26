From: David Rientjes <rientjes@google.com>
Date: Thu, 26 Sep 2019 19:04:42 +0000
Subject: Re: [PATCH] mm, vmpressure: Fix a signedness bug in vmpressure_register_event()
Message-Id: <alpine.DEB.2.21.1909261204300.39830@chino.kir.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925110449.GO3264@mwanda>
In-Reply-To: <20190925110449.GO3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, tglx@linutronix.de, Enrico Weigelt <info@metux.net>, Kate Stewart <kstewart@linuxfoundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 25 Sep 2019, Dan Carpenter wrote:

> The "mode" and "level" variables are enums and in this context GCC will
> treat them as unsigned ints so the error handling is never triggered.
> 
> I also removed the bogus initializer because it isn't required any more
> and it's sort of confusing.
> 
> Fixes: 3cadfa2b9497 ("mm/vmpressure.c: convert to use match_string() helper")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: David Rientjes <rientjes@google.com>
