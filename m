From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Sat, 27 May 2017 18:43:31 +0000
Subject: Re: [PATCH 1/2] blackfin: Delete an error message for a failed memory allocation in bfin_pm_suspend_
Message-Id: <20170527184331.GK390@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a8f92213-f0c5-8a4f-2b9e-60645f426210@users.sourceforge.net>
 <ba3c2de3-a43d-0725-90c2-9c3b465eeb84@users.sourceforge.net>
In-Reply-To: <ba3c2de3-a43d-0725-90c2-9c3b465eeb84@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: adi-buildroot-devel@lists.sourceforge.net, Ingo Molnar <mingo@kernel.org>, Steven Miao <realmz6@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, May 24, 2017 at 08:03:45PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 24 May 2017 19:29:25 +0200
> 
> Omit an extra message for a memory allocation failure in this function.

That's no extra message, that's "won't continue past that point if it happens".

> This issue was detected by using the Coccinelle software.

... which absolves you of any need to think, presumably.
