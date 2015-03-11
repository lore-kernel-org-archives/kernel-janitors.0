From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 11 Mar 2015 16:56:22 +0000
Subject: [PATCH 0/15] don't export static symbol
Message-Id: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org
Cc: alsa-devel@alsa-project.org, linux-nfs@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wpan@vger.kernel.org, target-devel@vger.kernel.org, linux-crypto@vger.kernel.org, netdev@vger.kernel.org, linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-edac@vger.kernel.org

These patches remove EXPORT_SYMBOL or EXPORT_SYMBOL_GPL declarations on
static functions.

This was done using the following semantic patch:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
type T;
identifier f;
@@

static T f (...) { ... }

@@
identifier r.f;
declarer name EXPORT_SYMBOL;
@@

-EXPORT_SYMBOL(f);

@@
identifier r.f;
declarer name EXPORT_SYMBOL_GPL;
@@

-EXPORT_SYMBOL_GPL(f);
// </smpl>

