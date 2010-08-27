From: Julia Lawall <julia@diku.dk>
Date: Fri, 27 Aug 2010 05:57:17 +0000
Subject: [PATCH 0/3] Remove potential NULL dereference
Message-Id: <1282888640-27042-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

These patches find a case where there is a dereference before a NULL test
and either move the dereference after the NULL test, or eliminate the NULL
test if it seems unnnecessary.

