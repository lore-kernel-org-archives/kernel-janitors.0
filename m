From: Julia Lawall <julia@diku.dk>
Date: Sun, 05 Sep 2010 18:59:38 +0000
Subject: [PATCH 0/8] Fix unsigned return type
Message-Id: <1283713226-8429-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

These patches fix some cases where a negative constant is returned from a
function that has an unsigned return type.  In most cases, the result of
every call to the function is stored in a signed variable, and thus the
unsigned in the return type can just dropped.

