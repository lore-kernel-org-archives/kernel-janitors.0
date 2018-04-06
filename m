From: Arend van Spriel <arend.vanspriel@broadcom.com>
Date: Fri, 06 Apr 2018 08:45:00 +0000
Subject: Re: [PATCH v2] rsi: remove unecessary PTR_ALIGN()s
Message-Id: <5AC7338C.3000307@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180406083717.GA21857@mwanda>
In-Reply-To: <20180406083717.GA21857@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: Amitkumar Karwar <amit.karwar@redpinesignals.com>, Prameela Rani Garnepudi <prameela.j04cs@gmail.com>, Karun Eagalapati <karun256@gmail.com>, Siva Rebbagondla <siva.rebbagondla@redpinesignals.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On 4/6/2018 10:37 AM, Dan Carpenter wrote:
> The issue here is that we allocate "data" and then set
> "data = PTR_ALIGN(data, 8);" and then we free the aligned pointer
> instead of the original pointer.
>
> kmalloc() pointers are already ARCH_SLAB_MINALIGN aligned which is 8 or
> more on everything except certain Xtensa variants.  We decided that if
> the Xtensa people ever notice a bug here then we'll tell them the bug is
> on their side.  ;)

I am not sure if it was decided to be a xtensa bug, but just to ignore 
the issue until it would arise. Anyway, not sure if the last sentence is 
useful in the commit message.

Regards,
Arend

