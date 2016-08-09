From: Florian Fainelli <f.fainelli@gmail.com>
Date: Tue, 09 Aug 2016 17:39:40 +0000
Subject: Re: [PATCH v2] net: dsa: b53: constify b53_io_ops structures
Message-Id: <ef2b8dcb-1a30-7de3-0713-8e8b46d89c1c@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470762585-2670-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1470762585-2670-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/09/2016 10:09 AM, Julia Lawall wrote:
> The b53_io_ops structures are never modified, so declare them as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
