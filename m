From: David Miller <davem@davemloft.net>
Date: Tue, 06 Jul 2010 02:06:55 +0000
Subject: Re: [PATCH] fealnx: Use the instance of net_device_stats from
Message-Id: <20100705.190655.229727729.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278332018-16490-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278332018-16490-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, joe@perches.com, jpirko@redhat.com, shemminger@vyatta.com, adobriyan@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon,  5 Jul 2010 16:13:36 +0400

> Since net_device has an instance of net_device_stats,
> we can remove the instance of this from the adapter structure.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied.
