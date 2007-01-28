From: "Ahmed S. Darwish" <darwish.07@gmail.com>
Date: Sun, 28 Jan 2007 12:10:57 +0000
Subject: [KJ] Database error when creating an account in the new wiki
Message-Id: <20070128121057.GA776@Ahmed>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi all,

Creating an account on the new wiki (http://www.fsdev.dreamhosters.com/wiki)
leads to the following error:

Database error
A database query syntax error has occurred. This may indicate a bug in the
software. The last attempted database query was:

    (SQL query hidden)

from within function "User::addToDatabase". MySQL returned error 
"1054: Unknown column 'user_newpass_time' in 'field list' 
(sql.fsdev.dreamhosters.com)".

Thanks,
-- 
Ahmed S. Darwish
http://darwish-07.blogspot.com
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
