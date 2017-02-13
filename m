From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Feb 2017 10:53:50 +0000
Subject: Re: [PATCH 4/5] IB/hfi1: Use memdup_user() rather than duplicating its implementation in hfi1_user_s
Message-Id: <20170213105350.GA4108@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8a997282-09c7-0f9f-645e-d7c6e8c79e67@users.sourceforge.net>
 <b19e44b3-601f-c642-b8d3-12c000511ce2@users.sourceforge.net>
 <477c8499-93ad-253d-aa2b-8f209ecfad62@intel.com>
In-Reply-To: <477c8499-93ad-253d-aa2b-8f209ecfad62@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dennis Dalessandro <dennis.dalessandro@intel.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>, Sean Hefty <sean.hefty@intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Feb 11, 2017 at 10:32:59AM -0500, Dennis Dalessandro wrote:
> On 02/10/2017 04:04 PM, SF Markus Elfring wrote:
> >From: Markus Elfring <elfring@users.sourceforge.net>
> >Date: Fri, 10 Feb 2017 21:01:55 +0100
> >
> >Reuse existing functionality from memdup_user() instead of keeping
> >duplicate source code.
> >
> >Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> Thanks for the patch, but this one is already taken care of along
> with other similar uses of kmalloc/copy:
> 
> http://marc.info/?l=linux-rdma&m8656088729538&w=2
> 

Michael's patch doesn't change user_sdma_free_request() so it introduces
a kfreeing an error pointer bug.

regards,
dan carpenter

