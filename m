From: Marcel Holtmann <marcel@holtmann.org>
Date: Tue, 02 Nov 2010 15:36:29 +0000
Subject: Re: [PATCH] bluetooth: hidp: fix information leak to userland
Message-Id: <1288712189.3322.180.camel@aeonflux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288448791-6009-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1288448791-6009-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, "Gustavo F. Padovan" <padovan@profusion.mobi>, "David S. Miller" <davem@davemloft.net>, Jiri Kosina <jkosina@suse.cz>, Michael Poole <mdpoole@troilus.org>, Bastien Nocera <hadess@hadess.net>, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Vasiliy,

> Structure hidp_conninfo is copied to userland with version, product,
> vendor and name fields unitialized if both session->input and session->hid
> are NULL.  It leads to leaking of contents of kernel stack memory.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Acked-by: Marcel Holtmann <marcel@holtmann.org>

Regards

Marcel


