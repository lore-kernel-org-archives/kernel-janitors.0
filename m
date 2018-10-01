From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 01 Oct 2018 16:44:41 +0000
Subject: [PATCH] mei: samples: fix a signedness bug in amt_host_if_call()
Message-Id: <20181001164440.GA29248@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomas Winkler <tomas.winkler@intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <shuahkh@osg.samsung.com>

"out_buf_sz" needs to be signed for the error handling to work.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/samples/mei/mei-amt-version.c b/samples/mei/mei-amt-version.c
index 57d0d871dcf7..33e67bd1dc34 100644
--- a/samples/mei/mei-amt-version.c
+++ b/samples/mei/mei-amt-version.c
@@ -370,7 +370,7 @@ static uint32_t amt_host_if_call(struct amt_host_if *acmd,
 			unsigned int expected_sz)
 {
 	uint32_t in_buf_sz;
-	uint32_t out_buf_sz;
+	ssize_t out_buf_sz;
 	ssize_t written;
 	uint32_t status;
 	struct amt_host_if_resp_header *msg_hdr;
