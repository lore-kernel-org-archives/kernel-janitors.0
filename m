From: David Miller <davem@davemloft.net>
Date: Thu, 22 Apr 2010 22:56:30 +0000
Subject: Re: [patch] wimax: wimax_msg_alloc() returns ERR_PTR not null
Message-Id: <20100422.155630.10951183.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100422094632.GM29647@bicker>
	<1271973596.2867.3.camel@localhost.localdomain>
In-Reply-To: <1271973596.2867.3.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: inaky@linux.intel.com
Cc: error27@gmail.com, netdev@vger.kernel.org, andre.goddard@gmail.com, kernel-janitors@vger.kernel.org, wimax@linuxwimax.org, linux-wimax@intel.com

From: Inaky Perez-Gonzalez <inaky@linux.intel.com>
Date: Thu, 22 Apr 2010 14:59:56 -0700

> On Thu, 2010-04-22 at 11:46 +0200, Dan Carpenter wrote: 
>> wimax_msg_alloc() returns an ERR_PTR and not null.  I changed it to test
>> for ERR_PTR instead of null.  I also added a check in front of the
>> kfree() because kfree() can handle null but not ERR_PTR.
>> 
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> Good catch thank you!
> 
> Will merge ASAP in preparation for the next push

There was another wimax fix from Dan, subject:

	[patch] wimax: checking ERR_PTR vs null

make sure you integrate that one too.
