From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 10 May 2020 05:30:50 +0000
Subject: Re: [PATCH] net/sonic: Fix some resource leaks in error handling paths
Message-Id: <9d279f21-6172-5318-4e29-061277e82157@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b7651b26-ac1e-6281-efb2-7eff0018b158@web.de>
 <alpine.LNX.2.22.394.2005100922240.11@nippy.intranet>
In-Reply-To: <alpine.LNX.2.22.394.2005100922240.11@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Finn Thain <fthain@telegraphics.com.au>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>

> Is there a way to add a Fixes tag that would not invoke the -stable
> process? And was that what you had in mind?

Christophe Jaillet proposed to complete the exception handling also for this
function implementation.
I find that such a software correction is qualified for this tag.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=e99332e7b4cda6e60f5b5916cf9943a79dbef902#n183

Corresponding consequences can vary then according to the change management
of involved developers.


> I think 'undo_probe1' is both descriptive and consistent with commit
> 10e3cc180e64 ("net/sonic: Fix a resource leak in an error handling path in
> 'jazz_sonic_probe()'").

I can agree to this view (in principle).

By the way:
The referenced commit contains the tag “Fixes”.
https://lore.kernel.org/patchwork/patch/1231354/
https://lore.kernel.org/lkml/20200427061803.53857-1-christophe.jaillet@wanadoo.fr/


> Your suggestion, 'free_dma' is also good.

Thanks for your positive feedback.


> But coming up with good alternatives is easy.

But the change acceptance can occasionally become harder.


> If every good alternative would be considered there would be no obvious way
> to get a patch merged.

I imagine that some alternatives can result in preferable solutions, can't they?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=e99332e7b4cda6e60f5b5916cf9943a79dbef902#n460

Regards,
Markus
