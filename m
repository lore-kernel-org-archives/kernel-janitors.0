From: Marcel Holtmann <marcel@holtmann.org>
Date: Tue, 02 Nov 2010 15:35:31 +0000
Subject: Re: [PATCH] bluetooth: bnep: fix information leak to userland
Message-Id: <1288712131.3322.178.camel@aeonflux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288448782-5582-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1288448782-5582-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, "Gustavo F. Padovan" <padovan@profusion.mobi>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <eric.dumazet@gmail.com>, Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, Tejun Heo <tj@kernel.org>, Jiri Kosina <jkosina@suse.cz>, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Vasiiy,

> Structure bnep_conninfo is copied to userland with the field "device"
> that has the last elements unitialized.  It leads to leaking of
> contents of kernel stack memory.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Acked-by: Marcel Holtmann <marcel@holtmann.org>

Regards

Marcel


