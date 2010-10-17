From: Julia Lawall <julia@diku.dk>
Date: Sun, 17 Oct 2010 18:48:28 +0000
Subject: [PATCH 0/3] Use kasprintf
Message-Id: <1287341311-11161-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

These patches convert a sequence of kmalloc and memcpy to use kasprintf
instead.

