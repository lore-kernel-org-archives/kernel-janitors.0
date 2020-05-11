From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 11 May 2020 06:48:21 +0000
Subject: Re: net/sonic: Fix some resource leaks in error handling paths
Message-Id: <9994a7de-0399-fb34-237a-a3c71b3cf568@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b7651b26-ac1e-6281-efb2-7eff0018b158@web.de>
 <alpine.LNX.2.22.394.2005100922240.11@nippy.intranet>
 <9d279f21-6172-5318-4e29-061277e82157@web.de>
 <alpine.LNX.2.22.394.2005101738510.11@nippy.intranet>
 <bc70e24c-dd31-75b7-6ece-2ad31982641e@web.de>
 <alpine.LNX.2.22.394.2005110845060.8@nippy.intranet>
In-Reply-To: <alpine.LNX.2.22.394.2005110845060.8@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Finn Thain <fthain@telegraphics.com.au>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>

> If you can't determine when the bug was introduced,

I might be able to determine also this information.


> how can you criticise a patch for the lack of a Fixes tag?

I dared to point two details out for the discussed patch.


>> To which commit would you like to refer to for the proposed adjustment
>> of the function “mac_sonic_platform_probe”?
>
> That was my question to you. We seem to be talking past each other.

We come along different views for this patch review.
Who is going to add a possible reference for this issue?


>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=e99332e7b4cda6e60f5b5916cf9943a79dbef902#n460
>
> My preference is unimportant here.

It is also relevant here because you added the tag “Reviewed-by”.
https://lore.kernel.org/patchwork/comment/1433193/
https://lkml.org/lkml/2020/5/8/1827


> I presume that you mean to assert that Christophe's patch
> breaches the style guide.

I propose to take such a possibility into account.


> However, 'sonic_probe1' is the name of a function.

The discussed source file does not contain such an identifier.
https://elixir.bootlin.com/linux/v5.7-rc5/source/drivers/net/ethernet/natsemi/macsonic.c#L486
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/natsemi/macsonic.c?id=2ef96a5bb12be62ef75b5828c0aab838ebb29cb8#n486


> This is not some sequence of GW-BASIC labels referred to in the style guide.

I recommend to read the current section “7) Centralized exiting of functions”
once more.


>> Can programming preferences evolve into the direction of “say what the
>> goto does”?
>
> I could agree that macsonic.c has no function resembling "probe1",
> and that portion of the patch could be improved.

I find this feedback interesting.


> Was that the opinion you were trying to express by way of rhetorical
> questions? I can't tell.

Some known factors triggered my suggestion to consider the use of
the label “free_dma”.


> Is it possible for a reviewer to effectively criticise C by use of
> English, when his C ability surpasses his English ability?

We come along possibly usual communication challenges.

Regards,
Markus
