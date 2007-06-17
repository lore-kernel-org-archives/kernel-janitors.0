From: Artem Bityutskiy <dedekind@infradead.org>
Date: Sun, 17 Jun 2007 12:53:54 +0000
Subject: [KJ] Re: [PATCH]is_power_of_2-mtd/ubi/build.c
Message-Id: <1182084834.4403.19.camel@sauron>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1181624466.3109.23.camel@merlin.linuxcoe.com>
In-Reply-To: <1181624466.3109.23.camel@merlin.linuxcoe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: vignesh.babu@wipro.com
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, Kernel Janitors List <kernel-janitors@lists.osdl.org>

On Tue, 2007-06-12 at 10:31 +0530, vignesh babu wrote:
> Replacing (n & (n-1)) in the context of power of 2 checks
> with is_power_of_2

Committed to UBI git tree, thanks.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
