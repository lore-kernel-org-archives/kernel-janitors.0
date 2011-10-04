From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 04 Oct 2011 07:26:31 +0000
Subject: puzzle for puzzle lovers
Message-Id: <20111004072631.GA18470@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Here is something that might amuse someone.

Smatch reports a read past the end of the array in rocket.c
drivers/tty/rocket.c +2168 init_ISA(77)
	error: buffer overflow calling init_r_port. param 0. 7 >= 4

drivers/tty/rocket.c
   657          init_completion(&info->close_wait);
   658          info->flags &= ~ROCKET_MODE_MASK;
   659          switch (pc104[board][line]) {
   660          case 422:
   661                  info->flags |= ROCKET_MODE_RS422;
   662                  break;

pc104[] is a 4 element array.

board comes from for loop in rp_init().

  2315          for (i = 0; i < NUM_BOARDS; i++) {
  2316                  if (init_ISA(i))
  2317                          isa_boards_found++;
  2318          }

NUM_BOARDS is is 8, so according to Smatch "board" can be 7 and no
one knows what line is.

Weird huh?

But the code is ancient from before the git era so no one knows what
it's supposed to do.  Unless you are clever enough to solve this
mystery.

This code gets run during init so presumably it got tested often
ten years ago and it works.

regards,
dan carpenter
