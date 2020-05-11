From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 11 May 2020 08:20:24 +0000
Subject: Re: net/sonic: Fix some resource leaks in error handling paths
Message-Id: <00a5237c-13b4-07b5-99ee-8f63d4276fb4@web.de>
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
To: Finn Thain <fthain@telegraphics.com.au>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>

>> To which commit would you like to refer to for the proposed adjustment
>> of the function “mac_sonic_platform_probe”?
>
> That was my question to you. We seem to be talking past each other.

I have needed a moment to notice your patch as another constructive response
for this code review.

[PATCH v2] net/sonic: Fix some resource leaks in error handling paths
https://lore.kernel.org/r/3eaa58c16dcf313ff7cb873dcff21659b0ea037d.1589158098.git.fthain@telegraphics.com.au/

Regards,
Markus
