From: Julia Lawall <julia@diku.dk>
Date: Tue, 26 Oct 2010 10:25:29 +0000
Subject: [PATCH 0/14] delete double assignment
Message-Id: <1288088743-3725-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

These patches fix cases where there are two adjacent assignments to the
same location.  In practice, many such occurrences appear to be
intentional, eg to initialize volatile memory, but these cases do not seem
to fall into that category.

