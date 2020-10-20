From: Colin King <colin.king@canonical.com>
Date: Tue, 20 Oct 2020 14:19:36 +0000
Subject: [PATCH] cifs: make const array static, makes object smaller
Message-Id: <20201020141936.52272-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate const array smb3_create_tag_posix on the stack but
instead make it static. Makes the object code smaller by 50 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
 150184	  47167	      0	 197351	  302e7	fs/cifs/smb2pdu.o

After:
    text	   data	    bss	    dec	    hex	filename
 150070	  47231	      0	 197301	  302b5	fs/cifs/smb2pdu.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/cifs/smb2pdu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
index d504bc296349..be8696abd871 100644
--- a/fs/cifs/smb2pdu.c
+++ b/fs/cifs/smb2pdu.c
@@ -1971,9 +1971,11 @@ smb2_parse_contexts(struct TCP_Server_Info *server,
 	unsigned int next;
 	unsigned int remaining;
 	char *name;
-	const char smb3_create_tag_posix[] = {0x93, 0xAD, 0x25, 0x50, 0x9C,
-					0xB4, 0x11, 0xE7, 0xB4, 0x23, 0x83,
-					0xDE, 0x96, 0x8B, 0xCD, 0x7C};
+	static const char smb3_create_tag_posix[] = {
+		0x93, 0xAD, 0x25, 0x50, 0x9C,
+		0xB4, 0x11, 0xE7, 0xB4, 0x23, 0x83,
+		0xDE, 0x96, 0x8B, 0xCD, 0x7C
+	};
 
 	*oplock = 0;
 	data_offset = (char *)rsp + le32_to_cpu(rsp->CreateContextsOffset);
-- 
2.27.0
