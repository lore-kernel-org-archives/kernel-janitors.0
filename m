From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 23 Jun 2012 09:15:20 +0000
Subject: [RFC] ext4: off by one check in ext4_ext_convert_to_initialized()
Message-Id: <20120623091520.GB26923@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org, Yongqiang Yang <xiaoqiangnk@gmail.com>

I am not very familiar with this code, but I think that we should be
using "<= EXT4_EXT_ZERO_LEN" here instead of "< EXT4_EXT_ZERO_LEN".

1)  The other comparisons with EXT4_EXT_ZERO_LEN use "<=".

2)  On the first side of the if else statement we do:
	if (allocated <= EXT4_EXT_ZERO_LEN ...
		split_map.m_len = allocated;
    On this side, it would match to do:
	if (map->m_lblk - ee_block + map->m_len <= EXT4_EXT_ZERO_LEN ...
		split_map.m_len = map->m_lblk - ee_block + map->m_len;

It's not the most air tight of arguments, so I've submitted this with a
big warning message.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
index 91341ec..2df32a4 100644
--- a/fs/ext4/extents.c
+++ b/fs/ext4/extents.c
@@ -3208,7 +3208,7 @@ static int ext4_ext_convert_to_initialized(handle_t *handle,
 				goto out;
 			split_map.m_lblk = map->m_lblk;
 			split_map.m_len = allocated;
-		} else if ((map->m_lblk - ee_block + map->m_len <
+		} else if ((map->m_lblk - ee_block + map->m_len < 			   EXT4_EXT_ZERO_LEN) &&
 			   (EXT4_EXT_MAY_ZEROOUT & split_flag)) {
 			/* case 2 */
