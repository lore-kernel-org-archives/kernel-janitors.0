From: Stanislaw Gruszka <sgruszka@redhat.com>
Date: Thu, 11 Aug 2016 14:48:50 +0000
Subject: Re: [PATCH] rt2x00usb: Fix error return code
Message-Id: <20160811144849.GA8018@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470926334-24532-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1470926334-24532-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: helmut.schaa@googlemail.com, kvalo@codeaurora.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 11, 2016 at 04:38:54PM +0200, Christophe JAILLET wrote:
> We know that 'retval = 0' because it has been tested a few lines above.
> So, if 'devm_kmalloc' fails, 0 will be returned instead of an error code.
> Return -ENOMEM instead.
> 
> Fixes: 8b4c0009313f ("rt2x00usb: Use usb anchor to manage URB")
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Acked-by: Stanislaw Gruszka <sgruszka@redhat.com>
