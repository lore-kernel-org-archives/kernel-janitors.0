From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Jun 2017 09:26:14 +0000
Subject: Re: [PATCH] reconnect_one(): fix a missing error code
Message-Id: <20170615092139.cn73xsicoh2c44sw@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614093002.GG29394@elgon.mountain>
 <20170614203414.GC32208@fieldses.org>
 <87lgou6xqm.fsf@notabene.neil.brown.name>
In-Reply-To: <87lgou6xqm.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: NeilBrown <neilb@suse.com>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, "J. Bruce Fields" <bfields@redhat.com>, David Howells <dhowells@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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

No, we return NULL for the goto out_reconnected case.

regards,
dan carpenter


