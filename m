From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 25 Aug 2012 19:57:03 +0000
Subject: [PATCH 0/6] adjust inconsistent IS_ERR and PTR_ERR
Message-Id: <1345924629-16584-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

These patches fix cases where PTR_ERR does not access the value just tested
by IS_ERR.

