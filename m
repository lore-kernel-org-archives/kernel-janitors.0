From: Julia Lawall <julia@diku.dk>
Date: Sun, 29 Aug 2010 09:52:39 +0000
Subject: [PATCH 0/7] Add of_node_put to avoid memory leak
Message-Id: <1283075566-27441-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

These patches introduce calls to of_node_put after various functions that
call of_node_get.

