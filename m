From: "Ted Ts'o" <tytso@mit.edu>
Date: Sun, 04 Sep 2011 14:15:02 +0000
Subject: Re: [patch 1/2] jbd2: remove an unneeded NULL check
Message-Id: <20110904141502.GF3461@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110826091931.GM5975@shale.localdomain>
In-Reply-To: <20110826091931.GM5975@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "open list:JOURNALLING LAYER..." <linux-ext4@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Aug 26, 2011 at 12:19:31PM +0300, Dan Carpenter wrote:
> We dereference "transaction" at the start of the function so the NULL
> check isn't needed here.  It's not harmful, but it silences a static
> checker warning when we remove this.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Thanks for pointing this out; I've merged in the fix.

       	   	    	      	   	  - Ted
