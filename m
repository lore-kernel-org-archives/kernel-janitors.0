From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Fri, 17 Apr 2020 15:56:18 +0000
Subject: Re: [PATCH] RDMA/ocrdma: Fix an off-by-one issue in 'ocrdma_add_stat'
Message-Id: <20200417155618.GG26002@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200328073040.24429-1-christophe.jaillet@wanadoo.fr>
 <20200414183441.GA28870@ziepe.ca>
 <20200416130847.GP1163@kadam>
 <20200416184754.GZ5100@ziepe.ca>
 <20200417112624.GS1163@kadam>
 <20200417122542.GC5100@ziepe.ca>
 <20200417130955.GU1163@kadam>
 <20200417134816.GD26002@ziepe.ca>
 <20200417151314.GV1163@kadam>
In-Reply-To: <20200417151314.GV1163@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: g@ziepe.ca, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, selvin.xavier@broadcom.com, devesh.sharma@broadcom.com, dledford@redhat.com, leon@kernel.org, colin.king@canonical.com, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Apr 17, 2020 at 06:13:14PM +0300, Dan Carpenter wrote:
> I was just meant unsigned iterators, not sizes.  I consider that to be a
> different sort of bug.  The original code did this:
> 
> 	desc_size = max_t(int, 32, desc_size);
> 
> Using signed casts for min_t() always seems like a crazy thing to me.  I
> have a static checker warning for those but I think people didn't accept
> my patches for those if it was only for kernel hardenning and
> readability instead of to fix bugs.  I don't know why, maybe casting to
> an int is faster?

Casting usually doesn't cost anything... But I think this shows again
why int is trouble: most likely desc_size is a unsigned value stored
in an int, and the temptation of max_t is to use the type of the
output variable.  So 'int' is a logical, if not bonkers choice.

If desc_size was properly unsigned then the author should keep using
unsigned through the max_t()

> > > You would need to hit a series of fairly rare events for this
> > > warning to be useful and I have never seen that happen yet.
> > 
> > IIRC the case was the uapi rightly used u32, which was then wrongly
> > implicitly cast to some internal function,  accepting int, which then
> > did something sort of like
> > 
> >   int len
> >   if (len >= sizeof(a))
> >        return -EINVAL
> >   copy_from_user(a, b, len)
> 
> This code works.  "len" is type promoted to unsigned and negative values
> are rejected.

Expecting people to know the unsigned/sign implicit promotion rules
for expressions to determine the code is right/wrong is just asking to
much, IMHO. I certainly don't have them all memorized and try to avoid
them :(

Using int pretty much guarentees you hit those cases...

> The real life example was slightly more complicated than that.  But the
> point is that a lot of people think unsigned values are inherently more
> safe and they use u32 everywhere as a default datatype.  I argue that
> the default should always be int unless there is a good reason
> otherwise.

Why? In my experience most values actually are never negative.

> to save memory.  There are reasons for the other datatypes to exist, but
> using them is tricky so it's best to avoid it if you can.

I can't say I have the same experience..
 
> There is a lot of magic to making your limits unsigned long type.

Oh? More magic than int is implictly promoted to unsigned anyhow?

> > > Originally if user_value was an int then the loop would have been a
> > > harmless no-op but now it was a large positive value so it lead to
> > > memory corruption.  Another example is:
> > > 
> > > 	for (i = 0; i < user_value - 1; i++) {
> > 
> > Again, code like this is simply missing required input validation. The
> > for loop works with int by dumb luck, and this would be broken if it
> > called copy_from_user.
> 
> The thing about int type is that it works like people expect normal
> numbers to work.

Not really. Some cases are a bit better, some are worse. As above when
using int:

 -1 >= sizeof(A) = true

Which is not at all how any sane person thinks about normal
numbers. There are lots of these odd traps around implicit promotion.

While foo-1 is right there, explicitly. If foo-1 < 0 and the code is
not expecting it then you have a clear problem.

> People normally think that zero minus one is going to
> be negative but if they change to u32 by default then it wraps to
> UINT_MAX and that's unexpected.  

Maybe I've been doing this too long, but this seems totally expected
to me...

> There is an element where the static checker encourages people to
> "change your types to match" and that's garbage advice.  Changing
> your types doesn't magically make things better and I would argue
> that it normally makes things worse.

I don't know much about this warning, but I do find that people
starting out tend to just use 'int' everywhere and 'hope for the best'
without any clear understanding or thinking of what types are what.

> > If you get the in habit of using types properly then it is less likely
> > this bug-class will happen. If your habit is to just always use 'int'
> > for everything then you *will* accidently cause a user value to be
> > implicitly casted.
> 
> This is an interesting theory but I haven't seen any evidence to support
> it.  My intuition is that it's better to only care when you have to
> otherwise you get overwhelmed.

If you make everything unsigned, there really is no downside, other
than possible subtraction related issues that exist anyhow, AFAIK.

This is the approach the C std uses, pretty much the entire API is
properly marked with signed/unsigned. I feel in pretty good company
advocating that this is the best way to write C code :)

But then again, I find the modular math intuitive and aware to be
careful with subtraction...

Jason
