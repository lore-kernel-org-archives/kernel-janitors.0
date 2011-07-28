From: Julia Lawall <julia@diku.dk>
Date: Thu, 28 Jul 2011 12:46:00 +0000
Subject: [PATCH 0/6] adjust array index
Message-Id: <1311857165-14780-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

These patches fix cases where the upper bound of a loop is used as an array
indes, while it appears that the loop index should be used as the array
index.  I have only guessed that the code is incorrect, not actually tested
any of it.

