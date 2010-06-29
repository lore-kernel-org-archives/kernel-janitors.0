From: =?UTF-8?B?Iua9mOWNq+W5syhQZXRlciBQYW4pIg==?=
Date: Tue, 29 Jun 2010 03:20:55 +0000
Subject: question about ext2_find_shared
Message-Id: <4C296697.1010000@redflag-linux.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi, all

the function ext2_find_shared is located fs/ext2/inode.c 935

I see ext2_find_shared is related with truncation, but i don't know
what's the use of it.

And i am also confused with the implementation of ext2_find_shared.

It would be greatly appreciated if somebody can show me what's the use
of ext2_find_shared and how it works.

Regards
-- 
Peter Pan
Red Flag Software Co.,Ltd
