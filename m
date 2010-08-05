From: Randy Dunlap <rdunlap@xenotime.net>
Date: Thu, 05 Aug 2010 21:19:41 +0000
Subject: Re: smatch: module_init unwinding on errors
Message-Id: <20100805141941.89db91f0.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100729174329.GU26313@bicker>
In-Reply-To: <20100729174329.GU26313@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 29 Jul 2010 22:18:03 +0200 Dan Carpenter wrote:

> On Thu, Jul 29, 2010 at 11:00:07AM -0700, Randy Dunlap wrote:
> > Hi Dan,
> > 
> > Most drivers just use the result of request_region() as a pass/fail indicator.
> > Only a very few of them actually save the result pointer;  mostly they just pass
> > bar to release_region().
> > 
> 
> That was another thing which was concerning me.  request_region()
> returns freshly allocated memory.  Isn't it a leak to discard this?

If I knew the answer, I would have already replied...
I was hoping that someone else could help out here.

I expect that if there was a leak, someone would have already noticed
and pointed this out to us.  OTOH, this could be the last class of kernel
leaks that needs to be fixed...  I dunno.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
