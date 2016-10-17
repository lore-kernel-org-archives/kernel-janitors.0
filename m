From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Oct 2016 11:40:53 +0000
Subject: Re: [bug report] staging: New driver: Xillybus generic interface for FPGA
Message-Id: <20161017114053.GB4469@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012082834.GA23170@mwanda>
In-Reply-To: <20161012082834.GA23170@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I have read and re-read your repsonse and I can't understand it at all.

The only way this code is correct is if we take the lock when we do:

   930                  if (left_to_sleep > 0) {

Here we are unlocked.

   931                          left_to_sleep    932                                  wait_event_interruptible_timeout(
   933                                          channel->wr_wait,
   934                                          (!channel->wr_sleepy),
   935                                          left_to_sleep);

Are you saying that here we are locked?  That does NOT appear to be what
you are saying, but it is the only response that I would accept to say
that the code is correct.

In other words, the bug is probably real.  Please review again.

regards,
dan carpenter
