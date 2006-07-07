From: Richard <h.vanberkum@chello.nl>
Date: Fri, 07 Jul 2006 11:54:00 +0000
Subject: [KJ] request_region
Message-Id: <20060707141257.GA10920@chello.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Some files scan a IO range for request_region and that same range is released when the
module unloads. Is it necessary to check those functions on return values?

Richard

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
