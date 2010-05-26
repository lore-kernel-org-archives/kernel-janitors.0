From: =?UTF-8?Q?Sjur_Br=C3=A6ndeland?= <sjurbren@gmail.com>
Date: Wed, 26 May 2010 18:18:36 +0000
Subject: Re: [patch] caif: unlock on error path in cfserl_receive()
Message-Id: <AANLkTimYIjrnOwzSyALY42fhNojwh1zawaFMUVC1ml6Y@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100526151648.GA15439@bicker>
In-Reply-To: <20100526151648.GA15439@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: Sjur Braendeland <sjur.brandeland@stericsson.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan.

Dan Carpenter <error27@gmail.com> wrote:
> There was an spin_unlock missing on the error path.  The spin_lock was
> tucked in with the declarations so it was hard to spot.  I added a new
> line.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Acked-by: Sjur Braendeland

Well spotted! Thanks for reviewing and fixing this.

Regards
Sjur
