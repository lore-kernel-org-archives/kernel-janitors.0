From: David Miller <davem@davemloft.net>
Date: Thu, 28 Apr 2016 20:38:15 +0000
Subject: Re: [PATCH] ps3_gelic: fix memcpy parameter
Message-Id: <20160428.163815.1737125177217196446.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1461638023-2986-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1461638023-2986-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 26 Apr 2016 04:33:43 +0200

> The size allocated for target->hwinfo and the number of bytes copied in it
> should be consistent.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks.
