From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Thu, 01 Apr 2010 08:56:39 +0000
Subject: Re: [patch] drbd: potential null dereference
Message-Id: <9736574BB1380E.7050404@linbit.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100327145950.GG5069@bicker>
In-Reply-To: <20100327145950.GG5069@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <jens.axboe@oracle.com>, Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan, 

Thanks for the work with the static analyzer, but the patch is
bogus. The lc_element_by_index() function causes a BUG_ON before
returning a NULL. The next mail contains a patch that removes
the unnecessary conditional expression operator.

Philipp Reisner (1):
  drbd: lc_element_by_index() never returns NULL

 drivers/block/drbd/drbd_actlog.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

