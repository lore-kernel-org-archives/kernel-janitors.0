From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 05 Dec 2016 20:53:48 +0000
Subject: Re: [PATCH] xen-scsifront: Add a missing call to kfree
Message-Id: <20161205205348.GA31465@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161119182256.9081-1-lambert.quentin@gmail.com>
 <1320a162-dc36-5833-a746-367134dae5e7@suse.com>
In-Reply-To: <1320a162-dc36-5833-a746-367134dae5e7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Juergen Gross <jgross@suse.com>
Cc: Quentin Lambert <lambert.quentin@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Vrabel <david.vrabel@citrix.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Nov 21, 2016 at 07:01:36AM +0100, Juergen Gross wrote:
> On 19/11/16 19:22, Quentin Lambert wrote:
> > Most error branches following the call to kmalloc contain
> > a call to kfree. This patch add these calls where they are
> > missing.
> > 
> > This issue was found with Hector.
> > 
> > Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
> 
> Nice catch. I think this will need some more work, I'll do a
> follow-on patch.
> 

The error handling is really weird.  Could you send your follow on to
this thread?

regards,
dan carpenter

