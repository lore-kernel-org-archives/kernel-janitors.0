From: Stanislaw Gruszka <sgruszka@redhat.com>
Date: Wed, 22 Aug 2018 13:32:28 +0000
Subject: Re: [PATCH] rt2x00: use simple_read_from_buffer()
Message-Id: <20180822133227.GA2019@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180822104126.2logh4tqxkmiomqy@kili.mountain>
In-Reply-To: <20180822104126.2logh4tqxkmiomqy@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Helmut Schaa <helmut.schaa@googlemail.com>, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Aug 22, 2018 at 01:41:26PM +0300, Dan Carpenter wrote:
> The problem with this copy_to_user() calls is that they don't ensure
> that "size" is less than the "length" which the user provided.
> 
> Obviously, this is debugfs and "size" is normally going to be very small
> so it probably doesn't matter, but this is the correct thing to do.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Stanislaw Gruszka <sgruszka@redhat.com>
