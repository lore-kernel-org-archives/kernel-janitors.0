From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Date: Wed, 16 Sep 2020 16:53:57 +0000
Subject: Re: [PATCH] MAINTAINERS: mark linux-samsung-soc list non-moderated
Message-Id: <20200916165357.GA18287@kozik-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200914061353.17535-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200914061353.17535-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Sep 14, 2020 at 08:13:53AM +0200, Lukas Bulwahn wrote:
> In fifteen entries mentioning linux-samsung-soc@vger.kernel.org in
> MAINTAINERS, seven entries mention the list being moderated for
> non-subscribers and eight entries do not. Clearly only one can be right,
> though.
> 
> Joe Perches suggested that all vger.kernel.org are not moderated for
> non-subscribers.
> 
> Remove all the remarks from the entries following Joe's suggestion.
> 
> Link: https://lore.kernel.org/lkml/da6f30896a8fd78635b3ca454d77a5292a9aa76d.camel@perches.com/
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on v5.9-rc5 and next-20200911
> 
> Krzysztof, please pick this minor non-urgent cleanup patch.
> 
> This patch submission will also show me if linux-samsung-soc is moderated
> or not. I have not subscribed to linux-samsung-soc and if it shows up
> quickly in the archive, the list is probably not moderated, and hence,
> validating the patch.

Please use scripts/get_maintainers.pl (for example on files in modified
maintainers section) to get the addresses of people.  This mail missed
all my filters and got archived immediately because you sent it to
unusual address (how did you get this address, BTW? It does not appear
in the sources since few years).

Thanks, applied.

Best regards,
Krzysztof
