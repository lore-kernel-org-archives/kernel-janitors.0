From: Dan Carpenter <error27@gmail.com>
Date: Mon, 05 Jul 2010 19:36:52 +0000
Subject: Re: ERROR: do not initialise externals to 0 or NULL
Message-Id: <20100705193652.GZ19184@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278346615.5396.3.camel@dermezel>
In-Reply-To: <1278346615.5396.3.camel@dermezel>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jul 05, 2010 at 06:16:55PM +0200, Joe Eloff wrote:
> Hi,
> 
> I have searched for results on this and most things I find is that it
> must be dropped.
> 

You mean something like:

extern int foo = 0;

initializing an extern doesn't make sense.  It doesn't matter what you
initialize it to.  Gcc should warn about this.  The initialization should
go where the actual variable is declared.

If that doesn't answer your question, can you send some sample code
that causes the error?

regards,
dan carpenter

> Could someone please give me an indication of ways to solve this or
> should I just leave it in the patch?
> 
> Thanks,
> 
> Joe 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
