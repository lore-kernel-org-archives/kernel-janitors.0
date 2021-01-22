From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 22 Jan 2021 11:16:06 +0000
Subject: [PATCH for device-mapper/for-next] dm integrity: follow ReST formatting
Message-Id: <20210122111606.24999-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Jonathan Corbet <corbet@lwn.net>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Alasdair Kergon <agk@redhat.com>

Commit 61b8b2a834bf ("dm integrity: introduce the "fix_hmac" argument")
adds some new part to dm-integrity.rst, but this causes make htmldocs warn:

  dm-integrity.rst:192: WARNING: Unexpected indentation.
  dm-integrity.rst:193: WARNING: Block quote ends without a blank line; \
    unexpected unindent.

Make dm-integrity.rst follow ReST formatting.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Mike, please pick this quick documentation fix in your for-next branch.

 Documentation/admin-guide/device-mapper/dm-integrity.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/device-mapper/dm-integrity.rst b/Documentation/admin-guide/device-mapper/dm-integrity.rst
index 39a9fdc9f6ab..ef762857da95 100644
--- a/Documentation/admin-guide/device-mapper/dm-integrity.rst
+++ b/Documentation/admin-guide/device-mapper/dm-integrity.rst
@@ -188,6 +188,7 @@ fix_padding
 
 fix_hmac
 	Improve security of internal_hash and journal_mac:
+
 	- the section number is mixed to the mac, so that an attacker can't
 	  copy sectors from one journal section to another journal section
 	- the superblock is protected by journal_mac
-- 
2.17.1
