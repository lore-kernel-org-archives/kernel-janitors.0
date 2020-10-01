From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 01 Oct 2020 08:56:50 +0000
Subject: Re: [PATCH] staging: vchiq: Fix list_for_each exit tests
Message-Id: <20201001085650.GA1832570@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200928091103.GC377727@mwanda>
In-Reply-To: <20200928091103.GC377727@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, Marcelo Diop-Gonzalez <marcgonzalez@google.com>, kernel-janitors@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Jamal Shareef <jamal.k.shareef@gmail.com>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

On Mon, Sep 28, 2020 at 12:11:03PM +0300, Dan Carpenter wrote:
> This code code here used to be list_for_each() and after the loop then
> the "entry" pointer was non-NULL if we found the correct entry or NULL
> if we couldn't find it.  Then we changed the code to use list_for_each_entry()
> and so now the "entry" pointer is always non-NULL when we exit the loop.
> 
> I have introduced a new "found" variable to say if we found the correct
> enty or not.  I fixed one test by making it an else statement because
> that was more readable than testing "if (!found)".
> 
> Fixes: 46e4b9ec4fa4 ("staging: vchiq_arm: use list_for_each_entry when accessing bulk_waiter_list")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  .../vc04_services/interface/vchiq_arm/vchiq_arm.c    | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

This doesn't apply against my tree, what branch did you make it against?

thanks,

greg k-h
