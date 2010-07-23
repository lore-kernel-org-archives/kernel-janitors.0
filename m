From: David Miller <davem@davemloft.net>
Date: Fri, 23 Jul 2010 20:06:04 +0000
Subject: Re: [PATCH] net: s2io: fix buffer overflow
Message-Id: <20100723.130604.15256955.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279902976-27146-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279902976-27146-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, ramkrishna.vepa@exar.com, sivakumar.subramani@exar.com, sreenivasa.honnur@exar.com, jon.mason@exar.com, joe@perches.com, jpirko@redhat.com, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 23 Jul 2010 20:36:15 +0400

> vpd_data[] is allocated as kmalloc(256, GFP_KERNEL), so if cnt = 255
> then (cnt + 3) overflows 256. memset() is executed without checking.
> vpd_data[cnt+2] must be less than 256-cnt-2 as the latter is number of
> vpd_data[] elements to copy.
> 
> Do not fill with zero the beginning of nic->serial_num as it will
> be filled with vpd_data[].
> 
> String in product_name[] should be terminated by '\0'.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied.
