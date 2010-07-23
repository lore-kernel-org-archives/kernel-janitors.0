From: Dan Carpenter <error27@gmail.com>
Date: Fri, 23 Jul 2010 10:04:42 +0000
Subject: Re: [patch -next] ath5k: snprintf() returns largish values
Message-Id: <20100723095252.GA26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100722085202.GV17585@bicker> <201007231744.14922.br1@einfach.org>
In-Reply-To: <201007231744.14922.br1@einfach.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno Randolf <br1@einfach.org>
Cc: "Luis R. Rodriguez" <lrodriguez@atheros.com>, Nick Kossifidis <mickflemm@gmail.com>, Jiri Slaby <jirislaby@gmail.com>, Bob Copeland <me@bobcopeland.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, ath5k-devel@lists.ath5k.org, kernel-janitors@vger.kernel.org

On Fri, Jul 23, 2010 at 05:44:14PM +0900, Bruno Randolf wrote:
> 
> i think it would be better to make sure the buffer is always big enough to 
> hold all the output (it's not very variable in length), but as a safety net 
> this can't hurt.
> 

This is a smatch thing.  I suppose someday I will fix smatch to
evaulate the strings themselves and verify that the buffer is large
enough.  But for now it's nice to be able to automatically check that
the buffers don't overflow.  

regards,
dan carpenter

