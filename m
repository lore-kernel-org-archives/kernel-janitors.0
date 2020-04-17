From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Fri, 17 Apr 2020 13:48:16 +0000
Subject: Re: [PATCH] RDMA/ocrdma: Fix an off-by-one issue in 'ocrdma_add_stat'
Message-Id: <20200417134816.GD26002@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200328073040.24429-1-christophe.jaillet@wanadoo.fr>
 <20200414183441.GA28870@ziepe.ca>
 <20200416130847.GP1163@kadam>
 <20200416184754.GZ5100@ziepe.ca>
 <20200417112624.GS1163@kadam>
 <20200417122542.GC5100@ziepe.ca>
 <20200417130955.GU1163@kadam>
In-Reply-To: <20200417130955.GU1163@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: g@ziepe.ca, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, selvin.xavier@broadcom.com, devesh.sharma@broadcom.com, dledford@redhat.com, leon@kernel.org, colin.king@canonical.com, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Apr 17, 2020 at 04:09:55PM +0300, Dan Carpenter wrote:
> On Fri, Apr 17, 2020 at 09:25:42AM -0300, Jason Gunthorpe wrote:
> > On Fri, Apr 17, 2020 at 02:26:24PM +0300, Dan Carpenter wrote:
> > > On Thu, Apr 16, 2020 at 03:47:54PM -0300, Jason Gunthorpe wrote:
> > > > On Thu, Apr 16, 2020 at 04:08:47PM +0300, Dan Carpenter wrote:
> > > > > On Tue, Apr 14, 2020 at 03:34:41PM -0300, Jason Gunthorpe wrote:
> > > > > > The memcpy is still kind of silly right? What about this:
> > > > > > 
> > > > > > static int ocrdma_add_stat(char *start, char *pcur, char *name, u64 count)
> > > > > > {
> > > > > > 	size_t len = (start + OCRDMA_MAX_DBGFS_MEM) - pcur;
> > > > > > 	int cpy_len;
> > > > > > 
> > > > > > 	cpy_len = snprintf(pcur, len, "%s: %llu\n", name, count);
> > > > > > 	if (cpy_len >= len || cpy_len < 0) {
> > > > > 
> > > > > The kernel version of snprintf() doesn't and will never return
> > > > > negatives.  It would cause a huge security headache if it started
> > > > > returning negatives.
> > > > 
> > > > Begs the question why it returns an int then :)
> > > 
> > > People should use "int" as their default type.  "int i;".  It means
> > > "This is a normal number.  Nothing special about it.  It's not too high.
> > > It's not defined by hardware requirements."  Other types call attention
> > > to themselves, but int is the humble datatype.
> > 
> > No, I strongly disagree with this, it is one of my pet peeves to see
> > 'int' being used for data which is known to be only ever be positive
> > just to save typing 'unsigned'.
> > 
> > Not only is it confusing, but allowing signed values has caused tricky
> > security bugs, unfortuntely.
> 
> I have the opposite pet peeve.
> 
> I complain about it a lot.  It pains me every time I see a "u32 i;".  I
> think there is a static analysis warning for using signed which
> encourages people to write code like that.  That warning really upsets
> me for two reasons 1) The static checker should know the range of values
> but it doesn't so it makes me sad to see inferior technology being used
> when it should deleted instead.  2)  I have never seen this warning
> prevent a real life bug.

I have.. But I'm having trouble finding it in the git torrent..

Maybe this one:

commit c2b37f76485f073f020e60b5954b6dc4e55f693c
Author: Boris Pismenny <borisp@mellanox.com>
Date:   Thu Mar 8 15:51:41 2018 +0200

    IB/mlx5: Fix integer overflows in mlx5_ib_create_srq

> You would need to hit a series of fairly rare events for this
> warning to be useful and I have never seen that happen yet.

IIRC the case was the uapi rightly used u32, which was then wrongly
implicitly cast to some internal function,  accepting int, which then
did something sort of like

  int len
  if (len >= sizeof(a))
       return -EINVAL
  copy_from_user(a, b, len)

Which explodes when a negative len is implicitly cast to unsigned long
to call copy_from_user.

> The most common bug caused by unsigned variables is that it breaks the
> kernel error handling 

You mean returning -ERRNO? Sure, those should be int, but that is a
case where a value actually can take on -ve numbers, so it really
should be signed.

> but there are other problems as well.  There was an example a little
> while back where someone "fixed" a security problem by making things
> unsigned.
> 
> 	for (i = 0; i < user_value; i++) {

This is clearly missing input validation on user_value, the only
reason int helps at all here is pure dumb luck for this one case.

If it had used something like copy_to_user it would be broken.

> Originally if user_value was an int then the loop would have been a
> harmless no-op but now it was a large positive value so it lead to
> memory corruption.  Another example is:
> 
> 	for (i = 0; i < user_value - 1; i++) {

Again, code like this is simply missing required input validation. The
for loop works with int by dumb luck, and this would be broken if it
called copy_from_user.
 
> From my experience with static analysis and security audits, making
> things unsigned en mass causes more security bugs.  There are definitely
> times where making variables unsigned is correct for security reasons
> like when you are taking a size from userspace.

Any code that casts a unsigned value from userspace to a signed value
in the kernel is deeply suspect, IMHO.

If you get the in habit of using types properly then it is less likely
this bug-class will happen. If your habit is to just always use 'int'
for everything then you *will* accidently cause a user value to be
implicitly casted.

> Complicated types call attention to themselves and they hurt
> readability.  You sometimes *need* other datatypes and you want those to
> stand out but if everything is special then nothing is special.

If the programmer knows the value is never negative it should be
recorded in the code, otherwise it is hard to tell if there are
problems or not.

Is this code wrong?

 int array_idx;
 ...
 if (array_idx < ARRAY_SIZE(foo))
    return foo[array_idx];
 
Since 'int' was used the entire code flow has to be studied to
determine if 'array_idx' is ever accidently set to negative. If it is
unsigned I can tell you there is no problem right away.

I do agree with you that people blindly changing things due to
security scanners is not good..

Jason
