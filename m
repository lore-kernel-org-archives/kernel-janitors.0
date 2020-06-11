From: Garrit Franke <garritfranke@gmail.com>
Date: Thu, 11 Jun 2020 21:27:15 +0000
Subject: [PATCH] sgi: remove unreachable debug output
Message-Id: <20200611212715.19231-1-garritfranke@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi all,

this patch aims to replace the DPRINTK macro in meth.c with pr_debug
from kernel.h. I then removed a whole bunch of unreachable debug
outputs.

Thanks for your time,
Garrit
