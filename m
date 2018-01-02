From: David Miller <davem@davemloft.net>
Date: Tue, 02 Jan 2018 18:50:30 +0000
Subject: Re: [PATCH 05/12] openvswitch: drop unneeded newline
Message-Id: <20180102.135030.669121099735044482.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
        <1514386305-7402-6-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514386305-7402-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: pshelar@nicira.com, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, dev@openvswitch.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 27 Dec 2017 15:51:38 +0100

> OVS_NLERR prints a newline at the end of the message string, so the
> message string does not need to include a newline explicitly.  Done
> using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
