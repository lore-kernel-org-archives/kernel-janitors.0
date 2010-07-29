From: Dan Carpenter <error27@gmail.com>
Date: Thu, 29 Jul 2010 17:43:29 +0000
Subject: smatch: module_init unwinding on errors
Message-Id: <20100729174329.GU26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Sort of inspired by Vasiliy's coccinelle work, I wrote a Smatch script to
verify that modules unwind on errors.

http://repo.or.cz/w/smatch.git/blob/HEAD:/check_unwind.c 

The heuristic is if you
	* call request_irq() 
	* it possibly succeeded
	* you don't call free_irq() 
	* you're in a function that returns an int
	* you are returning non-zero
Then complain.

One question that I had was for, "foo = request_region(bar, size)"
should we call release_region() on "foo" or on "bar"?

regards,
dan carpenter

