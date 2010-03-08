From: Jason Baron <jbaron@redhat.com>
Date: Mon, 08 Mar 2010 15:51:33 +0000
Subject: Re: [patch] dynamic_debug: small clean up in ddebug_proc_write()
Message-Id: <20100308155132.GA2734@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100306105934.GA4958@bicker>
In-Reply-To: <20100306105934.GA4958@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Greg Banks <gnb@melbourne.sgi.com>, =?iso-8859-1?Q?Andr=E9?= Goddard Rosa <andre.goddard@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Mar 06, 2010 at 01:59:34PM +0300, Dan Carpenter wrote:
> This the doesn't change behavior at all.  In the original code, if nwords
> was zero then ddebug_parse_query() would return -EINVAL, now we just do 
> it earlier.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 

I guess it makes the code a little more readable.

Acked-by: Jason Baron <jbaron@redhat.com>
