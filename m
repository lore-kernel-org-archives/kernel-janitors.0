From: James Morris <jmorris@namei.org>
Date: Sun, 29 Jan 2017 23:43:31 +0000
Subject: Re: [PATCH 3/3] ima_fs: Move three error code assignments in ima_write_policy()
Message-Id: <alpine.LRH.2.20.1701301036590.27354@namei.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e06d5392-5262-2d88-aa6b-79e53a20fc8b@users.sourceforge.net>         <b6339fa4-69b3-afc4-18a8-254369fec074@users.sourceforge.net> <1485520764.2596.89.camel@linux.vnet.ibm.com>
In-Reply-To: <1485520764.2596.89.camel@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linux-ima-devel@lists.sourceforge.net, linux-ima-user@lists.sourceforge.net, linux-security-module@vger.kernel.org, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <james.l.morris@oracle.com>, "Serge E. Hallyn" <serge@hallyn.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, 27 Jan 2017, Mimi Zohar wrote:

> On Wed, 2017-01-25 at 10:34 +0100, SF Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Tue, 24 Jan 2017 22:47:07 +0100
> > 
> > A local variable was set to an error code in three cases before a concrete
> > error situation was detected. Thus move the corresponding assignments into
> > if branches to indicate a software failure there.
> > 
> > This issue was detected by using the Coccinelle software.
> 
> This coding style was pretty common.  I assume the compiler is smart
> enough to do the right thing.  Is this a FYI, letting us know for the
> future the preferred coding style, or are we really upstreaming these
> sorts of coding style changes?

Nope, and I generally don't want cleanup patches from Markus going into 
the security tree.

See also:
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1254425.html


- James
-- 
James Morris
<jmorris@namei.org>

