From: David Miller <davem@davemloft.net>
Date: Tue, 06 Jul 2010 02:07:45 +0000
Subject: Re: [PATCH] ns83820: Use the instance of net_device_stats from
Message-Id: <20100705.190745.233678562.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278332071-17865-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278332071-17865-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, adobriyan@gmail.com, shemminger@vyatta.com, tj@kernel.org, jpirko@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon,  5 Jul 2010 16:14:28 +0400

> Since net_device has an instance of net_device_stats,
> we can remove the instance of this from the adapter structure.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied.
