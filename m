From: Heiko Carstens <heiko.carstens@de.ibm.com>
Date: Wed, 09 Dec 2009 19:46:31 +0000
Subject: Re: [PATCH 7/12] drivers/s390: Correct size given to memset
Message-Id: <20091209194631.GA4351@osiris.boeblingen.de.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912092024100.1870@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912092024100.1870@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, linux390@de.ibm.com, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Dec 09, 2009 at 08:24:28PM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Memset should be given the size of the structure, not the size of the pointer.
...
> -	memset(tcat, 0, sizeof(tcat));
> +	memset(tcat, 0, sizeof(*tcat));
>  	/* Calculate tcw input/output count and tcat transport count. */
>  	count = calc_dcw_count(tccb);
>  	if (tcw->w && (tcw->flags & TCW_FLAGS_OUTPUT_TIDA))
> @@ -269,7 +269,7 @@ EXPORT_SYMBOL(tccb_init);
>   */
>  void tsb_init(struct tsb *tsb)
>  {
> -	memset(tsb, 0, sizeof(tsb));
> +	memset(tsb, 0, sizeof(*tsb));

Applied. Thank you!
