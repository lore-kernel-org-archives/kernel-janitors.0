From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Fri, 12 Aug 2016 12:58:33 +0000
Subject: [PATCH 0/2] add missing calls to kfree
Message-Id: <20160812125835.2324-1-lambert.quentin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

The first patch is a style fix, the second add calls to kfree.
The reason for me thinking that they are necessary is that every other branches
leading to an error return are jumping to the same destination.

---
 drivers/staging/rts5208/ms.c |   18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)
---
