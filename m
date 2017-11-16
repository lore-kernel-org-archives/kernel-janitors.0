From: Flavio Leitner <fbl@sysclose.org>
Date: Thu, 16 Nov 2017 04:56:46 +0000
Subject: Re: [PATCH] rtnetlink: fix missing size for IFLA_IF_NETNSID
Message-Id: <20171116025646.3327d157@plex.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171106150454.9623-1-colin.king@canonical.com>
        <20171106161620.7080cf66@redhat.com>
In-Reply-To: <20171106161620.7080cf66@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Benc <jbenc@redhat.com>
Cc: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, David Ahern <dsahern@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 6 Nov 2017 16:16:20 +0100
Jiri Benc <jbenc@redhat.com> wrote:

> On Mon,  6 Nov 2017 15:04:54 +0000, Colin King wrote:
> > The size for IFLA_IF_NETNSID is missing from the size calculation
> > because the proceeding semicolon was not removed. Fix this by removing
> > the semicolon.  
> 
> Acked-by: Jiri Benc <jbenc@redhat.com>
> 
> Thanks for spotting this! Looking at my initial code, I had that right,
> this was probably introduced during one of rebases, so I blame
> Flavio :-p (On a serious note, thank you, Flavio, for taking care of
> the rebases.)

That's right, ouch!
Thanks for fixing it.

-- 
Flavio

