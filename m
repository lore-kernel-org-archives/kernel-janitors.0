From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Dec 2014 13:15:49 +0000
Subject: Re: [patch] CodingStyle: add some more error handling guidelines
Message-Id: <20141203131549.GS5048@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141202085950.GA13434@mwanda>
 <547F0297.6030202@users.sourceforge.net>
 <20141203124511.GR5048@mwanda>
 <alpine.DEB.2.10.1412031352120.2373@hadrien>
In-Reply-To: <alpine.DEB.2.10.1412031352120.2373@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Coccinelle <cocci@systeme.lip6.fr>, backports@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "Luis R. Rodriguez" <mcgrof@suse.com>

On Wed, Dec 03, 2014 at 01:52:53PM +0100, Julia Lawall wrote:
> On Wed, 3 Dec 2014, Dan Carpenter wrote:
> 
> > On Wed, Dec 03, 2014 at 01:31:19PM +0100, SF Markus Elfring wrote:
> > >
> > > * To which source code place should the word "location" refer to?
> > >   - jump source
> > >   - jump target
> >
> > jump target.
> 
> I think you mean source?  Or it really is ambiguous.  The example was
> err_kmalloc_failed, which seems source-related.

Yeah.  You're right.  I misread Markus's email.  The goto location is
where the goto is.  The label location is where the label is.

regards,
dan carpenter
