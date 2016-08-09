From: Florian Fainelli <f.fainelli@gmail.com>
Date: Tue, 09 Aug 2016 17:25:18 +0000
Subject: Re: [PATCH] net: dsa: b53: constify xfrm_replay structures
Message-Id: <8625595c-c611-dada-df0c-15a15b77993c@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470761889-26808-1-git-send-email-Julia.Lawall@lip6.fr>
 <4a13be00-d6ac-2c40-b7a6-1436072d36b8@gmail.com>
In-Reply-To: <4a13be00-d6ac-2c40-b7a6-1436072d36b8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/09/2016 10:23 AM, Florian Fainelli wrote:
> On 08/09/2016 09:58 AM, Julia Lawall wrote:
>> The xfrm_replay structures are never modified, so declare them as const.
> 
> You mean b53_io_ops here, right? Other than that LTGM, but this will
> have to wait for "net"next to re_open since this is more of a cleanup
> than bugfix. Thanks!

net-next is open again, just noticed that, please resubmit with
s/xfrm_read/b53_io_ops/, thanks
-- 
Florian
