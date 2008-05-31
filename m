From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Sat, 31 May 2008 19:08:41 +0000
Subject: [PATCH] ext3 : Remove redundant condition in ext3_free_blocks_sb()
Message-Id: <ea11fea30805311156q7488714ftf8b0b8b8cea85b76@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080531190527.GG28946@ZenIV.linux.org.uk>
In-Reply-To: <20080531190527.GG28946@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

For two unsigned values the check "block+count < block"  is always
false. Thus the below patch removes that condition.

==============================
Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>

--- a/fs/ext3/balloc.c  2008-05-11 23:54:40.000000000 +0530
+++ b/fs/ext3/balloc.c  2008-06-01 00:05:25.000000000 +0530
@@ -493,7 +493,6 @@
        sbi = EXT3_SB(sb);
        es = sbi->s_es;
        if (block < le32_to_cpu(es->s_first_data_block) ||
-           block + count < block ||
            block + count > le32_to_cpu(es->s_blocks_count)) {
                ext3_error (sb, "ext3_free_blocks",
                            "Freeing blocks not in datazone - "

==============================
-- 
Thanks & Regards,
********************************************
Manish Katiyar ( http://mkatiyar.googlepages.com )
3rd Floor, Fair Winds Block
EGL Software Park
Off Intermediate Ring Road
Bangalore 560071, India
***********************************************
