From: Robert Love <robert.w.love@intel.com>
Date: Thu, 18 Nov 2010 19:02:13 +0000
Subject: Re: [patch] [SCSI] libfc: unlocking wrong lock in fc_eh_abort()
Message-Id: <1290106933.1482.78.camel@fritz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101118041843.GN31724@bicker>
In-Reply-To: <20101118041843.GN31724@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "Dev, Vasu" <vasu.dev@intel.com>, "James E.J. Bottomley" <James.Bottomley@suse.de>, "devel@open-fcoe.org" <devel@open-fcoe.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, 2010-11-17 at 20:18 -0800, Dan Carpenter wrote:
> In commit 8b7ac2bb07bb "[SCSI] libfc: possible race could panic system
> due to NULL fsp->cmd" we changed the lock which was used in this
> function, but this path was missed.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Hi Dan,

   I found this bug too and have a patch in my tree.

Thanks, //Rob

