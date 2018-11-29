From: Colin King <colin.king@canonical.com>
Date: Thu, 29 Nov 2018 23:15:56 +0000
Subject: [PATCH] misc: ti-st: make array read_ver_cmd static, shrinks object size
Message-Id: <20181129231556.4776-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array read_ver_cmd on the stack but instead
make it static. Makes the object code smaller by 42 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  17262	   6928	    192	  24382	   5f3e	drivers/misc/ti-st/st_kim.o

After:
   text	   data	    bss	    dec	    hex	filename
  17156	   6992	    192	  24340	   5f14	drivers/misc/ti-st/st_kim.o

(gcc version 8.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/ti-st/st_kim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/ti-st/st_kim.c b/drivers/misc/ti-st/st_kim.c
index 1874ac922166..8e82983bef9d 100644
--- a/drivers/misc/ti-st/st_kim.c
+++ b/drivers/misc/ti-st/st_kim.c
@@ -211,7 +211,7 @@ static void kim_int_recv(struct kim_data_s *kim_gdata,
 static long read_local_version(struct kim_data_s *kim_gdata, char *bts_scr_name)
 {
 	unsigned short version = 0, chip = 0, min_ver = 0, maj_ver = 0;
-	const char read_ver_cmd[] = { 0x01, 0x01, 0x10, 0x00 };
+	static const char read_ver_cmd[] = { 0x01, 0x01, 0x10, 0x00 };
 	long timeout;
 
 	pr_debug("%s", __func__);
-- 
2.19.1
