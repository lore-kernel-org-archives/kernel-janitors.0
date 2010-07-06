From: David Miller <davem@davemloft.net>
Date: Tue, 06 Jul 2010 02:07:01 +0000
Subject: Re: [PATCH] hamachi: Use the instance of net_device_stats from
Message-Id: <20100705.190701.35018663.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278332023-16524-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278332023-16524-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, joe@perches.com, jpirko@redhat.com, adobriyan@gmail.com, shemminger@vyatta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon,  5 Jul 2010 16:13:41 +0400

> Since net_device has an instance of net_device_stats,
> we can remove the instance of this from the adapter structure.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied.
