From: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 06 Jul 2007 23:16:17 +0000
Subject: [KJ] Re: [PATCH] some kmalloc/memset ->kzalloc (tree wide)
Message-Id: <20070706161617.072f7eea.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <878x9ta320.fsf@wanadoo.fr>
	<20070706175552.GF3400@zakalwe.fi>
	<Line.LNX.4.64.0707061806390.18415@d.namei>
In-Reply-To: <Line.LNX.4.64.0707061806390.18415@d.namei>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Morris <jmorris@namei.org>
Cc: Heikki Orsila <shdl@zakalwe.fi>, Yoann Padioleau <padator@wanadoo.fr>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

On Fri, 6 Jul 2007 18:07:20 -0400 (EDT)
James Morris <jmorris@namei.org> wrote:

> On Fri, 6 Jul 2007, Heikki Orsila wrote:
> 
> > > Transform some calls to kmalloc/memset to a single kzalloc (or 
> > > kcalloc).
> > 
> > I looked all the files through. They looked good to me, except 
> > one case:
> 
> I checked the drivers/net and net/ changes and they looked ok (aside from 
> the above).
> 
> 

OK, thanks for checking it, guys.

Yoann, the "tree wide" thing really is a problem.  Your patch here is
touching ten or more maintainers' code and it really does want to be split
into ten separate patches and fed into the tree via the appropriate routes.

I can take care of that routing if I have the ten patches, but this time I
really can't be bothered splitting the patch up (it's rather boring, and
gets error-prone).

For this patch, I tossed out the ten or so hunks which conflicted with
other pending patches in the various trees and I shall just grit the teeth
and maintain and merge it as a single whopping patch.  (At least this way
I'll actually get some scsi stuff merged).  Anything which conflicts with
anyone's outstanding work will be dropped.

For any future patches, _please_ split them up along some sane lines. 
Generally you'll find that one patch per second-level directory works
pretty well: drivers/net, drivers/scsi, drivers/usb, fs/ext2, drivers/char,
etc.

Thanks.
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
