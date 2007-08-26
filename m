From: Jiri Slaby <jirislaby@gmail.com>
Date: Sun, 26 Aug 2007 13:48:05 +0000
Subject: use DIV_ROUND_UP
Message-Id: <46D18495.9020500@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi!

some code defines this macro itself, or simply counts it on its own.

Use for example this command to find it
grep -r '+.*\([^ ]*\).*-.*1.*/.*\1' *
ion the tree and remove all those re-defines of this macro.

regards,
-- 
Jiri Slaby (jirislaby@gmail.com)
Faculty of Informatics, Masaryk University
