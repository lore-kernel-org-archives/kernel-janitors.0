From: Inaky Perez-Gonzalez <inaky@linux.intel.com>
Date: Thu, 22 Apr 2010 21:59:56 +0000
Subject: Re: [patch] wimax: wimax_msg_alloc() returns ERR_PTR not null
Message-Id: <1271973596.2867.3.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100422094632.GM29647@bicker>
In-Reply-To: <20100422094632.GM29647@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: netdev@vger.kernel.org, =?ISO-8859-1?Q?Andr=E9?= Goddard Rosa <andre.goddard@gmail.com>, kernel-janitors@vger.kernel.org, wimax@linuxwimax.org, linux-wimax@intel.com

On Thu, 2010-04-22 at 11:46 +0200, Dan Carpenter wrote: 
> wimax_msg_alloc() returns an ERR_PTR and not null.  I changed it to test
> for ERR_PTR instead of null.  I also added a check in front of the
> kfree() because kfree() can handle null but not ERR_PTR.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Good catch thank you!

Will merge ASAP in preparation for the next push


