From: Julia Lawall <julia@diku.dk>
Date: Tue, 02 Aug 2011 10:34:53 +0000
Subject: [PATCH 0/11] trivial: use BUG_ON
Message-Id: <1312281304-11847-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

These patches convert conditionals containing only a call to BUG() to a
call to BUG_ON in some trivial cases.

