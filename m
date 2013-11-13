From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Nov 2013 14:07:31 +0000
Subject: Re: [patch] locks: missing unlock on error in generic_add_lease()
Message-Id: <20131113140731.GN5302@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131113075627.GJ25541@elgon.mountain>
 <20131113135103.GA27536@pad.fieldses.org>
In-Reply-To: <20131113135103.GA27536@pad.fieldses.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@redhat.com>
Cc: Matthew Wilcox <matthew@wil.cx>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Nov 13, 2013 at 08:51:04AM -0500, J. Bruce Fields wrote:
> On Wed, Nov 13, 2013 at 10:56:27AM +0300, Dan Carpenter wrote:
> > We should unlock here before returning.
> 
> A buggy-caller case, so shouldn't be a huge deal, but obviously should
> be fixed, thanks!
> 
> 	Acked-by: J. Bruce Fields <bfields@redhat.com>
> 
> I'm assuming Al will pick it up.
> 
> (Though error = -EAGAIN and "goto out" would be more consistent with
> other exits.)


-EINVAL, but yeah you're right.  I'll resend.

regards,
dan carpenter


