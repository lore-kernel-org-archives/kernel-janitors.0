From: Jiri Slaby <jirislaby@gmail.com>
Date: Thu, 22 Jul 2010 08:56:13 +0000
Subject: Re: [patch -next] ath5k: snprintf() returns largish values
Message-Id: <4C4807AD.5090302@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100722085202.GV17585@bicker>
In-Reply-To: <20100722085202.GV17585@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "Luis R. Rodriguez" <lrodriguez@atheros.com>, Nick Kossifidis <mickflemm@gmail.com>, Bob Copeland <me@bobcopeland.com>, "John W. Linville" <linville@tuxdriver.com>, Bruno Randolf <br1@einfach.org>, linux-wireless@vger.kernel.org, ath5k-devel@lists.ath5k.org, kernel-janitors@vger.kernel.org

On 07/22/2010 10:52 AM, Dan Carpenter wrote:
> snprintf() returns the number of characters that would have been written
> (not counting the NUL character).  So we can't use it as the limiter to 
> simple_read_from_buffer() without capping it first at sizeof(buf).

Doesn't scnprintf make more sense here?

thanks,
-- 
js
