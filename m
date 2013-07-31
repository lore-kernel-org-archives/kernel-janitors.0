From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 31 Jul 2013 14:50:17 +0000
Subject: Re: Updated FarSync driver
Message-Id: <20130731145017.GH5002@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <E603DC592C92B54A89CEF6B0919A0B1CA86BBBD5E2@SOLO.hq.farsitecommunications.com>
In-Reply-To: <E603DC592C92B54A89CEF6B0919A0B1CA86BBBD5E2@SOLO.hq.farsitecommunications.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jul 31, 2013 at 02:55:50PM +0100, Kevin Curtis wrote:
> Hi Dan,
>     I am fixing the errors and warning reported by checkpatch.  I have quite a few of these:
> 
> ERROR: do not initialise globals to 0 or NULL
> #90: FILE: drivers/net/wan/farsync.c:83:
> +int fst_excluded_cards = 0;
> 
> Is this because when the module is loaded the globals are
> guaranteed to be zero'd already, or is the module init is expected
> to initialise them?
> 

In C globals are always initialized to zero at the start.

I think there was a reason to prefer one way over the other with
older versions of GCC but now it's just a style preference or
something.

regards,
dan carpenter

