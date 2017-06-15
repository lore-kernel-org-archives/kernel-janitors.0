From: "J. Bruce Fields" <bfields@fieldses.org>
Date: Thu, 15 Jun 2017 21:40:02 +0000
Subject: Re: [PATCH] reconnect_one(): fix a missing error code
Message-Id: <20170615214002.GA6195@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614093002.GG29394@elgon.mountain>
 <20170614203414.GC32208@fieldses.org>
 <87lgou6xqm.fsf@notabene.neil.brown.name>
In-Reply-To: <87lgou6xqm.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: NeilBrown <neilb@suse.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "J. Bruce Fields" <bfields@redhat.com>, David Howells <dhowells@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jun 15, 2017 at 07:54:57AM +1000, NeilBrown wrote:
> On Wed, Jun 14 2017, J. Bruce Fields wrote:
> 
> > On Wed, Jun 14, 2017 at 12:30:02PM +0300, Dan Carpenter wrote:
> >> I found this bug by reviewing places where we do ERR_PTR(0) (which is
> >> NULL).
> >> 
> >> We used to return an error pointer if lookup_one_len() failed but we
> >> moved this code into a helper function and accidentally removed that.
> >> NULL is a valid return for this function but it's not what we intended.
> >> 
> >> Fixes: bbf7a8a3562f ("exportfs: move most of reconnect_path to helper function")
> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > ACK.  Agreed that the current code is wrong, and that this is the
> > correct fix.
> >
> > What I don't quite understand yet is what the impact of the bug would
> > be.
> >
> 
> It is interesting that reconnect_path() handles the possibility of
> reconnect_one() returning NULL, even though it will only do that if this
> "bug" is triggered.

As Dan says, you're missing a case.

> When that happens, the target_dir (a descendent of dentry) gets its
> DCACHE_DISCONNECTED flag cleared.
> 
> The bug can presumably only be triggered by a race.
> We look through a directory to find the name for an  inode
> (exportfs_get_name), then try to look up that name and it doesn't exist.

Wouldn't lookup_one_len succesfully return a negative dentry in that
case?

I think the error cases here are more likely due to permissions or IO
errors.

So, I wonder if you can get some kind of dcache corruption with an
uncached lookup of a directory with an ancestor that we lack permission
to.

> So presumably if you lose the race, some dentry will get
> DCACHE_DISCONNECTED cleared, even though it is still disconnected.
> This breaks a contract and can cause weirdness in dcache operations.
> 
> If the lookup_one_len_unlocked() fails, we should probably retry, at
> least once.  But if we do decide to give up, we shouldn't assume it all
> worked.
> 
> So I suggest:
>  - the fix as provided by Dan, plus
>  - remove "if (!parent) break;" from reconnect_path(), plus
>  - maybe retry the get_name/lookup_one operation once if the first
>     attempt fails.

See the comments in the code--if we lose the race, then it's because of
a concurrent operation which should have done the reconnection for us.

--b.
