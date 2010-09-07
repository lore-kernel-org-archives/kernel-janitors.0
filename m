From: David Miller <davem@davemloft.net>
Date: Tue, 07 Sep 2010 01:29:35 +0000
Subject: Re: [PATCH 1/2] drivers/net/fs_enet/fs_enet-main.c: Add
Message-Id: <20100906.182935.212701145.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283595164-29146-1-git-send-email-julia@diku.dk>
In-Reply-To: <1283595164-29146-1-git-send-email-julia-dAYI7NvHqcQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia-dAYI7NvHqcQ@public.gmane.org
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vbordug-hkdhdckH98+B+jHODAdFcQ@public.gmane.org, pantelis.antoniou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org

From: Julia Lawall <julia@diku.dk>
Date: Sat,  4 Sep 2010 12:12:43 +0200

> In this case, a device_node structure is stored in another structure that
> is then freed without first decrementing the reference count of the
> device_node structure.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
