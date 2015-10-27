From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Date: Tue, 27 Oct 2015 10:27:23 +0000
Subject: Re: [tpmdd-devel] [PATCH] TPM: Avoid reference to potentially freed memory
Message-Id: <20151027102723.GA9120@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1445545961-5620-1-git-send-email-christophe.jaillet@wanadoo.fr>
 <20151023073733.GA6941@intel.com>
In-Reply-To: <20151023073733.GA6941@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, tpmdd-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Fri, Oct 23, 2015 at 10:37:33AM +0300, Jarkko Sakkinen wrote:
> On Thu, Oct 22, 2015 at 10:32:41PM +0200, Christophe JAILLET wrote:
> > Reference to the 'np' node is dropped before dereferencing the 'sizep' and
> > 'basep' pointers, which could by then point to junk if the node has been
> > freed.
> > 
> > Refactor code to call 'of_node_pup' later.
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> LGTM.

Is there anyone able to provide Tested-by for this?

Christophe, were you able to reproduce the crash (insmod/rmmod couple
of times maybe?) and validate that it was gone after fixing the bug?

> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

/Jarkko
