From: Randy Dunlap <rdunlap@xenotime.net>
Date: Tue, 01 Mar 2011 18:50:53 +0000
Subject: Re: minor bug ?
Message-Id: <20110301105053.96286095.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110301154301.GS18043@bicker>
In-Reply-To: <20110301154301.GS18043@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 1 Mar 2011 21:43:28 +0300 Dan Carpenter wrote:

> On Tue, Mar 01, 2011 at 10:22:16AM -0800, Randy Dunlap wrote:
> > Are these duplicates?
> > 
> > struct some_struct;
> > 
> > is used as a notice to the compiler that the struct * may be used without knowing
> > what the struct looks like.  That keeps us from having to #include <struct.h>
> > every time that only struct * is used (struct->member is not used).
> > 
> 
> Right forward declarations.  But they're declared twice in the same
> file.
> 
> To me this like one of those things that you would fix if you notice it,
> but you wouldn't go out of your way to look for them.  They don't hurt
> anything and it's sort of easy to make a mistake when you patch them.
> 
> When the original poster emails, my response is that it's great that 
> people are reading the code and I like to encourage newbies.
> 
> But really if someone went through and systematically got rid of all the
> duplicated forward declarations, I'd secretly wish that they did
> something more productive and that I didn't have to review all the 
> changes.  Those kind of changes don't make the kernel run better but
> they can break the compile.

Sure, I won't use any cycles on it, but I couldn't tell that they were
duplicates.  Thanks.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
