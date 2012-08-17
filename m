From: Daniel Drake <dsd@laptop.org>
Date: Fri, 17 Aug 2012 21:44:19 +0000
Subject: Re: [patch] mtd: cafe_nand: fix an & vs | mistake
Message-Id: <CAMLZHHSDCC1MWBLUCrpXHU_EtRPw3bf1kOTFWS-NE8q3Ane41w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120609160825.GC6488@elgon.mountain>
 <1340018702.2420.32.camel@sauron.fi.intel.com>
In-Reply-To: <1340018702.2420.32.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: artem.bityutskiy@linux.intel.com
Cc: Mike Dunn <mikedunn@newsguy.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>

On Mon, Jun 18, 2012 at 5:25 AM, Artem Bityutskiy
<artem.bityutskiy@linux.intel.com> wrote:
> Pushed this patch to l2-mtd.git and added CC to -stable. The patch seems
> to be a real bug-fix. Daniel, could you please check it - it will be
> shame if it hits -stable and breaks something.

Thanks for catching this, sorry for the delay in looking closely at
it. I double-checked the device specifications and indeed, Dan's
interpretation is correct.

I also tested the patch. System still remains functional and basic
nand performance seems to be the same.

Thanks!
Daniel
