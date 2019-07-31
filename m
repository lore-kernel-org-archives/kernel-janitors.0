From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 31 Jul 2019 08:06:20 +0000
Subject: [PATCH 0/2] net: ag71xx: 2 small patches for 'ag71xx_rings_init()'
Message-Id: <cover.1564560130.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jcliburn@gmail.com, davem@davemloft.net, chris.snook@gmail.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Christophe JAILLET (2):
  net: ag71xx: Slighly simplify code in 'ag71xx_rings_init()'
  net: ag71xx: Use GFP_KERNEL instead of GFP_ATOMIC in
    'ag71xx_rings_init()'

 drivers/net/ethernet/atheros/ag71xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.20.1
