From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Tue, 09 Aug 2016 12:05:31 +0000
Subject: Re: [PATCH] rtc: pcf2123: Add missing error code assignment before test
Message-Id: <20160809120531.GY8132@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470743907-11498-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1470743907-11498-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: a.zummo@towertech.it, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 09/08/2016 at 13:58:27 +0200, Christophe JAILLET wrote :
> It is likely that checking the result of 'pcf2123_write_reg' is expected
> here.
> Also fix a small style issue. The '{' at the beginning of the function
> is misplaced.
> 
> Fixes: 809b453b76e15 ("rtc: pcf2123: clean up writes to the rtc chip")
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/rtc/rtc-pcf2123.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
