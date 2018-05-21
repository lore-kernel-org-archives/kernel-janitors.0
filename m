From: Sabin Mihai Rapan <sabin.rapan@gmail.com>
Date: Mon, 21 May 2018 17:34:29 +0000
Subject: [PATCH 3/4] staging: lustre: Fix "unsigned"->"unsigned int"
Message-Id: <20180521173430.9759-3-sabin.rapan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180520124408.GA10692@kroah.com>
In-Reply-To: <20180520124408.GA10692@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, jsimmons@infradead.org, andreas.dilger@intel.com, oleg.drokin@intel.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Sabin Mihai Rapan <sabin.rapan@gmail.com>

This patch fixes the checkpatch.pl warning:

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'

Signed-off-by: Sabin Mihai Rapan <sabin.rapan@gmail.com>
---
 .../staging/lustre/include/uapi/linux/lustre/lustre_fiemap.h    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/lustre/include/uapi/linux/lustre/lustre_fiemap.h b/drivers/staging/lustre/include/uapi/linux/lustre/lustre_fiemap.h
index f5214dc33c60..d375a476f5ea 100644
--- a/drivers/staging/lustre/include/uapi/linux/lustre/lustre_fiemap.h
+++ b/drivers/staging/lustre/include/uapi/linux/lustre/lustre_fiemap.h
@@ -51,7 +51,7 @@ static inline size_t fiemap_count_to_size(size_t extent_count)
 				       sizeof(struct fiemap_extent);
 }
 
-static inline unsigned fiemap_size_to_count(size_t array_size)
+static inline unsigned int fiemap_size_to_count(size_t array_size)
 {
 	return (array_size - sizeof(struct fiemap)) /
 		sizeof(struct fiemap_extent);
-- 
2.17.0

