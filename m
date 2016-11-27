From: Sakari Alius <sakari.ailus@iki.fi>
Date: Sun, 27 Nov 2016 16:21:45 +0000
Subject: Re: [patch] [media] uvcvideo: freeing an error pointer
Message-Id: <20161127162145.GF16630@valkosipuli.retiisi.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161125102835.GA5856@mwanda>
 <2064794.XNX8XhaLMu@avalon>
 <58384F15.4040207@bfs.de>
 <11316049.HORSOXRmDr@avalon>
 <20161125192024.GI6266@mwanda>
In-Reply-To: <20161125192024.GI6266@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, wharms@bfs.de, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Fri, Nov 25, 2016 at 10:20:24PM +0300, Dan Carpenter wrote:
> On Fri, Nov 25, 2016 at 06:02:45PM +0200, Laurent Pinchart wrote:
> > Sakari Ailus (CC'ed) has expressed the opinion that we might want to go one 
> > step further and treat error pointers the same way we treat NULL or ZERO 
> > pointers today, by just returning without logging anything. The reasoning is 
> > that accepting a NULL pointer in kfree() was decided before we made extensive 
> > use of allocation APIs returning error pointers, so it could be time to update 
> > kfree() based on the current allocation usage patterns.
> 
> Just don't free things that haven't been allocated.  That honestly seems
> like a simple rule to me, whenever I touch error handling code it feels
> better and simpler after I fix the bugs.  Error handling doesn't have to
> be complicated if you just follow the rules.

kfree() explicitly allows passing a NULL pointer to it; drivers often call
kfree() on objects possibly allocated using kmalloc() and friends. This
makes error handling easier in drivers which in turn decreases the
probability of bugs, the other side of which we've already seen in form of
the bug this patch fixes.

Previously interfaces that allocated memory tended to either allocate that
memory or in failing to do so, returned error in form of a NULL pointer.
memdup_user() breaks that assumption by returning a negative error value as
a pointer instead.

I suppose one of the motivations of memdup_user() has been to reduce
complexity of driver code as well as framework code dealing with
implementing IOCTLs but at least in this case the end result was an
introduction of a bug. This would not have happened in the first place if
the API of functions dealing with releasing memory had been updated as well.

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
