From: walter harms <wharms@bfs.de>
Date: Tue, 29 Jun 2010 12:56:49 +0000
Subject: Re: [PATCH 01/25] r852: remove casts from void*
Message-Id: <4C29ED91.2010309@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1277806498-30738-1-git-send-email-segooon@gmail.com> <20100629123850.GO19184@bicker>
In-Reply-To: <20100629123850.GO19184@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>, Kernel Janitors <kernel-janitors@vger.kernel.org>, linux-kernel@vger.kernel.org



Dan Carpenter schrieb:
> On Tue, Jun 29, 2010 at 02:14:57PM +0400, Kulikov Vasiliy wrote:
>> Remove unnesessary casts from void*.
>>
> 
> 1) The subjects are not helpful.  This one should say something about
> "mtd" but it doesn't.
> 2) These haven't been run through checkpatch.pl.  In fact, I can't be 
> certain anyone looked at these patches when I see things like:
> 
> -    if((( lp = (struct wl_private *)dev->priv ) != NULL ) &&
> -          !( lp->flags & WVLAN2_UIL_BUSY )) {
> +    if((( lp = dev->priv ) != NULL ) &&
> +       !( lp->flags & WVLAN2_UIL_BUSY )) {
> 
> On the recieving end, someone has to review every patch that gets merged.
> 


same problem in drivers/scsi/sg.c but that would requiere a additional patch.

re,
 wh

