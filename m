From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 30 Jul 2013 19:13:20 +0000
Subject: Re: What version should I be patching against?
Message-Id: <20130730191320.GE5002@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51F74061.107@gmail.com>
In-Reply-To: <51F74061.107@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jul 30, 2013 at 07:40:38AM -0600, Shaun Laing wrote:
> That's really good information, thank you.
> 
> Dan, I recently submitted a patch and the message back was:
> 
> "This is a note to let you know that I've just added the patch titled
> 
>     staging: comedi: dt9812: Resolves sparse endian warnings.
> 
> to my staging git tree which can be found at
>     git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> in the staging-next branch.
> "
> 
> Is it wrong to be patching against this
> (git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git),
> then? (I also see a reference to this at
> https://code.google.com/p/kernel-janitors/wiki/TODO under
> "Linux-Staging Tree").

Stephen Rothwell creates linux-next daily.  He takes everyone's
development trees and merges them.

regards,
dan carpenter
