From: Marcel Holtmann <marcel@holtmann.org>
Date: Tue, 02 Nov 2010 15:35:58 +0000
Subject: Re: [PATCH] bluetooth: cmtp: fix information leak to userland
Message-Id: <1288712158.3322.179.camel@aeonflux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288448787-5848-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1288448787-5848-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, "Gustavo F. Padovan" <padovan@profusion.mobi>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <eric.dumazet@gmail.com>, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Vasiliy,

> Structure cmtp_conninfo is copied to userland with some padding fields
> unitialized.  It leads to leaking of contents of kernel stack memory.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Acked-by: Marcel Holtmann <marcel@holtmann.org>

Regards

Marcel


