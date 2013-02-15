From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Feb 2013 10:14:35 +0000
Subject: Re: Kernel janitors website?
Message-Id: <20130215101435.GB6853@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87d2w2u5qv.fsf@steelpick.2x.cz>
In-Reply-To: <87d2w2u5qv.fsf@steelpick.2x.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Feb 15, 2013 at 10:24:09AM +0100, Julia Lawall wrote:
> > Everything in staging/ is supposed to be being developed with the
> > goal of getting out.  The exception would the android code.
> 
> OK, at one point, some code was put there that was on the way out, unless 
> someone complained, rather than on the way in.  I think it was around the 
> time of the final elimination of the big kernel lock.  But perhaps it was 
> an isolated incident.  If all of the code in staging is actually of 
> interest, maybe I should pay more attention to it in the future :)

Oh, yes.  Telephony, serial/ and tty/ were that way.  They have been
deleted now.

I think the only driver on its way out now is the one under net/.

regards,
dan carpenter

