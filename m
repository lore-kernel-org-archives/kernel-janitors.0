From: maximilian attems <janitor@sternwelten.at>
Date: Fri, 18 Jun 2004 09:43:07 +0000
Subject: Re: [Kernel-janitors] please comment on this patch
Message-Id: <20040618094307.GC21628@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61654632038542045=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200406160257.i5G2vWLJ023048@sirius.cs.pdx.edu>
In-Reply-To: <200406160257.i5G2vWLJ023048@sirius.cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============61654632038542045==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, 18 Jun 2004, Nicolas Kaiser wrote:

> * Kristen Carlson <kristenc@cs.pdx.edu>:
> 
> > Here's a new patch, please let me know what you think.
> 
> >  	/*
> >  	 * Check for ESP card
> >  	 */
> > -
> > -	if (!check_region(info->port, 8) && 
> > -	    serial_in(info, UART_ESI_BASE) == 0xf3) {
> > +	
>     ^^^^
> > +	if (serial_in(info, UART_ESI_BASE) == 0xf3) {
> 
> 
> Just nitpicking: Looks like trailing whitespace.

corrected 2 other occurrences for the kjt patch set.
a++ maks


--===============61654632038542045==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61654632038542045==--
