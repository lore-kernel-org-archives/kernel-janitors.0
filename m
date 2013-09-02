From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 02 Sep 2013 07:41:12 +0000
Subject: Re: [PATCH v2] Staging: android: Mark local functions in binder.c as static
Message-Id: <20130902074112.GM19256@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1378102720-4200-1-git-send-email-prtvar.b@gmail.com>
In-Reply-To: <1378102720-4200-1-git-send-email-prtvar.b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Sep 02, 2013 at 08:18:40AM +0200, Bojan Prtvar wrote:
> This fixes the following sparse warnings
> drivers/staging/android/binder.c:1703:5: warning: symbol 'binder_thread_write' was not declared. Should it be static?
> drivers/staging/android/binder.c:2058:6: warning: symbol 'binder_stat_br' was not declared. Should it be static?
> 
> Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
> ---
>  v2: Fixed indentig as suggested by Dan Carpenter.

Thanks.  :)

regards,
dan carpenter

