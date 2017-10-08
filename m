From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 08 Oct 2017 19:18:39 +0000
Subject: [PATCH 0/2] detect identical chip data arrays
Message-Id: <1507490321-24900-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

Rename battery.cocci as check_bq27xxx_data.cocci and adjust the warning
messages to indicate that some structures are the same, in response to
feedback from Liam Breck.

Although check_bq27xxx_data.cocci says is requires Coccinelle 1.0.7, which
is not yet released, it actually works with the version currently available
on Github, eg from Coccinelle commit 3ba77b3a0f91.

---

 scripts/coccinelle/api/battery.cocci            |  161 ------------------------
 scripts/coccinelle/api/check_bq27xxx_data.cocci |  161 ++++++++++++++++++++++++
 2 files changed, 161 insertions(+), 161 deletions(-)
