From: Julia Lawall <julia@diku.dk>
Date: Thu, 04 Aug 2011 10:29:30 +0000
Subject: [PATCH 0/4] delete useless initialization
Message-Id: <1312453774-23333-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

These patches fix cases where a variable is initialized in some non-trivial
way, and the result is immediately overwritten with the result of some
allocation function.

