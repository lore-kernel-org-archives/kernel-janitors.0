From: Rupesh Gujare <rgujare@ozmodevices.com>
Date: Wed, 22 Aug 2012 10:19:48 +0000
Subject: RE: [staging-next V3] ozwpan: fix memcmp() test in oz_set_active_pd()
Message-Id: <9DBB4F49862BA041A40EBC6350D9B0683DC988AB@BY2PRD0810MB367.namprd08.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345394197-6561-1-git-send-email-tomas.winkler@intel.com>
In-Reply-To: <1345394197-6561-1-git-send-email-tomas.winkler@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


________________________________________
From: Tomas Winkler [tomas.winkler@intel.com]
Sent: 19 August 2012 17:36
To: gregkh@linuxfoundation.org
Cc: alan@linux.intel.com; devel@linuxdriverproject.org; kernel-janitors@vger.kernel.org; Tomas Winkler; Dan Carpenter; Rupesh Gujare
Subject: [staging-next V3] ozwpan: fix memcmp() test in oz_set_active_pd()

"addr" is a pointer so it's either 4 or 8 bytes, but actually we want
to compare 6 bytes (ETH_ALEN).

As network stack already provides helper function
is_zero_ether_addr() we use that instead of memcmp

Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Rupesh Gujare <rgujare@ozmodevices.com>
---
V1: by Dan Carpenter <dan.carpenter@oracle.com>
V2: replace memcmp with is_zero_ether_addr
V3: include <linux/etherdevice.h>

Acked-by: Rupesh Gujare<rgujare@ozmodevices.com> 


--
Regards,
Rupesh Gujare
