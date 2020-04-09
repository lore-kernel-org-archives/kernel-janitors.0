From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Apr 2020 10:40:13 +0000
Subject: Re: [PATCH] checkpatch: check for missing \n at the end of logging message
Message-Id: <20200409103049.GA14081@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407204908.10420-1-christophe.jaillet@wanadoo.fr>
 <8617a6b94c0644bce1fd4ca77309d67a612e6300.camel@perches.com>
 <4b7e1cf3-6fa7-60af-a1d3-2457339dbe8a@wanadoo.fr>
 <efb5a518fdc47f0120b94a7e8a95d275c0f4ad43.camel@perches.com>
In-Reply-To: <efb5a518fdc47f0120b94a7e8a95d275c0f4ad43.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>, apw@canonical.com, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Apr 08, 2020 at 08:10:23PM -0700, Joe Perches wrote:
> Some types of false positives:
> 
> o Many of the formats seem to end in a ':' or a ' '
>   maybe those should be excluded
>    #86: FILE: drivers/android/binder_alloc_selftest.c:86:
>    +	pr_err("free seq: ");
> 

Yeah.  I also ignored strings that end in a space in my version.

>    o Split string formats should be excluded better
>      as only the first string fragment is checked:
>    #1001: FILE: drivers/ata/pata_octeon_cf.c:1001:
>    +	dev_info(&pdev->dev, "version " DRV_VERSION" %d bit%s.\n",

I ignored anything with a newline in it anywhere.

>    +		 is_16bit ? 16 : 8,
>    +		 cf_port->is_true_ide ? ", True IDE" : "");
> 
>    probably a few others, including a desire to check
>    if a pr_cont is below the use within a few lines.

Seems tricky to implement...  I think if you can't make it work it's
still usefull even with a some false positives.

regards,
dan carpenter
