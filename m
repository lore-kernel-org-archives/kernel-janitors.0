From: Dan Carpenter <error27@gmail.com>
Date: Fri, 29 Jan 2010 09:54:00 +0000
Subject: Re: bug list: dereferencing first then checking
Message-Id: <20100129095400.GB5547@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100129090049.GA5547@bicker>
In-Reply-To: <20100129090049.GA5547@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jan 29, 2010 at 10:23:42AM +0100, Peter Huewe wrote:
> Am Freitag 29 Januar 2010 10:00:49 schrieb Dan Carpenter:
> > These bugs are when code dereferences a variable and then checks that it is
> >  not null. The new thing is that I wrote a shell script to try remove the
> >  false positives caused by macros.  There are still some false positives
> >  because smatch is bad at handling loops and knowing when a container got
> >  redefined.
> > 
> > Sometimes the fixes are not obvious.
> > 
> > This is the output of: /path/to/smatch_scripts/filter_kernel_deref_check.sh
> >  warns.txt
> > 
> > regards,
> > dan carpenter
> 
> Hey Dan,
> 
> can you please explain to me (on a simple example) what is wrong with these 
> code samples? I somehow don't get it.
> 

The first two in the list are not false positives but let's take number 3.

fs/afs/security.c +202
   169          xpermits = auth_vnode->permits;
   170          count = 0;
   171          if (xpermits) {
   172                  /* see if the permit is already in the list
   173                   * - if it is then we just amend the list
   174                   */
   175                  count = xpermits->count;
   176                  permit = xpermits->permits;
   177                  for (loop = count; loop > 0; loop--) {
   178                          if (permit->key = key) {
   179                                  permit->access_mask    180                                          vnode->status.caller_access;
   181                                  goto out_unlock;
   182                          }
   183                          permit++;
   184                  }
   185          }
   186
   187          permits = kmalloc(sizeof(*permits) + sizeof(*permit) * (count + 1),
   188                            GFP_NOFS);
   189          if (!permits)
   190                  goto out_unlock;
   191
   192          memcpy(permits->permits, xpermits->permits,
   193                 count * sizeof(struct afs_permit));
   194
   195          _debug("key %x access %x",
   196                 key_serial(key), vnode->status.caller_access);
   197          permits->permits[count].access_mask = vnode->status.caller_access;
   198          permits->permits[count].key = key_get(key);
   199          permits->count = count + 1;
   200
   201          rcu_assign_pointer(auth_vnode->permits, permits);
   202          if (xpermits)
   203                  call_rcu(&xpermits->rcu, afs_dispose_of_permits);
 
If xpermits were null we would oops on line 192.  It does look like xpermits
can be null.

I suspect the right fix is to test xpermits on line 170 and goto_unlock if
it is null.  We could remove the if statements on lines 171 and 202.
But it would be better to really dig into it and find out for sure if xpermits 
can be null.

Quite a few of the fixes are not straightforward.  Sometimes maybe a variable
could become null inside a function.  Smatch wouldn't catch that.  Some of 
the checks could be removed, but if they don't hurt anything is it worth it?

regards,
dan carpenter 
