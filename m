From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 02 Feb 2012 14:52:59 +0000
Subject: [PATCH 0/3] Move call to PTR_ERR after reassignment
Message-Id: <1328194382-32465-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1328191247-23792-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1328191247-23792-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

These patches fix cases where a location is reset to NULL before being
passed to PTR_ERR.

