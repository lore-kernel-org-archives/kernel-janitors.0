From: Jens Axboe <axboe@kernel.dk>
Date: Thu, 10 May 2018 14:21:33 +0000
Subject: Re: [PATCH] mtip32xx: Fix an error handling path in 'mtip_pci_probe()'
Message-Id: <1c91e861-9f38-4c77-d7ac-1a1499932c1a@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180510072731.19956-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20180510072731.19956-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, ming.lei@redhat.com, martin.petersen@oracle.com, sagi@grimberg.me, chris.gekas@gmail.com, bart.vanassche@wdc.com
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 5/10/18 1:27 AM, Christophe JAILLET wrote:
> Branch to the right label in the error handling path in order to keep it
> logical.

Looks good, applied.

-- 
Jens Axboe

