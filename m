From: Jiri Kosina <jikos@kernel.org>
Date: Fri, 21 Oct 2016 07:24:05 +0000
Subject: Re: [PATCH 5/6] FRV-setup: Fix indentation in two lines
Message-Id: <alpine.LNX.2.00.1610210923330.31629@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405b16a-c470-531d-458d-fb6042b93230@users.sourceforge.net> <81f557b2-40f3-0625-331d-c5b115f1971c@users.sourceforge.net>
In-Reply-To: <81f557b2-40f3-0625-331d-c5b115f1971c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, 21 Oct 2016, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 20 Oct 2016 22:25:18 +0200
> 
> The script "checkpatch.pl" pointed information out like the following.
> 
> WARNING: please, no spaces at the start of a line
> 
> Thus fix the affected source code places.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

I think we really should update the documentation so that it states that 
checkpatch should only be run on patches or code that's not merged yet.

-- 
Jiri Kosina
SUSE Labs

