From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 31 Aug 2018 15:47:46 +0000
Subject: Re: [PATCH] rt2x00: use simple_read_from_buffer()
Message-Id: <20180831154746.482A460242@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180822104126.2logh4tqxkmiomqy@kili.mountain>
In-Reply-To: <20180822104126.2logh4tqxkmiomqy@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stanislaw Gruszka <sgruszka@redhat.com>, Helmut Schaa <helmut.schaa@googlemail.com>, "David S. Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The problem with this copy_to_user() calls is that they don't ensure
> that "size" is less than the "length" which the user provided.
> 
> Obviously, this is debugfs and "size" is normally going to be very small
> so it probably doesn't matter, but this is the correct thing to do.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Stanislaw Gruszka <sgruszka@redhat.com>

Patch applied to wireless-drivers-next.git, thanks.

f483039cf51a rt2x00: use simple_read_from_buffer()

-- 
https://patchwork.kernel.org/patch/10572845/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
