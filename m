From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Sep 2013 08:17:10 +0000
Subject: Re: [PATCH v4:No Change] xHCI:Fixing xhci_readl definition and function call
Message-Id: <20130903081710.GE6329@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1377970365-5420-1-git-send-email-kumargauravgupta3@gmail.com>
 <522557B7.8080909@gmail.com>
In-Reply-To: <522557B7.8080909@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Gaurav <kumargauravgupta3@gmail.com>
Cc: sarah.a.sharp@linux.intel.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Sep 03, 2013 at 08:59:59AM +0530, Kumar Gaurav wrote:
> I tried applying this patch on linux-next and it applies well.
> i used
>     git apply --apply
> 

The merge window is open.  No one is applying patches until -rc1 comes
out.

This one is not redone in the right way.  The subject is wrong:

 Bad: [PATCH v4:No Change] xHCI:Fixing xhci_readl definition and function call
Good: [PATCH v4] xHCI: Fixing xhci_readl definition and function call

There should be a note under the --- line to say what changed and why
you are resending.  It's not helpful to say "No Change" because actually
there were many changes.

---
v4: Update to apply on linux-next.

regards,
dan carpenter

