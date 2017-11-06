From: Jiri Benc <jbenc@redhat.com>
Date: Mon, 06 Nov 2017 15:16:20 +0000
Subject: Re: [PATCH] rtnetlink: fix missing size for IFLA_IF_NETNSID
Message-Id: <20171106161620.7080cf66@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171106150454.9623-1-colin.king@canonical.com>
In-Reply-To: <20171106150454.9623-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, David Ahern <dsahern@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon,  6 Nov 2017 15:04:54 +0000, Colin King wrote:
> The size for IFLA_IF_NETNSID is missing from the size calculation
> because the proceeding semicolon was not removed. Fix this by removing
> the semicolon.

Acked-by: Jiri Benc <jbenc@redhat.com>

Thanks for spotting this! Looking at my initial code, I had that right,
this was probably introduced during one of rebases, so I blame
Flavio :-p (On a serious note, thank you, Flavio, for taking care of
the rebases.)

Hopefully, with the "+ 0" added, this won't happen again in this
particular piece of code in the future.

 Jiri
