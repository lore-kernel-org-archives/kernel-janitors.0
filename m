From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Oct 2017 12:33:01 +0000
Subject: [PATCH 2/2 net-next] thunderbolt: Right shifting to zero bug in tbnet_handle_packet()
Message-Id: <20171017123301.z6heqexdlo6lc52b@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171013112959.sc2pwazrpk7fxbtw@mwanda>
In-Reply-To: <20171013112959.sc2pwazrpk7fxbtw@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Jamet <michael.jamet@intel.com>, Amir Levy <amir.jer.levy@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Yehezkel Bernat <yehezkel.bernat@intel.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a problem when we do:

	sequence = pkg->hdr.length_sn & TBIP_HDR_SN_MASK;
	sequence >>= TBIP_HDR_SN_SHIFT;

TBIP_HDR_SN_SHIFT is 27, and right shifting a u8 27 bits is always
going to result in zero.  The fix is to declare these variables as u32.

Fixes: e69b6c02b4c3 ("net: Add support for networking over Thunderbolt cable")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/thunderbolt.c b/drivers/net/thunderbolt.c
index 1a7bc0bf4598..435854688a7a 100644
--- a/drivers/net/thunderbolt.c
+++ b/drivers/net/thunderbolt.c
@@ -394,7 +394,7 @@ static int tbnet_handle_packet(const void *buf, size_t size, void *data)
 	struct tbnet *net = data;
 	u32 command_id;
 	int ret = 0;
-	u8 sequence;
+	u32 sequence;
 	u64 route;
 
 	/* Make sure the packet is for us */
