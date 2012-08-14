From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 14 Aug 2012 15:49:43 +0000
Subject: [PATCH 0/5] Remove potential NULL dereference
Message-Id: <1344959388-19719-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

These patches find a case where there is a dereference before a NULL test
and either move the dereference after the NULL test, or eliminate the NULL
test if it seems unnnecessary.

