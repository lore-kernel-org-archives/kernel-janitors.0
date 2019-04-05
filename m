From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Apr 2019 08:13:39 +0000
Subject: Re: [PATCH 1/3] net: xilinx: fix possible object reference leak
Message-Id: <20190405081339.GO32590@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1553223849-7143-1-git-send-email-wen.yang99@zte.com.cn>
 <d2f169a0-b982-82ca-b2f1-963b8a579504@web.de>
In-Reply-To: <d2f169a0-b982-82ca-b2f1-963b8a579504@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Simek <michal.simek@xilinx.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Anirudha Sarangi <anirudh@xilinx.com>, John Linn <John.Linn@xilinx.com>, Wen Yang <wen.yang99@zte.com.cn>, linux-arm-kernel@lists.infradead.org

Hi Markus,

Please don't add kernel-janitors to the CC list in the middle of the
conversation.  Netdev people can review their own code.  We don't have a
copy of the patch your discussing and it's not even clear who you're
responding to.

regards,
dan carpenter
