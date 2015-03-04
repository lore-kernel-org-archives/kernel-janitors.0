From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Wed, 04 Mar 2015 10:28:52 +0000
Subject: [PATCH 0/2] int to bool conversion
Message-Id: <20150304102852.GA9410@sloth>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

These patches convert int variables into boolean when relevant.

The first patch only deal with cases where the variable are local,
not returned and not given as argument to a function.

The second patch depends on the first one and deal with cases where
the local variables are given as argument. It therefore propagates the
conversion to the concerned parameters.

Quentin Lambert (2):
  staging: rts5208: Convert non-returned local variable to boolean when
    relevant
  staging: rts5208: Convert variable from int to bool and propagate the
    change to function parameters

 drivers/staging/rts5208/ms.c        |  23 ++++---
 drivers/staging/rts5208/ms.h        |   2 +-
 drivers/staging/rts5208/rtsx_chip.c |  56 ++++++++--------
 drivers/staging/rts5208/rtsx_scsi.c |  45 +++++++------
 drivers/staging/rts5208/sd.c        | 124 ++++++++++++++++++------------------
 drivers/staging/rts5208/sd.h        |   2 +-
 6 files changed, 133 insertions(+), 119 deletions(-)

-- 
1.9.1

