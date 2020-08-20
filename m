From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 20 Aug 2020 16:28:25 +0000
Subject: Re: [PATCH] epic100: switch from 'pci_' to 'dma_' API
Message-Id: <9b8ad131-3c2e-37b7-392c-79fab1a2f2bb@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200806201935.733641-1-christophe.jaillet@wanadoo.fr>
 <20200806.142311.94169513118353100.davem@davemloft.net>
In-Reply-To: <20200806.142311.94169513118353100.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: David Miller <davem@davemloft.net>
Cc: kuba@kernel.org, snelson@pensando.io, mhabets@solarflare.com, vaibhavgupta40@gmail.com, mst@redhat.com, mkubecek@suse.cz, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 06/08/2020 à 23:23, David Miller a écrit :
> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Date: Thu,  6 Aug 2020 22:19:35 +0200
> 
>> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> Christophe, the net-next tree is closed so I'd like to ask that you
> defer submitting these conversion patches until the net-next
> tree opens back up again.
> 
> Thank you.
> 
> 

Hi,
should I resend the few conversion patches sent at the wrong time or are 
they stored somewhere, and will be processed when some time is available 
for it?

CJ
