From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Tue, 15 Aug 2017 09:45:37 +0000
Subject: Re: [PATCH] netfilter: fix indent on in statements
Message-Id: <6b38b83c-21b3-5cec-6145-cdbb54a63dd2@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170815065025.18471-1-colin.king@canonical.com>
In-Reply-To: <20170815065025.18471-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, Stephen Hemminger <stephen@networkplumber.org>, "David S . Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, bridge@lists.linux-foundation.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello!

On 8/15/2017 9:50 AM, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The returns on some if statements are not indented correctly,

    s/in/if/ in the subject?

> add in the missing tab.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
[...]

MBR, Sergei
