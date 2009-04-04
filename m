From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sat, 04 Apr 2009 12:08:43 +0000
Subject: Re: [PATCH 2/2] Fix paramater/parameter typo in dmesg and source
Message-Id: <alpine.LFD.2.00.0904040806200.26532@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49D73B52.5050508@minimum.se>
In-Reply-To: <49D73B52.5050508@minimum.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 4 Apr 2009, Martin Olsson wrote:

> From edef040c17106bb02431b9399e9b214da8d7a5fd Mon Sep 17 00:00:00 2001
> From: Martin Olsson <martin@minimum.se>
> Date: Sat, 4 Apr 2009 12:29:59 +0200
> Subject: [PATCH] Correctly spell the word "parameter" in various source
> comments.
>
> Signed-off-by: Martin Olsson <martin@minimum.se>
> ---
>  drivers/atm/lanai.c                    |    2 +-
>  drivers/input/joystick/xpad.c          |    2 +-
>  drivers/net/b44.c                      |    2 +-
>  drivers/net/smc-mca.c                  |    2 +-
>  drivers/net/wireless/orinoco/orinoco.h |    2 +-
>  drivers/net/wireless/p54/p54spi.c      |    2 +-
>  drivers/scsi/qla1280.c                 |    2 +-
>  drivers/scsi/qla4xxx/ql4_mbx.c         |    2 +-
>  drivers/staging/epl/EplInstDef.h       |    2 +-
>  drivers/staging/rt2860/rt28xx.h        |    2 +-
>  drivers/staging/rt2870/rt28xx.h        |    2 +-
>  drivers/usb/core/message.c             |    4 ++--
>  drivers/usb/serial/io_edgeport.c       |    2 +-
>  drivers/usb/serial/ir-usb.c            |    2 +-
>  drivers/video/controlfb.c              |    2 +-
>  fs/debugfs/inode.c                     |    6 +++---
>  16 files changed, 19 insertions(+), 19 deletions(-)

  just FYI, that doesn't appear to be all of them:

drivers/net/wireless/rndis_wlan.c:	devdbg(dev, "setting rndis config paramater failed, %d.", ret);

might be worth making another pass.  and while you're at it, you might
grep for what i've noticed is a *very* common misspelling:
"paramter".  i'm betting you'll find at least a few of those.

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
