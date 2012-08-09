From: Pavel Roskin <proski@gnu.org>
Date: Thu, 09 Aug 2012 21:18:19 +0000
Subject: Re: [patch] wireless: at76c50x: signedness bug in at76_dfu_get_state()
Message-Id: <20120809171819.00c66bee@mj>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120809065730.GA7925@elgon.mountain>
In-Reply-To: <20120809065730.GA7925@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 9 Aug 2012 09:57:30 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This return holds the number of bytes transfered (1 byte) or a
> negative error code.  The type should be int instead of u8.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Pavel Roskin <proski@gnu.org>

Nice catch, thanks!

-- 
Regards,
Pavel Roskin
