From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 29 Sep 2015 08:09:08 +0000
Subject: Re: [v2] mwifiex: fix mwifiex_rdeeprom_read()
Message-Id: <20150929080908.CC1F813F7C4@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20150921161953.GQ5004@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Amitkumar Karwar <akarwar@marvell.com>, Nishant Sarmukadam <nishants@marvell.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org


> There were several bugs here.
> 
> 1)  The done label was in the wrong place so we didn't copy any
>     information out when there was no command given.
> 
> 2)  We were using PAGE_SIZE as the size of the buffer instead of
>     "PAGE_SIZE - pos".
> 
> 3)  snprintf() returns the number of characters that would have been
>     printed if there were enough space.  If there was not enough space
>     (and we had fixed the memory corruption bug #2) then it would result
>     in an information leak when we do simple_read_from_buffer().  I've
>     changed it to use scnprintf() instead.
> 
> I also removed the initialization at the start of the function, because
> I thought it made the code a little more clear.
> 
> Fixes: 5e6e3a92b9a4 ('wireless: mwifiex: initial commit for Marvell mwifiex driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Amitkumar Karwar <akarwar@marvell.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
