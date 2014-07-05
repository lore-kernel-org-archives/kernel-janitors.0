From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 05 Jul 2014 20:28:21 +0000
Subject: Re: [PATCH] appletalk: Set skb with destructor
Message-Id: <20140705202821.GA25880@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1404534494-6253-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1404534494-6253-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, acme@ghostprotocols.net

On Sat, Jul 05, 2014 at 07:28:14AM +0300, Andrey Utkin wrote:
> See https://bugzilla.kernel.org/show_bug.cgi?idy441
> ---8<---
> Made changes similar to 0ae89beb283a0db5980d1d4781c7d7be2f2810d6
> 

Thanks for fixing this bug but the patch description is just a URL and a
git hash.  Say something like:

The sock ref counting is off so there is a kernel panic when you run
`atalkd`.  See https://bugzilla.kernel.org/show_bug.cgi?idy441
This fix is similar to 0ae89beb283a ('can: add destructor for self
generated skbs')

--------------------------

Putting a little information directly in the changelog that it is about
refcounting and panics is a useful thing.

Also you need to send this to netdev@vger.kernel.org and CC
"David S. Miller" <davem@davemloft.net>.  Otherwise the patch looks good
to my non-expert eye.  Please resend to with the updated changelog and
CC list.

regards,
dan carpenter

