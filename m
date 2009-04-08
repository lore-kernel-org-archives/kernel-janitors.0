From: Jack Stone <jwjstone@fastmail.fm>
Date: Wed, 08 Apr 2009 11:21:32 +0000
Subject: [PATCH 0/56] Remove void casts
Message-Id: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <>
In-Reply-To: <>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org

This patch series removes void pointer casts from the kernel.

These casts are not needed in C.

These patches are against Linus' tree
