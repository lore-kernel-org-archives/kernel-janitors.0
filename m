From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Fri, 25 Aug 2017 13:50:13 +0000
Subject: Re: [PATCH] staging: r8822be: remove some dead code
Message-Id: <a62f44bc-d379-a947-b336-a760331aac57@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170825084206.upqz4f6kmzzs47xp@mwanda>
In-Reply-To: <20170825084206.upqz4f6kmzzs47xp@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 08/25/2017 03:42 AM, Dan Carpenter wrote:
> "hdr" can't be NULL.  We take skb->data which is non-NULL and add an
> offset to get "hdr".
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks. Looks good.

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Larry
