From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 26 Sep 2016 14:19:44 +0000
Subject: Re: [1/3] hostap: Use memdup_user() rather than duplicating its implementation
Message-Id: <20160926141944.A5DA06151E@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <efa66c16-7998-9ceb-0be6-d62dd249a2dc@users.sourceforge.net>
In-Reply-To: <efa66c16-7998-9ceb-0be6-d62dd249a2dc@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Jouni Malinen <j@w1.fi>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 20 Aug 2016 18:19:43 +0200
> 
> Reuse existing functionality from memdup_user() instead of keeping
> duplicate source code.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch set to Rejected.

[1/3] hostap: Use memdup_user() rather than duplicating i... 2016-08-20 SF Markus El Rejected

Reason: A similar patch is already applied.

Applying: hostap: Use memdup_user() rather than duplicating its implementation
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/intersil/hostap/hostap_ioctl.c
CONFLICT (content): Merge conflict in drivers/net/wireless/intersil/hostap/hostap_ioctl.c
Failed to merge in the changes.
Patch failed at 0001 hostap: Use memdup_user() rather than duplicating its implementation

-- 
https://patchwork.kernel.org/patch/9306999/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

