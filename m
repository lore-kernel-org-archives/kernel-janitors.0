From: Joe Perches <joe@perches.com>
Date: Sun, 21 Aug 2016 18:03:43 +0000
Subject: Re: [PATCH 0/2] IB/core: Fine-tuning for ib_is_udata_cleared()
Message-Id: <1471802623.3746.1.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
         <f7bb3caf-81cd-fba9-afc8-5fac72b8a4b3@users.sourceforge.net>
In-Reply-To: <f7bb3caf-81cd-fba9-afc8-5fac72b8a4b3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Sean Hefty <sean.hefty@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sun, 2016-08-21 at 19:39 +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 21 Aug 2016 19:34:12 +0200
> 
> A few update suggestions were taken into account
> from static source code analysis.

Don't introduce a defect in patch 1 and correct
that introduced defect in patch 2.

This should be a single patch.

