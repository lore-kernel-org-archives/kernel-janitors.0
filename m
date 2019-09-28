From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 28 Sep 2019 05:55:38 +0000
Subject: Re: nfp: abm: fix memory leak in nfp_abm_u32_knode_replace
Message-Id: <6854393f-8222-3077-1ff8-8be6b07d4862@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190927015157.20070-1-navid.emamdoost@gmail.com>
 <1cde6417-5942-598b-3670-c0a7227ffe25@web.de>
 <20190927144242.7e0d8fde@cakuba.netronome.com>
In-Reply-To: <20190927144242.7e0d8fde@cakuba.netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <jakub.kicinski@netronome.com>, Navid Emamdoost <navid.emamdoost@gmail.com>, netdev@vger.kernel.org, oss-drivers@netronome.com
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen A McCamant <smccaman@umn.edu>, Colin Ian King <colin.king@canonical.com>, "David S. Miller" <davem@davemloft.net>, John Hurley <john.hurley@netronome.com>, Pablo Neira <pablo@netfilter.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>> Can such a change variant be a bit nicer?
>
> Definitely not.
>
> Looks good as is, thanks Navid!

I find it interesting how the software development opinions are different
also in this use case for the implementation of correct and efficient
exception handling.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=f1f2f614d535564992f32e720739cb53cf03489f#n450

Regards,
Markus
