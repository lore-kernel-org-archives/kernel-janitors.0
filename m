From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Dec 2020 20:00:21 +0000
Subject: Re: [PATCH] pstore: Tidy up an error check
Message-Id: <20201202200021.GJ2789@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8c4C2q6qaZ8qX6L@mwanda>
 <202012021124.ADBFCE999@keescook>
In-Reply-To: <202012021124.ADBFCE999@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Dec 02, 2020 at 11:25:46AM -0800, Kees Cook wrote:
> On Wed, Dec 02, 2020 at 09:45:31AM +0300, Dan Carpenter wrote:
> > The crypto_alloc_comp() function never returns NULL, it returns error
> > pointers on error.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> I replied to an identical patch yesterday, actually:
> https://lore.kernel.org/lkml/202012011215.B9BF24A6D@keescook/ 
> 
> Using IS_ERR_OR_NULL() is more robust, and this isn't fast path, so I'd
> prefer to keep it that way.
> 

The NULL return doesn't make any sense though because crypto_alloc_comp()
isn't optional...  When a function returns both error pointers and NULLs
then the NULL is special kind of success.

	p = get_feature();

If "p" is an error pointer that means an error happened.  If "p" is NULL
that means the feature is disabled in the .config or whatever.  We can't
return a valid pointer because the feature doesn't exist but it's also
not an error so it doesn't return an error pointer.  The code should
not print a warning, maybe an info level printk at most.  Then the
driver should continue operating with the feature turned off.

Two of the callers for crypto_alloc_comp() check for error pointers and
NULL and three only check for error pointers.  It's inconsistent.

regards,
dan carpenter
