From: Julia Lawall <julia@diku.dk>
Date: Sat, 28 Aug 2010 15:40:59 +0000
Subject: [PATCH 0/7] Remove double test
Message-Id: <1283010066-20935-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

These patches fix a case where the same expression is tested twice and the
answer is guaranteed to be the same in each case.

