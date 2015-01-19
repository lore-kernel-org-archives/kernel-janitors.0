From: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 19 Jan 2015 20:31:43 +0000
Subject: Re: [PATCH] MTD: Deletion of checks before the function call "iounmap"
Message-Id: <20150119203143.GL9759@ld-irv-0074>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <54BBE87C.9020705@users.sourceforge.net>
 <20150119175835.GH9759@ld-irv-0074>
 <54BD4AB6.70708@users.sourceforge.net>
 <20150119183057.GI9759@ld-irv-0074>
 <54BD55F6.6090609@users.sourceforge.net>
In-Reply-To: <54BD55F6.6090609@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>

On Mon, Jan 19, 2015 at 08:07:34PM +0100, SF Markus Elfring wrote:
> >> I published scripts for static source code analysis in March 2004.

^^ That would be March 2014, not March 2004.

> > I didn't ask "when?"; where?
> 
> https://lkml.org/lkml/2014/3/5/356
> http://article.gmane.org/gmane.comp.version-control.coccinelle/3513/
> https://systeme.lip6.fr/pipermail/cocci/2014-March/000676.html
> 
> Do you get further ideas from this software analysis approach?

I suppose. I've gotten the idea that I can generate a ton of patches
using an automated tool, not test or research them, possibly add bugs to
the kernel, and still get a good percentage of my patches merged.

Now, have *you* learned anything from this approach?

Brian
