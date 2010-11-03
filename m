From: "Gustavo F. Padovan" <padovan@profusion.mobi>
Date: Wed, 03 Nov 2010 18:36:00 +0000
Subject: Re: [PATCH] bluetooth: bnep: fix information leak to userland
Message-Id: <20101103183600.GB17943@vigoh>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288448782-5582-1-git-send-email-segooon@gmail.com>
 <1288712131.3322.178.camel@aeonflux>
In-Reply-To: <1288712131.3322.178.camel@aeonflux>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Vasiliy Kulikov <segooon@gmail.com>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <eric.dumazet@gmail.com>, Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, Tejun Heo <tj@kernel.org>, Jiri Kosina <jkosina@suse.cz>, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

* Marcel Holtmann <marcel@holtmann.org> [2010-11-02 16:35:31 +0100]:

> Hi Vasiiy,
> 
> > Structure bnep_conninfo is copied to userland with the field "device"
> > that has the last elements unitialized.  It leads to leaking of
> > contents of kernel stack memory.
> > 
> > Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> 
> Acked-by: Marcel Holtmann <marcel@holtmann.org>

Applied, thanks.  

-- 
Gustavo F. Padovan
ProFUSION embedded systems - http://profusion.mobi
