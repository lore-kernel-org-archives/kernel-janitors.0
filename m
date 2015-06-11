From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 11 Jun 2015 12:02:51 +0000
Subject: [PATCH 0/7] Replace uses of OBD_{ALLOC,FREE}_LARGE
Message-Id: <1434024178-8785-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, HPDD-discuss@ml01.01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andreas Dilger <andreas.dilger@intel.com>, Oleg Drokin <oleg.drokin@intel.com>

Replace uses of OBD_ALLOC_LARGE by libcfs_kvzalloc and OBD_FREE_LARGE by
kvfree.

