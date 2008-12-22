From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Date: Mon, 22 Dec 2008 08:44:54 +0000
Subject: Re: [PATCH 1/13] s390: Remove redundant test
Message-Id: <1229935495.1529.9.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812211628030.9555@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812211628030.9555@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: heiko.carstens@de.ibm.com, linux390@de.ibm.com, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2008-12-21 at 16:28 +0100, Julia Lawall wrote:
> The loop above the modified code only terminates when rc is a valid pointer.
> 
> A simplified version of the semantic patch that makes this change is as
> follows: (http://www.emn.fr/x-info/coccinelle/)

Purely cosmetic but simplifies the code. So yes, makes sense.
Added to the s390 patch queue. Thanks Julia.

-- 
blue skies,
  Martin.

"Reality continues to ruin my life." - Calvin.


