From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Jan 2013 08:39:44 +0000
Subject: Re: [patch] USB: c67x00-ll-hpi.c: signedness bug in ll_recv_msg()
Message-Id: <87k3rakhpr.fsf@dell.be.48ers.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130118074138.GA31793@elgon.mountain>
In-Reply-To: <20130118074138.GA31793@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:

 Dan> The callers expect this function to return zero on success or -EIO if it
 Dan> times out.  The type should be int instead of unsigned short.

 Dan> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Peter Korsgaard <jacmet@sunsite.dk>


 Dan> diff --git a/drivers/usb/c67x00/c67x00-ll-hpi.c b/drivers/usb/c67x00/c67x00-ll-hpi.c
 Dan> index a9636f4..3a1ca4d 100644
 Dan> --- a/drivers/usb/c67x00/c67x00-ll-hpi.c
 Dan> +++ b/drivers/usb/c67x00/c67x00-ll-hpi.c
 Dan> @@ -237,7 +237,7 @@ void c67x00_ll_hpi_disable_sofeop(struct c67x00_sie *sie)
 Dan>  /* -------------------------------------------------------------------------- */
 Dan>  /* Transactions */
 
 Dan> -static inline u16 ll_recv_msg(struct c67x00_device *dev)
 Dan> +static inline int ll_recv_msg(struct c67x00_device *dev)
 Dan>  {
 Dan>  	u16 res;
 


-- 
Bye, Peter Korsgaard
