From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 06 Nov 2017 21:53:28 +0000
Subject: [PATCH 0/4] fsl/fman: Fix some error handling code in mac_probe
Message-Id: <cover.1510003551.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: madalin.bucur@nxp.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Commit c6e26ea8c893 ("dpaa_eth: change device used") generated some
conflicts in my patches waiting for submission. So I took a closer look at
it.


So here is a serie of 4 patches.

The 1st one is just about a spurious call to 'dev_set_drvdata()', which is
done in only 1 error handling path in the function.

The 2nd one removes some devm_iounmap/release/kfree functions which look
useless to me.

The 3rd one fixes a missing of_node_put.

The 4th one is just cosmetic and removes a useless message.


Christophe JAILLET (4):
  fsl/fman: Remove a useless call to 'dev_set_drvdata()'
  fsl/fman: Remove some useless code
  fsl/fman: Add a missing 'of_node_put()' call in an error handling path
  fsl/fman: Remove a useless 'dev_err()' call

 drivers/net/ethernet/freescale/fman/mac.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

-- 
2.14.1

