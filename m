From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 19:37:46 +0000
Subject: [PATCH 0/20] remove unneeded null test before free
Message-Id: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, HPDD-discuss@ml01.01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andreas Dilger <andreas.dilger@intel.com>, Oleg Drokin <oleg.drokin@intel.com>

These patches are motivated by the preceding patch series that converts
uses of OBD_FREE and OBD_FREE_PTR to kfree.  These patches should thus be
applied after that previous patch series (subject: Use kzalloc and kfree).

