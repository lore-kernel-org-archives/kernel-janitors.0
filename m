From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 11 May 2018 15:06:15 +0000
Subject: [PATCH 0/3] media: staging: atomisp:
Message-Id: <cover.1526048313.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alan@linux.intel.com, sakari.ailus@linux.intel.com, mchehab@kernel.org, gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com, chen.chenchacha@foxmail.com, keescook@chromium.org, arvind.yadav.cs@gmail.com
Cc: linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

These 3 patches fixes (at least I hope) some issues found in or around
'lm3554_probe()'.

Please review them carefully. I've only compile tested the changes and
I propose them because they sound logical to me.

The first one, return an error code instead of 0 if the call to an
initialisation function fails.
The 2nd one reorders own some label are reached in order to have a logical
flow (first error goes to last label, last error goes to first label)
The 3rd one fix the use 'media_entity_cleanup()'. If this one is correct,
some other drivers will need to be fixed the same way.  

Christophe JAILLET (3):
  media: staging: atomisp: Return an error code in case
    of error in 'lm3554_probe()'
  media: staging: atomisp: Fix an error handling path in
    'lm3554_probe()'
  media: staging: atomisp: Fix usage of 'media_entity_cleanup()'

 .../media/atomisp/i2c/atomisp-lm3554.c        | 20 +++++++++----------
 1 file changed, 9 insertions(+), 11 deletions(-)

-- 
2.17.0

