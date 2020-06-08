From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 08 Jun 2020 11:22:28 +0000
Subject: Re: [PATCH] kernel: power: swap: mark a function as __init to save some memory
Message-Id: <20200608112228.GW30374@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200531210059.647066-1-christophe.jaillet@wanadoo.fr>
 <effe3cde7b1f188427c42c476f5a96251d837416.camel@perches.com>
In-Reply-To: <effe3cde7b1f188427c42c476f5a96251d837416.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, rjw@rjwysocki.net, pavel@ucw.cz, len.brown@intel.com, Dan Carpenter <error27@gmail.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, May 31, 2020 at 03:11:27PM -0700, Joe Perches wrote:
> (adding Dan Carpenter)
> 
> On Sun, 2020-05-31 at 23:00 +0200, Christophe JAILLET wrote:
> > 'swsusp_header_init()' is only called via 'core_initcall'.
> > It can be marked as __init to save a few bytes of memory.
> 
> Hey Dan
> 
> smatch has a full function calling tree right?
> 
> Can smatch find unmarked functions called only by __init
> functions so those unmarked functions can be appropriately
> marked with __init like the below?
> 

It turns out it's complicated to do this in Smatch because Sparse
ignores the section attribute.  :/

regards,
dan carpenter
