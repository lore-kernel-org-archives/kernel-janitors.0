From: Jesse Millan <jessem@cs.pdx.edu>
Date: Tue, 24 May 2005 04:52:02 +0000
Subject: [KJ] [PATCH] Fix gcc4 warning,
Message-Id: <4292B2F2.9030008@cs.pdx.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <428E3224.8030307@cs.pdx.edu>
In-Reply-To: <428E3224.8030307@cs.pdx.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


This patch eliminates the warning that is generated when passing a
reference of an uninitialized variable to a function where it possible
that the function will return without initializing that variable.

Thats a mouthful.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
