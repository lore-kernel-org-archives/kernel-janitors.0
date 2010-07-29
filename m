From: Randy Dunlap <rdunlap@xenotime.net>
Date: Thu, 29 Jul 2010 18:00:07 +0000
Subject: Re: smatch: module_init unwinding on errors
Message-Id: <20100729110007.e89ff732.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100729174329.GU26313@bicker>
In-Reply-To: <20100729174329.GU26313@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 29 Jul 2010 19:43:29 +0200 Dan Carpenter wrote:

> Sort of inspired by Vasiliy's coccinelle work, I wrote a Smatch script to
> verify that modules unwind on errors.
> 
> http://repo.or.cz/w/smatch.git/blob/HEAD:/check_unwind.c 
> 
> The heuristic is if you
> 	* call request_irq() 
> 	* it possibly succeeded
> 	* you don't call free_irq() 
> 	* you're in a function that returns an int
> 	* you are returning non-zero
> Then complain.
> 
> One question that I had was for, "foo = request_region(bar, size)"
> should we call release_region() on "foo" or on "bar"?

Hi Dan,

Most drivers just use the result of request_region() as a pass/fail indicator.
Only a very few of them actually save the result pointer;  mostly they just pass
bar to release_region().

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
