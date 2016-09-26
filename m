From: Paul Bolle <pebolle@tiscali.nl>
Date: Mon, 26 Sep 2016 09:12:54 +0000
Subject: Re: [PATCH 3/5] ISDN-CAPI: Adjust 17 function calls together with variable assignments
Message-Id: <1474881174.1846.8.camel@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <be07f84d-fc84-e47d-207e-aedd8c960151@users.sourceforge.net>
         <10355972-1c9b-1103-edf3-efde78237cdd@users.sourceforge.net>
In-Reply-To: <10355972-1c9b-1103-edf3-efde78237cdd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, netdev@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sun, 2016-09-25 at 13:13 +0200, SF Markus Elfring wrote:
> The script "checkpatch.pl" can point out that assignments should usually
> not be performed within condition checks.
> Thus move the assignment for a variable to a separate statement
> in four functions.

Did you recycle this commit explanation? Because git diff tells me you
actually touched about eight functions.  

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/isdn/capi/capidrv.c | 59 +++++++++++++++++++++++++++------------------
>  1 file changed, 36 insertions(+), 23 deletions(-)

So I ran checkpatch on this file, just like you did. Specifically, I
did:
    scripts/checkpatch.pl -f drivers/isdn/capi/capidrv.c | grep "assignment in if condition" | wc -l 

It tells me there are actually 18 instances of this "ERROR". Why did
you ignore one of it in this patch?


Paul Bolle
